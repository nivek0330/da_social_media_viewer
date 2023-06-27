import 'package:da_social_media_viewer/core_packages.dart';

class AppModel extends ChangeNotifier {
  final tikTokLogin = ValueNotifier<bool>(false);
  final instagramLogin = ValueNotifier<bool>(false);

  Future<void> loginToTikTok(bool status) async {
    tikTokLogin.value = status;
    notifyListeners();
  }

  Future<void> loginToInstagram(bool status) async {
    instagramLogin.value = status;
    notifyListeners();
  }
}
