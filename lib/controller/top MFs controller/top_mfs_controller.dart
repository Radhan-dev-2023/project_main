import 'dart:developer';

import 'package:finfresh_mobile/model/schem%20allCategory/scheme_allcategory_model.dart';
import 'package:finfresh_mobile/model/top%20performing%20model/top_performing_mutual_fund.dart';
import 'package:finfresh_mobile/services/scheme%20services/scheme_services.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:flutter/material.dart';

class TopMFsController extends ChangeNotifier {
  int currentIndex = 0;
  void changeCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

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

// SchemeServices schemeServices = SchemeServices();
  SchemeAllCategoryModel? schemeAllCategoryModel;
  // bool loading = false;
  String valueforCategory = 'All';
  List<String> categoryList = ['All'];
  Future<void> getSchemeAllCategory(context) async {
    loading = true;
    categoryList.clear();
    categoryList.add('All');
    try {
      schemeAllCategoryModel = await schemeServices.schemeAllCategory(context);
      for (String category in schemeAllCategoryModel!.list!) {
        categoryList.add(category);
      }
      log('category list $categoryList');
      loading = false;
      notifyListeners();
    } catch (e) {
      logger.d('Exxception $e');
      loading = false;
      notifyListeners();
    }
    loading = false;
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
    getSchemeAllCategory(context);
  }

  bool selectedRadio = false;
  void updateRadioButton(bool value) {
    log('called radiobutton');
    selectedRadio = value;
    notifyListeners();
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   pageController.dispose();
  // }
  List<String> sipUnder500list = [
    "Nippon India Small Cap Fund - Growth Plan - Growth Option",
    'UTI Nifty 50 Index Fund - Regular Plan - Growth Option',
    'HDFC Infrastructure Fund - Growth Plan',
    'Baroda BNP Paribas Business Cycle Fund - Regular Plan - Growth',
    'Nippon India Power Infra Fund-Growth Plan -Growth Option',
  ];
  List<String> finfreshpickslist = [
    'HDFC Defence Fund - Growth Option',
    'Bajaj Finserv Flexi Cap Fund -Regular Plan-Growt',
    'Quant Active Fund-GROWTH OPTION - Regular Plan',
    'Quant Business Cycle Fund - Growth Option - Regular Plan',
    'Union Innovation Opportunities Fund - Regular Plan - Growth Option ',
  ];
  List<String> taxsavinginToppicks = [
    "Quant ELSS Tax Saver Fund - Growth Option - Regular Plan",
    'HDFC ELSS Tax saver - Growth Plan',
    'Tata ELSS Tax Saver Fund-Growth-Regular Plan',
    'ITI ELSS Tax Saver Fund - Regular Plan - Growth Option',
    'Taurus ELSS Tax Saver Fund - Regular Plan - Growth',
  ];
  List<String> sectorlFundlist = [
    'quant PSU Fund - Growth Option - Regular Plan ',
    'BANK OF INDIA Manufacturing \u0026 Infrastructure Fund-Growth',
    'BANDHAN TRANSPORTATION AND LOGISTICS FUND - GROWTH - REGULAR PLAN',
    'Tata Resources \u0026 Energy Fund-Regular Plan-Growth',
    'WhiteOak Capital Banking \u0026 Financial Services Fund - Regular Growth',
  ];

  List<String> taxsavingInGoals = [
    'WhiteOak Capital ELSS Tax Saver Fund Regular Plan Growth',
    'HSBC Tax Saver Equity Fund - Growth',
    'Kotak ELSS Tax Saver Fund Growth ',
    'Navi ELSS Tax Saver Fund- Regular Plan- Growth Option',
    'Quant ELSS Tax Saver Fund - Growth Option - Regular Plans',
  ];
  List<String> threeyearList = [
    'Quant Liquid Fund - Growth Option - Regular Plan',
    'Edelweiss Liquid Fund - Regular Plan - Growth Option',
    'Baroda BNP Paribas Credit Risk Fund -Regular-Growth Option ',
    'HDFC Dynamic Debt Fund - Growth Option ',
    'ICICI Prudential All Seasons Bond Fund - Growth',
  ];
  List<String> threetofiveyears = [
    "Quant PSU Fund - Growth Option - Regular Plan",
    "Parag Parikh Flexi Cap Fund - Regular Plan - Growth",
    "Mirae Asset Multi Asset Allocation Fund-Regular Plan-Growth",
    "Bank of India Multi Asset Allocation Fund-Regular Plan-Growth",
    'Quant Absolute Fund - Growth Option - Regular Plan',
  ];
  List<String> fivePlusYears = [
    "Quant Active Fund-GROWTH OPTION - Regular Plan",
    'Tata India Pharma Healthcare Fund-Regular Plan-Growth',
    'HDFC housing oppurtunity',
    'Tata Small Cap Fund-Regular Plan-Growth',
    'SBI Consumption Opportunities Fund - Regular - Growth'
  ];
}
