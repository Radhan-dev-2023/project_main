import 'dart:convert';
import 'dart:io';

import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:http/http.dart' as http;

class UserRegisterService {
  Future<bool> userRegister(
    context,
    String phoneNumber,
    String email,
  ) async {
    Map<String, dynamic> payload = {
      "phoneNumber": phoneNumber,
      "email": email,
      "userType": "customer",
    };
    final url = Uri.parse('${ApiEndpoint.baseUrl}/v1/user/register');
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
        // String token = jsonResponse['result']['token'];
        // String userId = jsonResponse['result']['userId'];
        // SecureStorage.addToken('token', token);
        // SecureStorage.addToken('userId', userId);
        return true;
      }
      if (jsonResponse['result']['status'] == 201 ||
          jsonResponse['result']['message'].toString().toLowerCase() ==
              'user already registered but not verified') {
        showSnackBar(context, "user already registered but not verified");
      }
    } on SocketException {
      showSnackBar(context, 'No Internet Connection');
    } catch (e) {
      logger.d('exception in user register $e');
      return false;
    }
    return false;
  }

  Future<bool> generateOtp(String phoneNumber, context) async {
    logger.d('calling generate otp');
    final url = Uri.parse('${ApiEndpoint.baseUrl}/v1/otp/send');
    logger.d('url===$url');
    Map<String, dynamic> payload = {
      "phoneNumber": phoneNumber,
      "userType": "customer"
    };
    try {
      http.Response response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );
      logger.d('response ==${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['result']['status'] == 200) {
        String token = jsonResponse['result']['token'];
        String userId = jsonResponse['result']['userId'];
        SecureStorage.addToken('token', token);
        SecureStorage.addToken('userId', userId);
        logger.d('tocke ==$token');
        return true;
      } else if (jsonResponse['result']['status'] == 1001 &&
          jsonResponse['result']['message'] == "user not found") {
        showSnackBar(context, jsonResponse['result']['message']);
      }
    } on SocketException {
      showSnackBar(context, 'No Internet Connection');
    } catch (e) {
      logger.d('Generate otp failed with an exception$e');
      return false;
    }
    return false;
  }
}
//  Future<bool> sendOtp(String phonenumber) async {
//     String url = ApiConfiguration.baseUrlDev + ApiConfiguration.sendOtpEndUrl;
//     Map<String, dynamic> payload = {
//       "phoneNumber": phonenumber,
//       "userType": "customer"
//     };
//     try {
//       http.Response response = await http.post(
//         Uri.parse(url),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(payload),
//       );
//       logger.d('response == ${response.body}');
//       Map<String, dynamic> jsonResponse = json.decode(response.body);
//       if (jsonResponse['result']['status'] == 200) {
//         return true;
//       }
//     } catch (e) {
//       logger.e('exception in send otp $e');
//     }

//     return false;
//   }
