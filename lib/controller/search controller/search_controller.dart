import 'dart:developer';

import 'package:finfresh_mobile/services/scheme%20services/scheme_services.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:flutter/material.dart';
import 'package:finfresh_mobile/model/mutual%20Fund%20Model/Mutual_fund_model.dart';

class SearchFundsController extends ChangeNotifier {
  SchemeServices schemeServices = SchemeServices();
  MutualFundModel? mutualfundmodel;
  bool searchLoading = false;

  Future<void> mutualFundsBasedonQuery(String query, context) async {
    log('query called');
    searchLoading = true;
    notifyListeners();
    try {
      mutualfundmodel = await schemeServices.mutualFundBasedonCategoryAndQuery(
          query, context);
      searchLoading = false;
      notifyListeners();
    } catch (e) {
      logger.d('mutual fund failed with  an exception $e');
      searchLoading = false;
      notifyListeners();
    }
  }
}
