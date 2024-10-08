import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/domain/domain.dart';

part 'home_categories_event.dart';
part 'home_categories_state.dart';

class HomeCategoriesBloc
    extends Bloc<HomeCategoriesEvent, HomeCategoriesState> {
  HomeCategoriesBloc({
    required MealsRepositoryInterface mealsRepository,
    required FavoritesRepositoryInterface favoritesRepository,
  })  : _mealsRepository = mealsRepository,
        _favoritesRepository = favoritesRepository,
        super(HomeCategoriesInitialState()) {
    on<HomeLoadCategoryEvent>(_onLoadCategory);
    add(HomeLoadCategoryEvent(category: MealCategory.beef));
  }

  final MealsRepositoryInterface _mealsRepository;
  final FavoritesRepositoryInterface _favoritesRepository;

  Future<void> _onLoadCategory(
    HomeLoadCategoryEvent event,
    Emitter<HomeCategoriesState> emit,
  ) async {
    try {
      final curState = state;
      final category = event.category;
      // print(category);
      if (curState is HomeCategoriesLoadedState &&
          curState.prevLoadedCategory == category) {
        // print("HERE");
        return;
      }

      if (state is! HomeCategoriesLoadingState) {
        emit(HomeCategoriesLoadingState(loadingCategory: event.category));
      }

      List<Meal> meals =
          await _mealsRepository.getMealsByCategory(category.toString());

      for (int i = 0; i < meals.length; i++) {
        final meal = meals[i];
        final bool isFavorite = await _favoritesRepository.isFavorite(meal.id);

        if (isFavorite) {
          meals[i] = meal.copyWith(isFavorite: isFavorite);
        }
      }

      switch (category) {
        case MealCategory.beef:
          if (curState is HomeCategoriesLoadedState) {
            return emit(curState.copyWith(
              beefCategoryMeals: meals,
              curLoadedCategory: category,
              prevLoadedCategory: curState.curLoadedCategory,
            ));
          }
          return emit(HomeCategoriesLoadedState(beefCategoryMeals: meals));
        case MealCategory.chicken:
          if (curState is HomeCategoriesLoadedState) {
            return emit(curState.copyWith(
              chickenCategoryMeals: meals,
              curLoadedCategory: category,
              prevLoadedCategory: curState.curLoadedCategory,
            ));
          }
          return emit(HomeCategoriesLoadedState(chickenCategoryMeals: meals));

        case MealCategory.dessert:
          if (curState is HomeCategoriesLoadedState) {
            return emit(curState.copyWith(
              chickenCategoryMeals: meals,
              curLoadedCategory: category,
              prevLoadedCategory: curState.curLoadedCategory,
            ));
          }
          return emit(HomeCategoriesLoadedState(dessertCategoryMeals: meals));

        default:
          return;
      }
    } catch (exception, stackTrace) {
      emit(HomeCategoriesFailureState(exception: exception));
      print("$exception $stackTrace");
    }
  }
}
