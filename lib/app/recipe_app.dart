import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/app/app.dart';
import 'package:recipe_app/core/blocs/blocs.dart';
import 'package:recipe_app/core/router/router.dart';
import 'package:recipe_app/uikit/uikit.dart';

class RecipeApp extends StatefulWidget {
  const RecipeApp({
    super.key,
    required this.appConfig,
  });

  final AppConfig appConfig;

  @override
  State<RecipeApp> createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  @override
  Widget build(BuildContext context) {
    final router = AppRouter();

    return AppInitializer(
      config: widget.appConfig,
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            
            debugShowCheckedModeBanner: false,
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
