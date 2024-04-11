import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:finfresh_mobile/model/ach%20history%20model/ach_history_model.dart';
import 'package:finfresh_mobile/utilities/constant/flushbar.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:http/http.dart' as http;

class AchHistoryService {
  AchHistoryModel achHistoryModel = AchHistoryModel();
  Future<AchHistoryModel?> getAchHistory(context, String status) async {
    String url = '${ApiEndpoint.baseUrl}/api/v1/achhistory';
    String iin = await SecureStorage.readToken('customerId');
    // String phoneNumber = await SecureStorage.readToken('phoneNumber');
    String token = await SecureStorage.readToken('token');

    String userId = await SecureStorage.readToken('userId');

    // Map<String, dynamic> payload = dropdown == true
    //     ? {"cust_id": iin, "ach_fromdate": "", "ach_todate": "", "status": ""}
    //     : {"cust_id": iin, "ach_fromdate": "", "ach_todate": "", "status": "A"};
    Map<String, dynamic> payload = {
      "cust_id": iin,
      "ach_fromdate": "",
      "ach_todate": "",
      "status": status
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
        achHistoryModel = AchHistoryModel.fromJson(jsonResponse);
        log('sucess');
        return achHistoryModel;
      } else {
        // ignore: use_build_context_synchronously
        showFlushbar(context, jsonResponse['message']);
        return null;
      }
    } on SocketException {
      // ignore: use_build_context_synchronously
      showFlushbar(context, 'No Internet Connection');
      return null;
    } catch (e) {
      logger.d('ach mandate failed with an exception$e');
      return null;
    }
  }
}
