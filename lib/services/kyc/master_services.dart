import 'dart:convert';

import 'package:finfresh_mobile/model/account%20type%20model/account_type_model.dart';
import 'package:finfresh_mobile/model/holding%20nature%20model/holding_nature_model.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:http/http.dart' as http;

class MasterService {
  HoldingNatureModel holdingNatureModel = HoldingNatureModel();
  AccountTypeModel accountTypeModel = AccountTypeModel();
  Future<HoldingNatureModel?> fetchData() async {
    Map<String, dynamic> payload = {"methodname": "holdingnature"};
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
      logger.d('response holding == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      logger.d('jsonResponse == ${jsonResponse['status']}');
      if (jsonResponse['status'] == 200) {
        holdingNatureModel = HoldingNatureModel.fromJson(
            jsonResponse); // Assuming modelClass has a fromJson method
        // logger.d('modelClass ==== ${modelClass.toJson()}');
        return holdingNatureModel;
      }
    } catch (e) {
      logger.d('exception in fetchData $e');
      return null;
    }
    return null;
  }

  Future<AccountTypeModel?> fetchAccountType() async {
    Map<String, dynamic> payload = {"methodname": "accounttype"};
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
      logger.d('response holding == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      logger.d('jsonResponse == ${jsonResponse['status']}');
      if (jsonResponse['status'] == 200) {
        accountTypeModel = AccountTypeModel.fromJson(
            jsonResponse); // Assuming modelClass has a fromJson method
        // logger.d('modelClass ==== ${modelClass.toJson()}');
        return accountTypeModel;
      }
    } catch (e) {
      logger.d('exception in fetchData $e');
      return null;
    }
    return null;
  }

  Future<void> fetchExceptions() async {
    Map<String, dynamic> payload = {"methodname": "panexemptcategory"};
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
      logger.d('response holding == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      logger.d('jsonResponse == ${jsonResponse['status']}');
      if (jsonResponse['status'] == 200) {
        // Assuming modelClass has a fromJson method
        // logger.d('modelClass ==== ${modelClass.toJson()}');
        // return accountTypeModel;
      }
    } catch (e) {
      logger.d('exception in fetchData $e');
      return null;
    }
    return null;
  }
}
