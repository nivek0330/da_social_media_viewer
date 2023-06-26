import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:da_social_media_viewer/constants.dart';

class NodeJs {
  var client = http.Client();
  final _tikTokLoginUrl = 'www.tiktok.com';
  static final csrfState = generateRandomString(10);
  final _headers = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Credentials': 'true',
    'Cookie': csrfState,
    'Content-Type': 'application/x-www-form-urlencoded',
  };

  Future<void> tikTokLogin() async {
    http.Response response;
    Uri baseUrl = Uri.https(_tikTokLoginUrl, '/v2/auth/authorize/');
    final url = baseUrl.replace(queryParameters: {
      'client_key': clientKey,
      'scope': 'user.info.basic',
      'response_type': 'code',
      'redirect_uri': serverEndPoint,
      'state': csrfState,
    });
    response = await client.get(url, headers: _headers);

    print(response.body);
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
