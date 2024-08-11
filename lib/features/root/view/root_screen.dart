import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/core/router/router.dart';
import 'package:recipe_app/uikit/colors/colors.dart';

@RoutePage()
class RootScreen extends StatelessWidget {
  const RootScreen({
    super.key,
  });

  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    final colorScheme = AppColorScheme.of(context);
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        SearchRoute(),
        FavoritesRoute(),
        SettingsRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: NavigationBar(
            indicatorColor: colorScheme.primary.withOpacity(0.7),
            overlayColor: WidgetStatePropertyAll(
              colorScheme.primary,
            ),
            height: 70,
            selectedIndex: tabsRouter.activeIndex,
            onDestinationSelected: (index) => _openPage(index, tabsRouter),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              NavigationDestination(
                icon: Icon(Icons.search),
                label: "Search",
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite),
                label: "Favorites",
              ),
              NavigationDestination(
                icon: Icon(Icons.settings),
                label: "Settings",
              ),
            ],
          ),
        );
      },
    );
  }
}
