import 'package:orth_psalter/helpers/json_helper.dart';
import 'package:orth_psalter/models/psalm.dart';
import 'package:orth_psalter/storage/psalter_translation_storage.dart';

class PsalmStorage {
  static const int psalmsAmount = 151;

  static Future<dynamic> getJsonData() async {
    String languageCode = await PsalterTranslationStorage.getTranslationCode();
    String filePath = 'assets/data/psalms/$languageCode.json';

    return await JsonHelper.getJsonData(filePath);
  }

  static Future<Psalm> getPsalmById(String psalmId) async {
    String psalmKey = 'psalm$psalmId';
    String psalmDescriptionKey = 'psalmDesc$psalmId';

    final data = await PsalmStorage.getJsonData();

    return Psalm(
      num: int.parse(psalmId),
      description: data[psalmDescriptionKey] ?? '',
      text: data[psalmKey] ?? '',
    );
  }

  static Future<List<Psalm>> getPsalmsByIds(List<int> ids) async {
    final List<Psalm> result = [];
    final data = await PsalmStorage.getJsonData();

    for(final id in ids){
      String psalmKey = 'psalm$id';
      String psalmDescriptionKey = 'psalmDesc$id';

      result.add(Psalm(
        num: id,
        description: data[psalmDescriptionKey] ?? '',
        text: data[psalmKey] ?? '',
      ));
    }

    return result;
  }
}
