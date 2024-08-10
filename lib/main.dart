import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/api/api.dart';
import 'package:recipe_app/core/blocs/theme_cubit/theme_cubit.dart';
import 'package:recipe_app/core/domain/repositories/repositories.dart';
import 'package:recipe_app/core/router/router.dart';
import 'package:recipe_app/features/home/blocs/home_categories_bloc/home_categories_bloc.dart';
import 'package:recipe_app/features/search/search_bloc/search_bloc.dart';
import 'package:recipe_app/uikit/theme/app_theme_data.dart';

void main() async {
  final dio = Dio();
  final apiClient = RecipeApiClient(dio);
  final mealsRepo = MealsRepository(apiClient: apiClient);
  runApp(RecipeApp(
    mealsRepository: mealsRepo,
  ));
}

class RecipeApp extends StatefulWidget {
  const RecipeApp({super.key, required this.mealsRepository});

  final MealsRepositoryInterface mealsRepository;
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
            create: (context) => ThemeCubit(),
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
