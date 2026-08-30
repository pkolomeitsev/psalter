import 'package:easy_localization/easy_localization.dart';
import 'package:intl/intl_standalone.dart'
    if (dart.library.html) 'package:intl/intl_browser.dart';
import 'package:orth_psalter/helpers/utils_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleStorage {
  static String defaultLocale = 'en';
  /// @see https://www.iana.org/assignments/language-subtag-registry/language-subtag-registry
  static List<String> languageCodes = ['en', 'ru', 'uk'];

  static Future<String> getLocale() async {
    final preferences = await SharedPreferences.getInstance();
    final foundPlatformLocale = await findSystemLocale();

    return preferences.getString('locale')
      ?? foundPlatformLocale.toLocale().languageCode;
  }

  static getTranslationKeyByCode(String languageCode) {
    return 'langName${UtilsHelper.capitalize(languageCode)}';
  }

  static getDefaultLocale() {
    return LocaleStorage.defaultLocale;
  }
}
