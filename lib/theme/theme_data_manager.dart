import 'package:flutter/material.dart';
import 'package:orth_psalter/models/enums/theme_options.dart';
import 'package:orth_psalter/theme/app_colors.dart';

class ThemeDataManager {
  static ThemeData getLightThemeData() {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.brandBgColor,
        foregroundColor: AppColors.titleTextColor,
      ),
      tabBarTheme: TabBarThemeData(
        unselectedLabelColor: Colors.white70,
        labelStyle: TextStyle(color: Colors.white),
        indicatorColor: Colors.white,
      ),
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: AppColors.brandBgColor,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.buttonBgColor),
          foregroundColor: WidgetStatePropertyAll(
            AppColors.buttonForegroundColor,
          ),
        ),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: SegmentedButton.styleFrom(
          selectedBackgroundColor: AppColors.brandColorLight,
        ),
      ),
      chipTheme: ChipThemeData(selectedColor: AppColors.brandColorLight),
    );
  }

  static ThemeData getDarkThemeData() {
    return ThemeData(
      brightness: Brightness.dark, // Essential for dark mode
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.brandBgColor,
        foregroundColor: AppColors.titleTextColor,
      ),
      tabBarTheme: TabBarThemeData(
        unselectedLabelColor: Colors.white70,
        labelStyle: TextStyle(color: Colors.white),
        indicatorColor: Colors.white,
      ),
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: AppColors.brandBgColor,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.buttonBgColorDark),
          foregroundColor: WidgetStatePropertyAll(
            AppColors.buttonForegroundColorDark,
          ),
        ),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: SegmentedButton.styleFrom(
          selectedBackgroundColor: AppColors.brandBgColor,
        ),
      ),
      chipTheme: ChipThemeData(selectedColor: AppColors.brandBgColor),
    );
  }

  static themeOptionToThemeMode(ThemeOptions option) {
    switch (option) {
      case ThemeOptions.light:
        return ThemeMode.light;
      case ThemeOptions.dark:
        return ThemeMode.dark;
      case ThemeOptions.beige:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}
