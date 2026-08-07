import 'package:flutter/material.dart';
import 'package:orth_psalter/models/enums/theme_options.dart';

class ApplicationNotifier with ChangeNotifier {
  ThemeOptions? _themeOption;

  void switchTheme(ThemeOptions option) {
    this._themeOption = option;
    notifyListeners();
  }

  ThemeOptions? getThemeOption() {
    return this._themeOption;
  }
}
