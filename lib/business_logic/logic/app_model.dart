import 'package:da_social_media_viewer/core_packages.dart';

class AppModel extends ChangeNotifier {
  final tikTokLogin = ValueNotifier<bool>(false);

  Future<void> loginToTikTok(bool status) async {
    tikTokLogin.value = status;
    notifyListeners();
  }
}
