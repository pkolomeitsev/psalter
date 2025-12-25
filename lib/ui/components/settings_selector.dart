import 'package:flutter/material.dart';

final class SettingsSelector extends StatelessWidget {
  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  const SettingsSelector({
    required this.name,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.primary;
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(1.0),
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
        iconColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return textColor.withValues(alpha: 0.5);
          } else if (states.contains(WidgetState.pressed)) {
            return textColor.withValues(alpha: 0.5);
          }
          return textColor;
        }),
        shape: WidgetStateProperty.all(const BeveledRectangleBorder()),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SizedBox(
          height: 50.0,
          child: Row(
            children: [
              Expanded(child: Text(name)),
              Visibility(visible: isSelected, child: const Icon(Icons.check)),
            ],
          ),
        ),
      ),
    );
  }
}
