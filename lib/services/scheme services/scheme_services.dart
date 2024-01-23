import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:finfresh_mobile/model/historical%20nav%20model/historical_nav_model.dart';
import 'package:finfresh_mobile/model/latest%20nav%20model/latest_nav_model.dart';
import 'package:finfresh_mobile/model/mutual%20Fund%20Model/Mutual_fund_model.dart';
import 'package:finfresh_mobile/model/schem%20allCategory/scheme_allcategory_model.dart';
import 'package:finfresh_mobile/model/scheme%20category%20model/scheme_category_model.dart';
import 'package:finfresh_mobile/model/scheme%20model/scehem_information_model.dart';
import 'package:finfresh_mobile/model/top%20performing%20lambsum%20fund%20model/lumsum_model.dart';
import 'package:finfresh_mobile/model/top%20performing%20model/top_performing_mutual_fund.dart';
import 'package:finfresh_mobile/model/top%20performing%20sib%20model/top_performing_sip_on_category.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:http/http.dart' as http;

class SchemeServices {
  SchemeInfoModel infoModel = SchemeInfoModel();
  SchemeCategoryModel categoryModel = SchemeCategoryModel();
  SchemeAllCategoryModel allCategoryModel = SchemeAllCategoryModel();
  TopPerformingMutualFundModel topPerformingMutualFundModel =
      TopPerformingMutualFundModel();
  LatestNavModel latestNavModel = LatestNavModel();
  HistoricalNavModel historicalNavModel = HistoricalNavModel();
  SipBasedOnCategoeryModel sipBasedOnCategoeryModel =
      SipBasedOnCategoeryModel();
  TopLumbSumModel topLumbSumModel = TopLumbSumModel();
  MutualFundModel mutualFundModel = MutualFundModel();
  List<dynamic> portfolioList = [];
  // List<Map<String, double>> holdings = [];
  Future<SchemeInfoModel?> schemeInfo(context) async {
    log('calling');
    String url =
        'http://mfapi.advisorkhoj.com/getSchemeInfoFinfreshWealth?key=44aaa594-8ebd-4b0f-b3e2-80bc279d0163&scheme=HDFC Top 100 Fund - Growth Option - Regular Plan';
    try {
      log('try');
      http.Response response = await http.get(
        Uri.parse(url),
      );
      logger.d('Scheme info service == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
        infoModel = SchemeInfoModel.fromJson(jsonResponse);

        return infoModel;
      } else if (jsonResponse['status'] == 500) {
        // showSnackBar(context, jsonResponse['result']['message']);
        return null;
      } else {
        showSnackBar(context, jsonResponse['status_msg']);
      }
    } on SocketException {
      showSnackBar(context, 'No Internet Connection');
      return null;
    } catch (e) {
      logger.d('exception in scheme info $e');
      return null;
    }
    return null;
  }

  Future<void> schemeCategory() async {
    log('calling');
    String url =
        'https://mfapi.advisorkhoj.com/getAllSchemeBroadCategories?key=44aaa594-8ebd-4b0f-b3e2-80bc279d0163';
    try {
      log('try');
      http.Response response = await http.get(
        Uri.parse(url),
      );

      logger.d('Scheme info service == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
        categoryModel = SchemeCategoryModel.fromJson(jsonResponse);
      } else if (jsonResponse['status'] == 500) {
        // showSnackBar(context, jsonResponse['result']['message']);
      }
    } on SocketException {
      // showSnackBar(context, 'No Internet Connection');
    } catch (e) {
      logger.d('exception in scheme info $e');
    }
  }

  Future<void> schemeAllCategory() async {
    log('calling');
    String url =
        'https://mfapi.advisorkhoj.com/getAllSchemeCategories?key=44aaa594-8ebd-4b0f-b3e2-80bc279d0163';
    try {
      log('try');
      http.Response response = await http.get(
        Uri.parse(url),
      );
      log('completed');
      logger.d('Scheme info service == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
        allCategoryModel = SchemeAllCategoryModel.fromJson(jsonResponse);
      } else if (jsonResponse['status'] == 500) {
        // showSnackBar(context, jsonResponse['result']['message']);
      }
    } on SocketException {
      // showSnackBar(context, 'No Internet Connection');
    } catch (e) {
      logger.d('exception in scheme info $e');
    }
  }

  Future<void> topPerformingMutualFund() async {
    log('calling');
    String url =
        'https://mfapi.advisorkhoj.com/getSchemePerformanceReturnsNew?key=44aaa594-8ebd-4b0f-b3e2-80bc279d0163&category=Hybrid: Aggressive&period=1m';
    try {
      log('try');
      http.Response response = await http.get(
        Uri.parse(url),
      );
      log('completed');
      logger.d('Scheme info service == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
        topPerformingMutualFundModel =
            TopPerformingMutualFundModel.fromJson(jsonResponse);
      } else if (jsonResponse['status'] == 500) {
        // showSnackBar(context, jsonResponse['result']['message']);
      }
    } on SocketException {
      // showSnackBar(context, 'No Internet Connection');
    } catch (e) {
      logger.d('exception in scheme info $e');
    }
  }

  Future<void> latestNav() async {
    log('calling');
    String url =
        'https://mfapi.advisorkhoj.com/getLatestNav?key=44aaa594-8ebd-4b0f-b3e2-80bc279d0163&amc=HDFC Mutual Fund&category=Debt: Liquid';
    try {
      log('try');
      http.Response response = await http.get(
        Uri.parse(url),
      );
      log('completed');
      logger.d('Scheme info service == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
        latestNavModel = LatestNavModel.fromJson(jsonResponse);
      } else if (jsonResponse['status'] == 500) {
        // showSnackBar(context, jsonResponse['result']['message']);
      }
    } on SocketException {
      // showSnackBar(context, 'No Internet Connection');
    } catch (e) {
      logger.d('exception in scheme info $e');
    }
  }

  Future<HistoricalNavModel?> historicalNav(String startDate, context) async {
    log('calling');
    String url =
        'https://mfapi.advisorkhoj.com/getHistoricalNav?key=44aaa594-8ebd-4b0f-b3e2-80bc279d0163&scheme=HDFC Liquid Fund - Growth Plan&startdate=19-12-2022&enddate=19-12-2023';
    try {
      log('try');
      http.Response response = await http.get(
        Uri.parse(url),
      );
      log('completed');
      logger.d('Scheme nav == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
        historicalNavModel = HistoricalNavModel.fromJson(jsonResponse);
        return historicalNavModel;
      } else if (jsonResponse['status'] == 500) {
        // showSnackBar(context, jsonResponse['result']['message']);
        return null;
      } else {
        showSnackBar(context, jsonResponse['status_msg']);
        return null;
      }
    } on SocketException {
      showSnackBar(context, 'No Internet Connection');
      return null;
    } catch (e) {
      logger.d('exception in historical nav $e');
      return null;
    }
    return null;
  }

  Future<void> topSIPbasedonCategory() async {
    log('calling');
    String url =
        'https://mfapi.advisorkhoj.com/getSIPReturnsForCategoryPeriodAmount?key=44aaa594-8ebd-4b0f-b3e2-80bc279d0163&category=Equity: Mid Cap&period=3&amount=3000&maxno=3';
    try {
      log('try');
      http.Response response = await http.get(
        Uri.parse(url),
      );
      log('completed');
      logger.d('Scheme info service == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
        sipBasedOnCategoeryModel =
            SipBasedOnCategoeryModel.fromJson(jsonResponse);
      } else if (jsonResponse['status'] == 500) {
        // showSnackBar(context, jsonResponse['result']['message']);
      }
    } on SocketException {
      // showSnackBar(context, 'No Internet Connection');
    } catch (e) {
      logger.d('exception in scheme info $e');
    }
  }

  Future<void> topLumbSum() async {
    log('calling');
    String url =
        'https://mfapi.advisorkhoj.com/getTopPerformingLumpsumFunds?key=44aaa594-8ebd-4b0f-b3e2-80bc279d0163&category=Debt: Short Duration&period=3&amount=10000';
    try {
      log('try');
      http.Response response = await http.get(
        Uri.parse(url),
      );
      log('completed');
      logger.d('Scheme info service == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
        topLumbSumModel = TopLumbSumModel.fromJson(jsonResponse);
      } else if (jsonResponse['status'] == 500) {
        // showSnackBar(context, jsonResponse['result']['message']);
      }
    } on SocketException {
      // showSnackBar(context, 'No Internet Connection');
    } catch (e) {
      logger.d('exception in scheme info $e');
    }
  }

  Future<void> mutualFundBasedonCategoryAndQuery() async {
    log('calling');
    String url =
        'https://mfapi.advisorkhoj.com/autoSuggestAllMfSchemes?key=44aaa594-8ebd-4b0f-b3e2-80bc279d0163&category=Debt: Liquid&query=hdfc';
    try {
      log('try');
      http.Response response = await http.get(
        Uri.parse(url),
      );
      log('completed');
      logger.d('Scheme info service == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
        mutualFundModel = MutualFundModel.fromJson(jsonResponse);
      } else if (jsonResponse['status'] == 500) {
        // showSnackBar(context, jsonResponse['result']['message']);
      }
    } on SocketException {
      // showSnackBar(context, 'No Internet Connection');
    } catch (e) {
      logger.d('exception in scheme info $e');
    }
  }
}