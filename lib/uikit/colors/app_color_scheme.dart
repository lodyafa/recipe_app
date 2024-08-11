import 'package:flutter/material.dart';

@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color outline;
  final Color surfaceContainer;

  const AppColorScheme.light()
      : primary = const Color(0xFF70B9BE),
        onPrimary = Colors.black,
        primaryContainer = const Color(0xFFF1F5F5),
        onPrimaryContainer = const Color(0xFF1E1833),
        secondary = const Color(0xFF757477),
        onSecondary = const Color.fromARGB(255, 63, 63, 63),
        secondaryContainer = const Color(0xFFDCD8E6),
        onSecondaryContainer = const Color(0xFF2C2933),
        tertiary = const Color(0xFF996576),
        onTertiary = const Color(0xFFFFFFFF),
        tertiaryContainer = const Color(0xFFE6CDD5),
        onTertiaryContainer = const Color(0xFF332227),
        error = const Color.fromARGB(255, 216, 61, 52),
        onError = const Color(0xFFFFFFFF),
        errorContainer = const Color(0xFFE6ACA9),
        onErrorContainer = const Color(0xFF330B09),
        background = Colors.white,
        onBackground = Colors.black,
        surface = const Color.fromARGB(255, 242, 242, 242),
        onSurface = const Color(0xFF323233),
        outline = const Color(0xFF8c8999),
        surfaceContainer = const Color(0xFFE6E1F2);

  const AppColorScheme.dark()
      : primary = const Color(0xFF70B9BE),
        onPrimary = Colors.white,
        primaryContainer = const Color(0xFF282828),
        onPrimaryContainer = const Color(0xFFC8BFE6),
        secondary = const Color(0xFF757477),
        onSecondary = const Color(0xFFFFFFFF),
        secondaryContainer = const Color(0xFF2C2933),
        onSecondaryContainer = const Color(0xFFDCD8E6),
        tertiary = const Color(0xFF7D5260),
        onTertiary = const Color(0xFFFFFFFF),
        tertiaryContainer = const Color(0xFF332227),
        onTertiaryContainer = const Color(0xFFE6CDD5),
        error = const Color(0xFFB3261E),
        onError = const Color(0xFFFFFFFF),
        errorContainer = const Color(0xFF330B09),
        onErrorContainer = const Color(0xFFE6ACA9),
        background = Colors.black,
        onBackground = Colors.white,
        surface = const Color(0xFF282828),
        onSurface = const Color(0xFF696969),
        outline = const Color(0xFF938F99),
        surfaceContainer = const Color(0xFF242329);

  const AppColorScheme._({
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.outline,
    required this.surfaceContainer,
  });

  @override
  ThemeExtension<AppColorScheme> copyWith({
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    Color? outline,
    Color? surfaceContainer,
  }) {
    return AppColorScheme._(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      onSecondaryContainer: onSecondaryContainer ?? this.onSecondaryContainer,
      tertiary: tertiary ?? this.tertiary,
      onTertiary: onTertiary ?? this.onTertiary,
      tertiaryContainer: tertiaryContainer ?? this.tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer ?? this.onTertiaryContainer,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      errorContainer: errorContainer ?? this.errorContainer,
      onErrorContainer: onErrorContainer ?? this.onErrorContainer,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      outline: outline ?? this.outline,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
    );
  }

  @override
  ThemeExtension<AppColorScheme> lerp(
    ThemeExtension<AppColorScheme>? other,
    double t,
  ) {
    if (other is! AppColorScheme) {
      return this;
    }

    return AppColorScheme._(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      primaryContainer:
          Color.lerp(primaryContainer, other.primaryContainer, t)!,
      onPrimaryContainer:
          Color.lerp(onPrimaryContainer, other.onPrimaryContainer, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      secondaryContainer:
          Color.lerp(secondaryContainer, other.secondaryContainer, t)!,
      onSecondaryContainer:
          Color.lerp(onSecondaryContainer, other.onSecondaryContainer, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      onTertiary: Color.lerp(onTertiary, other.onTertiary, t)!,
      tertiaryContainer:
          Color.lerp(tertiaryContainer, other.tertiaryContainer, t)!,
      onTertiaryContainer:
          Color.lerp(onTertiaryContainer, other.onTertiaryContainer, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      errorContainer: Color.lerp(errorContainer, other.errorContainer, t)!,
      onErrorContainer:
          Color.lerp(onErrorContainer, other.onErrorContainer, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      outline: Color.lerp(outline, other.outline, t)!,
      surfaceContainer:
          Color.lerp(surfaceContainer, other.surfaceContainer, t)!,
    );
  }

  static AppColorScheme of(BuildContext context) =>
      Theme.of(context).extension<AppColorScheme>()!;
}
