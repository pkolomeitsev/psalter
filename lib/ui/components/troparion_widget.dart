import 'package:flutter/material.dart';
import 'package:orth_psalter/models/kathisma.dart';
import 'package:orth_psalter/theme/app_colors.dart';
import 'package:orth_psalter/theme/app_font.dart';

class TroparionWidget extends StatelessWidget {
  final Kathisma? kathisma;
  const TroparionWidget({super.key, this.kathisma});

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
            this.kathisma!.getTrisagion2OurFather().getTropariaLabel(),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: AppFont.comfortReadingSize),
          child: SelectableText(this.kathisma!.getTroparion()),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
