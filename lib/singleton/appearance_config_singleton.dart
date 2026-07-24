import 'package:orth_psalter/theme/app_font.dart';

class AppearanceConfigSingleton {
  late double _bodyFontSize;
  late double _titleFontSize;

  AppearanceConfigSingleton._();
  static final AppearanceConfigSingleton _instance =
      AppearanceConfigSingleton._();

  factory AppearanceConfigSingleton() {
    return _instance;
  }

  void initAppearanceSettings() async {
    this._bodyFontSize = await AppFont.getPsalterReadingFontSize();
    this._titleFontSize =
        (this._bodyFontSize + AppFont.psalterTitleFontSizeOffset);
  }

  double getTitleFontSize() => _titleFontSize;
  double getBodyFontSize() => _bodyFontSize;
}
