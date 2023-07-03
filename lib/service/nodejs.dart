import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;

class NodeJs {
  var client = http.Client();

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
