import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:orth_psalter/models/enums/font_size.dart';
import 'package:orth_psalter/models/enums/theme_options.dart';
import 'package:url_launcher/url_launcher.dart';

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

  static String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map(
          (MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
        )
        .join('&');
  }

  static Future<bool> sendEmail(String mail, String subject, String body) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: mail,
      query: UtilsHelper.encodeQueryParameters(<String, String>{
        'subject': subject,
        'body': body,
      }),
    );
    LaunchMode mode = await supportsLaunchMode(LaunchMode.externalApplication)
      ? LaunchMode.externalApplication
      : LaunchMode.platformDefault;

    if (await launchUrl(emailLaunchUri, mode: mode)) {
      return true;
    }

    if (kDebugMode) {
      print('Error: to launch email -> $emailLaunchUri ; mode: $mode');
    }

    return false;
  }
}
