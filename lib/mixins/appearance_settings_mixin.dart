import 'package:orth_psalter/theme/app_font.dart';

mixin AppearanceSettingsMixin {
  late double bodyFontSize;
  late double titleFontSize;

  void initAppearanceSettings() async {
    this.bodyFontSize = await AppFont.getPsalterReadingFontSize();
    this.titleFontSize =
        (this.bodyFontSize + AppFont.psalterTitleFontSizeOffset);
  }
}
