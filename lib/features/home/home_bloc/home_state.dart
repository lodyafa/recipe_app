part of 'home_bloc.dart';

sealed class HomeState extends Equatable {}

final class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

final class HomeLoadedState extends HomeState {
  HomeLoadedState({required this.randomMeals});

  final List<Meal> randomMeals;

  @override
  List<Object?> get props => [randomMeals];
}

final class HomeFailureState extends HomeState {
  HomeFailureState({required this.exception});

  final Object exception;

  @override
  List<Object?> get props => [exception];
}
