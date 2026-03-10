import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/icons/orthodox-cross-white-50.png',
          height: 24,
        ),
        const SizedBox(width: 10),
        Text(context.tr('appTitle'), style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
