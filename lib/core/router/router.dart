import 'package:auto_route/auto_route.dart';
import 'package:recipe_app/features/account/view/account_screen.dart';
import 'package:recipe_app/features/favorites/view/favorites_screen.dart';
import 'package:recipe_app/features/home/view/beef_category_tab.dart';
import 'package:recipe_app/features/home/view/home_screen.dart';
import 'package:recipe_app/features/home/view/pasta_category_tab.dart';
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
              ],
            ),
            AutoRoute(page: SearchRoute.page, path: "search"),
            AutoRoute(page: FavoritesRoute.page, path: "favorites"),
            AutoRoute(page: AccountRoute.page, path: "account"),
          ],
        ),
      ];
}
