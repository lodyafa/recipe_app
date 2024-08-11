import 'package:flutter/material.dart';
import 'package:recipe_app/uikit/colors/colors.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    required this.isSelected,
  });

  final IconData icon;
  final String text;
  final void Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: 105,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isSelected
              ? colorScheme.primary
              : colorScheme.primary.withOpacity(0.2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: colorScheme.onBackground,
            ),
            Text(
              text,
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
