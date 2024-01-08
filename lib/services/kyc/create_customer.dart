import 'dart:convert';

import 'package:finfresh_mobile/model/investors%20details/investors_details_model.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:http/http.dart' as http;

class CreateCustomer {
  Future<bool> createCustomer(InvestorDetails investorDetails) async {
    String token = await SecureStorage.readToken('token');
    String userId = await SecureStorage.readToken('userId');
    final url = Uri.parse('${ApiEndpoint.baseUrl}/api/v1/getiin');
    try {
      http.Response response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'x-key': userId,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(investorDetails.toJson()),
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
