import 'package:flutter/material.dart';
import 'package:orth_psalter/storage/psalter_translation_storage.dart';

class AppearanceThemeWidget extends StatefulWidget {
  const AppearanceThemeWidget({super.key});

  @override
  State<AppearanceThemeWidget> createState() => _AppearanceThemeWidgetState();
}

class _AppearanceThemeWidgetState extends State<AppearanceThemeWidget> {

  Future<String> fetchData() async {
    return await PsalterTranslationStorage.getTranslationCode();
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuEntry<String>> translationItems = [];
    for (var code in this.psalterTranslations) {
      String name = pageContext.tr(
        PsalterTranslationStorage.getTranslationKeyByCode(code),
      );
      translationItems.add(
        DropdownMenuEntry(
          value: code,
          label: name,
          enabled: !tmpDisabled.contains(code),
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
          this.currentTranslation = snapshot.data!;
          return DropdownMenu<String>(
            label: Text(context.tr('psalterLanguage')),
            initialSelection: this.currentTranslation,
            onSelected: (String? value) {
              setState(() {
                this.currentTranslation = value!;
                this.changePsalterTranslation(value);
              });
            },
            dropdownMenuEntries: translationItems,
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
