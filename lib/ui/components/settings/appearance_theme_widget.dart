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
  late ThemeOptions defaultTheme = ThemeOptions.light;

  Future<String> fetchData() async {
    return await PsalterTranslationStorage.getTranslationCode();
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuEntry<String>> menuItems = [];
    for (var themes in ThemeOptions.values) {
      Icon icon = Icon(Icons.light_mode);
      switch (themes.index){
        case 1:
          icon = Icon(Icons.dark_mode);
        case 2:
          icon = Icon(Icons.contrast);
      }

      menuItems.add(
        DropdownMenuEntry(
          value: themes.index.toString(),
          label: context.tr("${themes.name}Theme"),
          leadingIcon: icon,
        ),
      );
    }

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
          // this.defaultTheme = UtilsHelper.intToThemeOptionEnum(
          //   // int.parse(snapshot.data!),
          //   0
          // );
          return DropdownMenu<String>(
            label: Text(context.tr('theme')),
            initialSelection: this.defaultTheme.index.toString(),
            onSelected: (String? value) {
              setState(() {
                this.defaultTheme = UtilsHelper.intToThemeOptionEnum(
                  int.parse(value!),
                );
              });
            },
            dropdownMenuEntries: menuItems,
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
}
