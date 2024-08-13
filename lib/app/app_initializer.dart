import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/api/api.dart';
import 'package:recipe_app/app/app.dart';
import 'package:recipe_app/core/blocs/blocs.dart';
import 'package:recipe_app/core/domain/domain.dart';
import 'package:recipe_app/features/favorites/favorites.dart';
import 'package:recipe_app/features/home/home.dart';
import 'package:recipe_app/features/recipe/recipe.dart';
import 'package:recipe_app/features/search/search.dart';
import 'package:recipe_app/storage/theme_mode_storage/theme_mode_storage_impl.dart';

class AppInitializer extends StatelessWidget {
  const AppInitializer({
    super.key,
    required this.config,
    required this.child,
  });

  final AppConfig config;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final RecipeApiClient apiClient = RecipeApiClient(config.dio);
    final ThemeModeStorage themeModeStorage =
        ThemeModeStorage(prefs: config.prefs);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<MealsRepositoryInterface>(
          create: (context) => MealsRepository(apiClient: apiClient),
        ),
        RepositoryProvider<ThemeModeRepositoryInterface>(
          create: (context) =>
              ThemeModeRepository(themeModeStorage: themeModeStorage),
        ),
        RepositoryProvider<FavoritesRepositoryInterface>(
          create: (context) => FavoritesRepository(realm: config.realm),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCategoriesBloc(
              mealsRepository:
                  RepositoryProvider.of<MealsRepositoryInterface>(context),
            ),
          ),
          BlocProvider(
            create: (context) => SearchBloc(
              mealsRepository:
                  RepositoryProvider.of<MealsRepositoryInterface>(context),
              favoritesRepository:
                  RepositoryProvider.of<FavoritesRepositoryInterface>(context),
            ),
          ),
          BlocProvider(
            create: (context) => ThemeCubit(
              themeModeRepository:
                  RepositoryProvider.of<ThemeModeRepositoryInterface>(context),
            ),
          ),
          BlocProvider(
            create: (context) => RecipeBloc(
              mealsRepository:
                  RepositoryProvider.of<MealsRepositoryInterface>(context),
            ),
          ),
          BlocProvider(
            create: (context) => FavoritesBloc(
              favoritesRepository:
                  RepositoryProvider.of<FavoritesRepositoryInterface>(context),
            ),
          ),
        ],
        child: child,
      ),
    );
  }
}
