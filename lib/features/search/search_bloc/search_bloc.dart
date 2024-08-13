import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/domain/domain.dart';
import 'package:stream_transform/stream_transform.dart';

part 'search_event.dart';
part 'search_state.dart';

EventTransformer<E> debounceDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.debounce(duration), mapper);
  };
}

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({
    required MealsRepositoryInterface mealsRepository,
    required FavoritesRepositoryInterface favoritesRepository,
  })  : _mealsRepository = mealsRepository,
        _favoritesRepository = favoritesRepository,
        super(SearchInitialState()) {
    on<SearchMealEvent>(
      _onSearch,
      transformer: debounceDroppable(
        const Duration(milliseconds: 200),
      ),
    );
  }

  final MealsRepositoryInterface _mealsRepository;
  final FavoritesRepositoryInterface _favoritesRepository;

  Future<void> _onSearch(
    SearchMealEvent event,
    Emitter<SearchState> emit,
  ) async {
    try {
      if (event.query.isEmpty && state is! SearchInitialState) {
        return emit(SearchInitialState());
      }
      if (event.query.length < 3) return;
      if (state is! SearchLoadingState) {
        emit(SearchLoadingState());
      }

      List<Meal> searchedMeals =
          await _mealsRepository.getMealsByName(event.query);

      for (int i = 0; i < searchedMeals.length; i++) {
        final meal = searchedMeals[i];

        bool isFavorite = await _favoritesRepository.isFavorite(meal.id);
        if (isFavorite) {
          final updatedMeal = meal.copyWith(isFavorite: true);
          searchedMeals[i] = updatedMeal;
        }
      }

      emit(SearchLoadedState(meals: searchedMeals));
    } catch (exception, stackTrace) {
      emit(SearchFailureState(exception: exception));
      print("$exception $stackTrace");
    }
  }

  // Написать метод обновления найденного списка с помощью copywith у состояния
}
