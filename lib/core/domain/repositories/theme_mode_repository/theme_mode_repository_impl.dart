import 'package:flutter/material.dart';
import 'package:recipe_app/core/domain/domain.dart';
import 'package:recipe_app/storage/storage.dart';

class ThemeModeRepository implements ThemeModeRepositoryInterface {
  ThemeModeRepository({
    required ThemeModeStorageInterface themeModeStorage,
  }) : _themeModeStorage = themeModeStorage;

  final ThemeModeStorageInterface _themeModeStorage;

  @override
  Future<ThemeMode?> getThemeMode() async {
    return await _themeModeStorage.getThemeMode();
  }

  @override
  Future<bool> setThemeMode(ThemeMode themeMode) async {
    return await _themeModeStorage.setThemeMode(themeMode);
  }
}