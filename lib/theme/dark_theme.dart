import 'package:flutter/material.dart';
import 'package:orth_psalter/theme/app_colors.dart';
import 'package:orth_psalter/theme/interfaces/theme_interface.dart';

class DarkTheme implements ThemeInterface {
  @override
  ThemeData getThemeData() {
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
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
