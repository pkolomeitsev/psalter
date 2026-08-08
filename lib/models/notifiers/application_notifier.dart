import 'package:flutter/material.dart';
import 'package:orth_psalter/models/enums/appearance_config.dart';
import 'package:orth_psalter/models/enums/theme_options.dart';
import 'package:orth_psalter/singleton/appearance_config_singleton.dart';
import 'package:orth_psalter/storage/appearance_config_storage.dart';

class ApplicationNotifier with ChangeNotifier {
  ThemeOptions? _themeOption;

  void switchTheme(ThemeOptions option) async{
    this._themeOption = option;
    AppearanceConfigStorage().set(
      AppearanceConfig.themeOptions,
      option.index,
    );
    await AppearanceConfigSingleton().initAppearanceSettings();
    notifyListeners();
  }

  ThemeOptions? getThemeOption() {
    return this._themeOption;
  }
}
