import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/domain/domain.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc({
    required MealsRepositoryInterface mealsRepository,
    required FavoritesRepositoryInterface favoritesRepository,
  })  : _mealsRepository = mealsRepository,
        _favoritesRepository = favoritesRepository,
        super(RecipeLoadingState()) {
    on<RecipeLoadEvent>(_onRecipe);
  }
  final MealsRepositoryInterface _mealsRepository;
  final FavoritesRepositoryInterface _favoritesRepository;

  Future<void> _onRecipe(
    RecipeLoadEvent event,
    Emitter<RecipeState> emit,
  ) async {
    try {
      if (state is! RecipeLoadingState) {
        emit(RecipeLoadingState());
      }
      final Meal meal = await _mealsRepository.getMealDeatilsByID(
        event.mealId,
      );

      final bool isFavorite =
          await _favoritesRepository.isFavorite(event.mealId);

      if (isFavorite) {
        meal.copyWith(isFavorite: isFavorite);
      }

      emit(RecipeLoadedState(meal: meal));
    } catch (exception, stackTrace) {
      emit(RecipeFailureState(exception: exception));
      print("$exception $stackTrace");
    }
  }
}
