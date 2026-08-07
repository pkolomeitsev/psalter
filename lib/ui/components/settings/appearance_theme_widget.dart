import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:orth_psalter/helpers/global_helper.dart';
import 'package:orth_psalter/helpers/utils_helper.dart';
import 'package:orth_psalter/models/enums/appearance_config.dart';
import 'package:orth_psalter/models/enums/theme_options.dart';
import 'package:orth_psalter/storage/appearance_config_storage.dart';

class AppearanceThemeWidget extends StatefulWidget {
  const AppearanceThemeWidget({super.key});

  @override
  State<AppearanceThemeWidget> createState() => _AppearanceThemeWidgetState();
}

class _AppearanceThemeWidgetState extends State<AppearanceThemeWidget> {
  late ThemeOptions currentTheme = ThemeOptions.auto;

  Future<int> fetchData() async {
    return await AppearanceConfigStorage().get(
      AppearanceConfig.themeOptions,
      defaultValue: this.currentTheme.index,
    );
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
          this.currentTheme = UtilsHelper.intToThemeOptionEnum(snapshot.data!);

          return DropdownMenu<String>(
            label: Text(context.tr('theme')),
            initialSelection: this.currentTheme.index.toString(),
            leadingIcon: this.getIconByThemeOptionIndex(
              this.currentTheme.index,
            ),
            onSelected: (String? value) {
              setState(() {
                this.currentTheme = UtilsHelper.intToThemeOptionEnum(
                  int.parse(value!),
                );
                AppearanceConfigStorage().set(
                  AppearanceConfig.themeOptions,
                  this.currentTheme.index,
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
            inputDecorationTheme: const InputDecorationTheme(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          );
        }

        return const Center(child: Text('No data found'));
      },
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
