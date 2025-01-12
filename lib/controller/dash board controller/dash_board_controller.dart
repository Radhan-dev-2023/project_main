import 'dart:developer';

import 'package:finfresh_mobile/model/dash%20Board%20Model/dash_board_model.dart';
import 'package:finfresh_mobile/model/summary%20model/summary_model.dart';
import 'package:finfresh_mobile/services/dash%20board%20Services/dash_board_services.dart';
import 'package:finfresh_mobile/services/delete%20account/delete_account.dart';
import 'package:finfresh_mobile/services/refersh%20token/refersh_token.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class DashBoardController extends ChangeNotifier {
  DasBoardService dashBoardService = DasBoardService();
  DeleteAccountService deleteAccountService = DeleteAccountService();
  DashBoardModel? dashBoardModel;
  bool loadingDashboard = false;
  RefershTokenService refershTokenService = RefershTokenService();
  int currentIndex = 2;
  bool isSwitched = false;
  double totalAmount = 0.0;
  double gain = 0.0;
  double invest = 0.0;
  dynamic percetageforinvest;
  dynamic prectageForGain;
  int indexForButtonForGraph = 0;
  Color graphColor = const Color(0xFF4A90E2);
  void changeindexOfButtonForGraph(int index, color) {
    indexForButtonForGraph = index;
    graphColor = color;
    notifyListeners();
  }

  void changeToogle() async {
    isSwitched = !isSwitched;
    notifyListeners();
    if (isSwitched == false) {
      log('changing');
      await SecureStorage.addingvaluesToStorage('fringer', 'false');
    } else {
      log('fringer false');
      await SecureStorage.addingvaluesToStorage('fringer', 'true');
    }
  }

  Future<void> fringerprintCheck() async {
    String pin = await SecureStorage.readToken('fringer');
    if (pin == 'true') {
      isSwitched = true;
    } else {
      isSwitched = false;
    }
  }

  bool isfetched = false;
  Future<void> getDashBoardDetails(context) async {
    // refershTokenService.postRefershTocken(context);

    loadingDashboard = true;
    indexForButtonForGraph = 0;
    // notifyListeners();

    try {
      String token = await SecureStorage.readToken('token');
      bool isTokenExpired = JwtDecoder.isExpired(token);
      if (isTokenExpired) {
        bool result = await refershTokenService.postRefershTocken(context);
        log(result.toString());
        if (result) {
          dashBoardModel = await dashBoardService.getDashBoardDetails(context);

          logger.d(
              'dassss=${dashBoardModel?.result?.data?.activationStatus!.statusCode}');
          SecureStorage.addToken(
              'bankAccNumber', dashBoardModel?.result?.data?.bank?.accNo ?? '');
          SecureStorage.addToken(
              'bankcode', dashBoardModel?.result?.data?.bank?.bankName ?? '');
          SecureStorage.addToken(
              'customerId', dashBoardModel?.result?.data?.iin ?? '');
          await getSummary(context, dashBoardModel?.result?.data?.email ?? '');
          loadingDashboard = false;
          isfetched = true;
          notifyListeners();
        }
        loadingDashboard = false;
        notifyListeners();
      } else {
        log(isTokenExpired.toString());
        dashBoardModel = await dashBoardService.getDashBoardDetails(context);

        logger.d(
            'dassss=${dashBoardModel?.result?.data?.activationStatus!.statusCode}');
        SecureStorage.addToken(
            'bankAccNumber', dashBoardModel?.result?.data?.bank?.accNo ?? '');
        SecureStorage.addToken(
            'bankcode', dashBoardModel?.result?.data?.bank?.bankName ?? '');
        SecureStorage.addToken(
          'customerId',
          dashBoardModel?.result?.data?.iin ?? '',
        );
        await getSummary(context, dashBoardModel?.result?.data?.email ?? '');
        isfetched = true;
        loadingDashboard = false;
        notifyListeners();
      }
    } catch (e) {
      logger.d('get dashboard failed with an exception$e');
      loadingDashboard = false;
      notifyListeners();
    }
  }

  String username = '';
  getusername() async {
    String name = await SecureStorage.readToken('username');
    username = name;
    notifyListeners();
  }

  SummaryModel? summaryModel;
  // List<dynamic> summaryResilt = [];
  Future<void> getSummary(context, String email) async {
    // loadingDashboard = true;

    // notifyListeners();
    try {
      String token = await SecureStorage.readToken('token');
      bool isTokenExpired = JwtDecoder.isExpired(token);
      if (isTokenExpired) {
        await refershTokenService.postRefershTocken(context);
        summaryModel = await dashBoardService.fetchSummary(context, email);

        loadingDashboard = false;
        notifyListeners();
      } else {
        summaryModel = await dashBoardService.fetchSummary(context, email);
        loadingDashboard = false;
        notifyListeners();
      }
    } catch (e) {
      logger.d('summary failed with an exception$e');
      loadingDashboard = false;
      notifyListeners();
    }
  }

  bool loadingPage = false;
  Future<bool> deleteaccount(context) async {
    loadingPage = true;
    notifyListeners();
    bool result = await deleteAccountService.deleteAccount(context);
    loadingPage = false;
    notifyListeners();
    return result;
  }
  // Future<void> callBothFunction(context) async {
  //   await getDashBoardDetails(context);
  //   await getSummary(context);
  // }
}
