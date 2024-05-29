import 'dart:developer';
import 'package:finfresh_mobile/model/historical%20nav%20model/historical_nav_model.dart';
import 'package:finfresh_mobile/model/product%20code%20model/product_code_model.dart';
import 'package:finfresh_mobile/model/scheme%20model/scehem_information_model.dart';
import 'package:finfresh_mobile/model/sip%20date%20model/sip_date_model.dart';
import 'package:finfresh_mobile/services/kyc/master_services.dart';
import 'package:finfresh_mobile/services/refersh%20token/refersh_token.dart';
import 'package:finfresh_mobile/services/scheme%20services/scheme_services.dart';
import 'package:finfresh_mobile/services/transaction%20service/transaction_service.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SchemeDetailsController extends ChangeNotifier {
  SchemeServices schemeService = SchemeServices();
  MasterService masterService = MasterService();
  TextEditingController dateController = TextEditingController();
  TextEditingController installmentController = TextEditingController();
  TextEditingController accountnumberController = TextEditingController();
  TransactionService transactionService = TransactionService();
  GlobalKey<FormState> formKeyForbtmSheet = GlobalKey<FormState>();

  ProductCodeModel? productCodeModel;
  SchemeInfoModel? schemeInfoModel;
  HistoricalNavModel? historicalNavModel;
  String paymentvalueTobackent = '';
  bool detailScreenLoading = false;
  List<dynamic> holding = [];
  List<dynamic> value = [];
  bool changebutton = false;
  String selectValueForChart = 'ALL';
  List<String> monthvalue = ['3M', '6M', '1Y', '2Y', '5Y', '10Y', 'ALL'];
  int curentIndexForChart = 0;
  String durationValue = '25 Year';
  String achMandateLAstdate = '';
  void updateCurrent(int value) {
    curentIndexForChart = value;
    notifyListeners();
  }

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

  String selectedDay = '';
  String currentMonth = '';
  String currentYear = '';
  String? datevalue;
  void updateDatevalue(String newValue) {
    datevalue = newValue;
    selectedDay = datevalue!;
    DateTime now = DateTime.now();
    currentMonth = DateFormat.MMM().format(now);
    currentYear = DateFormat.y().format(now);
    String selecteddatefromdropdown = '$selectedDay-$currentMonth-$currentYear';
    // dateController.text = '$selectedDay-$currentMonth-$currentYear';
    DateFormat outputFormat = DateFormat('dd-MMM-yyyy');

    DateTime date = outputFormat.parse(selecteddatefromdropdown);
    log('date====$date');
    int difference = date.difference(now).inDays;
    log('difference$difference');
    if (difference >= 7) {
      dateController.text = '$selectedDay-$currentMonth-$currentYear';
    } else {
      DateTime selectedDate;
      if (date.month == DateTime.december) {
        selectedDate = DateTime(date.year + 1, date.month + 1, date.day);
      } else {
        selectedDate = DateTime(date.year, date.month + 1, date.day);
      }
      // DateTime selectedDate = DateTime(date.year, date.month + 1, date.day);
      log('selected date =============$selectedDate');
      // dateController.text = '$selectedDay-${currentMonth}-$currentYear';
      // log('selctedtime$selectedDate');
      dateController.text = DateFormat('dd-MMM-yyyy').format(selectedDate);
      notifyListeners();
    }

    notifyListeners();
  }

  String umrnNumber = '';
  String? mandatevalue;
  void cahngeMandate(String newValue) {
    mandatevalue = newValue;
    notifyListeners();
  }

  bool ischecked = true;
  void changeChecked(bool value) {
    ischecked = value;
    notifyListeners();
  }

  List<String> paymentList = [
    'Select a payment mode',
    // 'Debit Mandate',
    'Online',
    // 'RTGS/NEFT',
    'UPI',
  ];
  void updatePaymentMode(String? value) {
    paymentMode = value ?? '';
    notifyListeners();
    if (paymentMode == 'Select a payment mode') {
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
  final List<String> investmentTypeLumbpsum = ['Investment type', 'Lumpsum'];
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

  dynamic value1;
  Future<void> getChartValue(context, String scheme) async {
    detailScreenLoading = true;
    DateTime? today;
    // DateTime dateTime =
    //     DateFormat('dd-MM-yyyy').parse(today);
    DateTime? newDateTime;

    String? lastdate;

    String? startdate;
    log('select value $selectValueForChart ');

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
    log('start date ===$startdate');
    // log('inception date =${schemeInfoModel?.schemeInceptionDate ?? ''}');
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

  Future<void> getProductCode(String inisinumber) async {
    productCodeModel = await masterService.getProductCode(inisinumber);
  }

  String ifscCodde = '';
  Future<void> callingFunctionDetailScreen(context, String scheme) async {
    await getSchemeInfo(context, scheme);
    await getChartValue(context, scheme);
    // await getSipDate(isinNumber, context);
  }

  RefershTokenService refershTokenService = RefershTokenService();
  bool loadingTransButton = false;
  Future<bool> transction(
    context,
    String investorName,
    String isinNumber,
    String category,
    String navProdName,
  ) async {
    loadingTransButton = true;
    notifyListeners();
    String duedate = '';
    if (dateController.text.isNotEmpty) {
      String purchasedate = dateController.text;
      if (durationValue == 'Until Cancelled') {
        duedate = achMandateLAstdate;
      } else {
        String year = durationValue.trim().split(' ')[0];
        log(year);
        int yearConvetToint = int.parse(year);
        DateTime selcetdate = DateFormat('dd-MMM-yyyy').parse(purchasedate);
        DateTime date = selcetdate.add(Duration(days: yearConvetToint * 365));
        duedate = DateFormat('dd-MMM-yyyy').format(date);
      }
      // DateTime selcetdate = DateFormat('dd-MMM-yyyy').parse(purchasedate);

      log('duedate ===$duedate');
    }
    String token = await SecureStorage.readToken('token');
    bool isTokenExpired = JwtDecoder.isExpired(token);
    if (isTokenExpired) {
      await refershTokenService.postRefershTocken(context);
      bool result = await transactionService.transcationService(
        paymenMode: paymentvalueTobackent.isEmpty ? 'M' : paymentvalueTobackent,
        accountNumber: accountnumberController.text,
        ifscCode: ifscCodde,
        instalmentAmount: installmentController.text,
        fromdate: dateController.text,
        duedate: duedate,
        date: dateController.text,
        amc: productCodeModel?.product?.amcCode ?? '',
        productCode: productCodeModel?.product?.productCode ?? '',
        context: context,
        investorname: investorName,
        isinnumber: isinNumber,
        category: category,
        navpodname: navProdName,
        productName: productCodeModel?.product?.productLongName ?? '',
        transType: selectedValue,
        umrn: umrnNumber,
        systamatic: selectedValue == 'SIP' ? 'S' : "N",
        sipPeriod: selectedValue == 'SIP' ? datevalue ?? '' : '',
      );
      if (result == true) {
        loadingTransButton = false;
        notifyListeners();
        return true;
      } else {
        loadingTransButton = false;
        notifyListeners();
        return false;
      }
    } else {
      bool result = await transactionService.transcationService(
        paymenMode: paymentvalueTobackent.isEmpty ? 'M' : paymentvalueTobackent,
        accountNumber: accountnumberController.text,
        ifscCode: ifscCodde,
        instalmentAmount: installmentController.text,
        fromdate: dateController.text,
        duedate: duedate,
        date: dateController.text,
        amc: productCodeModel?.product?.amcCode ?? '',
        productCode: productCodeModel?.product?.productCode ?? '',
        context: context,
        investorname: investorName,
        isinnumber: isinNumber,
        category: category,
        navpodname: navProdName,
        productName: productCodeModel?.product?.productLongName ?? '',
        transType: selectedValue,
        umrn: umrnNumber,
        systamatic: selectedValue == 'SIP' ? 'S' : "N",
        sipPeriod: selectedValue == 'SIP' ? datevalue ?? '' : '',
      );
      if (result == true) {
        loadingTransButton = false;
        notifyListeners();
        return true;
      } else {
        loadingTransButton = false;
        notifyListeners();
        return false;
      }
    }
  }

  SipdateModel? sipdateModel;
  Future<void> getSipDate(String isinNumber, context) async {
    log('sip date calling');
    try {
      sipdateModel = await masterService.fetchsipDate(isinNumber, context);
    } catch (e) {
      logger.d('failed with an exception in sipdate$e');
    }
  }
}
