import 'package:intl/intl_standalone.dart'
    if (dart.library.html) 'package:intl/intl_browser.dart';
import 'package:orth_psalter/helpers/json_helper.dart';
import 'package:orth_psalter/helpers/utils_helper.dart';
import 'package:orth_psalter/storage/locale_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PsalterTranslationStorage {
  static String defaultLocale = 'en';

  /// @see https://www.iana.org/assignments/language-subtag-registry/language-subtag-registry
  static List defaultLocaleToTranslation = [
    {'languageCode': 'en', 'translationCode': 'kjv'},
    {'languageCode': 'ru', 'translationCode': 'jungerov'},
    {'languageCode': 'uk', 'translationCode': 'uk'},
  ];

  static List<String> translationCodes = ['kjv', 'jungerov', 'rucu', 'uk'];

  static Future<String> getTranslationCode() async {
    final preferences = await SharedPreferences.getInstance();

    return preferences.getString('psalterTranslation') ??
        await PsalterTranslationStorage.getDefaultTranslationCode();
  }

  static void setTranslationCode(String translationCode) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString('psalterTranslation', translationCode);
  }

  static getTranslationKeyByCode(String translationCode) {
    return 'transName${UtilsHelper.capitalize(translationCode)}';
  }

  static Future<String> getDefaultTranslationCode() async {
    String languageCode = await LocaleStorage.getLocale();
    String defaultTranslationCode =
        JsonHelper.filterJsonByKey(
          defaultLocaleToTranslation,
          'languageCode',
          languageCode,
        )[0]['translationCode'] ??
        PsalterTranslationStorage.defaultLocale;

    return defaultTranslationCode;
  }
}
