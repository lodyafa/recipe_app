import 'package:flutter/material.dart';

class FoodCardsGridView extends StatelessWidget {
  const FoodCardsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Количество столбцов
          crossAxisSpacing: 16, // Расстояние между столбцами
          mainAxisSpacing: 16, // Расстояние между строками
          childAspectRatio: 4 / 5, // Пропорции ширины и высоты карточек
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            width: 200,
            height: 240,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
          );
        },
      ),
    );
  }
}