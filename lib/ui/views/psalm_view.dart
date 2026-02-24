import 'package:flutter/material.dart';
import 'package:orth_psalter/models/psalm.dart';
import 'package:orth_psalter/theme/app_font.dart';

class PsalmView extends StatelessWidget {
  final Psalm psalm;
  const PsalmView({super.key, required this.psalm});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      DefaultTextStyle.merge(
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        child: Text(this.psalm.getTitle() ?? '', textAlign: TextAlign.center),
      ),
      SizedBox(height: 10),
      DefaultTextStyle.merge(
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        child: Text(this.psalm.getDescription(), textAlign: TextAlign.center),
      ),
      SizedBox(height: 10),
      DefaultTextStyle.merge(
        style: const TextStyle(fontSize: AppFont.comfortReadingSize),
        child: Text(this.psalm.getText()),
      ),
      SizedBox(height: 10),
    ]);
  }
}
