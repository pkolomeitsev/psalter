import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jungers_psalter/l10n/app_localizations.dart';

class AsNeeded extends StatefulWidget {
  const AsNeeded({super.key});

  @override
  State<AsNeeded> createState() => _AsNeededState();
}

class _AsNeededState extends State<AsNeeded> {
  String psalms = 'psalms';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'This is the 3 tab ${'psalms'.tr()}',
        style: const TextStyle(fontSize: 36),
      ),
    );
  }
}
