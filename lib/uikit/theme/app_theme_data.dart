import 'package:flutter/material.dart';
import 'package:recipe_app/uikit/colors/colors.dart';

abstract class AppThemeData {
  static final lightTheme = ThemeData(
    extensions: const [
      _lightColorScheme,
    ],
    brightness: Brightness.light,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: _lightColorScheme.primary,
      onPrimary: _lightColorScheme.onPrimary,
      primaryContainer: _lightColorScheme.primaryContainer,
      secondary: _lightColorScheme.secondary,
      onSecondary: _lightColorScheme.onSecondary,
      error: _lightColorScheme.error,
      onError: _lightColorScheme.onError,
      surface: _lightColorScheme.surface,
      surfaceContainer: _lightColorScheme.surfaceContainer,
      onSurface: _lightColorScheme.onSurface,
    ),
    scaffoldBackgroundColor: _lightColorScheme.background,
    appBarTheme: AppBarTheme(
      color: _lightColorScheme.background,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: _lightColorScheme.background,
      labelTextStyle: WidgetStatePropertyAll(
        TextStyle(
          color: _lightColorScheme.onBackground.withOpacity(0.8),
        ),
      ),
      iconTheme: WidgetStatePropertyAll(
        IconThemeData(
          color: _lightColorScheme.onBackground.withOpacity(0.8),
        ),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    extensions: const [
      _darkColorScheme,
    ],
    brightness: Brightness.dark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: _darkColorScheme.primary,
      onPrimary: _darkColorScheme.onPrimary,
      primaryContainer: _darkColorScheme.primaryContainer,
      secondary: _darkColorScheme.secondary,
      onSecondary: _darkColorScheme.onSecondary,
      error: _darkColorScheme.error,
      onError: _darkColorScheme.onError,
      surface: _darkColorScheme.surface,
      surfaceContainer: _lightColorScheme.surfaceContainer,
      onSurface: _darkColorScheme.onSurface,
    ),
    scaffoldBackgroundColor: _darkColorScheme.background,
    appBarTheme: AppBarTheme(
      color: _darkColorScheme.background,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: _darkColorScheme.background,
      labelTextStyle: WidgetStatePropertyAll(
        TextStyle(
          color: _darkColorScheme.onBackground.withOpacity(0.8),
        ),
      ),
      iconTheme: WidgetStatePropertyAll(
        IconThemeData(
          color: _darkColorScheme.onBackground.withOpacity(0.8),
        ),
      ),
    ),
  );

  static const _lightColorScheme = AppColorScheme.light();
  static const _darkColorScheme = AppColorScheme.dark();
}
