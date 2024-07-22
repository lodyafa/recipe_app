import 'package:flutter/material.dart';
import 'package:recipe_app/uikit/cards/cards.dart';

class MealsSliverList extends StatelessWidget {
  const MealsSliverList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverList.separated(
      itemBuilder: (context, index) {
        return MealListCard(theme: theme);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}
