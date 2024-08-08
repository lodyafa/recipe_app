import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/core/router/router.dart';
import 'package:recipe_app/features/home/widgets/widgets.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return AutoTabsRouter.tabBar(
      routes: const [
        BeefCategoryRoute(),
        PastaCategoryRoute(),
      ],
      builder: (context, child, tabController) {
        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, isScrolling) {
              return [
                SliverAppBar(
                  pinned: false,
                  floating: true,
                  snap: true,
                  title: const Column(
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
                  bottom: PreferredSize(
                    preferredSize: const Size(double.infinity, 40),
                    child: CategoriesListView(
                      tabController: tabController,
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
