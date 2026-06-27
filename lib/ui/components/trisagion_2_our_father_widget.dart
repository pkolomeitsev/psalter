import 'package:flutter/material.dart';
import 'package:orth_psalter/models/trisagion_2_our_father.dart';
import 'package:orth_psalter/theme/app_colors.dart';
import 'package:orth_psalter/theme/app_font.dart';

class Trisagion2OurFatherWidget extends StatelessWidget {
  final Trisagion2OurFather trisagion2OurFather;
  const Trisagion2OurFatherWidget({
    super.key,
    required this.trisagion2OurFather,
  });

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
            trisagion2OurFather.getTrisagion2OurFatherLabel(),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: AppFont.comfortReadingSize),
          child: Text(trisagion2OurFather.getTrisagion()),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: AppFont.comfortReadingSize),
          child: Text(trisagion2OurFather.getGloryForever()),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: AppFont.comfortReadingSize),
          child: Text(trisagion2OurFather.getMostHolyTrinity()),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: AppFont.comfortReadingSize),
          child: Text(trisagion2OurFather.getLordHaveMercy3T()),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: AppFont.comfortReadingSize),
          child: Text(trisagion2OurFather.getGloryForever()),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: AppFont.comfortReadingSize),
          child: Text(trisagion2OurFather.getOurFather()),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
