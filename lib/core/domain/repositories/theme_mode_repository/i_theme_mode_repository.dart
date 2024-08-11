import 'package:flutter/material.dart';

abstract interface class ThemeModeRepositoryInterface {
  Future<ThemeMode?> getThemeMode();
  Future<bool> setThemeMode(ThemeMode themeMode);
}