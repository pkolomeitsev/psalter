import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LocaleStorage {
  static String defaultLocale = 'en';
  static List languages = [
    {'languageCode': 'en', 'languageName': 'langNameEn'},
    {'languageCode': 'ru', 'languageName': 'langNameRu'},
    {'languageCode': 'cu', 'languageName': 'langNameRuSlav'},
  ];

  static Future<String> getLocale() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString('locale') ?? LocaleStorage.defaultLocale;
  }
}
