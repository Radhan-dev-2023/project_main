import 'dart:developer';

import 'package:finfresh_mobile/model/top%20performing%20model/top_performing_mutual_fund.dart';
import 'package:finfresh_mobile/services/scheme%20services/scheme_services.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:flutter/material.dart';

class TopMFsController extends ChangeNotifier {
  String returns = '1 month';
  SchemeServices schemeServices = SchemeServices();
  final List<String> dataList = [
    '1 month',
    '3 month',
    '6 month',
    '1 year',
    '3 year',
    '5 year',
    '10 year'
  ];
  String returntoBackend = '';
  final PageController pageController = PageController();

  void changeValueinDuration(String value) {
    returns = value;
    notifyListeners();
    if (returns == '1 month') {
      returntoBackend = '1m';
    } else if (returns == '3 month') {
      returntoBackend = '3m';
    } else if (returns == '6 month') {
      returntoBackend = '6m';
    } else if (returns == '1 year') {
      returntoBackend = '1y';
    } else if (returns == '3 year') {
      returntoBackend = '3y';
    } else if (returns == '5 year') {
      returntoBackend = '5y';
    } else if (returns == '10 year') {
      returntoBackend = '10y';
    }
  }

  TopPerformingMutualFundModel? topPerformingMutualFundModel;
  bool loading = false;
  Future<void> getTopMfs(context, String category) async {
    loading = true;
    // notifyListeners();
    log('categort$category ,retunrs$returntoBackend');

    try {
      topPerformingMutualFundModel = await schemeServices
          .topPerformingMutualFund(context, category, returntoBackend);
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

  Future<void> getTopMfsFRomPeriod(context, String category) async {
    // loading = true;
    // notifyListeners();
    log('categort$category ,retunrs$returns');

    try {
      topPerformingMutualFundModel = await schemeServices
          .topPerformingMutualFund(context, category, returns);
      log(topPerformingMutualFundModel.toString());
      // loading = false;
      notifyListeners();
    } catch (e) {
      logger.d('Exception in top MFs$e');
      // loading = false;
      notifyListeners();
    }
    // loading = false;
    notifyListeners();
  }

  String returnPercentage = '';
  void returnValue(int index) {
    if (returns == '1 month') {
      returnPercentage = topPerformingMutualFundModel
              ?.list?[index].returnsAbs1Month
              .toString() ??
          '';
    } else if (returns == '3 month') {
      returnPercentage = topPerformingMutualFundModel
              ?.list?[index].returnsAbs3Month
              .toString() ??
          '';
    } else if (returns == '6 month') {
      returnPercentage = topPerformingMutualFundModel
              ?.list?[index].returnsAbs6Month
              .toString() ??
          '';
    } else if (returns == '1 year') {
      returnPercentage = topPerformingMutualFundModel
              ?.list?[index].returnsAbs1Year
              .toString() ??
          '';
    } else if (returns == '3 year') {
      returnPercentage = topPerformingMutualFundModel
              ?.list?[index].returnsCmp3Year
              .toString() ??
          '';
    } else if (returns == '5 year') {
      returnPercentage = topPerformingMutualFundModel
              ?.list?[index].returnsCmp5Year
              .toString() ??
          '';
    } else if (returns == '10 year') {
      returnPercentage = topPerformingMutualFundModel
              ?.list?[index].returnsCmp10Year
              .toString() ??
          '';
    }
  }
}
