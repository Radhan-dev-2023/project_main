import 'package:finfresh_mobile/services/ach%20service/ach_service.dart';
import 'package:finfresh_mobile/services/refersh%20token/refersh_token.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AchController extends ChangeNotifier {
  RefershTokenService refershTokenService = RefershTokenService();
  AchService achService = AchService();
  final GlobalKey<FormState> formkeyForAch = GlobalKey<FormState>();
  TextEditingController microController = TextEditingController();
  TextEditingController fromdateController = TextEditingController();
  TextEditingController todateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  String? cancelvalue;
  String? processmodevalue;
  String? channelvalue;
  String cancelvaluuetobakend = '';
  String processvalueTobackend = '';
  String channelValuetoBackend = '';

  List<String> cancellist = ['Yes', 'No'];
  List<String> processmode = ['Physical', 'eMandate'];
  List<String> channel = ['Addhar', 'Netbanking', 'Debit card'];

  void updateCancelValue(String newValue) {
    cancelvalue = newValue;
    notifyListeners();
    if (cancelvalue == 'Yes') {
      cancelvaluuetobakend = 'Y';
    } else {
      cancelvaluuetobakend = 'N';
    }
  }

  void updateProcessMode(String newValue) {
    processmodevalue = newValue;
    notifyListeners();

    if (processmodevalue == 'Physical') {
      processvalueTobackend = "P";
    } else {
      processvalueTobackend = "E";
    }
  }

  void updateChannelType(String newValue) {
    channelvalue = newValue;
    notifyListeners();
    if (channelvalue == 'Addhar') {
      channelValuetoBackend = 'AA';
    } else if (channelvalue == 'Netbanking') {
      channelValuetoBackend = 'NET';
    } else {
      channelValuetoBackend = 'DC';
    }
  }

  bool visibilty = true;
  bool loadingAch = false;
  Future<bool> registerAch(context, bool dash) async {
    DateTime currentDate = DateTime.now();
    String selectdate = DateFormat('dd-MMM-yyyy').format(currentDate);
    loadingAch = true;
    notifyListeners();
    String token = await SecureStorage.readToken('token');
    bool isTokenExpired = JwtDecoder.isExpired(token);
    try {
      if (isTokenExpired) {
        await refershTokenService.postRefershTocken(context);
        bool result = await achService.achMadateRegister(
          microController.text,
          cancelvaluuetobakend,
          dash == false ? selectdate : fromdateController.text,
          todateController.text,
          amountController.text,
          processvalueTobackend,
          channelValuetoBackend,
          context,
          dash,
        );
        if (result == true) {
          loadingAch = false;
          visibilty = false;
          notifyListeners();
          return true;
        } else {
          loadingAch = false;

          notifyListeners();
          return false;
        }
      } else {
        bool result = await achService.achMadateRegister(
          microController.text,
          cancelvaluuetobakend,
          dash == false ? selectdate : fromdateController.text,
          todateController.text,
          amountController.text,
          processvalueTobackend,
          channelValuetoBackend,
          context,
          dash,
        );
        if (result == true) {
          loadingAch = false;
          visibilty = false;
          notifyListeners();
          return true;
        } else {
          loadingAch = false;
          notifyListeners();
          return false;
        }
      }
    } catch (e) {
      logger.d('failed with an exception$e');
      loadingAch = false;
      notifyListeners();
      return false;
    }
  }

  void clearValue() {
    microController.text;
    channelvalue = null;
    cancelvalue = null;
    amountController.clear();
    processmodevalue = null;
    fromdateController.clear();
    todateController.clear();
  }
}
