import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:http/http.dart' as http;

class RefershTokenService {
  Future<bool> postRefershTocken(context) async {
    String userId = await SecureStorage.readToken('userId');
    String refreshToken = await SecureStorage.readToken('refreshToken');
    log('refresh tocke  $refreshToken');

    Map<String, dynamic> payload = {
      "userId": userId,
      "refreshToken": refreshToken,
    };
    final url = Uri.parse('${ApiEndpoint.baseUrl}/v1/refreshtoken');

    try {
      http.Response response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );
      logger.d('response of refersh token == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['result']['status'] == 200) {
        SecureStorage.addToken('token', jsonResponse['result']['token']);
        SecureStorage.addToken(
            'refreshToken', jsonResponse['result']['refreshToken']);
        return true;
      }
    } on SocketException {
      showSnackBar(context, 'No Internet Connection');
      return false;
    } catch (e) {
      logger.d('exception in token refresh $e');
      return false;
    }
    return false;
  }
}
