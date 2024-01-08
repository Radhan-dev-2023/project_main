import 'dart:convert';

import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:http/http.dart' as http;

class GetInnService {
  Future<bool> getInn(String phoneNumber, String panNumber) async {
    Map<String, dynamic> payload = {
      "mobile_no": phoneNumber,
      "fh_pan": panNumber,
      "tax_status": "01",
      "hold_nature": "SI",
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
