import 'package:flutter/material.dart';

class ApplicationNotifier with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  void switchTheme(ThemeMode themeMode) {
    this._themeMode = themeMode;
    notifyListeners();
  }

  ThemeMode getThemeMode() {
    return this._themeMode;
  }
}
