import 'package:flutter/material.dart';
import 'package:orth_psalter/theme/app_colors.dart';
import 'package:orth_psalter/theme/interfaces/theme_interface.dart';

class BeigeTheme implements ThemeInterface {
  @override
  ThemeData getThemeData() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.amber,
      ),
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
}