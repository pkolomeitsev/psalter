import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class JsonHelper {
  static Future<dynamic> getJsonData(String filePath) async {
    final String response = await rootBundle.loadString(filePath);

    return await json.decode(response);
  }

  static List<dynamic> filterJsonByKey(
    List<dynamic> jsonList,
    String key,
    dynamic value,
  ) {
    final filteredList = jsonList
        .where((element) => element[key] == value)
        .toList();

    return filteredList;
  }
}
