import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:finfresh_mobile/utilities/constant/alert_dialogue.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:finfresh_mobile/view/sign%20in/sign_in_screen.dart';
import 'package:flutter/material.dart';
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
        String userId = jsonResponse['result']['userId'];
        String refreshToken = jsonResponse['result']['refreshToken'];
        // SecureStorage.addToken('token', token);
        SecureStorage.addToken('userId', userId);
        SecureStorage.addToken('refreshToken', refreshToken);
        // logger.d('tocke ==$token');
        logger.d('refreshToken ==$refreshToken');
        return true;
      }
      if (jsonResponse['result']['status'] == 201 ||
          jsonResponse['result']['message'].toString().toLowerCase() ==
              'user already registered but not verified') {
        return true;
        // showSnackBar(context, "user already registered but not verified");
      } else if (jsonResponse['result']['status'] == 1001) {
        showAlertDialog(context);

        return false;
      } else {
        showSnackBar(context, jsonResponse['result']['message']);
        return false;
      }
    } on SocketException {
      showSnackBar(context, 'No Internet Connection');
      return false;
    } catch (e) {
      logger.d('exception in user register $e');
      return false;
    }
  }

  Future<bool> generateOtp(String phoneNumber, context) async {
    logger.d('calling generate otp');
    final url = Uri.parse('${ApiEndpoint.baseUrl}/v1/otp/send');
    logger.d('url===$url');
    log('phonenumber ==$phoneNumber');
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
        log('kerriii');
        return true;
      }
      else if (jsonResponse['result']['status'] == 1001 &&
          jsonResponse['result']['message'] == "user not found") {
        showSnackBar(context, jsonResponse['result']['message']);
      }
      else if (jsonResponse['result']['status'] == 1001) {
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
