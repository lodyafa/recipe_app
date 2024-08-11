import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/core/router/router.dart';
import 'package:recipe_app/features/home/widgets/widgets.dart';
import 'package:recipe_app/uikit/colors/colors.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const [
        BeefCategoryRoute(),
        ChickenCategoryRoute(),
        DessertCategoryRoute(),
        PastaCategoryRoute(),
      ],
      builder: (context, child, tabController) {
        final colorScheme = AppColorScheme.of(context);
        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, isScrolling) {
              return [
                SliverAppBar(
                  pinned: false,
                  floating: true,
                  snap: true,
                  title: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.sunny, color: colorScheme.onBackground,),
                          const SizedBox(width: 8),
                          Text(
                            "Good Morning!",
                            style: TextStyle(
                              color: colorScheme.onBackground,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  bottom: PreferredSize(
                    preferredSize: const Size(double.infinity, 40),
                    child: Column(
                      children: [
                        CategoriesListView(
                          tabController: tabController,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  centerTitle: false,
                ),
              ];
            },
            body: child,
          ),
        );
      },
    );
  }
}
