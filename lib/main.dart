import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/api/api.dart';
import 'package:recipe_app/core/blocs/theme_cubit/theme_cubit.dart';
import 'package:recipe_app/core/domain/repositories/repositories.dart';
import 'package:recipe_app/core/router/router.dart';
import 'package:recipe_app/features/home/blocs/home_categories_bloc/home_categories_bloc.dart';
import 'package:recipe_app/features/recipe/recipe_bloc/recipe_bloc.dart';
import 'package:recipe_app/features/search/search_bloc/search_bloc.dart';
import 'package:recipe_app/storage/theme_mode_storage/theme_mode_storage_impl.dart';
import 'package:recipe_app/uikit/theme/app_theme_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dio = Dio();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final apiClient = RecipeApiClient(dio);
  final themeModeStorage = ThemeModeStorage(prefs: prefs);
  final mealsRepo = MealsRepository(apiClient: apiClient);
  final themeRepo = ThemeModeRepository(themeModeStorage: themeModeStorage);
  runApp(
    RecipeApp(
      mealsRepository: mealsRepo,
      themeModeRepository: themeRepo,
    ),
  );
}

class RecipeApp extends StatefulWidget {
  const RecipeApp({
    super.key,
    required this.mealsRepository,
    required this.themeModeRepository,
  });

  final MealsRepositoryInterface mealsRepository;
  final ThemeModeRepositoryInterface themeModeRepository;
  @override
  State<RecipeApp> createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<MealsRepositoryInterface>(
          create: (context) => widget.mealsRepository,
        ),
        RepositoryProvider<ThemeModeRepositoryInterface>(
          create: (context) => widget.themeModeRepository,
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
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp.router(
              title: 'Recipe App',
              theme: AppThemeData.lightTheme,
              darkTheme: AppThemeData.darkTheme,
              themeMode: state.themeMode,
              routerConfig: _router.config(),
            );
          },
        ),
      ),
    );
  }
}
