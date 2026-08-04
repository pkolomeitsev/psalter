import 'package:flutter/material.dart';
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
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: SegmentedButton.styleFrom(
          selectedBackgroundColor: AppColors.brandBgColor,
        ),
      ),
      chipTheme: ChipThemeData(selectedColor: AppColors.brandBgColor),
      // colorSchemeSeed: Colors.blue,
    );
  }
}
