import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:finfresh_mobile/model/investors%20details/investors_details_model.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:http/http.dart' as http;

class CreateCustomer {
  Future<bool> createCustomer(InvestorDetails investorDetails, context) async {
    String token = await SecureStorage.readToken('token');
    String userId = await SecureStorage.readToken('userId');
    final url = Uri.parse('${ApiEndpoint.baseUrl}/api/v1/createcustomer');
    log('inverstor===${jsonEncode(investorDetails.toJson())}');
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
      logger.d('responsestatuscode create customer== ${response.statusCode}');
      logger.d('response customer creation == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
        log('create customer success');
        String customerId = jsonResponse['customerId'];
        SecureStorage.addingvaluesToStorage('customerId', customerId);
        return true;
      } else if (jsonResponse['status'] == 500) {
        log('create customer failed');
        showSnackBar(context, jsonResponse['message']);
        return false;
      } else {
        showSnackBar(context, jsonResponse['message']);
        return false;
      }
    } on SocketException {
      showSnackBar(context, 'No Internet Connection');
    } catch (e) {
      logger.d('exception in user register $e');
      return false;
    }
    return false;
  }
}
