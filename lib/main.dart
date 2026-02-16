import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:orth_psalter/models/enums/entity_type.dart';
import 'package:orth_psalter/pages/home/kathisma.dart';
import 'package:orth_psalter/pages/home/psalm.dart';
import 'package:orth_psalter/pages/main_application.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);

  await Hive.openBox(EntityType.kathisma.name);
  await Hive.openBox(EntityType.psalm.name);
  await Hive.openBox(EntityType.asNeeded.name);

  runApp(EasyLocalization(
    supportedLocales: [
      Locale('en'),
      Locale('ru')
    ],
    path: 'assets/generated/translations',
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

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const MainApplication(),
      routes: <RouteBase>[
        GoRoute(
          path: '/${EntityType.psalm.name}/:psalmId',
          builder: (context, state) =>
              Psalm(psalmId: state.pathParameters['psalmId']),
        ),
        GoRoute(
          path: '/${EntityType.kathisma.name}/:kathismaId',
          builder: (context, state) =>
              Kathisma(kathismaId: state.pathParameters['kathismaId']),
        ),
        GoRoute(
          path: '/${EntityType.asNeeded.name}/:psalmId',
          builder: (context, state) =>
              Psalm(psalmId: state.pathParameters['psalmId']),
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
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}
