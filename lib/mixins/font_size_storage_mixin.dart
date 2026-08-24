import 'package:orth_psalter/models/enums/appearance_config.dart';
import 'package:orth_psalter/singleton/appearance_config_singleton.dart';
import 'package:orth_psalter/storage/system/appearance_config_storage.dart';

mixin FontSizeStorageMixin {
  Future<int> getPsalterFontSize() async {
    return await AppearanceConfigStorage().get(
      AppearanceConfig.psalterFontSize,
    );
  }

  Future<void> setPsalterFontSize(int fontSize) async {
    AppearanceConfigStorage().set(AppearanceConfig.psalterFontSize, fontSize);
    // re-init singleton
    AppearanceConfigSingleton().initAppearanceSettings();
  }
}
