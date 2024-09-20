import 'dart:developer';

import 'package:finfresh_mobile/model/TopPicks%20model/topPicks_model.dart';
import 'package:finfresh_mobile/model/goal%20model/goal_model.dart';
import 'package:finfresh_mobile/model/schem%20allCategory/scheme_allcategory_model.dart';
import 'package:finfresh_mobile/model/top%20performing%20model/top_performing_mutual_fund.dart';
import 'package:finfresh_mobile/services/refersh%20token/refersh_token.dart';
import 'package:finfresh_mobile/services/scheme%20services/scheme_services.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class TopMFsController extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  int currentIndex = 0;
  void changeCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  int indexForFunds = 0;
  void changeFundindex(int index) {
    indexForFunds = index;
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
        .where((item) =>
            item.schemeAmfi!
                .toLowerCase()
                .contains(queryController.text.toLowerCase()) ||
            item.isinNo!
                .toLowerCase()
                .contains(queryController.text.toLowerCase()))
        .toList();
    logger.d('search result list == $filteredListForAllFunds');
    notifyListeners();
  }

  TopPicksModel? topPicksModel;
  bool lodingList = false;
  Future<void> getTopMfsFRomPeriod(context, String category) async {
    log('calling top mfs');
    filteredListForAllFunds.clear();
    lodingList = true;
    notifyListeners();
    log('categort$category ,retunrs$returntoBackend');

    try {
      topPerformingMutualFundModel = await schemeServices
          .topPerformingMutualFund(context, category, returntoBackend);

      filteredListForAllFunds.addAll(topPerformingMutualFundModel?.list ?? []);
      await topPicks(context);

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

  void callinginInit(context, category) {
    queryController.clear();
    returns = '3 year';
    returntoBackend = '3y';
    getTopMfsFRomPeriod(context, category);
    // getSchemeAllCategory(context);
  }

  bool selectedRadio = false;
  void updateRadioButton(bool value) {
    log('called radiobutton');
    selectedRadio = value;
    notifyListeners();
  }

  GoalsModel? goalsModel;
  RefershTokenService refershTokenService = RefershTokenService();
  Future<void> topPicks(context) async {
    log('toppickscalling');
    try {
      String token = await SecureStorage.readToken('token');
      bool isTokenExpired = JwtDecoder.isExpired(token);
      if (isTokenExpired) {
        await refershTokenService.postRefershTocken(context);
        topPicksModel = await schemeServices.topPicksServices(context);
        goalsModel = await schemeServices.goalsServices(context);
      } else {
        topPicksModel = await schemeServices.topPicksServices(context);
        goalsModel = await schemeServices.goalsServices(context);
      }
    } catch (e) {
      log('failed with an exception$e');
    }
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
    'Nippon India Power %26 Infra Fund-Growth Plan -Growth Option',
  ];
  List<String> isinForSip500 = [
    'INF204K01HY3',
    'INF789F01JN2',
    'INF179K01GF8',
    'INF955L01KH7',
    'INF204K01AE0',
  ];
  List<String> categorySip = [
    'Equity: Small Cap',
    'Index Fund',
    'Equity: Sectoral-Infrastructure',
    'Debt: Credit Risk',
    'Equity: Sectoral-Infrastructure'
  ];
  List<String> sipUnder500Logo = [
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/nippon.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/uti.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/hdfc.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/bnp.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/nippon.png',
  ];

  List<String> finfreshpickslist = [
    'HDFC Defence Fund - Growth Option',
    'Bajaj Finserv Flexi Cap Fund -Regular Plan-Growth',
    'Quant Active Fund-GROWTH OPTION - Regular Plan',
    'Quant Business Cycle Fund - Growth Option - Regular Plan',
    'Union Innovation %26 Opportunities Fund - Regular Plan - Growth Option',
  ];
  List<String> finfreshtoppickCategory = [
    'Equity: Thematic-Others',
    'Equity: Flexi Cap',
    'Equity: Multi Cap',
    'Equity: Thematic-Others',
    "Equity: Thematic-Others",
  ];
  List<String> finffreshtoppicksisin = [
    'INF179KC1GL9',
    'INF0QA701383',
    'INF966L01234',
    'INF966L01BU6',
    'INF582M01JA4'
  ];
  List<String> finfreshpickslistlogo = [
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/hdfc.png',
    '',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/quant.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/quant.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/union.png',
  ];
  List<String> taxsavinginToppicks = [
    "Quant ELSS Tax Saver Fund - Growth Option - Regular Plan",
    'HDFC ELSS Tax saver - Growth Plan',
    'Tata ELSS Tax Saver Fund-Growth-Regular Plan',
    'ITI ELSS Tax Saver Fund - Regular Plan - Growth Option',
    'Taurus ELSS Tax Saver Fund - Regular Plan - Growth',
  ];
  List<String> taxSavingintopPicksCategory = [
    'Equity: ELSS',
    'Equity: ELSS',
    'Equity: ELSS',
    'Equity: ELSS',
    'Equity: ELSS',
  ];
  List<String> taxSavingIsin = [
    'INF966L01135',
    'INF179K01BB8',
    'INF277K01I52',
    'INF00XX01374',
    'INF044D01AC9',
  ];
  List<String> taxSavingIntopPicksLogo = [
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/quant.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/hdfc.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/tata.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/iti.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/taurus.png',
  ];
  List<String> sectorlFundlist = [
    'quant PSU Fund - Growth Option - Regular Plan ',
    'BANK OF INDIA Manufacturing %26 Infrastructure Fund-Growth',
    'BANDHAN TRANSPORTATION AND LOGISTICS FUND - GROWTH - REGULAR PLAN',
    'Tata Resources %26 Energy Fund-Regular Plan-Growth',
    'WhiteOak Capital Banking %26 Financial Services Fund - Regular Growth'
  ];
  List<String> sectorCategory = [
    'Equity: Thematic-Psu',
    'Equity: Sectoral-Infrastructure',
    'Equity: Thematic-Transportation',
    'Equity: Thematic-Energy',
    "Equity: Sectoral-Banking and Financial Services",
  ];
  List<String> sectoralIsin = [
    'INF966L01DQ0',
    'INF761K01199',
    'INF194KB1EE1',
    'INF277K012B6',
    'INF03VN01852',
  ];
  List<String> sectoralLogoList = [
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/quant.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/boi.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/bandhan.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/tata.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/whiteoak.png',
  ];

  List<String> taxsavingInGoals = [
    'WhiteOak Capital ELSS Tax Saver Fund Regular Plan Growth',
    'HSBC Tax Saver Equity Fund - Growth',
    'Kotak ELSS Tax Saver Fund Growth ',
    'Navi ELSS Tax Saver Fund- Regular Plan- Growth Option',
    'Quant ELSS Tax Saver Fund - Growth Option - Regular Plan',
  ];
  List<String> taxsavingInGoalsIsin = [
    'INF03VN01647',
    'INF336L01BA4',
    'INF174K01369',
    'INF959L01CF0',
    'INF966L01135',
  ];
  List<String> taxsavingInGoalsCategory = [
    "Debt: Liquid",
    "Equity: ELSS",
    'Equity: ELSS',
    'Equity: ELSS',
    'Equity: ELSS',
  ];
  List<String> taxSavingingoalsLogo = [
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/whiteoak.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/hsbc.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/kotak.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/navi.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/quant.png',
  ];
  List<String> threeyearList = [
    'Quant Liquid Fund - Growth Option - Regular Plan',
    'Edelweiss Liquid Fund - Regular Plan - Growth Option',
    'Baroda BNP Paribas Credit Risk Fund -Regular-Growth Option ',
    'HDFC Dynamic Debt Fund - Growth Option ',
    'ICICI Prudential All Seasons Bond Fund - Growth',
  ];
  List<String> threrYearIsin = [
    'INF966L01317',
    'INF754K01GZ6',
    'INF955L01FP0',
    'INF179K01848',
    'INF109K01GN9',
  ];
  List<String> threrYearcategory = [
    "Debt: Liquid",
    "Debt: Liquid",
    "Debt: Credit Risk",
    "Debt: Dynamic Bond",
    "Debt: Dynamic Bond",
  ];
  List<String> threeyearLogo = [
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/quant.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/edelweiss.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/bnp.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/hdfc.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/icici.png',
  ];
  List<String> threetofiveyears = [
    "Quant PSU Fund - Growth Option - Regular Plan",
    "Parag Parikh Flexi Cap Fund - Regular Plan - Growth",
    "Mirae Asset Multi Asset Allocation Fund - Regular Plan - Growth",
    // "Mirae Asset Multi Asset Allocation Fund-Regular Plan-Growth",
    "Bank of India Multi Asset Allocation Fund-Regular Plan-Growth",
    'Quant Absolute Fund - Growth Option - Regular Plan',
  ];
  List<String> threeYeartoFinveisin = [
    'INF966L01DQ0',
    'INF879O01019',
    'INF769K01KW3',
    'INF761K01FW0',
    'INF966L01267',
  ];
  List<String> threeYeartoFinveCategory = [
    "Equity: Thematic-PSU",
    "Equity: Flexi Cap",
    "Hybrid: Multi Asset Allocation",
    "Hybrid: Multi Asset Allocation",
    "Hybrid: Aggressive"
  ];
  List<String> threetoFiveyearsLogo = [
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/quant.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/ppfas.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/mirae.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/boi.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/quant.png',
  ];
  List<String> fivePlusYears = [
    "Quant Active Fund-GROWTH OPTION - Regular Plan",
    'Tata India Pharma %26 Healthcare Fund-Regular Plan-Growth',
    'HDFC Housing Opportunities Fund  - Growth Option',
    'Tata Small Cap Fund-Regular Plan-Growth',
    'SBI Consumption Opportunities Fund - Regular - Growth'
  ];
  //Equity: Thematic-Others
  List<String> fivePlusIsin = [
    'INF966L01234',
    'INF277K016A9',
    'INF179KC1AX7',
    'INF277K015O2',
    'INF200K01VR6'
  ];
  List<String> fivePluscategory = [
    "Equity: Multi Cap",
    "Equity: Sectoral-Pharma and Healthcare",
    "Equity: Thematic-Others",
    "Equity: Small Cap",
    "Equity: Thematic-Consumption"
  ];
  List<String> fiveYearLogo = [
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/quant.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/tata.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/hdfc.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/tata.png',
    'https://mfapi.advisorkhoj.com/resources/images/amc-logo-white/sbi.png',
  ];
  List<String> item = ['Tax Savings', '0-3 Years', '3-5 Years', '5+ Years'];
  List<String> imageList = [
    'assets/images/goalimages/taxsaving.jpg',
    'assets/images/goalimages/2.png',
    'assets/images/goalimages/thretofive.jpg',
    'assets/images/goalimages/fiveyears.jpg'
    // 'assets/images/taxsavings.png',
    // 'assets/images/zerotofiveyears.png',
    // 'assets/images/threetofiveyear.png',
    // 'assets/images/fiveyesrs.png'
  ];
  List<Color> colorList = const [
    Color(0xFF5A765E),
    Color(0xFF9688C1),
    Color(0xFF1F8D92),
    Color(0xFF006685)
  ];
}
