import 'package:flutter/material.dart';
import 'package:recipe_app/core/domain/domain.dart';
import 'package:recipe_app/uikit/uikit.dart';

class RecipeDetailsLoadedBody extends StatelessWidget {
  const RecipeDetailsLoadedBody({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              textAlign: TextAlign.center,
              meal.name,
              style: TextStyle(
                color: colorScheme.onBackground,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Center(
            child: Text(
              textAlign: TextAlign.center,
              meal.area,
              style: TextStyle(
                color: colorScheme.onBackground,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              "Ingredients:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: colorScheme.onBackground,
              ),
            ),
          ),
          Text(
            meal.ingredients
                .where((ingredient) => ingredient.isNotEmpty)
                .join(', '),
            style: TextStyle(
              color: colorScheme.onBackground,
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              "Instructions:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: colorScheme.onBackground,
              ),
            ),
          ),
          Text(
            meal.instructions,
            style: TextStyle(
              color: colorScheme.onBackground,
            ),
          ),
        ],
      ),
    );
  }
}
