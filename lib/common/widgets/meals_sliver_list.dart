import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:recipe_app/core/domain/domain.dart';
import 'package:recipe_app/uikit/cards/cards.dart';

class MealsSliverList extends StatelessWidget {
  const MealsSliverList({
    super.key,
    required this.meals,
  });

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return Animate(
          effects: const [
            FadeEffect(
              duration: Duration(milliseconds: 400),
            ),
          ],
          child: MealListCard(
            meal: meals[index],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: meals.length,
    );
  }
}
