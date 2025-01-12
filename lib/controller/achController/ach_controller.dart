import 'package:finfresh_mobile/model/ach%20history%20model/ach_history_model.dart';
import 'package:finfresh_mobile/services/ach%20history/getting_ach_history.dart';
import 'package:finfresh_mobile/services/ach%20service/ach_service.dart';
import 'package:finfresh_mobile/services/refersh%20token/refersh_token.dart';
import 'package:finfresh_mobile/utilities/constant/flushbar.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AchController extends ChangeNotifier {
  RefershTokenService refershTokenService = RefershTokenService();
  AchHistoryService achHistoryService = AchHistoryService();
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
  bool clickchangeButton = false;

  void changeClickButton() {
    channelvalue = null;
    channelValuetoBackend = '';
    clickchangeButton = !clickchangeButton;
    notifyListeners();
  }

  void updateCancelValue(String newValue) {
    cancelvalue = newValue;
    notifyListeners();
    if (cancelvalue == 'Yes') {
      cancelvaluuetobakend = 'Y';
    } else {
      cancelvaluuetobakend = 'N';
    }
  }

  void achTodate() {
    todateController.text = '31-Dec-2999';
    notifyListeners();
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

  void itialdataForFeilds() {
    DateTime now = DateTime.now();

    // Format the date as 'DD-MMM-YYYY'

    fromdateController.text = DateFormat('dd-MMM-yyyy').format(now);
    todateController.text = '31-Dec-2999';
    updateCancelValue("Yes");
    amountController.text = '100000';
    updateProcessMode('eMandate');
  }

  bool visibilty = true;
  bool loadingAch = false;
  String result = '';
  Future<bool> registerAch(context, bool dash) async {
    DateTime currentDate = DateTime.now();
    String selectdate = DateFormat('dd-MMM-yyyy').format(currentDate);
    loadingAch = true;
    notifyListeners();
    try {
      String token = await SecureStorage.readToken('token');
      bool isTokenExpired = JwtDecoder.isExpired(token);
      if (isTokenExpired) {
        await refershTokenService.postRefershTocken(context);
        result = await achService.achMadateRegister(
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
        if (result.isNotEmpty) {
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
        result = await achService.achMadateRegister(
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
        if (result.isNotEmpty) {
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

  AchHistoryModel? achHistoryModel;
  bool historyLoading = false;
  Future<void> getAchHistoy(context, String status) async {
    historyLoading = true;
    notifyListeners();

    try {
      String token = await SecureStorage.readToken('token');
      bool isTokenExpired = JwtDecoder.isExpired(token);
      if (isTokenExpired) {
        await refershTokenService.postRefershTocken(context);
        achHistoryModel =
            await achHistoryService.getAchHistory(context, status);
        if (achHistoryModel != null) {
          historyLoading = false;
          notifyListeners();
        } else {
          historyLoading = false;
          notifyListeners();
        }
      } else {
        achHistoryModel =
            await achHistoryService.getAchHistory(context, status);
        if (achHistoryModel != null) {
          historyLoading = false;
          notifyListeners();
        } else {
          historyLoading = false;
          notifyListeners();
        }
      }
    } catch (e) {
      logger.d('Ach history failed with an exception$e');
      historyLoading = false;
      notifyListeners();
    }
  }

  bool allvalue = false;
  bool pendinginhistory = false;
  bool acceptesvalue = false;
  bool rejected = false;
  void changeAllvalue(bool newValue) {
    allvalue = newValue;
    rejected = false;
    acceptesvalue = false;
    notifyListeners();
  }

  void changependingvalue(bool newValue) {
    pendinginhistory = newValue;

    notifyListeners();
  }

  void changeacceptedvalue(bool newValue) {
    acceptesvalue = newValue;
    rejected = false;
    allvalue = false;
    notifyListeners();
  }

  void changeFailedvalue(bool newValue) {
    rejected = newValue;
    allvalue = false;
    acceptesvalue = false;

    notifyListeners();
  }

  void callAchHistory(context) {
    if (acceptesvalue == true) {
      getAchHistoy(context, 'A');
    } else if (rejected == true) {
      getAchHistoy(context, 'R');
    } else if (allvalue == true) {
      getAchHistoy(context, '');
    } else {
      showFlushbar(context, 'Please select one ');
    }
  }

  void resetFilter() {
    allvalue = false;
    rejected = false;
    acceptesvalue = false;
  }
}
