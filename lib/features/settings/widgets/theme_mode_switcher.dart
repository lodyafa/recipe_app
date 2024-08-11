import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/blocs/theme_cubit/theme_cubit.dart';
import 'package:recipe_app/uikit/uikit.dart';

class ThemeModeSwitcher extends StatelessWidget {
  const ThemeModeSwitcher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: colorScheme.primaryContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ThemeButton(
                      icon: Icons.wb_sunny_outlined,
                      text: "Light",
                      onTap: () {
                        BlocProvider.of<ThemeCubit>(context)
                            .setTheme(ThemeMode.light);
                      },
                      isSelected: state.themeMode == ThemeMode.light,
                    ),
                    const SizedBox(width: 10),
                    ThemeButton(
                      icon: Icons.dark_mode_outlined,
                      text: "Dark",
                      onTap: () {
                        BlocProvider.of<ThemeCubit>(context)
                            .setTheme(ThemeMode.dark);
                      },
                      isSelected: state.themeMode == ThemeMode.dark,
                    ),
                    const SizedBox(width: 10),
                    ThemeButton(
                      icon: Icons.phone_iphone,
                      text: "System",
                      onTap: () {
                        BlocProvider.of<ThemeCubit>(context)
                            .setTheme(ThemeMode.system);
                      },
                      isSelected: state.themeMode == ThemeMode.system,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 10),
            Text(
              "Theme Mode",
              style: TextStyle(
                color: colorScheme.onBackground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
