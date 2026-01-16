import 'package:jungers_psalter/models/psalm.dart';
import 'package:jungers_psalter/storage/locale_storage.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class PsalmStorage {
  static Future<Psalm> getPsalmById(String psalmId) async {
    String psalmKey = 'psalm$psalmId';
    String psalmDescriptionKey = 'psalmDesc$psalmId';

    String languageCode = await LocaleStorage.getLocale();

    String filePath = 'assets/data/psalms/$languageCode.json';

    final String response = await rootBundle.loadString(filePath);
    final data = await json.decode(response);

    return Psalm(
      num: int.parse(psalmId),
      description: data[psalmDescriptionKey] ?? '',
      text: data[psalmKey] ?? '',
    );
  }
}
