import 'package:flutter/material.dart';
import 'package:orth_psalter/helpers/utils_helper.dart';
import 'package:orth_psalter/models/enums/theme_options.dart';
import 'package:orth_psalter/theme/beige_theme.dart';
import 'package:orth_psalter/theme/dark_theme.dart';
import 'package:orth_psalter/theme/light_theme.dart';

class ThemeDataManager {
  late ThemeOptions _themeOption;
  late ThemeMode _themeMode;

  ThemeDataManager(ThemeOptions themeOption) {
    this._themeOption = themeOption;
    this._themeMode = UtilsHelper.themeOptionToThemeMode(this._themeOption);
  }

  ThemeData getLightThemeData() {
    switch(this._themeOption) {
      case ThemeOptions.beige:
        return BeigeTheme().getThemeData();
      default:
        return LightTheme().getThemeData();
    }
  }

  ThemeData getDarkThemeData() {
    return DarkTheme().getThemeData();
  }

  ThemeOptions getThemeOption() => _themeOption;
  ThemeMode getThemeMode() => _themeMode;
}
