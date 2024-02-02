import 'dart:developer';

import 'package:finfresh_mobile/model/dash%20Board%20Model/dash_board_model.dart';
import 'package:finfresh_mobile/model/historical%20nav%20model/historical_nav_model.dart';
import 'package:finfresh_mobile/model/scheme%20model/scehem_information_model.dart';
import 'package:finfresh_mobile/services/scheme%20services/scheme_services.dart';
import 'package:finfresh_mobile/services/transaction%20service/transaction_service.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SchemeDetailsController extends ChangeNotifier {
  SchemeServices schemeService = SchemeServices();
  TextEditingController dateController = TextEditingController();
  TextEditingController installmentController = TextEditingController();
  TextEditingController accountnumberController = TextEditingController();
  TransactionService transactionService = TransactionService();

  SchemeInfoModel? schemeInfoModel;
  HistoricalNavModel? historicalNavModel;
  String? paymentvalueTobackent;
  bool detailScreenLoading = false;
  List<dynamic> holding = [];
  List<dynamic> value = [];
  bool changebutton = false;
  String selectValueForChart = 'ALL';
  List<String> monthvalue = ['3M', '6M', '1Y', '2Y', '5Y', '10Y', 'ALL'];
  String durationValue = 'Until Cancelled';
  List<String> duration = [
    'Until Cancelled',
    '1 Year',
    '2 Year',
    '3 Year',
    '4 Year',
    '5 Year',
    '6 Year',
    '7 Year',
    '8 Year',
    '9 Year',
    '10 Year',
    '11 Year',
    '12 Year',
    '13 Year',
    '14 Year',
    '15 Year',
    '16 Year',
    '17 Year',
    '18 Year',
    '19 Year',
    '20 Year',
    '21 Year',
    '22 Year',
    '23 Year',
    '24 Year',
    '25 Year'
  ];

  void updateDuration(String? value) {
    durationValue = value ?? '';
    notifyListeners();
  }

  String paymentMode = 'Select a payment mode';
  List<String> paymentList = [
    'Select a payment mode',
    'Cheque',
    'Demand Draft',
    'Debit Mandate',
    'Online',
    'RTGS/NEFT',
    'UPI',
  ];
  void updatePaymentMode(String? value) {
    paymentMode = value ?? '';
    notifyListeners();
    if (paymentMode == 'Cheque') {
      paymentvalueTobackent = 'Q';
    } else if (paymentMode == 'Demand Draft') {
      paymentvalueTobackent = 'D';
    } else if (paymentMode == 'Debit Mandate') {
      paymentvalueTobackent = 'M';
    } else if (paymentMode == 'Online') {
      paymentvalueTobackent = 'OL';
    } else if (paymentMode == 'RTGS/NEFT') {
      paymentvalueTobackent = 'TR';
    } else if (paymentMode == 'UPI') {
      paymentvalueTobackent = 'UPI';
    }
  }

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

  String ifscCodde = '';
  Future<void> callingFunctionDetailScreen(context, String scheme) async {
    await getSchemeInfo(context, scheme);
    await getChartValue(context, scheme);
  }

  Future<bool> transction() async {
    String purchasedate = dateController.text;
    String year = durationValue.trim().split(' ')[0];
    log(year);
    int yearConvetToint = int.parse(year);
    DateTime selcetdate = DateFormat('dd-MMM-yyyy').parse(purchasedate);
    DateTime date = selcetdate.add(Duration(days: yearConvetToint * 365));
    String duedate = DateFormat('dd-MMM-yyyy').format(date);
    log('duedate ===$duedate');

    bool result = await transactionService.transcationService(
        paymenMode: paymentvalueTobackent ?? '',
        accountNumber: accountnumberController.text,
        ifscCode: ifscCodde,
        instalmentAmount: installmentController.text,
        fromdate: dateController.text,
        duedate: duedate,
        date: dateController.text);
    if (result == true) {
      return true;
    } else {
      return false;
    }
  }
}
