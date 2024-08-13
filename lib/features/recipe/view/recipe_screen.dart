import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/features/recipe/recipe.dart';
import 'package:recipe_app/uikit/uikit.dart';

@RoutePage()
class RecipeScreen extends StatelessWidget {
  const RecipeScreen({
    super.key,
  });

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
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
              color: colorScheme.onBackground,
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: const RecipeDetails(),
    );
  }
}
