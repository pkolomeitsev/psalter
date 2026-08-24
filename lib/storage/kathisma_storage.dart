import 'package:orth_psalter/helpers/json_helper.dart';
import 'package:orth_psalter/models/kathisma.dart';
import 'package:orth_psalter/models/common_prayers.dart';
import 'package:orth_psalter/storage/psalm_storage.dart';
import 'package:orth_psalter/storage/psalter_translation_storage.dart';

class KathismaStorage {
  static const int kathismasAmount = 20;
  static const List<String> psalmsMap = [
    '1-8',
    '9-16',
    '17-23',
    '24-31',
    '32-36',
    '37-45',
    '46-54',
    '55-63',
    '64-69',
    '70-76',
    '77-84',
    '85-90',
    '91-100',
    '101-104',
    '105-108',
    '109-117',
    '118',
    '119-133',
    '134-142',
    '143-150'
  ];

  static Future<Kathisma> getKathismaById(int kathismaId) async {
    String languageCode = await PsalterTranslationStorage.getTranslationCode();

    String filePath = 'assets/data/kathismas/prayer_$languageCode.json';
    dynamic prayerData = await JsonHelper.getJsonData(filePath);
    prayerData = JsonHelper.filterJsonByKey(prayerData, 'num', kathismaId);

    filePath = 'assets/data/prayers/common_prayers_$languageCode.json';
    dynamic commonPrayersData = await JsonHelper.getJsonData(filePath);
    CommonPrayers commonPrayers = CommonPrayers(commonPrayersData);

    filePath = 'assets/data/kathismas/statistics.json';
    dynamic jsonData = await JsonHelper.getJsonData(filePath);
    List<dynamic> statData = JsonHelper.filterJsonByKey(jsonData, 'num', kathismaId);

    int start = statData[0]['psalmFrom'];
    int end = statData[0]['psalmTo'];
    List<int> ids = List<int>.generate(end - start + 1, (i) => start + i);
    final psalms = await PsalmStorage.getPsalmsByIds(ids);

    return Kathisma(
      num: kathismaId,
      psalmFrom: statData[0]['psalmFrom'],
      psalmTo: statData[0]['psalmTo'],
      gloryAfter: statData[0]['gloryAfter'].cast<int>(),
      troparion: prayerData[0]['troparion'],
      prayer: prayerData[0]['prayer'],
      commonPrayers: commonPrayers,
      psalms: psalms
    );
  }
}
