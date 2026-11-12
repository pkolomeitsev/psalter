import 'package:flutter/material.dart';
import 'package:orth_psalter/models/common_prayers.dart';
import 'package:orth_psalter/singleton/appearance_config_singleton.dart';
import 'package:orth_psalter/theme/app_colors.dart';
import 'package:orth_psalter/ui/components/text/prayers/glory_forever_widget.dart';
import 'package:orth_psalter/ui/views/psalm_view.dart';

class Psalm118View extends PsalmView {
  final CommonPrayers commonPrayers;
  const Psalm118View({
    super.key,
    required super.psalm,
    required this.commonPrayers,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (this.psalm.getTitle() != null) ...[
          DefaultTextStyle.merge(
            style: TextStyle(
              fontSize: AppearanceConfigSingleton().getTitleFontSize(),
              fontWeight: FontWeight.bold,
              color: AppColors.textHeadingColor,
            ),
            child: SelectableText(
              this.psalm.getTitle().toString(),
              textAlign: TextAlign.center,
            ),
          ),
        ],
        if (this.psalm.getDescription().isNotEmpty) ...[
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
        this.renderPsalmVerses(
          context,
          this.psalm.getPsalmVerses().where((v) => v.getNum() <= 72).toList(),
        ),
        SizedBox(height: 10),
        GloryForeverWidget(commonPrayers: this.commonPrayers),
        SizedBox(height: 10),
        this.renderPsalmVerses(
          context,
          this.psalm
              .getPsalmVerses()
              .where((v) => (v.getNum() >= 73 && v.getNum() <= 93))
              .toList(),
        ),
        SizedBox(height: 10),
        DefaultTextStyle.merge(
          style: TextStyle(
            fontSize: AppearanceConfigSingleton().getBodyFontSize(),
          ),
          child: Text("${this.commonPrayers.getMiddle118()}"),
        ),
        SizedBox(height: 10),
        this.renderPsalmVerses(
          context,
          this.psalm
              .getPsalmVerses()
              .where((v) => (v.getNum() >= 94 && v.getNum() <= 131))
              .toList(),
        ),
        SizedBox(height: 10),
        GloryForeverWidget(commonPrayers: this.commonPrayers),
        SizedBox(height: 10),
        this.renderPsalmVerses(
          context,
          this.psalm
              .getPsalmVerses()
              .where((v) => (v.getNum() >= 132 && v.getNum() <= 176))
              .toList(),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
