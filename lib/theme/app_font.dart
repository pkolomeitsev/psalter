import 'package:orth_psalter/helpers/utils_helper.dart';
import 'package:orth_psalter/models/enums/appearance_config.dart';
import 'package:orth_psalter/models/enums/font_size.dart';
import 'package:orth_psalter/storage/system/appearance_config_storage.dart';

class AppFont {
  static const double comfortReadingSize = 16;
  static const double mediumReadingSize = 20;
  static const double largeReadingSize = 24;

  static Map<FontSize, double> psalterFontSizeMapping = {
    FontSize.small: AppFont.comfortReadingSize,
    FontSize.medium: AppFont.mediumReadingSize,
    FontSize.large: AppFont.largeReadingSize,
  };

  static double psalterTitleFontSizeOffset = 2;

  static Future<double> getPsalterReadingFontSize() async {
    int psalterFontSizeConfig = await AppearanceConfigStorage().get(
      AppearanceConfig.psalterFontSize,
    );

    return psalterFontSizeMapping[UtilsHelper.intToFontSizeEnum(
          psalterFontSizeConfig,
        )] ??
        AppFont.comfortReadingSize;
  }
}
