import 'dart:convert';
import 'dart:developer';

import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:http/http.dart' as http;

class GetInnService {
  Future<bool> getInn(
      String phoneNumber, String panNumber, taxStatus, holdingNature) async {
    String token = await SecureStorage.readToken('token');
    String userId = await SecureStorage.readToken('userId');
    Map<String, dynamic> payload = {
      "mobile_no": phoneNumber,
      "fh_pan": panNumber,
      "tax_status": taxStatus,
      "hold_nature": holdingNature,
      "exempt_flag": "",
      "jh1_exempt_flag": "",
      "jh1_pan": "",
      "jh2_exempt_flag": "",
      "jh2_pan": "",
      "guardian_pan": "",
      "investor_name": ""
    };
    final url = Uri.parse('${ApiEndpoint.baseUrl}/api/v1/getiin');
    try {
      http.Response response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'x-key': userId,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );
      logger.d('get inn status code == ${response.statusCode}');
      logger.d('response get inn== ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
        log('getINN success');
        return true;
      }
    } catch (e) {
      log('getINN failed');
      logger.d('exception in user register $e');
      return false;
    }
    return false;
  }
}
