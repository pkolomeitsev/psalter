import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jungers_psalter/ui/components/settings_selector.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List languageNames = [];

  @override
  Widget build(BuildContext context) {
    this.languageNames = [
      {'languageCode': 'en', 'languageName': 'langNameEn'.tr()},
      {'languageCode': 'ru', 'languageName': 'langNameRu'.tr()},
      {'languageCode': 'cu', 'languageName': 'langNameRuSlav'.tr()},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('appTitle'.tr(), style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
        prototypeItem: const SizedBox(height: 50.0),
        itemCount: this.languageNames.length,
        itemBuilder: (context, index) {
          String code = this.languageNames[index]['languageCode'];
          String name = this.languageNames[index]['languageName'];

          return SettingsSelector(
            isSelected: Localizations.localeOf(context).languageCode == code,
            name: name,
            onTap: () => _changeAppLanguage(context, languageCode: code),
          );
        },
      ),
    );
  }

  void _changeAppLanguage(
    BuildContext context, {
    required String languageCode,
  }) {
    context.setLocale(Locale(languageCode));
    print('lang code changed: $languageCode');
  }
}
