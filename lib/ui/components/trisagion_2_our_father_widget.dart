import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:orth_psalter/theme/app_font.dart';

class Trisagion2OurFatherWidget extends StatelessWidget {
  const Trisagion2OurFatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          child: Text(
            context.tr('trisagion2OurFather'),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: AppFont.comfortReadingSize),
          child: Text(context.tr('trisagion')),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: AppFont.comfortReadingSize),
          child: Text(context.tr('gloryForever')),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: AppFont.comfortReadingSize),
          child: Text(context.tr('mostHolyTrinity')),
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
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: AppFont.comfortReadingSize),
          child: Text(context.tr('ourFather')),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
