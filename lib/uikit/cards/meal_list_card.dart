import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/domain/domain.dart';
import 'package:recipe_app/features/favorites/favorites.dart';
import 'package:recipe_app/uikit/uikit.dart';

class MealListCard extends StatelessWidget {
  const MealListCard({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(meal.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                meal.name,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: colorScheme.onBackground,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              onPressed: () => _addOrRemoveFromfavorites(context, meal),
              icon: Icon(
                meal.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: meal.isFavorite
                    ? colorScheme.error
                    : colorScheme.onBackground,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addOrRemoveFromfavorites(
    BuildContext context,
    Meal meal,
  ) {
    BlocProvider.of<FavoritesBloc>(context)
        .add(AddOrRemoveFromFavoritesEvent(meal: meal));
  }
}
