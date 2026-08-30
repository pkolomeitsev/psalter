import 'package:flutter/material.dart';
import 'package:orth_psalter/models/kathisma.dart';
import 'package:orth_psalter/singleton/appearance_config_singleton.dart';
import 'package:orth_psalter/theme/app_colors.dart';

class PrayerWidget extends StatelessWidget {
  final Kathisma? kathisma;
  const PrayerWidget({super.key, this.kathisma});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTextStyle.merge(
          style: TextStyle(
            fontSize: AppearanceConfigSingleton().getTitleFontSize(),
            fontWeight: FontWeight.bold,
            color: AppColors.textHeadingColor,
          ),
          child: Text(
            this.kathisma!.getCommonPrayers().getPrayerLabel(),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: TextStyle(
            fontSize: AppearanceConfigSingleton().getBodyFontSize(),
          ),
          child: SelectableText(this.kathisma!.getPrayer()),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
