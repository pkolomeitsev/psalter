import 'package:flutter/material.dart';
import 'package:orth_psalter/singleton/appearance_config_singleton.dart';
import 'package:orth_psalter/theme/app_colors.dart';

class PrayerView extends StatelessWidget {
  final String prayerName;
  final String prayerText;
  const PrayerView({super.key, this.prayerName = '', required this.prayerText});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        if (this.prayerName.isNotEmpty) ...[
          DefaultTextStyle.merge(
            style: TextStyle(
              fontSize: AppearanceConfigSingleton().getTitleFontSize(),
              fontWeight: FontWeight.bold,
              color: AppColors.textHeadingColor,
            ),
            child: SelectableText(
              this.prayerName,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10),
        ],
        DefaultTextStyle.merge(
          style: TextStyle(
            fontSize: AppearanceConfigSingleton().getBodyFontSize(),
          ),
          child: SelectableText(this.prayerText),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
