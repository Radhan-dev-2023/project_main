import 'dart:convert';

import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:http/http.dart' as http;

class ResetPasswordService {
  Future<bool> resetPassword(String phoneNumber, String password) async {
    Map<String, dynamic> payload = {
      "phoneNumber": phoneNumber,
      "userType": "customer",
      "password": password,
      "otp": "123456"
    };
    final url = Uri.parse('${ApiEndpoint.baseUrl}/v1/user/reset/password');
    try {
      http.Response response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );
      logger.d('response == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['result']['status'] == 200) {
        return true;
      }
    } catch (e) {
      logger.d('exception in user register $e');
      return false;
    }
    return false;
  }
}
