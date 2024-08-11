import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/core/domain/repositories/repositories.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({
    required ThemeModeRepositoryInterface themeModeRepository,
  })  : _themeModeRepository = themeModeRepository,
        super(const ThemeState(themeMode: ThemeMode.light)) {
    _restoreTheme();
  }

  final ThemeModeRepositoryInterface _themeModeRepository;

  Future<void> _restoreTheme() async {
    try {
      final ThemeMode? themeMode = await _themeModeRepository.getThemeMode();
      if (themeMode == null) return;

      emit(ThemeState(themeMode: themeMode));
    } catch (exception, stackTrace) {
      print("$exception $stackTrace");
    }
  }

  Future<void> setTheme(ThemeMode themeMode) async {
    try {
      final bool success = await _themeModeRepository.setThemeMode(themeMode);
      if (success) {
        emit(ThemeState(themeMode: themeMode));
      }
    } catch (exception, stackTrace) {
      print("$exception $stackTrace");
    }
  }
}
