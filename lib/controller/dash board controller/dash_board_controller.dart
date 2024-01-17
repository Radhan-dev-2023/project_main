import 'dart:developer';

import 'package:finfresh_mobile/model/dash%20Board%20Model/dash_board_model.dart';
import 'package:finfresh_mobile/services/dash%20board%20Services/dash_board_services.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:flutter/cupertino.dart';

class DashBoardController extends ChangeNotifier {
  DasBoardService dashBoardService = DasBoardService();
  DashBoardModel? dashBoardModel;
  bool loadingDashboard = false;

  Future<void> getDashBoardDetails(context) async {
    loadingDashboard = true;
    notifyListeners();
    try {
      dashBoardModel = await dashBoardService.getDashBoardDetails(context);

      logger.d(
          'dassss=${dashBoardModel?.result?.data?.activationStatus!.statusCode}');
      loadingDashboard = false;
      notifyListeners();
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
}
