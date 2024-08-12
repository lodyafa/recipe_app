part of 'recipe_bloc.dart';

sealed class RecipeState extends Equatable {
  const RecipeState();
}

final class RecipeLoadingState extends RecipeState {
  @override
  List<Object?> get props => [];
}

final class RecipeLoadedState extends RecipeState {
  const RecipeLoadedState({required this.meal});

  final Meal meal;

  @override
  List<Object?> get props => [meal];
}

final class RecipeFailureState extends RecipeState {
  const RecipeFailureState({required this.exception});

  final Object exception;

  @override
  List<Object?> get props => [exception];
}
