import 'package:auto_route/auto_route.dart';
import 'package:recipe_app/features/home/view/view.dart';
import 'package:recipe_app/features/recipe/recipe.dart';
import 'package:recipe_app/features/settings/view/settings_screen.dart';
import 'package:recipe_app/features/favorites/view/favorites_screen.dart';
import 'package:recipe_app/features/root/view/root_screen.dart';
import 'package:recipe_app/features/search/view/search_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: RootRoute.page,
          path: "/",
          initial: true,
          children: [
            AutoRoute(
              page: HomeShellRoute.page,
              path: "home",
              children: [
                AutoRoute(
                  page: HomeRoute.page,
                  path: "",
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
                AutoRoute(
                  page: RecipeRoute.page,
                  path: "recipe",
                ),
              ],
            ),
            AutoRoute(
              page: SearchShellRoute.page,
              path: "search",
              children: [
                AutoRoute(
                  page: SearchRoute.page,
                  path: "",
                ),
                AutoRoute(
                  page: RecipeRoute.page,
                  path: "recipe",
                ),
              ],
            ),
            AutoRoute(
              page: FavoritesShellRoute.page,
              path: "favorites",
              children: [
                AutoRoute(
                  page: FavoritesRoute.page,
                  path: "",
                ),
                AutoRoute(
                  page: RecipeRoute.page,
                  path: "recipe",
                ),
              ],
            ),
            AutoRoute(
              page: SettingsRoute.page,
              path: "settings",
            ),
          ],
        ),
      ];
}
