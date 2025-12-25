
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:jungers_psalter/models/language_provider.dart';
import 'package:jungers_psalter/pages/main_application.dart';
// import 'package:provider/provider.dart';
// import 'package:jungers_psalter/l10n/app_localizations.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: [
      Locale('en'),
      Locale('ru')
    ],
    path: 'assets/langs',
    child: PsalterApp(),
    // fallbackLocale: Locale('en', 'US'),
    // startLocale: Locale('de', 'DE'),
    // saveLocale: false,
    // useOnlyLangCode: true,
    // ignorePluralRules: false,

    // optional assetLoader default used is RootBundleAssetLoader which uses flutter's assetloader
    // install easy_localization_loader for enable custom loaders
    // assetLoader: RootBundleAssetLoader()
    // assetLoader: HttpAssetLoader()
    // assetLoader: FileAssetLoader()
    // assetLoader: CsvAssetLoader()
    // assetLoader: YamlAssetLoader() //multiple files
    // assetLoader: YamlSingleAssetLoader() //single file
    // assetLoader: XmlAssetLoader() //multiple files
    // assetLoader: XmlSingleAssetLoader() //single file
    // assetLoader: CodegenLoader()
  ));
}

class PsalterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainApplication(),
    );
  }
}
