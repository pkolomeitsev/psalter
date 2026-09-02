import 'package:flutter/material.dart';
import 'package:orth_psalter/models/common_prayers.dart';
import 'package:orth_psalter/singleton/appearance_config_singleton.dart';
import 'package:orth_psalter/theme/app_colors.dart';

class Trisagion2OurFatherWidget extends StatelessWidget {
  final CommonPrayers commonPrayers;
  const Trisagion2OurFatherWidget({
    super.key,
    required this.commonPrayers,
  });

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
            commonPrayers.getTrisagion2OurFatherLabel(),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: TextStyle(
            fontSize: AppearanceConfigSingleton().getBodyFontSize(),
          ),
          child: Text(commonPrayers.getTrisagion()),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: TextStyle(
            fontSize: AppearanceConfigSingleton().getBodyFontSize(),
          ),
          child: Text(commonPrayers.getGloryForever()),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: TextStyle(
            fontSize: AppearanceConfigSingleton().getBodyFontSize(),
          ),
          child: Text(commonPrayers.getMostHolyTrinity()),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: TextStyle(
            fontSize: AppearanceConfigSingleton().getBodyFontSize(),
          ),
          child: Text(commonPrayers.getLordHaveMercy3T()),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: TextStyle(
            fontSize: AppearanceConfigSingleton().getBodyFontSize(),
          ),
          child: Text(commonPrayers.getGloryForever()),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: TextStyle(
            fontSize: AppearanceConfigSingleton().getBodyFontSize(),
          ),
          child: Text(commonPrayers.getOurFather()),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
