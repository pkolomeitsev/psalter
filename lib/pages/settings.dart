import 'package:flutter/material.dart';
import 'package:orth_psalter/storage/locale_storage.dart';
import 'package:orth_psalter/storage/psalter_translation_storage.dart';
import 'package:orth_psalter/storage/thanks_storage.dart';
import 'package:orth_psalter/ui/components/app_icon.dart';
import 'package:orth_psalter/ui/components/app_title.dart';
import 'package:orth_psalter/ui/components/link_button.dart';
import 'package:orth_psalter/ui/components/settings/appearance_font_size_widget.dart';
import 'package:orth_psalter/ui/components/settings/appearance_theme_widget.dart';
import 'package:orth_psalter/ui/components/settings_card.dart';
import 'package:orth_psalter/ui/components/settings_card_title.dart';
import 'package:orth_psalter/ui/views/list_view_wrapper.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<String> appLanguages = [];
  List<String> psalterTranslations = [];
  List<String> tmpDisabled = [];
  String currentTranslation = '';
  String currentLocale = ''; //required context

  Future<String> fetchData() async {
    return await PsalterTranslationStorage.getTranslationCode();
  }

  @override
  void initState() {
    super.initState();
    this.appLanguages = LocaleStorage.languageCodes;
    this.psalterTranslations = PsalterTranslationStorage.translationCodes;
    // TODO: temporary solution
    this.tmpDisabled = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppTitle()),
      body: Semantics(
        identifier: 'settings_view',
        child: ListViewWrapper(
          data: [
            SettingsCardTitle(text: context.tr('languageSetup')),
            SettingsCard(
              children: [
                this.getSystemLanguageSelector(context),
                this.getPsalterLanguageSelector(context),
              ],
            ),
            SizedBox(height: 10),
            // Appearance
            SettingsCardTitle(text: context.tr('appearance')),
            SettingsCard(
              children: [
                Text(
                  context.tr('psalterFontSize'),
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                this.getPsalterFontSizeSelector(),
                this.getThemeSelector(),
              ],
            ),
            SizedBox(height: 10),
            // Info
            SettingsCardTitle(text: context.tr('info')),
            SettingsCard(
              children: [
                ListTile(
                  title: Text(context.tr('references')),
                  onTap: () async {
                    this.onReferencesClick(context);
                  },
                ),
                Divider(height: 0),
                ListTile(
                  title: Text(context.tr('about')),
                  onTap: () async {
                    await this.onAboutClick(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getSystemLanguageSelector(BuildContext pageContext) {
    List<DropdownMenuEntry<String>> langItems = [];
    this.currentLocale = Localizations.localeOf(pageContext).languageCode;
    for (var code in this.appLanguages) {
      String name = pageContext.tr(LocaleStorage.getTranslationKeyByCode(code));
      langItems.add(
        DropdownMenuEntry(
          value: code,
          label: name,
          enabled: !tmpDisabled.contains(code),
        ),
      );
    }

    return DropdownMenu<String>(
      label: Text(pageContext.tr('appLanguage')),
      initialSelection: currentLocale,
      onSelected: (String? value) {
        setState(() {
          currentLocale = value!;
          this.changeAppLanguage(pageContext, value);
        });
      },
      dropdownMenuEntries: langItems,
      expandedInsets: EdgeInsets.zero,
    );
  }

  void changeAppLanguage(BuildContext context, String languageCode) {
    context.setLocale(Locale(languageCode));
  }

  Widget getPsalterLanguageSelector(BuildContext pageContext) {
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
          );
        }

        return const Center(child: Text('No data found'));
      },
    );
  }

  void changePsalterTranslation(String translationCode) async {
    PsalterTranslationStorage.setTranslationCode(translationCode);
  }

  Widget getPsalterFontSizeSelector() {
    return AppearanceFontSizeWidget();
  }

  Widget getThemeSelector() {
    return AppearanceThemeWidget();
  }

  Future onAboutClick(BuildContext context) async {
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
          child: LinkButton(
            link: 'sourceCodeLink',
            label: 'sourceCodeLinkLabel',
          ),
        ),
        Text('${context.tr('lastUpdated')}: $lastUpdate', style: textStyle),
      ],
    );
  }

  void onReferencesClick(BuildContext context) async {
    final List<dynamic> references = await ThanksStorage.getReferences();
    final List<Widget> refWidgets = [];

    for (int i = 0; i < references.length; i++) {
      refWidgets.add(
        ListTile(
          title: Text(references[i]['title']),
          subtitle: Text(references[i]['linkLabel']),
          trailing: LinkButton(link: references[i]['link'], label: ''),
          contentPadding: EdgeInsetsGeometry.all(0),
        ),
      );
      if (i < references.length - 1) {
        refWidgets.add(Divider(height: 0));
      }
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(context.tr('references')), const CloseButton()],
          ),
          content: Column(children: [...refWidgets]),
        );
      },
    );
  }
}
