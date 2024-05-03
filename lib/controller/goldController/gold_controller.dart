import 'dart:ffi';

import 'package:finfresh_mobile/services/get%20gold%20rate/get_gold_rate.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoldController extends ChangeNotifier {
  DigiGoldService service = DigiGoldService();
  TextEditingController goldRateController = TextEditingController();
  bool loading = false;
  Future<bool> addGoldRate(context) async {
    loading = true;
    notifyListeners();
    try {
      bool result =
          await service.addDigiGoldRate(context, goldRateController.text);
      if (result == true) {
        loading = false;
        notifyListeners();
        return true;
      } else {
        loading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      logger.d('add gold failed with an exception$e');
      loading = false;
      notifyListeners();
      return false;
    }
  }

  double? goldvalue;
  bool isloading = false;
  Future<void> getGoldrate(context) async {
    isloading = true;
    notifyListeners();
    try {
      goldvalue = await service.getDigiGoldRate(context);
      notifyListeners();
      isloading = false;
      notifyListeners();
    } catch (e) {
      logger.d('get gold rate failed with an eception$e');
      isloading = false;
      notifyListeners();
    }
  }
}
