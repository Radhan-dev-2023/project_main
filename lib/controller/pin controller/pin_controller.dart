import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:flutter/material.dart';

class PinController extends ChangeNotifier {
  bool iscliked = false;

  TextEditingController pinController = TextEditingController();
  TextEditingController confirmPinController = TextEditingController();
  final GlobalKey<FormState> formKeyForPin = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyForConfirmPin = GlobalKey<FormState>();
  String pin = '';
  Future<void> setPin() async {
    await SecureStorage.addingvaluesToStorage('pin', confirmPinController.text);
  }

  Future<void> setFringer(String value) async {
    await SecureStorage.addingvaluesToStorage('fringer', value);
  }
  Future<String> getfringerAccept() async {
    String pin = await SecureStorage.readToken('fringer');
    return pin;
  }
}
