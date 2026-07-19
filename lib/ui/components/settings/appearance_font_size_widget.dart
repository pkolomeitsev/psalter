import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:orth_psalter/models/dto/simple_dto.dart';
import 'package:orth_psalter/models/enums/appearance_config.dart';
import 'package:orth_psalter/models/enums/font_size.dart';
import 'package:orth_psalter/storage/appearance_config_storage.dart';
import 'package:orth_psalter/ui/components/segmented_button_widget.dart';

class AppearanceFontSizeWidget extends StatefulWidget {
  const AppearanceFontSizeWidget({super.key});

  @override
  State<AppearanceFontSizeWidget> createState() =>
      _AppearanceFontSizeWidgetState();
}

class _AppearanceFontSizeWidgetState extends State<AppearanceFontSizeWidget> {
  int selectedValue = 0;

  Future<int> fetchData() async {
    return await AppearanceConfigStorage().get(AppearanceConfig.fontSize);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: this.fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error} ${snapshot.stackTrace}'),
          );
        } else if (snapshot.hasData) {
          this.selectedValue = snapshot.data!;

          return SegmentedButtonWidget(
            segments: [
              SimpleDto(
                context.tr('psalterFontSizeSmall'),
                FontSize.small,
                null,
              ),
              SimpleDto(
                context.tr('psalterFontSizeMedium'),
                FontSize.medium,
                null,
              ),
              SimpleDto(
                context.tr('psalterFontSizeLarge'),
                FontSize.large,
                null,
              ),
            ],
            defaultItemId: this.selectedValue,
            identifier: 'font_size_selector',
            callback: onSelect,
          );
        }

        return const Center(child: Text('No data found'));
      },
    );
  }

  void onSelect(dynamic value) {
    AppearanceConfigStorage().set(AppearanceConfig.fontSize, value);
  }
}
