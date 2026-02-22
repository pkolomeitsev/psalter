import 'package:easy_localization/easy_localization.dart';
import 'package:intl/intl_standalone.dart'
    if (dart.library.html) 'package:intl/intl_browser.dart';
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
    final foundPlatformLocale = await findSystemLocale();

    return preferences.getString('locale')
      ?? foundPlatformLocale.toLocale().languageCode;
  }

  static getDefaultLocale() {
    return LocaleStorage.defaultLocale;
  }
}
