import 'package:flutter/material.dart';
import 'package:orth_psalter/models/common_prayers.dart';
import 'package:orth_psalter/singleton/appearance_config_singleton.dart';
import 'package:orth_psalter/theme/app_colors.dart';

class GloryForeverShortWidget extends StatelessWidget {
  final CommonPrayers trisagion2ourFather;
  const GloryForeverShortWidget({super.key, required this.trisagion2ourFather});

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
            this.trisagion2ourFather.getGloryForeverShort(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: AppearanceConfigSingleton().getBodyFontSize(),
            ),
          ),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: TextStyle(
            fontSize: AppearanceConfigSingleton().getBodyFontSize(),
          ),
          child: Text(this.trisagion2ourFather.getGloryForever()),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: TextStyle(
            fontSize: AppearanceConfigSingleton().getBodyFontSize(),
          ),
          child: Text(this.trisagion2ourFather.getHallelujah3T()),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
