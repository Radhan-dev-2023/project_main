import 'dart:developer';

import 'package:finfresh_mobile/model/gold%20listing%20model/gold_liting_model.dart';
import 'package:finfresh_mobile/model/gold%20sell%20listing%20model/gold_sell_listing_model.dart';
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
  TextEditingController sellgoldrateController = TextEditingController();
  bool loading = false;
  String? selectvalue;
  void updateselectValue(String value) {
    selectvalue = value;
    notifyListeners();
  }

  List<String> listForAddingRate = ['purchase', 'sell'];
  Future<bool> addGoldRate(context) async {
    loading = true;
    notifyListeners();
    try {
      String token = await SecureStorage.readToken('token');
      bool isTokenExpired = JwtDecoder.isExpired(token);
      if (isTokenExpired) {
        await refershTokenService.postRefershTocken(context);
        bool result = await service.addDigiGoldRate(
          context,
          goldRateController.text,
          selectvalue ?? '',
        );
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
        bool result = await service.addDigiGoldRate(
          context,
          goldRateController.text,
          selectvalue ?? '',
        );
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

  dynamic sellrate;

  String formattedValue = '';
  RefershTokenService refershTokenService = RefershTokenService();
  dynamic goldvalue;
  bool isloading = false;
  // Future<void> getGoldSellrate(context) async {
  //   String token = await SecureStorage.readToken('token');
  //   bool isTokenExpired = JwtDecoder.isExpired(token);

  //   try {
  //     if (isTokenExpired) {
  //       await refershTokenService.postRefershTocken(context);
  //       sellrate = await service.getsellGoldRate(context);

  //       notifyListeners();
  //     } else {
  //       sellrate = await service.getsellGoldRate(context);

  //       notifyListeners();
  //     }
  //   } catch (e) {
  //     logger.d('get gold rate failed with an eception$e');
  //   }
  // }

  Future<void> getGoldrate(context) async {
    isloading = true;
    // notifyListeners();
    try {
      String token = await SecureStorage.readToken('token');
      bool isTokenExpired = JwtDecoder.isExpired(token);
      if (isTokenExpired) {
        await refershTokenService.postRefershTocken(context);
        goldvalue = await service.getDigiGoldRate(context);
        sellrate = await service.getsellGoldRate(context);
        await goldListing(context);

        dynamic value = goldlistingmodel?.res?.total * sellrate;
        formattedValue = '₹ ${value.toStringAsFixed(2)}';

        notifyListeners();
        isloading = false;
        notifyListeners();
      } else {
        goldvalue = await service.getDigiGoldRate(context);
        sellrate = await service.getsellGoldRate(context);
        await goldListing(context);
        dynamic value = goldlistingmodel?.res?.total * sellrate;
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
  bool buttonEnable = false;
  double? goldMg;
  void calculate() async {
    try {
      // Check if goldRateController.text is not empty
      if (buygoldrateController.text.isEmpty) {
        throw Exception("Gold rate input is empty");
      }

      // Parse gold rate from text field
      double purchaseRate = double.parse(buygoldrateController.text);
      double amountAfterTax = (purchaseRate * 100) / (100 + 3);

      // Check if gold value is not zero
      if (goldvalue == 0) {
        throw Exception("Gold value is zero");
      }

      // Calculate gold in milligrams
      goldMg = amountAfterTax / goldvalue!;
      // goldMg = purchaseRate / goldvalue!;
      SecureStorage.addToken('goldMg', goldMg!.toStringAsFixed(2));
      SecureStorage.addToken('paymentCompleted', 'true');
      // Log the calculated gold value
      log('Gold in milligrams: $goldMg');

      // Notify listeners if there are any
      buttonEnable = true;
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
  double calculateAmountAfterTax(dynamic amount) {
    // Calculate the tax amount (3% of the original amount)

    double amountAfterTax = (double.parse(amount) * 100) / (100 + 3);
    // double taxAmount = double.parse(amount) * 0.03;

    // // Subtract the tax amount from the original amount
    // double amountAfterTax = double.parse(amount) - taxAmount;

    return amountAfterTax;
  }

  double calculateAmountOfTax(dynamic amount) {
    // Calculate the tax amount (3% of the original amount)
    double taxAmount = (double.parse(amount) * 3) / (100 + 3);
    // double taxAmount = double.parse(amount) * 0.03;

    // // Subtract the tax amount from the original amount
    // double amountAfterTax = double.parse(amount) - taxAmount;

    return taxAmount;
  }

  Future<bool> goldTrasaction(dynamic response, context) async {
    log('calling');
    log('$goldvalue  ,$goldMg');
    try {
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
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  GolListingModel? goldlistingmodel;
  Future<void> goldListing(context) async {
    try {
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
    } catch (e) {
      log('failed with exception$e');
    }
  }

  dynamic soldAmount;
  void calculateSellAmount() {
    soldAmount = double.parse(sellgoldrateController.text) * sellrate;
    log(soldAmount.toString());
    notifyListeners();
  }

  bool selbuttonClicked = false;
  Future<bool> sellGold(context, String name, String phoneNumber) async {
      selbuttonClicked = true;
      notifyListeners();
    try {

      String token = await SecureStorage.readToken('token');
      bool isTokenExpired = JwtDecoder.isExpired(token);

      if (isTokenExpired) {
        await refershTokenService.postRefershTocken(context);
        bool value = await service.sellGold(
          context,
          sellrate,
          sellgoldrateController.text,
          soldAmount,
          name,
          phoneNumber,
        );
        selbuttonClicked = false;
        notifyListeners();
        return value == true ? true : false;
      } else {
        bool value = await service.sellGold(
          context,
          sellrate,
          sellgoldrateController.text,
          soldAmount,
          name,
          phoneNumber,
        );

        selbuttonClicked = false;
        notifyListeners();

        return value == true ? true : false;
      }
    } catch (e) {
      // Handle exceptions here (e.g., show a message to the user, log the error, etc.)
      log('Error occurred while selling gold: $e');

      selbuttonClicked = false;
      notifyListeners();

      return false;
    }
  }

  GoldSellListingModel? sellGoldListingModel;
  bool sellListingLoading = false;
  Future<void> getSellGoldListing(context) async {
    sellListingLoading = true;
    notifyListeners();
    try {
      String token = await SecureStorage.readToken('token');
      bool isTokenExpired = JwtDecoder.isExpired(token);
      if (isTokenExpired) {
        await refershTokenService.postRefershTocken(context);
        sellGoldListingModel = await service.getSellGoldList(context);

        notifyListeners();
        sellListingLoading = false;
        notifyListeners();
      } else {
        sellGoldListingModel = await service.getSellGoldList(context);
        notifyListeners();
        sellListingLoading = false;
        notifyListeners();
      }
    } catch (e) {
      logger.d('get gold rate failed with an eception$e');
      sellListingLoading = false;
      notifyListeners();
    }
  }
}
