import 'package:orth_psalter/helpers/json_helper.dart';

class ThanksStorage {
  static Future<dynamic> getReferences() async {
    String filePath = 'assets/data/credits/thanks.json';
    dynamic thanksData = await JsonHelper.getJsonData(filePath);

    return thanksData;
  }
}
