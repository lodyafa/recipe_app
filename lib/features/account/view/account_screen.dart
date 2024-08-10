import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/blocs/theme_cubit/theme_cubit.dart';

@RoutePage()
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ThemeButton(
                  icon: Icons.wb_sunny_outlined,
                  text: "Light",
                  onTap: () {
                    BlocProvider.of<ThemeCubit>(context)
                        .setThemeMode(ThemeMode.light);
                  },
                ),
                const SizedBox(width: 10),
                ThemeButton(
                  icon: Icons.dark_mode_outlined,
                  text: "Dark",
                  onTap: () {
                    BlocProvider.of<ThemeCubit>(context)
                        .setThemeMode(ThemeMode.dark);
                  },
                ),
                const SizedBox(width: 10),
                ThemeButton(
                  icon: Icons.phone_iphone,
                  text: "System",
                  onTap: () {
                    BlocProvider.of<ThemeCubit>(context)
                        .setThemeMode(ThemeMode.system);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final IconData icon;
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: theme.primaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            Text(text),
          ],
        ),
      ),
    );
  }
}
