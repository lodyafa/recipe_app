import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/domain/domain.dart';
import 'package:recipe_app/features/recipe/recipe_bloc/recipe_bloc.dart';
import 'package:recipe_app/uikit/uikit.dart';

@RoutePage()
class RecipeScreen extends StatelessWidget {
  const RecipeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final colorScheme = AppColorScheme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: const RecipeDetails(),
    );
  }
}

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final colorScheme = AppColorScheme.of(context);
    return BlocBuilder<RecipeBloc, RecipeState>(
      builder: (context, state) {
        if (state is RecipeLoadedState) {
          return RecipeLoadedBody(
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

class RecipeLoadedBody extends StatelessWidget {
  const RecipeLoadedBody({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    return ListView(
      children: [
        Image.network(meal.imageUrl),
        const SizedBox(height: 10),
        Center(
          child: Text(
            meal.name,
            style: TextStyle(
              color: colorScheme.onBackground,
              fontSize: 23,
            ),
          ),
        ),
      ],
    );
  }
}
