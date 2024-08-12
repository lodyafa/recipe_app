import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/app/app.dart';
import 'package:recipe_app/core/blocs/blocs.dart';
import 'package:recipe_app/core/router/router.dart';
import 'package:recipe_app/uikit/uikit.dart';

class RecipeApp extends StatefulWidget {
  const RecipeApp({
    super.key,
    required this.config,
  });

  final AppConfig config;

  @override
  State<RecipeApp> createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  @override
  Widget build(BuildContext context) {
    final router = AppRouter();

    return AppInitializer(
      config: widget.config,
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Recipe App',
            theme: AppThemeData.lightTheme,
            darkTheme: AppThemeData.darkTheme,
            themeMode: state.themeMode,
            routerConfig: router.config(),
          );
        },
      ),
    );
  }
}