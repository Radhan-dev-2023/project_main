import 'dart:convert';
import 'dart:io';

import 'package:finfresh_mobile/model/bank%20details%20model/bank_details_model.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:http/http.dart' as http;

class GetBankDetailsService {
  BankDeatilsModel bankdetailsModel = BankDeatilsModel();
  Future<BankDeatilsModel?> getBankDetails(context, String ifscCode) async {
    String url = '${ApiEndpoint.baseUrl}/v1/ifsc/$ifscCode';
    try {
      http.Response response = await http.get(
        Uri.parse(url),
      );
      logger.d('response of get bank details == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
        logger.d('bank details == ${jsonResponse['bankDetails']}');
        bankdetailsModel = BankDeatilsModel.fromJson(jsonResponse);
        return bankdetailsModel;
      } else if (jsonResponse['status'] == 500) {
        showSnackBar(context, jsonResponse['message']);
        return null;
      }
    } on SocketException {
      showSnackBar(context, 'No Internet Connection');
    } catch (e) {
      logger.d('exception in get bank details $e');
    }
    return null;
  }
}
