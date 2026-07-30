import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:orth_psalter/models/enums/entity_type.dart';
import 'package:orth_psalter/pages/home/kathisma.dart';
import 'package:orth_psalter/pages/home/psalm.dart';
import 'package:orth_psalter/pages/main_application.dart';
import 'package:orth_psalter/singleton/appearance_config_singleton.dart';
import 'package:orth_psalter/storage/locale_storage.dart';
import 'package:orth_psalter/theme/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await AppearanceConfigSingleton().initAppearanceSettings();

  runApp(EasyLocalization(
    supportedLocales: [
      Locale('en'),
      Locale('ru'),
      Locale('uk'),
    ],
    path: 'assets/generated/translations',
    fallbackLocale: Locale(LocaleStorage.getDefaultLocale()),
    // startLocale: Locale('ru'),
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
    child: PsalterApp(),
  ));
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const MainApplication(),
      routes: <RouteBase>[
        GoRoute(
          path: '/${EntityType.psalm.name}/:psalmId',
          builder: (context, state) =>
              Psalm(psalmId: int.parse(state.pathParameters['psalmId']!)),
        ),
        GoRoute(
          path: '/${EntityType.kathisma.name}/:kathismaId',
          builder: (context, state) =>
              Kathisma(kathismaId: int.parse(state.pathParameters['kathismaId']!)),
        ),
        GoRoute(
          path: '/${EntityType.asNeeded.name}/:psalmId',
          builder: (context, state) =>
              Psalm(psalmId: int.parse(state.pathParameters['psalmId']!)),
        ),
      ],
    ),
  ],
);

class PsalterApp extends StatelessWidget {
  const PsalterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.brandBgColor,
          foregroundColor: AppColors.titleTextColor,
        ),
      ),
      routerConfig: _router,
    );
  }
}
