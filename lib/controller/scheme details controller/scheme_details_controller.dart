import 'dart:developer';

import 'package:finfresh_mobile/model/historical%20nav%20model/historical_nav_model.dart';
import 'package:finfresh_mobile/model/scheme%20model/scehem_information_model.dart';
import 'package:finfresh_mobile/services/scheme%20services/scheme_services.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SchemeDetailsController extends ChangeNotifier {
  SchemeServices schemeService = SchemeServices();
  SchemeInfoModel? schemeInfoModel;
  HistoricalNavModel? historicalNavModel;
  bool detailScreenLoading = false;
  List<dynamic> holding = [];
  List<dynamic> value = [];
  bool changebutton = false;
  String selectValueForChart = 'ALL';
  List<String> monthvalue = ['3M', '6M', '1Y', '2Y', '5Y', '10Y', 'ALL'];
  void updatemonthvalue(
    String? value,
  ) {
    selectValueForChart = value ?? '';
    notifyListeners();
  }

  String selectedValue = 'Investment type';
  final List<String> investmentType = ['Investment type', 'SIP', 'Lumpsum'];
  void updateSelectedValue(String? value) {
    selectedValue = value ?? '';
    notifyListeners();
  }

  void changeButton() {
    changebutton = !changebutton;
    notifyListeners();
  }

  Future<void> getSchemeInfo(context, String scheme) async {
    detailScreenLoading = true;
    // notifyListeners();
    holding.clear();
    value.clear();
    try {
      schemeInfoModel = await schemeService.schemeInfo(context, scheme);
      holding = schemeInfoModel!.schemePortfolioList!
          .map((e) => e.schemePortfolioHoldings.keys)
          .toList();
      value = schemeInfoModel!.schemePortfolioList!
          .map((e) => e.schemePortfolioHoldings.values)
          .toList();

      detailScreenLoading = false;
      notifyListeners();
    } catch (e) {
      logger.d('Scheme info Exception$e');
      detailScreenLoading = false;
      notifyListeners();
    }
  }

  Future<void> getChartValue(context, String scheme) async {
    detailScreenLoading = true;
    DateTime? today;
    // DateTime dateTime =
    //     DateFormat('dd-MM-yyyy').parse(today);
    DateTime? newDateTime;

    String? lastdate;

    String? startdate;

    if (selectValueForChart == '3M') {
      today = DateTime.now();
      newDateTime = today.subtract(const Duration(days: 3 * 30));
      lastdate = DateFormat('dd-MM-yyyy').format(newDateTime);
      startdate = DateFormat('dd-MM-yyyy').format(today);
    } else if (selectValueForChart == '6M') {
      today = DateTime.now();
      newDateTime = today.subtract(const Duration(days: 6 * 30));
      lastdate = DateFormat('dd-MM-yyyy').format(newDateTime);
      startdate = DateFormat('dd-MM-yyyy').format(today);
    } else if (selectValueForChart == '1Y') {
      today = DateTime.now();
      newDateTime = today.subtract(const Duration(days: 1 * 365));
      lastdate = DateFormat('dd-MM-yyyy').format(newDateTime);
      startdate = DateFormat('dd-MM-yyyy').format(today);
    } else if (selectValueForChart == '2Y') {
      today = DateTime.now();
      newDateTime = today.subtract(const Duration(days: 2 * 365));
      lastdate = DateFormat('dd-MM-yyyy').format(newDateTime);
      startdate = DateFormat('dd-MM-yyyy').format(today);
    } else if (selectValueForChart == '5Y') {
      today = DateTime.now();
      newDateTime = today.subtract(const Duration(days: 5 * 365));
      lastdate = DateFormat('dd-MM-yyyy').format(newDateTime);
      startdate = DateFormat('dd-MM-yyyy').format(today);
    } else if (selectValueForChart == '10Y') {
      today = DateTime.now();
      newDateTime = today.subtract(const Duration(days: 10 * 365));
      lastdate = DateFormat('dd-MM-yyyy').format(newDateTime);
      startdate = DateFormat('dd-MM-yyyy').format(today);
    } else if (selectValueForChart == 'ALL') {
      today = DateTime.now();
      newDateTime = today.subtract(const Duration(days: 10 * 365));
      lastdate = DateFormat('dd-MM-yyyy').format(newDateTime);
      startdate = DateFormat('dd-MM-yyyy').format(today);
    }
    log('last date ==$lastdate');
    log('inception date =${schemeInfoModel!.schemeInceptionDate!}');
    // notifyListeners();
    try {
      historicalNavModel = await schemeService.historicalNav(
        lastdate!,
        context,
        scheme,
        startdate!,
      );
      detailScreenLoading = false;
      notifyListeners();
    } catch (e) {
      logger.d('exceptionn in getting nav$e');
      detailScreenLoading = false;
      notifyListeners();
    }
  }

  Future<void> callingFunctionDetailScreen(context, String scheme) async {
    await getSchemeInfo(context, scheme);
    await getChartValue(context, scheme);
  }
}
