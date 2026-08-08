import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:orth_psalter/helpers/global_helper.dart';
import 'package:orth_psalter/helpers/utils_helper.dart';
import 'package:orth_psalter/models/enums/theme_options.dart';
import 'package:orth_psalter/singleton/appearance_config_singleton.dart';

class AppearanceThemeWidget extends StatefulWidget {
  const AppearanceThemeWidget({super.key});

  @override
  State<AppearanceThemeWidget> createState() => _AppearanceThemeWidgetState();
}

class _AppearanceThemeWidgetState extends State<AppearanceThemeWidget> {
  late ThemeOptions currentTheme;

  @override
  void initState() {
    super.initState();
    this.currentTheme = UtilsHelper.intToThemeOptionEnum(
      AppearanceConfigSingleton().getTheme(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      key: UniqueKey(),
      label: Text(context.tr('theme')),
      initialSelection: this.currentTheme.index.toString(),
      leadingIcon: this.getIconByThemeOptionIndex(this.currentTheme.index),
      onSelected: (String? value) {
        setState(() {
          this.currentTheme = UtilsHelper.intToThemeOptionEnum(
            int.parse(value!),
          );
          GlobalHelper.applicationNotifier.switchTheme(this.currentTheme);
        });
      },
      dropdownMenuEntries: ThemeOptions.values.map((ThemeOptions option) {
        Icon icon = this.getIconByThemeOptionIndex(option.index);

        return DropdownMenuEntry(
          value: option.index.toString(),
          label: context.tr("${option.name}Theme"),
          leadingIcon: icon,
          trailingIcon: (option.index == this.currentTheme.index)
              ? const Icon(Icons.check)
              : null,
        );
      }).toList(),
      expandedInsets: EdgeInsets.zero,
    );
  }

  Icon getIconByThemeOptionIndex(int index) {
    switch (index) {
      case 1:
        return Icon(Icons.dark_mode);
      case 2:
        return Icon(Icons.contrast);
      case 3:
        return Icon(Icons.auto_awesome);
      default:
        return Icon(Icons.light_mode);
    }
  }
}
