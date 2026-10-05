import 'package:orth_psalter/helpers/json_helper.dart';
import 'package:orth_psalter/models/dto/verse_dto.dart';
import 'package:orth_psalter/models/psalm.dart';
import 'package:orth_psalter/storage/system/psalter_translation_storage.dart';

class PsalmStorage {
  static const int psalmsAmount = 151;

  static Future<dynamic> getJsonData() async {
    String languageCode = await PsalterTranslationStorage.getTranslationCode();
    String filePath = 'assets/data/psalms/$languageCode.json';

    return await JsonHelper.getJsonData(filePath);
  }

  static Future<Psalm> getPsalmById(int psalmId) async {
    final data = await PsalmStorage.getJsonData();

    return Psalm(
      num: psalmId,
      description: data[PsalmStorage.getPsalmDescriptionKey(psalmId)] ?? '',
      verses: PsalmStorage.getPsalmVersesFromDataById(psalmId, data),
    );
  }

  static Future<List<Psalm>> getPsalmsByIds(List<int> ids) async {
    final List<Psalm> result = [];
    final data = await PsalmStorage.getJsonData();

    for(final id in ids){
      result.add(Psalm(
        num: id,
        description: data[PsalmStorage.getPsalmDescriptionKey(id)] ?? '',
        verses: PsalmStorage.getPsalmVersesFromDataById(id, data),
      ));
    }

    return result;
  }

  static List<VerseDto> getPsalmVersesFromDataById(int psalmId, data) {
    List<VerseDto> versesList = [];

    for(final verse in data[PsalmStorage.getPsalmVersesKey(psalmId)]) {
      verse.forEach((key, value) => versesList.add(VerseDto(key, value)));
    }

    return versesList;
  }

  static String getPsalmDescriptionKey(int id) => 'psalmDesc$id';
  static String getPsalmVersesKey(int id) => 'psalmVerses$id';
}
