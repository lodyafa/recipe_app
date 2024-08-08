import 'package:flutter/material.dart';
import 'package:recipe_app/core/domain/domain.dart';
import 'package:recipe_app/uikit/cards/cards.dart';

class MealsSliverGrid extends StatelessWidget {
  const MealsSliverGrid({
    super.key,
    required this.meals,
  });

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Количество столбцов
        crossAxisSpacing: 16, // Расстояние между столбцами
        mainAxisSpacing: 16, // Расстояние между строками
        childAspectRatio: 4 / 5, // Пропорции ширины и высоты карточек
      ),
      itemCount: meals.length,
      itemBuilder: (context, index) {
        final meal = meals[index];
        return MealGridCard(meal: meal);
      },
    );
  }
}
