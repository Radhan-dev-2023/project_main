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
  final GlobalKey<FormState> formKeyforSwitch = GlobalKey<FormState>();
  final TextEditingController amountController = TextEditingController();
  HoldingServices holdingServices = HoldingServices();
  RefershTokenService refershTokenService = RefershTokenService();
  TransactionReport? transactionReport;
  bool loadingHoldingpage = true;
  Future<void> fetchTransactionReport(context) async {
    loadingHoldingpage = true;
    notifyListeners();
    try {
      String token = await SecureStorage.readToken('token');
      bool isTokenExpired = JwtDecoder.isExpired(token);
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

  String? redeemValue;
  List<String> radeemList = [
    'Redeem',
    'Switch',
  ];
  void updateRedeemValue(String value) {
    redeemValue = value;
    notifyListeners();
  }

  String? redeemBy;
  List<String> redeemByList = [
    'Amount',
    'All Units',
  ];
  void updateRadeemBy(String? value) {
    redeemBy = value;
    notifyListeners();
  }

  String? foliovalue;
  void updateFolio(String? value) {
    foliovalue = value;
    log('foliovalue ==$foliovalue');
    notifyListeners();
  }

  void clearValue() {
    foliovalue = null;
    redeemValue = null;
    redeemBy = null;
    amountController.clear();
    notifyListeners();
  }

  List<String> folioList = [];

  bool loading = false;
  ReportDetailsModel? reportDetailsModel;
  Future<void> fetchReportDetails(
      context, String isinNumber, String trxnumber) async {
    folioList.clear();
    loading = true;
    notifyListeners();
    try {
      String token = await SecureStorage.readToken('token');
      bool isTokenExpired = JwtDecoder.isExpired(token);
      if (isTokenExpired) {
        await refershTokenService.postRefershTocken(context);
        reportDetailsModel =
            await holdingServices.fetchReprot(context, isinNumber, trxnumber);
        if (reportDetailsModel != null) {
          log('hi');
          var purchaseDetails = reportDetailsModel?.result?.purchaseDetails;

          if (purchaseDetails != null) {
            for (var purchaseDetail in purchaseDetails) {
              folioList.add(purchaseDetail.folio);
              log("folioList======$folioList");
            }
          }
        }
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        reportDetailsModel =
            await holdingServices.fetchReprot(context, isinNumber, trxnumber);
        if (reportDetailsModel != null) {
          log('hi');
          var purchaseDetails = reportDetailsModel?.result?.purchaseDetails;

          if (purchaseDetails != null) {
            for (var purchaseDetail in purchaseDetails) {
              folioList.add(purchaseDetail.folio);
              log("folioList======$folioList");
            }
          }
        }
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

  bool loadingmail = false;
  Future<void> sendMailToClinet(
    String mobile,
    String username,
    String schemename,
    String transactiontype,
    context,
  ) async {
    loadingmail = true;
    notifyListeners();
    try {
      String token = await SecureStorage.readToken('token');
      bool isTokenExpired = JwtDecoder.isExpired(token);
      if (isTokenExpired) {
        await refershTokenService.postRefershTocken(context);
        holdingServices.sendmailToClient(
            mobile, username, schemename, transactiontype, context);
        // notifyListeners();
        loadingmail = false;
        notifyListeners();
      } else {
        holdingServices.sendmailToClient(
            mobile, username, schemename, transactiontype, context);
        // notifyListeners();
        loadingmail = false;
        notifyListeners();
      }
    } catch (e) {
      logger.d('report failed with an exception$e');
      loadingmail = false;
      notifyListeners();
    }
  }

  bool loadingSwicth = false;
  Future<void> switchTransaction(context) async {
    loadingSwicth = true;
    notifyListeners();
    try {
      String token = await SecureStorage.readToken('token');
      bool isTokenExpired = JwtDecoder.isExpired(token);
      if (isTokenExpired) {
        await refershTokenService.postRefershTocken(context);

        await holdingServices.transactionSwitch(context);
        loadingSwicth = false;
        notifyListeners();
      } else {
        await holdingServices.transactionSwitch(context);
        loadingSwicth = false;
        notifyListeners();
      }
    } catch (e) {
      logger.d('report failed with an exception$e');
      loadingSwicth = false;
      notifyListeners();
    }
  }
}
