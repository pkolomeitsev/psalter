import 'package:flutter/material.dart';
import 'package:orth_psalter/models/dto/verse_dto.dart';
import 'package:orth_psalter/models/psalm.dart';
import 'package:orth_psalter/singleton/appearance_config_singleton.dart';
import 'package:orth_psalter/theme/app_colors.dart';

class PsalmView extends StatelessWidget {
  final Psalm psalm;
  final bool hasNumeration;

  const PsalmView({super.key, required this.psalm, this.hasNumeration = false});

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
        this.renderPsalmVerses(context, this.psalm.getPsalmVerses()),
        SizedBox(height: 10),
      ],
    );
  }

  Widget renderPsalmVerses(BuildContext context, List<VerseDto> psalmVerses) {
    if (this.hasNumeration) {
      List<InlineSpan> numeratedVerses = [];
      final double expOffset =
          AppearanceConfigSingleton().getBodyFontSize() / 2 * (-1);

      for (VerseDto verse in psalmVerses) {
        numeratedVerses.add(
          TextSpan(
            children: [
              WidgetSpan(
                child: Transform.translate(
                  offset: Offset(0, expOffset),
                  child: Text(
                    verse.getNum(),
                    textScaler: TextScaler.linear(0.7),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textHeadingColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
        numeratedVerses.add(
          TextSpan(
            text: '${verse.getValue()} ',
            style: TextStyle(
              color: DefaultTextStyle.of(context).style.color,
              fontSize: AppearanceConfigSingleton().getBodyFontSize(),
              height: DefaultTextStyle.of(context).style.height,
            ),
          ),
        );
      }

      return RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: AppearanceConfigSingleton().getBodyFontSize(),
          ),
          children: numeratedVerses,
        ),
      );
    }

    final List<String> verses = psalmVerses
        .map((verse) => verse.getValue())
        .toList();

    return DefaultTextStyle.merge(
      style: TextStyle(fontSize: AppearanceConfigSingleton().getBodyFontSize()),
      child: SelectableText(verses.join(' ').toString()),
    );
  }
}
