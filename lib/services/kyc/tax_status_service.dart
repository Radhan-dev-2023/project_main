import 'dart:convert';

import 'package:finfresh_mobile/model/tax%20status%20model/tax_status_model.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:http/http.dart' as http;

class TaxStatusService {
  TaxMaster taxMaster = TaxMaster();
  Future<String?> getTaxStatus() async {
    Map<String, dynamic> payload = {"methodname": "tax"};
    final url = Uri.parse('${ApiEndpoint.baseUrl}/v1/master');
    try {
      http.Response response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );
      logger.d('response == ${response.statusCode}');
      logger.d('response == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      logger.d('jsonResponse == ${jsonResponse['status']}');
      if (jsonResponse['status'] == 200) {
        taxMaster = TaxMaster.fromJson(jsonResponse);
        logger.d('taxmaster====${taxMaster.toJson()}');
        logger.d('taxmasterList====${taxMaster.masterDetails}');
        return response.body;
      }
    } catch (e) {
      logger.d('exception in user register $e');
      return null;
    }
    return null;
  }
}
