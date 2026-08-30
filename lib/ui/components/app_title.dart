import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:orth_psalter/ui/components/app_icon.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppIcon(color: Theme.of(context).appBarTheme.foregroundColor),
        const SizedBox(width: 10),
        Text(context.tr('appTitle')),
      ],
    );
  }
}
