import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:orth_psalter/models/enums/entity_type.dart';
import 'package:orth_psalter/pages/home/kathisma.dart';
import 'package:orth_psalter/pages/home/psalm.dart';
import 'package:orth_psalter/pages/main_application.dart';
import 'package:orth_psalter/storage/bookmark_storage.dart';
import 'package:orth_psalter/storage/last_viewed_bookmarks_storage.dart';
import 'package:orth_psalter/storage/last_viewed_storage.dart';
import 'package:orth_psalter/theme/app_colors.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);

  await Hive.openBox(BookmarkStorage.getName(EntityType.kathisma.name));
  await Hive.openBox(BookmarkStorage.getName(EntityType.psalm.name));
  await Hive.openBox(BookmarkStorage.getName(EntityType.asNeeded.name));

  await Hive.openBox(LastViewedStorage().getName());
  await Hive.openBox(LastViewedBookmarksStorage().getName());

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
              Psalm(psalmId: state.pathParameters['psalmId'].toString()),
        ),
        GoRoute(
          path: '/${EntityType.kathisma.name}/:kathismaId',
          builder: (context, state) =>
              Kathisma(kathismaId: state.pathParameters['kathismaId'].toString()),
        ),
        GoRoute(
          path: '/${EntityType.asNeeded.name}/:psalmId',
          builder: (context, state) =>
              Psalm(psalmId: state.pathParameters['psalmId'].toString()),
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
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.brandBgColor,
        ),
      ),
      routerConfig: _router,
    );
  }
}
