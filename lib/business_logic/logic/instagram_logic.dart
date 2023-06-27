import 'package:da_social_media_viewer/core_packages.dart';
import 'package:da_social_media_viewer/service/nodejs.dart';

class InstagramLogic {
  NodeJs get nodeJs => GetIt.I.get<NodeJs>();

  Future<void> instagramLogin() async {
    nodeJs.instagramLogin();
  }
}
