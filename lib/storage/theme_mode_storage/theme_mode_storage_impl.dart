import 'package:flutter/material.dart';
import 'package:recipe_app/storage/theme_mode_storage/i_theme_mode_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeStorage implements ThemeModeStorageInterface {
  ThemeModeStorage({required SharedPreferences prefs}) : _prefs = prefs;

  final SharedPreferences _prefs;

  @override
  Future<ThemeMode?> getThemeMode() async {
    final String? themeModeStr = _prefs.getString("theme_mode");
    if (themeModeStr?.isEmpty ?? true) return null;

    return ThemeMode.values.firstWhere(
      (e) => e.name == themeModeStr,
    );
  }

  @override
  Future<bool> setThemeMode(ThemeMode themeMode) async {
    final result = await _prefs.setString(
      "theme_mode",
      themeMode.name,
    );

    return result;
  }
}
