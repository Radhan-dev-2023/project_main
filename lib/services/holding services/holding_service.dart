import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:finfresh_mobile/model/report%20details%20modal/report_details_model.dart';
import 'package:finfresh_mobile/model/transaction%20report%20model/transaction_report_model.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HoldingServices {
  Future<TransactionReport?> fetchTranscationReprot(
      BuildContext context) async {
    TransactionReport transactionReport = TransactionReport();
    String token = await SecureStorage.readToken('token');
    String userId = await SecureStorage.readToken('userId');
    String url = '${ApiEndpoint.baseUrl}/api/v1/transactionreport';
    String iin = await SecureStorage.readToken('customerId');
    Map<String, dynamic> payload = {"iin": iin};
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            'Authorization': 'Bearer $token',
            'x-key': userId,
            'Content-Type': 'application/json',
          },
          body: jsonEncode(payload));
      logger.d('response of report == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
        transactionReport = TransactionReport.fromJson(jsonResponse);
        return transactionReport;
      } else if (jsonResponse['status'] == 500) {
        if (context.mounted) {
          showSnackBar(context, jsonResponse['message']);
        }
        return null;
      }
    } on SocketException {
      if (context.mounted) {
        showSnackBar(context, 'No Internet Connection');
      }
      return null;
    } catch (e) {
      logger.d('fechtransaction report failed with an exception$e');
      return null;
    }
    return null;
  }

  Future<ReportDetailsModel?> fetchReprot(
      BuildContext context, String isinNumber, String trxnumber) async {
    ReportDetailsModel reportDetailsModel = ReportDetailsModel();
    String token = await SecureStorage.readToken('token');
    String userId = await SecureStorage.readToken('userId');
    String url = '${ApiEndpoint.baseUrl}/api/v1/reportdetail';
    String iin = await SecureStorage.readToken('customerId');
    Map<String, dynamic> payload = {
      "isin": isinNumber,
      "iin": iin,
      "USER_TRXNNO": trxnumber
    };
    log('payload ===$payload');
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            'Authorization': 'Bearer $token',
            'x-key': userId,
            'Content-Type': 'application/json',
          },
          body: jsonEncode(payload));
      logger.d('response of report == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
        reportDetailsModel = ReportDetailsModel.fromJson(jsonResponse);
        return reportDetailsModel;
      } else if (jsonResponse['status'] == 500) {
        if (context.mounted) {
          showSnackBar(context, jsonResponse['message']);
        }
        return null;
      }
    } on SocketException {
      if (context.mounted) {
        showSnackBar(context, 'No Internet Connection');
      }
      return null;
    } catch (e) {
      logger.d(' report failed with an exception$e');
      return null;
    }
    return null;
  }

  Future<void> sendmailToClient(String mobile, String username,
      String schemename, String transactiontype, context) async {
    String token = await SecureStorage.readToken('token');
    String userId = await SecureStorage.readToken('userId');
    String url = '${ApiEndpoint.baseUrl}/api/v1/changetransaction';
    String iin = await SecureStorage.readToken('customerId');
    Map<String, dynamic> payload = {
      "mobile_no": mobile,
      "user_name": username,
      "iin": iin,
      "scheme_name": schemename,
      "transactiontype": transactiontype
    };
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            'Authorization': 'Bearer $token',
            'x-key': userId,
            'Content-Type': 'application/json',
          },
          body: jsonEncode(payload));
      logger.d('response of report == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
      } else if (jsonResponse['status'] == 500) {
        if (context.mounted) {
          showSnackBar(context, jsonResponse['message']);
        }
      }
    } on SocketException {
      if (context.mounted) {
        showSnackBar(context, 'No Internet Connection');
      }
    } catch (e) {
      logger.d(' report failed with an exception$e');
    }
  }

  Future<bool> transactionSwitch(
      BuildContext context,
      String transactionType,
      String amcCode,
      String folio,
      String redeemBy,
      String amount,
      String sourceproductCode,
      String targetCode) async {
    String token = await SecureStorage.readToken('token');
    String userId = await SecureStorage.readToken('userId');
    String url = '${ApiEndpoint.baseUrl}/api/v1/switch/transaction';
    String iin = await SecureStorage.readToken('customerId');
    String phonenumber = await SecureStorage.readToken('phoneNumber');

    Map<String, dynamic> payload = {
      "transaction": transactionType,
      "phonenumber": phonenumber,
      "service_request": {
        "iin": iin,
        "poa": "N",
        "poa_bank_trxn_type": "",
        "trxn_acceptance": "OL",
        "dp_id": "",
        "sub_broker_arn_code": "",
        "sub_broker_code": "",
        "euin_opted": "N",
        "euin": "",
        "trxn_execution": "",
        "remarks": "",
        "trxn_initiator": "",
        "trans_count": "1",
        "investor_auth_log": ""
      },
      "child": [
        {
          "childtrans": {
            "amc": amcCode,
            "folio": folio,
            "source_product_code": sourceproductCode,
            "source_ft_acc_no": "",
            "target_product_code": targetCode,
            "target_ft_acc_no": "",
            "reinvest": "Z",
            "amt_unit_type": redeemBy,
            "amt_unit": amount,
            "all_units": redeemBy == 'Amount' ? 'N' : 'Y',
            "input_ref_no": ""
          }
        }
      ]
    };
    log('payload ===$payload');
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            'Authorization': 'Bearer $token',
            'x-key': userId,
            'Content-Type': 'application/json',
          },
          body: jsonEncode(payload));
      logger.d('response switch == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
        // reportDetailsModel = ReportDetailsModel.fromJson(jsonResponse);
        // return reportDetailsModel;
        return true;
      } else if (jsonResponse['status'] == 500) {
        if (context.mounted) {
          showSnackBar(context, jsonResponse['message']);
          return false;
        }
        // return null;
      }
    } on SocketException {
      if (context.mounted) {
        showSnackBar(context, 'No Internet Connection');
        return false;
      }
      // return null;
    } catch (e) {
      logger.d(' report failed with an exception$e');
      return false;
      // return null;
    }
    return false;
    // return null;
  }
}
