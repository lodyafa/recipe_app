import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/domain/domain.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc({
    required FavoritesRepositoryInterface favoritesRepository,
  })  : _favoritesRepository = favoritesRepository,
        super(FavoritesLoadingState()) {
    on<AddOrRemoveFromFavoritesEvent>(_onAddOrRemoveFromFavorites);
  }

  final FavoritesRepositoryInterface _favoritesRepository;

  Future<void> _onAddOrRemoveFromFavorites(
    AddOrRemoveFromFavoritesEvent event,
    Emitter<FavoritesState> emit,
  ) async {
    try {
      if (state is! FavoritesLoadingState) {
        emit(FavoritesLoadingState());
      }

      await _favoritesRepository.addOrRemoveFavoriteMeal(event.meal);
      final updatedFavMeals = await _favoritesRepository.getFavoritesMeals();

      emit(FavoritesLoadedState(favoriteMeals: updatedFavMeals));
    } catch (exception, stackTrace) {
      emit(FavoritesFailureState(exception: exception));
      print("$exception $stackTrace");
    }
  }
}
