import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/common/common.dart';
import 'package:recipe_app/features/favorites/favorites.dart';
import 'package:recipe_app/uikit/colors/colors.dart';

@RoutePage(name: "FavoritesShellRoute")
class FavoritesShellScreen extends AutoRouter {
  const FavoritesShellScreen({super.key});
}

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
          BlocBuilder<FavoritesBloc, FavoritesState>(
            builder: (context, state) {
              if (state is FavoritesLoadedState) {
                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: MealsSliverList(
                    meals: state.favoriteMeals,
                  ),
                );
              }
              return const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
