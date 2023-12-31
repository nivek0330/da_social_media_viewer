import 'dart:math';

import 'package:da_social_media_viewer/business_logic/data/tiktok_access_token.dart';
import 'package:da_social_media_viewer/constants.dart';
import 'package:da_social_media_viewer/core_packages.dart';
import 'package:da_social_media_viewer/service/nodejs.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TikTokLogic {
  NodeJs get nodeJs => GetIt.I.get<NodeJs>();

  Future<void> tikTokLogin() async {
    String tikTokLoginUrl = 'https://www.tiktok.com/v2/auth/authorize/';
    String key = clientKey;
    String redirect = serverEndPoint;
    String scope =
        'user.info.basic,user.info.profile,user.info.stats,video.list';
    String responseType = 'code';
    String state = generateRandomString(16);

    String loginUrl =
        '$tikTokLoginUrl?client_key=$key&redirect_uri=$redirect&scope=$scope&response_type=$responseType&state=$state';

    await launchUrlString(loginUrl, webOnlyWindowName: '_self');
  }

  Future<String> getAccessToken(String code) async {
    Map<String, dynamic>? accessToken = await nodeJs.getAccessToken(code);

    TikTokAccessToken token = TikTokAccessToken.fromJSON(accessToken!);
    return token.toString();
  }
}

String generateRandomString(int length) {
  final random = Random();
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final result = StringBuffer();

  for (var i = 0; i < length; i++) {
    final randomIndex = random.nextInt(chars.length);
    result.write(chars[randomIndex]);
  }

  return result.toString();
}
