import 'dart:convert';

import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:http/http.dart' as http;

class BankCodeService {
  Future<String> getBankCode() async {
    String url = '${ApiEndpoint.baseUrl}/v1/bank';
    String bankName = await SecureStorage.readToken('bankName');
    Map<String, dynamic> payload = {"bankName": bankName};
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );

      logger.d('response of get bank code == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
        logger.d('bank code == ${jsonResponse['bankCode']}');
        String bankCode = jsonResponse['bankCode'];
        return bankCode;
      }
    } catch (e) {
      logger.d('Get bank code failed with an exception$e');
      return '';
    }
    return '';
  }
}
