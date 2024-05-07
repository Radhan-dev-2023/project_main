import 'dart:ffi';

import 'package:finfresh_mobile/services/get%20gold%20rate/get_gold_rate.dart';
import 'package:finfresh_mobile/services/refersh%20token/refersh_token.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class GoldController extends ChangeNotifier {
  DigiGoldService service = DigiGoldService();
  TextEditingController goldRateController = TextEditingController();
  bool loading = false;
  Future<bool> addGoldRate(context) async {
    String token = await SecureStorage.readToken('token');
    bool isTokenExpired = JwtDecoder.isExpired(token);
    loading = true;
    notifyListeners();
    try {
      if (isTokenExpired) {
        await refershTokenService.postRefershTocken(context);
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
      } else {
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
      }
    } catch (e) {
      logger.d('add gold failed with an exception$e');
      loading = false;
      notifyListeners();
      return false;
    }
  }

  RefershTokenService refershTokenService = RefershTokenService();
  double? goldvalue;
  bool isloading = false;
  Future<void> getGoldrate(context) async {
    String token = await SecureStorage.readToken('token');
    bool isTokenExpired = JwtDecoder.isExpired(token);
    isloading = true;
    // notifyListeners();
    try {
      if (isTokenExpired) {
        await refershTokenService.postRefershTocken(context);
        goldvalue = await service.getDigiGoldRate(context);
        notifyListeners();
        isloading = false;
        notifyListeners();
      } else {
        goldvalue = await service.getDigiGoldRate(context);
        notifyListeners();
        isloading = false;
        notifyListeners();
      }
    } catch (e) {
      logger.d('get gold rate failed with an eception$e');
      isloading = false;
      notifyListeners();
    }
  }
}
