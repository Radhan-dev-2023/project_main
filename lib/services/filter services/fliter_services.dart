import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:finfresh_mobile/model/filter%20model/filter_model.dart';
import 'package:finfresh_mobile/utilities/constant/flushbar.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:http/http.dart' as http;

class FilterService {
  FliterModel fliterModel = FliterModel();
  Future<FliterModel?> fetchFilterdata(
      List<String> type, List<String> status, context) async {
    String url = '${ApiEndpoint.baseUrl}/api/v1/orders';
    String iin = await SecureStorage.readToken('customerId');
    String token = await SecureStorage.readToken('token');

    String userId = await SecureStorage.readToken('userId');

    Map<String, dynamic> payload = {"iin": iin, "type": type, "status": status};

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
      log('payload ===${jsonEncode(payload)}');
      log('response of filtering  === ${response.body}');
      log('tyelis$type  stauslise$status');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
        log('sucesss');
        fliterModel = FliterModel.fromJson(jsonResponse);
        return fliterModel;
      }
    } on SocketException {
      showFlushbar(context, 'No Internet Connection');
      return null;
    } catch (e) {
      logger.d('filtering failed with an exception $e');
      return null;
    }
    return null;
  }
}
