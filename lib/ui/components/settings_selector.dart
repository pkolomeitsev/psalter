import 'package:flutter/material.dart';
import 'package:orth_psalter/theme/app_colors.dart';

final class SettingsSelector extends StatelessWidget {
  final String name;
  final bool isSelected;
  final bool isDisabled;
  final VoidCallback onTap;

  const SettingsSelector({
    super.key,
    required this.name,
    this.isSelected = false,
    this.isDisabled = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = this.isSelected
        ? (AppColors.brandBgColor ?? Colors.blue)
        : theme.colorScheme.secondary;
    final disabledColor = this.isDisabled ? Colors.grey : null;

    return TextButton(
      onPressed: this.isDisabled ? null : onTap,
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
      child: SizedBox(
        height: 40.0,
        child: Row(
          children: [
            Expanded(
              child: Text(name, style: TextStyle(color: disabledColor ?? textColor)),
            ),
            Visibility(visible: isSelected, child: const Icon(Icons.check)),
          ],
        ),
      ),
    );
  }
}
