import 'dart:developer';

import 'package:finfresh_mobile/model/filter%20model/filter_model.dart';
import 'package:finfresh_mobile/services/filter%20services/fliter_services.dart';
import 'package:finfresh_mobile/services/refersh%20token/refersh_token.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class FilterController extends ChangeNotifier {
  FliterModel? fliterModel;
  FilterService filterService = FilterService();
  int currentIndex = 0;
  void changeindex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  bool sipvalue = false;
  bool lumbsumvalue = false;
  bool compltedvalue = false;
  bool pendingvalue = false;
  bool failedvalue = false;

  void changesipvalue(bool newValue) {
    sipvalue = newValue;
    if (newValue == true) {
      typeList.add('Systematic');
    } else {
      typeList.remove('Systematic');
    }
    notifyListeners();
  }

  void changelumpsumvalue(bool newValue) {
    lumbsumvalue = newValue;
    if (newValue == true) {
      typeList.add('Normal');
    } else {
      typeList.remove('Normal');
    }
    log('list === $typeList');
    notifyListeners();
  }

  void changeCompletedvalue(bool newValue) {
    compltedvalue = newValue;
    if (newValue == true) {
      statusList.add('Processed by RTA');
    } else {
      statusList.remove('Processed by RTA');
    }
    notifyListeners();
  }

  void changependingvalue(bool newValue) {
    pendingvalue = newValue;
    if (newValue == true) {
      statusList.add('Pending');
    } else {
      statusList.remove('Pending');
    }
    notifyListeners();
  }

  void changeFailedvalue(bool newValue) {
    failedvalue = newValue;
    if (newValue == true) {
      statusList.add('Rejected / Reversal');
    } else {
      statusList.remove('Rejected / Reversal');
    }
    notifyListeners();
  }

  List<String> typeList = [];
  List<String> statusList = [];
  List<Result> filteredList = [];
  TextEditingController searchController = TextEditingController();

  RefershTokenService refershTokenService = RefershTokenService();
  bool filterPageLoading = false;
  bool isFetched = false;
  Future<void> getfilter(context) async {
    filteredList.clear();
    filterPageLoading = true;
    notifyListeners();
    try {
      String token = await SecureStorage.readToken('token');
      bool isTokenExpired = JwtDecoder.isExpired(token);
      if (isTokenExpired) {
        await refershTokenService.postRefershTocken(context);
        fliterModel =
            await filterService.fetchFilterdata(typeList, statusList, context);
        filteredList = fliterModel?.result?.reversed.toList() ?? [];
        log('filtere list =$filteredList');
        filterPageLoading = false;
        isFetched = true;
        notifyListeners();
      } else {
        fliterModel =
            await filterService.fetchFilterdata(typeList, statusList, context);
        filteredList = fliterModel?.result?.reversed.toList() ?? [];
        log('filtere list =${filteredList.toList()}');
        filterPageLoading = false;
        isFetched = true;
        notifyListeners();
      }
    } catch (e) {
      log('failed with an exception$e');
      filterPageLoading = false;
      notifyListeners();
    }
  }

  void searchItems() {
    // searchResults.addAll(vendourList.vendourModel.result!.company!)
    logger.d('search function called ');

    filteredList = fliterModel!.result!
        .where((item) => item.schemeName!
            .toLowerCase()
            .contains(searchController.text.toLowerCase()))
        .toList();
    logger.d('search result list == $filteredList');
    notifyListeners();
  }

  void resetFilter() {
    typeList.clear();
    statusList.clear();
    sipvalue = false;
    lumbsumvalue = false;
    compltedvalue = false;
    pendingvalue = false;
    failedvalue = false;
    searchController.clear();
  }
}
