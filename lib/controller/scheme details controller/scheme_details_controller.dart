import 'package:finfresh_mobile/model/historical%20nav%20model/historical_nav_model.dart';
import 'package:finfresh_mobile/model/scheme%20model/scehem_information_model.dart';
import 'package:finfresh_mobile/services/scheme%20services/scheme_services.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:flutter/material.dart';

class SchemeDetailsController extends ChangeNotifier {
  SchemeServices schemeService = SchemeServices();
  SchemeInfoModel? schemeInfoModel;
  HistoricalNavModel? historicalNavModel;
  bool detailScreenLoading = false;
  List<dynamic> holding = [];
  List<dynamic> value = [];
  bool changebutton = false;
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
    // notifyListeners();
    try {
      historicalNavModel = await schemeService.historicalNav(
        schemeInfoModel!.schemeInceptionDate!,
        context,
        scheme,
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
