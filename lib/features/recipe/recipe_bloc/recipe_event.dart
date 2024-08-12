part of 'recipe_bloc.dart';

sealed class RecipeEvent extends Equatable {}

final class RecipeLoadEvent extends RecipeEvent {
  final String mealId;

  RecipeLoadEvent(this.mealId);

  @override
  List<Object?> get props => [mealId];
}
