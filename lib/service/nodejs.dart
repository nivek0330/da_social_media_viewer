import 'package:da_social_media_viewer/constants.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;

class NodeJs {
  var client = http.Client();
  final String _tikTokAPI = 'open.tiktokapis.com';
  final Map<String, String> _headers = {};

  /// TikTok API calls
  Future<String> getAccessToken(String code) async {
    final decodedCode = Uri.decodeComponent(code);
    _headers['Content-Type'] = 'application/x-www-form-urlencoded';

    Uri url = Uri.https(_tikTokAPI, '/v2/oauth/token/');
    http.Response response = await client.post(url,
        body: {
          'client_key': clientKey,
          'client_secret': clientSecret,
          'code': decodedCode,
          'grant_type': 'authorization_code',
          'redirect_url': serverEndPoint,
        },
        headers: _headers);

    return response.body;
  }

  /// Instagram API calls
  Future<String> instagramLogin() async {
    final LoginResult result = await FacebookAuth.i.login();

    if (result.status == LoginStatus.success) {
      final AccessToken? accessToken = result.accessToken;
      print('Access token is: ${accessToken!.token}');
    } else {
      print(result.status);
      print(result.message);
    }

    return '${result.status} ${result.status} ${result.message}';
  }
}
