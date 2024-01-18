import 'dart:developer';

import 'package:finfresh_mobile/db/functions/db_functions.dart';
import 'package:finfresh_mobile/db/model/investors_data_model.dart';
import 'package:finfresh_mobile/services/auth%20services/user%20register/user_register_service.dart';
import 'package:finfresh_mobile/services/auth%20services/verify%20otp%20service/verify_otp_service.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AuthController extends ChangeNotifier {
  bool iscliked = false;
  bool loginClicked = false;
  bool otploading = false;
  bool otploadingforlogin = false;
  DbFunctions dbFunctions = DbFunctions();

  UserRegisterService userRegisterService = UserRegisterService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  final GlobalKey<FormState> formKeyforlogin = GlobalKey<FormState>();
  TextEditingController phonenumberControllerforlogin = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyForPhone = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyForPassword = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyForPinput = GlobalKey<FormState>();
  Future<bool> userRegister(context) async {
    SecureStorage.addToken('phoneNumber', phonenumberController.text);

    iscliked = true;
    notifyListeners();
    bool isRegistered = await userRegisterService.userRegister(
        context, phonenumberController.text, emailController.text);
    iscliked = false;
    notifyListeners();
    return isRegistered;
  }

  Future<bool> generateOtp(context) async {
    SecureStorage.addToken('phoneNumber', phonenumberControllerforlogin.text);
    try {
      loginClicked = true;
      notifyListeners();
      bool result = await userRegisterService.generateOtp(
          phonenumberControllerforlogin.text, context);
      log('result ===$result');
      if (result == true) {
        loginClicked = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      logger.d('failed with an exception$e');
      loginClicked = false;
      notifyListeners();
      return false;
    }
    loginClicked = false;
    notifyListeners();
    return false;
  }

  Future<bool> otpVerfy(context) async {
    logger.d('otpcontroller.text ===${otpController.text}');
    otploading = true;
    notifyListeners();
    bool result = VerifyOtp.dummyverifyOtp(otpController.text);
    if (result == true) {
      bool isVerified = await VerifyOtp.verifyOtp(
          phonenumberController.text, otpController.text, context);
      otploading = false;
      notifyListeners();
      return isVerified;
    }
    otploading = false;
    notifyListeners();
    return false;
  }

  Future<bool> otpVerifyForLogin(context) async {
    logger.d('otpcontroller.text ===${otpController.text}');
    otploadingforlogin = true;
    notifyListeners();
    bool result = VerifyOtp.dummyverifyOtp(otpController.text);
    if (result == true) {
      bool isVerified = await VerifyOtp.verifyOtp(
          phonenumberControllerforlogin.text, otpController.text, context);
      otploadingforlogin = false;
      notifyListeners();
      return isVerified;
    }
    otploadingforlogin = false;
    notifyListeners();
    return false;
  }

  void clearTheControllerValue() {
    emailController.clear();
    phonenumberController.clear();
    phonenumberControllerforlogin.clear();
    otpController.clear();
  }

  void addEmail() {
    InvestorModel investorModel = InvestorModel(email: emailController.text);

    dbFunctions.addTodb(investorModel);
  }

  void addPhonenumber() async {
    final investorDb = await Hive.openBox<InvestorModel>('investor_db');
    final retrievedValue = investorDb.get('email');
    log('mail ===${retrievedValue?.email}');
    InvestorModel investorModel = InvestorModel(
      email: retrievedValue?.email,
      mobileNo: phonenumberController.text,
    );

    dbFunctions.addTodb(investorModel);
  }
}
