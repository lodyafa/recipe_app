import 'package:flutter/material.dart';
import 'package:recipe_app/uikit/cards/cards.dart';

class MealsSliverGrid extends StatelessWidget {
  const MealsSliverGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Количество столбцов
        crossAxisSpacing: 16, // Расстояние между столбцами
        mainAxisSpacing: 16, // Расстояние между строками
        childAspectRatio: 4 / 5, // Пропорции ширины и высоты карточек
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return MealGridCard();
      },
    );
  }
}
