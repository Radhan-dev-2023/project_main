import 'dart:developer';

import 'package:finfresh_mobile/model/top%20performing%20model/top_performing_mutual_fund.dart';
import 'package:finfresh_mobile/services/scheme%20services/scheme_services.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:flutter/material.dart';

class TopMFsController extends ChangeNotifier {
  SchemeServices schemeServices = SchemeServices();
  TopPerformingMutualFundModel? topPerformingMutualFundModel;
  bool loading = false;
  Future<void> getTopMfs(context, String category) async {
    loading = true;
    // notifyListeners();
    log('calling$category');
    try {
      topPerformingMutualFundModel =
          await schemeServices.topPerformingMutualFund(context, category);
      log(topPerformingMutualFundModel.toString());
      loading = false;
      notifyListeners();
    } catch (e) {
      logger.d('Exception in top MFs$e');
      loading = false;
      notifyListeners();
    }
    loading = false;
    notifyListeners();
  }
}
