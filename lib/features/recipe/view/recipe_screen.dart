import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/domain/domain.dart';
import 'package:recipe_app/features/favorites/favorites.dart';
import 'package:recipe_app/features/recipe/recipe.dart';
import 'package:recipe_app/uikit/uikit.dart';

@RoutePage()
class RecipeScreen extends StatelessWidget {
  const RecipeScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            AutoRouter.of(context).popForced();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: colorScheme.onBackground,
          ),
        ),
        actions: [
          BlocBuilder<FavoritesBloc, FavoritesState>(
            buildWhen: (previous, current) {
              return (current is FavoritesLoadedState);
            },
            builder: (context, state) {
              bool isFavorite = false;
              if (state is FavoritesLoadedState) {
                for (var favMeal in state.favoriteMeals) {
                  if (meal.id == favMeal.id) {
                    isFavorite = true;
                  }
                }
              }

              return Animate(
                key: ValueKey(isFavorite),
                effects: const [FadeEffect()],
                child: IconButton(
                  onPressed: () {
                    BlocProvider.of<FavoritesBloc>(context)
                        .add(AddOrRemoveFromFavoritesEvent(meal: meal));
                  },
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite
                        ? colorScheme.error
                        : colorScheme.onBackground,
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: const RecipeDetails(),
    );
  }
}
