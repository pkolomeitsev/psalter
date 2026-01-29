import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jungers_psalter/models/kathisma.dart';

class PrayerWidget extends StatelessWidget {
  final Kathisma? kathisma;
  const PrayerWidget({super.key, this.kathisma});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          child: Text(
            context.tr('prayer'),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: 16),
          child: Text(this.kathisma!.getPrayer()),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
