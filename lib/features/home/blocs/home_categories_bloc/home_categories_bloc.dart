import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/domain/domain.dart';

part 'home_categories_event.dart';
part 'home_categories_state.dart';

class HomeCategoriesBloc
    extends Bloc<HomeCategoriesEvent, HomeCategoriesState> {
  HomeCategoriesBloc({required MealsRepositoryInterface mealsRepository})
      : _mealsRepository = mealsRepository,
        super(HomeCategoriesInitialState()) {
    on<HomeLoadCategoryEvent>(_onLoadCategory);
    add(HomeLoadCategoryEvent(category: MealCategory.beef));
  }

  final MealsRepositoryInterface _mealsRepository;

  Future<void> _onLoadCategory(
    HomeLoadCategoryEvent event,
    Emitter<HomeCategoriesState> emit,
  ) async {
    try {
      final prevState = state;
      final category = event.category;

      if (state is! HomeCategoriesLoadingState) {
        emit(HomeCategoriesLoadingState(loadingCategory: event.category));
      }

      switch (category) {
        case MealCategory.beef:
          List<Meal> meals =
              await _mealsRepository.getMealsByCategory(category.toString());

          if (prevState is HomeCategoriesLoadedState) {
            return emit(prevState.copyWith(beefCategoryMeals: meals));
          }
          return emit(HomeCategoriesLoadedState(beefCategoryMeals: meals));
        case MealCategory.chicken:
          List<Meal> meals =
              await _mealsRepository.getMealsByCategory(category.toString());

          if (prevState is HomeCategoriesLoadedState) {
            return emit(prevState.copyWith(chickenCategoryMeals: meals));
          }
          return emit(HomeCategoriesLoadedState(chickenCategoryMeals: meals));

        case MealCategory.dessert:
          List<Meal> meals =
              await _mealsRepository.getMealsByCategory(category.toString());

          if (prevState is HomeCategoriesLoadedState) {
            return emit(prevState.copyWith(chickenCategoryMeals: meals));
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
