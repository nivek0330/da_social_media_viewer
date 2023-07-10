import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;

class NodeJs {
  var client = http.Client();
  final String _baseUrl = 'dasocialmediaviewer.ue.r.appspot.com';

  /// TikTok API calls
  Future<String> getAccessToken(String code) async {
    final decodedCode = Uri.decodeComponent(code);
    Uri url = Uri.https(_baseUrl, '/users/tiktok-access-token');
    http.Response response = await client.post(url, body: {
      'code': decodedCode,
    });

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
