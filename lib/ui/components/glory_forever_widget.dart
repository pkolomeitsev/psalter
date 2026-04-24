import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orth_psalter/theme/app_colors.dart';
import 'package:orth_psalter/theme/app_font.dart';

class GloryForeverWidget extends StatelessWidget {
  const GloryForeverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTextStyle.merge(
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textHeadingColor,
          ),
          child: Text(
            context.tr('gloryForeverShort'),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: AppFont.comfortReadingSize),
          child: Text(context.tr('gloryForever')),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: AppFont.comfortReadingSize),
          child: Text(context.tr('hallelujah3T')),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: AppFont.comfortReadingSize),
          child: Text(context.tr('lordHaveMercy3T')),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: AppFont.comfortReadingSize),
          child: Text(context.tr('gloryForever')),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
