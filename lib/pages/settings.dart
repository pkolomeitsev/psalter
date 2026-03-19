import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orth_psalter/storage/locale_storage.dart';
import 'package:orth_psalter/ui/components/app_icon.dart';
import 'package:orth_psalter/ui/components/app_title.dart';
import 'package:orth_psalter/ui/components/settings_card.dart';
import 'package:orth_psalter/ui/components/settings_card_title.dart';
import 'package:orth_psalter/ui/components/settings_selector.dart';
import 'package:orth_psalter/ui/views/list_view_wrapper.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List languages = LocaleStorage.languages;
  List tmpDisabled = ['en', 'cu', 'uk'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppTitle()),
      body: ListViewWrapper(
        data: [
          SettingsCardTitle(text: context.tr('language')),
          SettingsCard(children: this.getLanguageItems(context)),
          SizedBox(height: 10),
          SettingsCardTitle(text: context.tr('info')),
          SettingsCard(children: [this.getAboutButton(context)]),
        ],
      ),
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
            isDisabled: tmpDisabled.contains(code),
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

  Widget getAboutButton(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final appInfo = await PackageInfo.fromPlatform();
        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        final lastUpdate = formatter.format(appInfo.updateTime ?? DateTime.now());
        final ThemeData theme = Theme.of(context);
        final TextStyle textStyle = theme.textTheme.bodyMedium!;
        showAboutDialog(
          context: context,
          applicationName: context.tr('appTitle'),
          applicationIcon: AppIcon(),
          applicationVersion: appInfo.version,
          children: [
            Text(context.tr('aboutText'), style: textStyle),
            const SizedBox(height: 18),
            Text(context.tr('sourceCodeInfo'), style: textStyle),
            Center(
              child: TextButton.icon(
                iconAlignment: IconAlignment.end,
                onPressed: () async {
                  final Uri toLaunch = Uri.parse(context.tr('sourceCodeLink'));
                  if (!await launchUrl(
                    toLaunch,
                    mode: LaunchMode.inAppBrowserView,
                  )) {
                    throw Exception('Could not launch $toLaunch');
                  }
                },
                label: Text(
                  context.tr('sourceCodeLinkLabel'),
                  style: const TextStyle(color: Colors.blue),
                ),
                icon: const Icon(
                  Icons.launch,
                  color: Colors.blue,
                  size: 16,
                ),
              ),
            ),
            Text('${context.tr('lastUpdated')}: $lastUpdate', style: textStyle),
          ],
        );
      },
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(1.0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              context.tr('about'),
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
          ),
        ],
      ),
    );
  }
}
