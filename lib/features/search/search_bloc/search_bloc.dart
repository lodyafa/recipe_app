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
  SearchBloc({required MealsRepositoryInterface mealsRepository})
      : _mealsRepository = mealsRepository,
        super(SearchInitialState()) {
    on<SearchMealEvent>(
      _onSearch,
      transformer: debounceDroppable(
        const Duration(milliseconds: 200),
      ),
    );
  }

  final MealsRepositoryInterface _mealsRepository;

  Future<void> _onSearch(
    SearchMealEvent event,
    Emitter<SearchState> emit,
  ) async {
    if (event.query.isEmpty && state is! SearchInitialState) {
      return emit(SearchInitialState());
    }
    if (event.query.length < 3) return;
    if (state is! SearchLoadingState) {
      emit(SearchLoadingState());
    }
    final meals = await _mealsRepository.getMealsByName(event.query);
    emit(SearchLoadedState(meals: meals));
  }
}
