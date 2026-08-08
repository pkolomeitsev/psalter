import 'package:flutter/material.dart';
import 'package:orth_psalter/models/enums/font_size.dart';
import 'package:orth_psalter/models/enums/theme_options.dart';

class UtilsHelper {
  static String capitalize(String str) =>
      '${str[0].toUpperCase()}${str.substring(1)}';

  static List<int> stringListToInt(List<String> stringList) =>
      stringList.map((i) => int.parse(i)).toList();

  static List<String> intListToString(List<int> intList) =>
      intList.map((i) => i.toString()).toList();

  static FontSize intToFontSizeEnum(int value) {
    return FontSize.values[value];
  }

  static ThemeOptions intToThemeOptionEnum(int value) {
    return ThemeOptions.values[value];
  }

  static themeOptionToThemeMode(ThemeOptions option) {
    switch (option) {
      case ThemeOptions.light:
      case ThemeOptions.beige:
        return ThemeMode.light;

      case ThemeOptions.dark:
        return ThemeMode.dark;

      case ThemeOptions.auto:
        return ThemeMode.system;
    }
  }
}
