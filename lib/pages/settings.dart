import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jungers_psalter/storage/locale_storage.dart';
import 'package:jungers_psalter/ui/components/settings_card.dart';
import 'package:jungers_psalter/ui/components/settings_card_title.dart';
import 'package:jungers_psalter/ui/components/settings_selector.dart';
import 'package:jungers_psalter/ui/views/list_view_wrapper.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List languages = LocaleStorage.languages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('appTitle'), style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: ListViewWrapper(data: [
        SettingsCardTitle(text: context.tr('changeLanguage')),
        SettingsCard(
            children: getLanguageItems(context)
        ),
      ]),
    );
  }

  List<Widget> getLanguageItems(BuildContext pageContext) {
    List<Widget> langItems = [];
    for (var lang in languages) {
      String code = lang['languageCode'];
      String name = pageContext.tr(lang['languageName']);
      String currentLocale = Localizations.localeOf(pageContext).languageCode;
      langItems.add(
          SettingsSelector(
            isSelected: currentLocale == code,
            name: name,
            onTap: () => this.changeAppLanguage(pageContext, code),
          )
      );
    }

    return langItems;
  }

  void changeAppLanguage(BuildContext context, String languageCode) {
    context.setLocale(Locale(languageCode));
  }
}
