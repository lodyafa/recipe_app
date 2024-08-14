// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BeefCategoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BeefCategoryTab(),
      );
    },
    ChickenCategoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChickenCategoryTab(),
      );
    },
    DessertCategoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DessertCategoryTab(),
      );
    },
    FavoritesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavoritesScreen(),
      );
    },
    FavoritesShellRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavoritesShellScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    HomeShellRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeShellScreen(),
      );
    },
    PastaCategoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PastaCategoryTab(),
      );
    },
    RecipeRoute.name: (routeData) {
      final args = routeData.argsAs<RecipeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RecipeScreen(
          key: args.key,
          meal: args.meal,
        ),
      );
    },
    RootRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RootScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchScreen(),
      );
    },
    SearchShellRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchShellScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
  };
}

/// generated route for
/// [BeefCategoryTab]
class BeefCategoryRoute extends PageRouteInfo<void> {
  const BeefCategoryRoute({List<PageRouteInfo>? children})
      : super(
          BeefCategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'BeefCategoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChickenCategoryTab]
class ChickenCategoryRoute extends PageRouteInfo<void> {
  const ChickenCategoryRoute({List<PageRouteInfo>? children})
      : super(
          ChickenCategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChickenCategoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DessertCategoryTab]
class DessertCategoryRoute extends PageRouteInfo<void> {
  const DessertCategoryRoute({List<PageRouteInfo>? children})
      : super(
          DessertCategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'DessertCategoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FavoritesScreen]
class FavoritesRoute extends PageRouteInfo<void> {
  const FavoritesRoute({List<PageRouteInfo>? children})
      : super(
          FavoritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoritesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FavoritesShellScreen]
class FavoritesShellRoute extends PageRouteInfo<void> {
  const FavoritesShellRoute({List<PageRouteInfo>? children})
      : super(
          FavoritesShellRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoritesShellRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeShellScreen]
class HomeShellRoute extends PageRouteInfo<void> {
  const HomeShellRoute({List<PageRouteInfo>? children})
      : super(
          HomeShellRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeShellRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PastaCategoryTab]
class PastaCategoryRoute extends PageRouteInfo<void> {
  const PastaCategoryRoute({List<PageRouteInfo>? children})
      : super(
          PastaCategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'PastaCategoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RecipeScreen]
class RecipeRoute extends PageRouteInfo<RecipeRouteArgs> {
  RecipeRoute({
    Key? key,
    required Meal meal,
    List<PageRouteInfo>? children,
  }) : super(
          RecipeRoute.name,
          args: RecipeRouteArgs(
            key: key,
            meal: meal,
          ),
          initialChildren: children,
        );

  static const String name = 'RecipeRoute';

  static const PageInfo<RecipeRouteArgs> page = PageInfo<RecipeRouteArgs>(name);
}

class RecipeRouteArgs {
  const RecipeRouteArgs({
    this.key,
    required this.meal,
  });

  final Key? key;

  final Meal meal;

  @override
  String toString() {
    return 'RecipeRouteArgs{key: $key, meal: $meal}';
  }
}

/// generated route for
/// [RootScreen]
class RootRoute extends PageRouteInfo<void> {
  const RootRoute({List<PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchShellScreen]
class SearchShellRoute extends PageRouteInfo<void> {
  const SearchShellRoute({List<PageRouteInfo>? children})
      : super(
          SearchShellRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchShellRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
