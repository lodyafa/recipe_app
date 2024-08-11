import 'package:auto_route/auto_route.dart';
import 'package:recipe_app/features/settings/view/settings_screen.dart';
import 'package:recipe_app/features/favorites/view/favorites_screen.dart';
import 'package:recipe_app/features/home/view/home_screen.dart';
import 'package:recipe_app/features/root/view/root_screen.dart';
import 'package:recipe_app/features/search/view/search_screen.dart';

import '../../features/home/view/categories_tabs/categories_tabs.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: RootRoute.page,
          path: "/",
          children: [
            AutoRoute(
              page: HomeRoute.page,
              path: "home",
              children: [
                AutoRoute(
                  page: BeefCategoryRoute.page,
                  path: "beef_category",
                ),
                AutoRoute(
                  page: PastaCategoryRoute.page,
                  path: "pasta_category",
                ),
                AutoRoute(
                  page: ChickenCategoryRoute.page,
                  path: "chicken_category",
                ),
                AutoRoute(
                  page: DessertCategoryRoute.page,
                  path: "dessert_category",
                ),
              ],
            ),
            AutoRoute(page: SearchRoute.page, path: "search"),
            AutoRoute(page: FavoritesRoute.page, path: "favorites"),
            AutoRoute(page: SettingsRoute.page, path: "settings"),
          ],
        ),
      ];
}
