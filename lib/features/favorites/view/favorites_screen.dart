import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/uikit/colors/colors.dart';

@RoutePage()
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            title: Text(
              "Favorites",
              style: TextStyle(
                color: colorScheme.onBackground,
              ),
            ),
            surfaceTintColor: Colors.transparent,
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            // sliver: MealsSliverList(),
          ),
        ],
      ),
    );
  }
}
