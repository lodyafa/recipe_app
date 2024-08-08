import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// import 'package:recipe_app/common/widgets/widgets.dart';

@RoutePage()
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            title: Text("Favorites"),
            surfaceTintColor: Colors.transparent,
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            // sliver: MealsSliverList(),
          ),
        ],
      ),
    );
  }
}
