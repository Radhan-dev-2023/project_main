import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:finfresh_mobile/utilities/constant/flushbar.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AchService {
  String emadateLink = '';
  Future<String> achMadateRegister(
    String micro,
    String uc,
    String fromdate,
    String todate,
    String amount,
    String processmode,
    String channel,
    BuildContext context,
    bool dash,
  ) async {
    String url = '${ApiEndpoint.baseUrl}/api/v1/achmandateregistration';
    String iin = await SecureStorage.readToken('customerId');
    String phoneNumber = await SecureStorage.readToken('phoneNumber');
    String token = await SecureStorage.readToken('token');
    log('token$token');
    String userId = await SecureStorage.readToken('userId');
    log('userid:$userId');

    Map<String, dynamic> payload = dash == true
        ? {
            "phonenumber": phoneNumber,
            "iin": iin,
            "micr_no": micro,
            "uc": uc,
            "ach_fromdate": fromdate,
            "ach_todate": todate,
            "ach_amount": amount,
            "process_mode": processmode,
            "channel_type": channel
          }
        : {
            "phonenumber": phoneNumber,
            "iin": iin,
            "micr_no": '',
            "uc": 'Y',
            "ach_fromdate": fromdate,
            "ach_todate": '31-Dec-2999',
            "ach_amount": '100000',
            "process_mode": 'E',
            "channel_type": channel
          };
    log('paylod$payload');
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'x-key': userId,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );
      logger.d('response.statuscode${response.statusCode}');
      log('ach response${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse["status"] == 200) {
        emadateLink = jsonResponse["emandatelink"];
        return emadateLink;
      } else {
        // ignore: use_build_context_synchronously
        showFlushbar(context, jsonResponse['message']);
      }
    } on SocketException {
      // ignore: use_build_context_synchronously
      showFlushbar(context, 'No Internet Connection');
    } catch (e) {
      logger.d('ach mandate failed with an exception$e');
      return '';
    }
    return '';
  }
}
