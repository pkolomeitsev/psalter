import 'package:flutter/material.dart';
import 'package:orth_psalter/models/common_prayers.dart';
import 'package:orth_psalter/singleton/appearance_config_singleton.dart';
import 'package:orth_psalter/theme/app_colors.dart';

class GloryForeverWidget extends StatelessWidget {
  final CommonPrayers commonPrayers;
  const GloryForeverWidget({super.key, required this.commonPrayers});

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
            this.commonPrayers.getGloryForeverShort(),
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
          child: Text(this.commonPrayers.getGloryForever()),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: TextStyle(
            fontSize: AppearanceConfigSingleton().getBodyFontSize(),
          ),
          child: Text(this.commonPrayers.getHallelujah3T()),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: TextStyle(
            fontSize: AppearanceConfigSingleton().getBodyFontSize(),
          ),
          child: Text(this.commonPrayers.getLordHaveMercy3T()),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: TextStyle(
            fontSize: AppearanceConfigSingleton().getBodyFontSize(),
          ),
          child: Text(this.commonPrayers.getGloryForever()),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
