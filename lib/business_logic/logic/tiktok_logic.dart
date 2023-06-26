import 'package:da_social_media_viewer/core_packages.dart';
import 'package:da_social_media_viewer/service/nodejs.dart';

class TikTokLogic {
  NodeJs get nodeJs => GetIt.I.get<NodeJs>();

  Future<void> tikTokLogin() async {
    nodeJs.tikTokLogin();
  }
}
