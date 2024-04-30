import 'dart:developer';

import 'package:finfresh_mobile/model/report%20details%20modal/report_details_model.dart';
import 'package:finfresh_mobile/model/transaction%20report%20model/transaction_report_model.dart';
import 'package:finfresh_mobile/services/holding%20services/holding_service.dart';
import 'package:finfresh_mobile/services/refersh%20token/refersh_token.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class HoldingsController extends ChangeNotifier {
  HoldingServices holdingServices = HoldingServices();
  RefershTokenService refershTokenService = RefershTokenService();
  TransactionReport? transactionReport;
  bool loadingHoldingpage = true;
  Future<void> fetchTransactionReport(context) async {
    String token = await SecureStorage.readToken('token');
    bool isTokenExpired = JwtDecoder.isExpired(token);
    loadingHoldingpage = true;
    notifyListeners();
    try {
      if (isTokenExpired) {
        await refershTokenService.postRefershTocken(context);
        transactionReport =
            await holdingServices.fetchTranscationReprot(context);
        loadingHoldingpage = false;
        notifyListeners();
      } else {
        transactionReport =
            await holdingServices.fetchTranscationReprot(context);
        loadingHoldingpage = false;
        notifyListeners();
      }
    } catch (e) {
      logger.d('report failed with an exception$e');
      loadingHoldingpage = false;
      notifyListeners();
    }
  }

  String? redeemValue = 'Redeem';
  List<String> radeemList = ['Redeem', 'Switch', 'Stp', 'Swp'];
  void updateRedeemValue(String value) {
    redeemValue = value;
    notifyListeners();
  }

  bool loading = false;
  ReportDetailsModel? reportDetailsModel;
  Future<void> fetchReportDetails(
      context, String isinNumber, String trxnumber) async {
    String token = await SecureStorage.readToken('token');
    bool isTokenExpired = JwtDecoder.isExpired(token);
    loading = true;
    notifyListeners();
    try {
      if (isTokenExpired) {
        await refershTokenService.postRefershTocken(context);
        reportDetailsModel =
            await holdingServices.fetchReprot(context, isinNumber, trxnumber);
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        reportDetailsModel =
            await holdingServices.fetchReprot(context, isinNumber, trxnumber);
        notifyListeners();
        loading = false;
        notifyListeners();
      }
    } catch (e) {
      logger.d('report failed with an exception$e');
      loading = false;
      notifyListeners();
    }
  }

  int currentindex = 0;
  void changeindex(int index) {
    currentindex = index;
    log('curent$currentindex');
    notifyListeners();
  }
}
