import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:http/http.dart' as http;

class NonIndividualService {
  Future<bool> getNonindividualTax(String phonenumber, String pancardNumber,
      String name, taxcode, context) async {
    String token = await SecureStorage.readToken('token');
    String userId = await SecureStorage.readToken('userId');
    Map<String, dynamic> payload = {
      "mobile_no": phonenumber,
      "fh_pan": pancardNumber,
      "investor_name": name,
      "tax_status": taxcode,
      "userId": userId,
    };
    log('payload$payload');
    final url = Uri.parse('${ApiEndpoint.baseUrl}/api/v1/nonindividual');
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
      logger.d('response == ${response.statusCode}');
      logger.d('response  fo individual== ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      logger.d('jsonResponse == ${jsonResponse['status']}');
      if (jsonResponse['status'] == 200) {
        return true;
      }
    } on SocketException {
      showSnackBar(context, 'No Internet Connection');
      return false;
    } catch (e) {
      logger.d('exception in user register $e');
      return false;
    }
    return false;
  }
}
