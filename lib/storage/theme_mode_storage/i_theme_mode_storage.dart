import 'package:flutter/material.dart';

abstract interface class ThemeModeStorageInterface {
  Future<ThemeMode?> getThemeMode();
  Future<bool> setThemeMode(ThemeMode themeMode);
}
