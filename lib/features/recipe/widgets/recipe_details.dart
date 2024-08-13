import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/recipe/recipe.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeBloc, RecipeState>(
      builder: (context, state) {
        if (state is RecipeLoadedState) {
          return RecipeDetailsLoadedBody(
            meal: state.meal,
          );
        }
        if (state is RecipeLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is RecipeFailureState) {
          return const Center(
            child: Text("Something went wrong..."),
          );
        }
        return const Center(
          child: Text("Recipe not found"),
        );
      },
    );
  }
}