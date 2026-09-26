import 'package:flutter/material.dart';
import 'package:orth_psalter/models/enums/appearance_config.dart';
import 'package:orth_psalter/models/enums/font_size.dart';
import 'package:orth_psalter/models/notifiers/page_notifier.dart';
import 'package:orth_psalter/storage/system/appearance_config_storage.dart';
import 'package:orth_psalter/theme/app_colors.dart';

class FontSizeButton extends StatefulWidget {
  final PageNotifier? notifier;

  const FontSizeButton({super.key, this.notifier});

  @override
  State<FontSizeButton> createState() => _FontSizeButtonState();
}

class _FontSizeButtonState extends State<FontSizeButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.white60),
        foregroundColor: WidgetStatePropertyAll(
          AppColors.buttonForegroundColor,
        ),
      ),
      icon: const Icon(Icons.format_size),
      onPressed: () async {
        int fontSizeOptionId = await AppearanceConfigStorage().get(
          AppearanceConfig.psalterFontSize,
        );
        fontSizeOptionId++;
        if (fontSizeOptionId > (FontSize.values.length - 1)) {
          fontSizeOptionId = 0;
        }

        if (widget.notifier != null) {
          await widget.notifier!.changePsalterFontSize(fontSizeOptionId);
        }
      },
    );
  }
}
