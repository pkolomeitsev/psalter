import 'package:flutter/material.dart';
import 'package:orth_psalter/models/enums/appearance_config.dart';
import 'package:orth_psalter/singleton/appearance_config_singleton.dart';
import 'package:orth_psalter/storage/system/appearance_config_storage.dart';

class PageNotifier with ChangeNotifier {
  Future<void> changePsalterFontSize(int fontSizeOptionId) async {
    await AppearanceConfigStorage().set(
      AppearanceConfig.psalterFontSize,
      fontSizeOptionId,
    );
    await AppearanceConfigSingleton().initAppearanceSettings();

    notifyListeners();
  }
}