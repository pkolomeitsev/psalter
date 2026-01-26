import 'package:flutter/material.dart';
import 'package:jungers_psalter/models/psalm.dart';

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
        style: const TextStyle(fontSize: 16),
        child: Text(this.psalm.getText()),
      ),
      SizedBox(height: 10),
    ]);
  }
}
