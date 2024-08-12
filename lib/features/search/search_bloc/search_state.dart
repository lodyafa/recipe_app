part of 'search_bloc.dart';

sealed class SearchState extends Equatable {}

final class SearchInitialState extends SearchState {
  @override
  List<Object?> get props => [];
}

final class SearchLoadingState extends SearchState {
  @override
  List<Object?> get props => [];
}

final class SearchLoadedState extends SearchState {
  final List<Meal> meals;

  SearchLoadedState({required this.meals});

  @override
  List<Object?> get props => [meals];
}

final class SearchFailureState extends SearchState {
  final Object exception;

  SearchFailureState({required this.exception});

  @override
  List<Object?> get props => [exception];
}
