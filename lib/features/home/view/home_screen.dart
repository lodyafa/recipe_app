import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/features/home/widgets/widgets.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.sunny),
            SizedBox(width: 8),
            Text("Good Morning!"),
          ],
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Category",
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            const CategoriesListView(),
            const SizedBox(height: 10),
            const FoodCardsGridView(),
          ],
        ),
      ),
    );
  }
}



