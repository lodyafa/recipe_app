part of 'favorites_bloc.dart';

sealed class FavoritesState extends Equatable {}

final class FavoritesLoadingState extends FavoritesState {
  @override
  List<Object?> get props => [];
}

final class FavoritesLoadedState extends FavoritesState {
  final List<Meal> favoriteMeals;

  FavoritesLoadedState({required this.favoriteMeals});

  @override
  List<Object?> get props => [favoriteMeals];
}

final class FavoritesFailureState extends FavoritesState {
  final Object exception;

  FavoritesFailureState({required this.exception});

  @override
  List<Object?> get props => [exception];
}
