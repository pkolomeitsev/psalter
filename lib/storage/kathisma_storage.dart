import 'package:jungers_psalter/helpers/json_helper.dart';
import 'package:jungers_psalter/models/kathisma.dart';
import 'package:jungers_psalter/storage/locale_storage.dart';
import 'package:jungers_psalter/storage/psalm_storage.dart';

class KathismaStorage {
  static Future<Kathisma> getKathismaById(int kathismaId) async {
    String languageCode = await LocaleStorage.getLocale();
    String filePath = 'assets/data/kathismas/prayer_$languageCode.json';
    dynamic prayerData = await JsonHelper.getJsonData(filePath);
    prayerData = JsonHelper.filterJsonByKey(prayerData, 'num', kathismaId);

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
      psalms: psalms
    );
  }
}
