import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:orth_psalter/helpers/utils_helper.dart';
import 'package:orth_psalter/models/enums/theme_options.dart';
import 'package:orth_psalter/storage/psalter_translation_storage.dart';

class AppearanceThemeWidget extends StatefulWidget {
  const AppearanceThemeWidget({super.key});

  @override
  State<AppearanceThemeWidget> createState() => _AppearanceThemeWidgetState();
}

class _AppearanceThemeWidgetState extends State<AppearanceThemeWidget> {
  late ThemeOptions currentTheme = ThemeOptions.light;

  Future<String> fetchData() async {
    return await "0"; //PsalterTranslationStorage.getTranslationCode();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: this.fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error} ${snapshot.stackTrace}'),
          );
        } else if (snapshot.hasData) {
          // this.currentTheme = UtilsHelper.intToThemeOptionEnum(
          //   // int.parse(snapshot.data!),
          //   0
          // );

          return DropdownMenu<String>(
            label: Text(context.tr('theme')),
            initialSelection: this.currentTheme.index.toString(),
            leadingIcon: this.getIconByThemeOptionIndex(this.currentTheme.index),
            onSelected: (String? value) {
              setState(() {
                this.currentTheme = UtilsHelper.intToThemeOptionEnum(
                  int.parse(value!),
                );
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
      default:
        return Icon(Icons.light_mode);
    }
  }
}
