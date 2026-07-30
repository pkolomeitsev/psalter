import 'package:flutter/material.dart';
import 'package:orth_psalter/models/psalm.dart';
import 'package:orth_psalter/singleton/appearance_config_singleton.dart';
import 'package:orth_psalter/theme/app_colors.dart';

class PsalmView extends StatelessWidget {
  final Psalm psalm;
  const PsalmView({super.key, required this.psalm});

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
          child: SelectableText(
            this.psalm.getTitle() ?? '',
            textAlign: TextAlign.center,
          ),
        ),
        if (!this.psalm.getDescription().isEmpty) ...[
          SizedBox(height: 10),
          DefaultTextStyle.merge(
            style: TextStyle(
              fontSize: AppearanceConfigSingleton().getTitleFontSize(),
              fontWeight: FontWeight.bold,
              color: AppColors.textHeadingColor,
            ),
            child: SelectableText(
              this.psalm.getDescription(),
              textAlign: TextAlign.center,
            ),
          ),
        ],
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: TextStyle(
            fontSize: AppearanceConfigSingleton().getBodyFontSize(),
          ),
          child: SelectableText(this.psalm.getText()),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
