import 'dart:developer';

import 'package:finfresh_mobile/model/top%20performing%20model/top_performing_mutual_fund.dart';
import 'package:finfresh_mobile/services/scheme%20services/scheme_services.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:flutter/material.dart';

class TopMFsController extends ChangeNotifier {
  String returns = '3 year';
  SchemeServices schemeServices = SchemeServices();
  TextEditingController queryController = TextEditingController();
  final List<String> dataList = [
    '1 month',
    '3 month',
    '6 month',
    '1 year',
    '3 year',
    '5 year',
    '10 year'
  ];
  String returntoBackend = '3Y';
  final PageController pageController = PageController(initialPage: 4);

  void changeValueinDuration(String value) {
    returns = value;
    notifyListeners();
    if (returns == '1 month') {
      returntoBackend = '1M';
    } else if (returns == '3 month') {
      returntoBackend = '3M';
    } else if (returns == '6 month') {
      returntoBackend = '6M';
    } else if (returns == '1 year') {
      returntoBackend = '1Y';
    } else if (returns == '3 year') {
      returntoBackend = '3Y';
    } else if (returns == '5 year') {
      returntoBackend = '5Y';
    } else if (returns == '10 year') {
      returntoBackend = '10Y';
    }
  }

  List<ListElement> filteredListForAllFunds = [];
  TopPerformingMutualFundModel? topPerformingMutualFundModel;
  bool loading = false;
  Future<void> getTopMfs(context, String category) async {
    filteredListForAllFunds.clear();
    loading = true;
    // notifyListeners();
    log('categort$category ,retunrs$returntoBackend');

    try {
      topPerformingMutualFundModel = await schemeServices
          .topPerformingMutualFund(context, category, returntoBackend);

      filteredListForAllFunds.addAll(topPerformingMutualFundModel?.list ?? []);

      loading = false;
      notifyListeners();
      log(topPerformingMutualFundModel.toString());
    } catch (e) {
      logger.d('Exception in top MFs$e');
      loading = false;
      notifyListeners();
    }
    loading = false;
    notifyListeners();
  }

  void searchItems() {
    // searchResults.addAll(vendourList.vendourModel.result!.company!)
    logger.d('search function called ');

    filteredListForAllFunds = topPerformingMutualFundModel!.list!
        .where((item) => item.schemeAmfi!
            .toLowerCase()
            .contains(queryController.text.toLowerCase()))
        .toList();
    logger.d('search result list == $filteredListForAllFunds');
    notifyListeners();
  }

  bool lodingList = false;
  Future<void> getTopMfsFRomPeriod(context, String category) async {
    filteredListForAllFunds.clear();
    lodingList = true;
    notifyListeners();
    log('categort$category ,retunrs$returntoBackend');

    try {
      topPerformingMutualFundModel = await schemeServices
          .topPerformingMutualFund(context, category, returntoBackend);

      filteredListForAllFunds.addAll(topPerformingMutualFundModel?.list ?? []);
      lodingList = false;
      notifyListeners();
      log(topPerformingMutualFundModel.toString());
    } catch (e) {
      logger.d('Exception in top MFs$e');
      lodingList = false;
      notifyListeners();
    }
    lodingList = false;
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

  String returnPercentageinAllFunds = '';
  void returnValueallFunds(int index) {
    if (returns == '1 month') {
      returnPercentageinAllFunds =
          filteredListForAllFunds[index].returnsAbs1Month.toString() ?? '';
    } else if (returns == '3 month') {
      returnPercentageinAllFunds =
          filteredListForAllFunds[index].returnsAbs3Month.toString() ?? '';
    } else if (returns == '6 month') {
      returnPercentageinAllFunds =
          filteredListForAllFunds[index].returnsAbs6Month.toString() ?? '';
    } else if (returns == '1 year') {
      returnPercentageinAllFunds =
          filteredListForAllFunds[index].returnsAbs1Year.toString() ?? '';
    } else if (returns == '3 year') {
      returnPercentageinAllFunds =
          filteredListForAllFunds[index].returnsCmp3Year.toString() ?? '';
    } else if (returns == '5 year') {
      returnPercentageinAllFunds =
          filteredListForAllFunds[index].returnsCmp5Year.toString() ?? '';
    } else if (returns == '10 year') {
      returnPercentageinAllFunds =
          filteredListForAllFunds[index].returnsCmp10Year.toString() ?? '';
    }
  }

  void callinginInit(context) {
    queryController.clear();
    returns = '3 year';
    returntoBackend = '3y';
    getTopMfsFRomPeriod(context, 'All');
  }
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   pageController.dispose();
  // }
}
