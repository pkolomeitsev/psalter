import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orth_psalter/storage/locale_storage.dart';
import 'package:orth_psalter/storage/psalter_translation_storage.dart';
import 'package:orth_psalter/ui/components/app_icon.dart';
import 'package:orth_psalter/ui/components/app_title.dart';
import 'package:orth_psalter/ui/components/settings_card.dart';
import 'package:orth_psalter/ui/components/settings_card_title.dart';
import 'package:orth_psalter/ui/views/list_view_wrapper.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<String> languages = [];
  List<String> translations = [];
  List<String> tmpDisabled = [];
  String currentTranslation = '';
  String currentLocale = ''; //required context

  Future<String> fetchData() async {
    return await PsalterTranslationStorage.getTranslationCode();
  }

  @override
  void initState() {
    super.initState();
    this.languages = LocaleStorage.languageCodes;
    this.translations = PsalterTranslationStorage.translationCodes;
    // TODO: temporary solution
    this.tmpDisabled = ['uk'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppTitle()),
      body: ListViewWrapper(
        data: [
          SettingsCardTitle(text: context.tr('languageSetup')),
          SettingsCard(
            children: [
              this.getSystemLanguageSelector(context),
              this.getPsalterLanguageSelector(context),
            ],
          ),
          SizedBox(height: 10),
          SettingsCardTitle(text: context.tr('info')),
          SettingsCard(children: [this.getAboutButton(context)]),
        ],
      ),
    );
  }

  Widget getSystemLanguageSelector(BuildContext pageContext) {
    List<DropdownMenuEntry<String>> langItems = [];
    this.currentLocale = Localizations.localeOf(pageContext).languageCode;
    for (var code in languages) {
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
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    );
  }

  void changeAppLanguage(BuildContext context, String languageCode) {
    context.setLocale(Locale(languageCode));
  }

  Widget getPsalterLanguageSelector(BuildContext pageContext) {
    List<DropdownMenuEntry<String>> translationItems = [];
    for (var code in this.translations) {
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
          return Center(child: Text('Error: ${snapshot.error} ${snapshot.stackTrace}'));
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

  void changePsalterTranslation(String translationCode) async {
    PsalterTranslationStorage.setTranslationCode(translationCode);
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
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
