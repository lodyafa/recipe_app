part of 'favorites_bloc.dart';

sealed class FavoritesEvent extends Equatable {}

class AddOrRemoveFromFavoritesEvent extends FavoritesEvent {
  final Meal meal;

  AddOrRemoveFromFavoritesEvent({required this.meal});

  @override
  List<Object?> get props => [meal];
}