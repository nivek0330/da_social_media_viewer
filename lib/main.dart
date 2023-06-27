import 'package:da_social_media_viewer/business_logic/logic/app_model.dart';
import 'package:da_social_media_viewer/business_logic/logic/bootstrap.dart';
import 'package:da_social_media_viewer/business_logic/logic/instagram_logic.dart';
import 'package:da_social_media_viewer/business_logic/logic/tiktok_logic.dart';
import 'package:da_social_media_viewer/core_packages.dart';
import 'package:da_social_media_viewer/service/nodejs.dart';
import 'package:da_social_media_viewer/user_interface/app_scaffold.dart';
import 'package:da_social_media_viewer/user_interface/styles/styles.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() async {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();

  registerSingletons();

  await bootstrap.init();

  runApp(DataAnalyticsWeb());
}

class DataAnalyticsWeb extends StatefulWidget {
  const DataAnalyticsWeb({super.key});

  @override
  State<DataAnalyticsWeb> createState() => _DataAnalyticsWebState();
}

class _DataAnalyticsWebState extends State<DataAnalyticsWeb> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
    );
  }
}

void registerSingletons() {
  GetIt.I.registerLazySingleton<Bootstrap>(() => Bootstrap());
  GetIt.I.registerLazySingleton<AppModel>(() => AppModel());
  GetIt.I.registerLazySingleton<InstagramLogic>(() => InstagramLogic());
  GetIt.I.registerLazySingleton<TikTokLogic>(() => TikTokLogic());
  GetIt.I.registerLazySingleton<NodeJs>(() => NodeJs());
}

Bootstrap get bootstrap => GetIt.I.get<Bootstrap>();
AppModel get appModel => GetIt.I.get<AppModel>();
TikTokLogic get tiktok => GetIt.I.get<TikTokLogic>();
InstagramLogic get instagram => GetIt.I.get<InstagramLogic>();

// Global style helper
AppStyle get $styles => AppScaffold.style;
