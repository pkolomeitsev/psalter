import 'package:orth_psalter/models/enums/appearance_config.dart';
import 'package:orth_psalter/storage/appearance_config_storage.dart';
import 'package:orth_psalter/theme/app_font.dart';

class AppearanceConfigSingleton {
  late double _bodyFontSize;
  late double _titleFontSize;
  late int _theme;

  AppearanceConfigSingleton._();
  static final AppearanceConfigSingleton _instance =
      AppearanceConfigSingleton._();

  factory AppearanceConfigSingleton() {
    return _instance;
  }

  Future<void> initAppearanceSettings() async {
    this._bodyFontSize = await AppFont.getPsalterReadingFontSize();
    this._titleFontSize =
        (this._bodyFontSize + AppFont.psalterTitleFontSizeOffset);
    this._theme = await AppearanceConfigStorage().get(
      AppearanceConfig.themeOptions
    );
  }

  double getTitleFontSize() => _titleFontSize;
  double getBodyFontSize() => _bodyFontSize;
  int getTheme() => _theme;
}
