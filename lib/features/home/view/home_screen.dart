import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/features/home/widgets/widgets.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.sunny),
                    SizedBox(width: 8),
                    Text("Good Morning!"),
                  ],
                ),
              ],
            ),
            centerTitle: false,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 16),
              child: CategoriesListView(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            sliver: MealsSliverGrid(),
          ),
        ],
      ),
    );
  }
}
