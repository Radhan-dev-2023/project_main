import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:finfresh_mobile/model/payment%20response%20model/payment_response_model.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  PaymentResponseModel paymentResponseModel = PaymentResponseModel();
  Future<bool> transcationService({
    required String paymenMode,
    required String accountNumber,
    required String ifscCode,
    required String instalmentAmount,
    required String fromdate,
    required String duedate,
    required String date,
    required String amc,
    required String productCode,
    required BuildContext context,
  }) async {
    String token = await SecureStorage.readToken('token');
    String userId = await SecureStorage.readToken('userId');
    String phoneNumber = await SecureStorage.readToken('phoneNumber');
    String bankCode = await SecureStorage.readToken('bankcode');
    String iin = await SecureStorage.readToken('customerId');
    String url = '${ApiEndpoint.baseUrl}/api/v1/purchasetransaction';

    log(phoneNumber);
    log(paymenMode);
    log(ifscCode);
    log(instalmentAmount);
    log(fromdate);
    log(duedate);
    log(date);
    log(iin);
    log(bankCode);
    Map<String, dynamic> payload = {
      // "transaction": "purchasetransaction",
      // "phonenumber": "8098994900",
      // "service_request": {
      //   "iin": "5014047687",
      //   "sub_trxn_type": "N",
      //   "poa": "N",
      //   "poa_bank_trxn_type": "NDCPMS",
      //   "trxn_acceptance": "OL",
      //   "demat_user": "N",
      //   "dp_id": "",
      //   "bank": "162",
      //   "ac_no": "6912945699",
      //   "ifsc_code": "KKBK0008667",
      //   "sub_broker_arn_code": "",
      //   "sub_broker_code": "",
      //   "euin_opted": "N",
      //   "euin": "",
      //   "trxn_execution": "",
      //   "remarks": "",
      //   "payment_mode": "OL",
      //   "billdesk_bank": "162",
      //   "instrm_bank": "",
      //   "instrm_ac_no": "",
      //   "instrm_no": "",
      //   "instrm_amount": "100",
      //   "instrm_date": "",
      //   "instrm_branch": "",
      //   "instrm_charges": "",
      //   "micr": "",
      //   "rtgs_code": "",
      //   "neft_ifsc": "",
      //   "advisory_charge": "",
      //   "dd_charge": "",
      //   "cheque_deposit_mode": "",
      //   "debit_amount_type": "",
      //   "sip_micr_no": "",
      //   "sip_bank": "",
      //   "sip_branch": "",
      //   "sip_acc_no": "",
      //   "sip_ac_type": "",
      //   "sip_ifsc_code": "KKBK0008667",
      //   "sip_paymech": "",
      //   "umrn": "",
      //   "ach_amt": "",
      //   "ach_fromdate": "",
      //   "ach_enddate": "",
      //   "until_cancelled": "",
      //   "Return_paymnt_flag": "Y",
      //   "Client_callback_url": "https://finfresh-api.in.techath.com/finfresh",
      //   "Bank_holder_name": "Krishna",
      //   "Bank_holder_name1": "",
      //   "Bank_holder_name2": "",
      //   "trxn_initiator": "I / O",
      //   "trans_count": "1",
      //   "utr_no": "564545",
      //   "transfer_date": "31-Jan-2024",
      //   "investor_auth_log": "",
      //   "ach_exist": "Y",
      //   "process_mode": "E",
      //   "channel_type": "NET"
      // },
      // "childtrans": {
      //   "amc": "H",
      //   "folio": "",
      //   "product_code": "HRDHR",
      //   "ft_acc_no": "",
      //   "reinvest": "Z",
      //   "amount": "100",
      //   "sip_from_date": "",
      //   "sip_end_date": "",
      //   "sip_freq": "",
      //   "sip_amount": "",
      //   "sip_period_day": "",
      //   "input_ref_no": "52521",
      //   "perpetual_flag": "",
      //   "insurance_enabled": "",
      //   "GOAL_BASED_SIP": "",
      //   "GOAL_TYPE": "",
      //   "GOAL_AMOUNT": "",
      //   "FREEDOM_SIP": "Y",
      //   "FREEDOM_TARGET_SCHEME": "RG2GR",
      //   "FREEDOM_TENURE": "12",
      //   "FREEDOM_SWP_AMOUNT": "100",
      //   "FREEDOM_SCHEME_OPTION": "A"
      // }

      "transaction": "purchasetransaction",
      "phonenumber": phoneNumber,
      "service_request": {
        // "iin": "5014047687",
        "iin": iin,
        "sub_trxn_type": "N",
        "poa": "N",
        "poa_bank_trxn_type": "NDCPMS",
        "trxn_acceptance": paymenMode,
        "demat_user": "N",
        "dp_id": "",
        "bank": bankCode,
        // "bank": 'YBK',
        // "ac_no": "069251100006838",
        // "ifsc_code": "YESB0000692",
        "ac_no": accountNumber,
        "ifsc_code": ifscCode,
        "sub_broker_arn_code": "",
        "sub_broker_code": "",
        "euin_opted": "N",
        "euin": "",
        "trxn_execution": "",
        "remarks": "",
        "payment_mode": paymenMode,
        "billdesk_bank": bankCode,
        "instrm_bank": "",
        "instrm_ac_no": "",
        "instrm_no": "",
        "instrm_amount": instalmentAmount,
        "instrm_date": "",
        "instrm_branch": "",
        "instrm_charges": "",
        "micr": "",
        "rtgs_code": "",
        "neft_ifsc": "",
        "advisory_charge": "",
        "dd_charge": "",
        "cheque_deposit_mode": "",
        "debit_amount_type": "",
        "sip_micr_no": "",
        "sip_bank": "",
        "sip_branch": "",
        "sip_acc_no": "",
        "sip_ac_type": "",
        "sip_ifsc_code": "KKBK0008667",
        "sip_paymech": "",
        "umrn": "",
        "ach_amt": "",
        "ach_fromdate": date,
        "ach_enddate": duedate,
        "until_cancelled": "",
        "Return_paymnt_flag": "Y",
        "Client_callback_url": "https://finfresh-api.in.techath.com/finfresh",
        "Bank_holder_name": "Krishna",
        "Bank_holder_name1": "",
        "Bank_holder_name2": "",
        "trxn_initiator": "I / O",
        "trans_count": "1",
        "utr_no": "564545",
        "transfer_date": date,
        "investor_auth_log": "",
        "ach_exist": "Y",
        "process_mode": "E",
        "channel_type": "NET"
      },
      "childtrans": {
        "amc": amc,
        "folio": "",
        "product_code": productCode,
        "ft_acc_no": "",
        "reinvest": "Z",
        "amount": instalmentAmount,
        "sip_from_date": date,
        "sip_end_date": duedate,
        "sip_freq": "",
        "sip_amount": "",
        "sip_period_day": "",
        "input_ref_no": "52521",
        "perpetual_flag": "",
        "insurance_enabled": "",
        "GOAL_BASED_SIP": "",
        "GOAL_TYPE": "",
        "GOAL_AMOUNT": "",
        "FREEDOM_SIP": "Y",
        "FREEDOM_TARGET_SCHEME": "RG2GR",
        "FREEDOM_TENURE": "12",
        "FREEDOM_SWP_AMOUNT": "100",
        "FREEDOM_SCHEME_OPTION": "A"
      }
    };
    log('payload === ${jsonEncode(payload)}');
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'x-key': userId,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );
      logger.d('response.statuscode${response.statusCode}');
      log('transaction response${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse["status"] == 200) {
        paymentResponseModel = PaymentResponseModel.fromJson(jsonResponse);
        return true;
      } else if (jsonResponse["code"] == 500) {
        // ignore: use_build_context_synchronously
        showSnackBar(context, jsonResponse["message"]);
      }
    } on SocketException {
      // ignore: use_build_context_synchronously
      showSnackBar(context, 'No Internet Connection');
    } catch (e) {
      logger.d('Exception in purchase $e');
      return false;
    }
    return false;
  }

  
}
