import 'dart:convert';
import 'dart:developer';

import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:http/http.dart' as http;

class VerifyOtp {
  static String dummyOtp = "123456";
  static bool dummyverifyOtp(String otp) {
    return otp == dummyOtp ? true : false;
  }

  static Future<bool> verifyOtp(String phoneNumber, String otp, context) async {
    final url = Uri.parse('${ApiEndpoint.baseUrl}/v1/otp/verify');
    Map<String, dynamic> payload = {
      "phoneNumber": phoneNumber,
      "userType": "customer",
      "otp": otp
    };
    try {
      http.Response response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );
      logger.d('responseotp login == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['result']['status'] == 200) {
        log('otp calling');
        String token = jsonResponse['result']['token'];
        String userId = jsonResponse['result']['userId'];
        String refreshToken = jsonResponse['result']['refreshToken'];
        SecureStorage.addToken('token', token);
        SecureStorage.usserId('userId', userId);
        SecureStorage.addToken('refreshToken', refreshToken);

        logger.d('token == $token');
        return true;
      } else if (jsonResponse['result']['status'] == 1001 ||
          jsonResponse['result']['message'].toString().toLowerCase() ==
              'wrong otp') {
        showSnackBar(context, 'wrong otp');
        return false;
      }
    } catch (e) {
      logger.d('failsed with an exception$e');
    }
    return false;
  }
}
