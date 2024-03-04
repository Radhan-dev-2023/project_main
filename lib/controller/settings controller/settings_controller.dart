import 'package:finfresh_mobile/model/account%20type%20model/account_type_model.dart';
import 'package:flutter/cupertino.dart';

class SettingsController extends ChangeNotifier {
  MasterAccountDetail? accountype;
  String? accountypeToBackend;
  void updateAccountType(value) {
    accountype = value;
    accountypeToBackend = accountype?.accType;
    notifyListeners();
  }
}
