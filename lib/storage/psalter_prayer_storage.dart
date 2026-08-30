import 'package:orth_psalter/helpers/json_helper.dart';
import 'package:orth_psalter/models/common_prayers.dart';
import 'package:orth_psalter/models/psalter_before_after_prayers.dart';
import 'package:orth_psalter/storage/psalter_translation_storage.dart';

class PsalterPrayerStorage {
  static Future<PsalterBeforeAfterPrayers> getBeforeAfterPrayers() async {
    String languageCode = await PsalterTranslationStorage.getTranslationCode();

    dynamic prayerData = await PsalterPrayerStorage.getPrayerData('before');
    prayerData.addAll(await PsalterPrayerStorage.getPrayerData('after'));
    String filePath = 'assets/data/prayers/common_prayers_$languageCode.json';
    dynamic commonPrayersData = await JsonHelper.getJsonData(filePath);
    CommonPrayers commonPrayers = CommonPrayers(commonPrayersData);

    return PsalterBeforeAfterPrayers(prayerData, commonPrayers);
  }

  static Future getPrayerData(String type) async {
    String languageCode = await PsalterTranslationStorage.getTranslationCode();

    String filePath = 'assets/data/psalms/$type/prayer_$languageCode.json';
    return await JsonHelper.getJsonData(filePath);
  }
}
