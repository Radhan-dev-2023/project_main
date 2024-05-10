import 'dart:developer';
import 'dart:ffi';

import 'package:finfresh_mobile/model/gold%20listing%20model/gold_liting_model.dart';
import 'package:finfresh_mobile/services/get%20gold%20rate/get_gold_rate.dart';
import 'package:finfresh_mobile/services/gold%20save%20transaction/save_gold_transaction.dart';
import 'package:finfresh_mobile/services/refersh%20token/refersh_token.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:uuid/uuid.dart';

class GoldController extends ChangeNotifier {
  GoldSaveTransactionService goldSaveTransaction = GoldSaveTransactionService();
  DigiGoldService service = DigiGoldService();
  TextEditingController goldRateController = TextEditingController();
  TextEditingController buygoldrateController = TextEditingController();
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

  String formattedValue = '';
  RefershTokenService refershTokenService = RefershTokenService();
  dynamic goldvalue;
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

        await goldListing(context);

        dynamic value = goldlistingmodel?.res?.total * goldvalue;
        formattedValue = '₹ ${value.toStringAsFixed(2)}';

        notifyListeners();
        isloading = false;
        notifyListeners();
      } else {
        goldvalue = await service.getDigiGoldRate(context);
        await goldListing(context);
        dynamic value = goldlistingmodel?.res?.total * goldvalue;
        formattedValue = '₹ ${value.toStringAsFixed(2)}';
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

  String transactionid = '';
  void generateSSID() {
    var uuid = Uuid();
    String ssid = uuid.v4().replaceAll('-', '');
    // Truncate to 25 characters
    ssid = ssid.substring(0, 25);
    transactionid = ssid; // Generates a version 4 (random) UUID
    log('transactionid $transactionid');
    notifyListeners();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double? goldMg;
  void calculate() async {
    try {
      // Check if goldRateController.text is not empty
      if (buygoldrateController.text.isEmpty) {
        throw Exception("Gold rate input is empty");
      }

      // Parse gold rate from text field
      double purchaseRate = double.parse(buygoldrateController.text);

      // Check if gold value is not zero
      if (goldvalue == 0) {
        throw Exception("Gold value is zero");
      }

      // Calculate gold in milligrams
      goldMg = purchaseRate / goldvalue!;
      SecureStorage.addToken('goldMg', goldMg.toString());
      SecureStorage.addToken('paymentCompleted', 'true');
      // Log the calculated gold value
      log('Gold in milligrams: $goldMg');

      // Notify listeners if there are any
      notifyListeners();
    } catch (e) {
      // Handle any errors
      log('Error occurred in calculate(): $e');
    }
  }

  String isCompletedGoldPurchase = '';
  void isCompleted() async {
    isCompletedGoldPurchase = await SecureStorage.readToken('paymentCompleted');

    notifyListeners();
  }

  dynamic totalAmount;
  void calulateWithGstAmount() {
    String purchaseamount = buygoldrateController.text;
    dynamic tax = int.parse(purchaseamount) * 0.03;
    totalAmount = int.parse(purchaseamount) + tax;
    notifyListeners();
  }

  dynamic currentValueofGold;
  void currentValue() async {
    String goldMg = await SecureStorage.readToken('goldMg');
    if (goldvalue != null) {
      currentValueofGold = double.parse(goldMg) * goldvalue!;
    }
    // currentValueofGold = goldMg! * goldvalue!;
    // log('current gold $currentValueofGold');
    notifyListeners();
  }

  int sum = 0;
  int calculateAmountAfterTax(dynamic amount) {
    // Calculate the tax amount (3% of the original amount)
    double taxAmount = double.parse(amount) * 0.03;

    // Subtract the tax amount from the original amount
    double amountAfterTax = double.parse(amount) - taxAmount;

    return amountAfterTax.ceil();
  }

  Future<bool> goldTrasaction(dynamic response, context) async {
    log('calling');
    log('$goldvalue  ,$goldMg');
    String token = await SecureStorage.readToken('token');
    bool isTokenExpired = JwtDecoder.isExpired(token);
    if (isTokenExpired) {
      await refershTokenService.postRefershTocken(context);
      bool result = await goldSaveTransaction.saveTransactionForgold(
        goldvalue!,
        goldMg!,
        response,
        context,
      );
      if (result == true) {
        return true;
      } else {
        return false;
      }
    } else {
      bool result = await goldSaveTransaction.saveTransactionForgold(
        goldvalue!,
        goldMg!,
        response,
        context,
      );
      if (result == true) {
        return true;
      } else {
        return false;
      }
    }
  }

  GolListingModel? goldlistingmodel;
  Future<void> goldListing(context) async {
    String token = await SecureStorage.readToken('token');
    bool isTokenExpired = JwtDecoder.isExpired(token);
    if (isTokenExpired) {
      await refershTokenService.postRefershTocken(context);
      goldlistingmodel = await goldSaveTransaction.getGoldList(context);

      notifyListeners();
    } else {
      goldlistingmodel = await goldSaveTransaction.getGoldList(context);
      notifyListeners();
    }
  }
}
