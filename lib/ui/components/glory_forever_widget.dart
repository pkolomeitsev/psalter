import 'package:flutter/material.dart';
import 'package:orth_psalter/models/trisagion_2_our_father.dart';
import 'package:orth_psalter/theme/app_colors.dart';
import 'package:orth_psalter/theme/app_font.dart';

class GloryForeverWidget extends StatelessWidget {
  final Trisagion2OurFather trisagion2ourFather;
  const GloryForeverWidget({super.key, required this.trisagion2ourFather});

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
            this.trisagion2ourFather.getGloryForeverShort(),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: AppFont.comfortReadingSize),
          child: Text(this.trisagion2ourFather.getGloryForever()),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: AppFont.comfortReadingSize),
          child: Text(this.trisagion2ourFather.getHallelujah3T()),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: AppFont.comfortReadingSize),
          child: Text(this.trisagion2ourFather.getLordHaveMercy3T()),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: AppFont.comfortReadingSize),
          child: Text(this.trisagion2ourFather.getGloryForever()),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
