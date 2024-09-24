import 'dart:developer';
import 'dart:io';
import 'package:finfresh_mobile/model/status%20check%20model/status_check_model.dart';
import 'package:finfresh_mobile/services/refersh%20token/refersh_token.dart';
import 'package:finfresh_mobile/utilities/constant/flushbar.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../services/expense services/expense_services.dart';

class ExpenseSummaryController extends ChangeNotifier {
  RefershTokenService refershTokenService = RefershTokenService();
  ExpenseServices expenseServices = ExpenseServices();
  DateTime? selectedMonth;
  String formattMonth = ''; // Holds the currently selected month
  int? selectedYear;
  String? _txn_id;
  bool _isReportLoading = false;

  bool get isReportLoading => _isReportLoading;
  String? get txn_id => _txn_id;
  void monthAsign() {
    selectedYear = DateTime.now().year;
    selectedMonth = DateTime.now();
    log('calling month assing');
    formattMonth = DateFormat('MMM yy').format(selectedMonth!);
  }

  List<String> sortList = ['Current', 'High to Low', 'Low to High'];
  String intialStringforRadio = 'High to Low';
  void changeValue(value) {
    selectedMonth = value; // Set the selected month
    formattMonth = DateFormat('MMM yy').format(selectedMonth!);
    log('Selected Month: $formattMonth');
    notifyListeners();
  }

  void changeofSort(value) {
    intialStringforRadio = value; // Set the selected month

    notifyListeners();
  }

  bool isLoading = false;
  String? retreiveUrl;
  Future<String?> generateUrl(context) async {
    log('calling');
    isLoading = true;
    // notifyListeners();
    try {
      String token = await SecureStorage.readToken('token');
      bool isTokenExpired = JwtDecoder.isExpired(token);
      if (isTokenExpired) {
        await refershTokenService.postRefershTocken(context);
        retreiveUrl = await expenseServices.generateUrl(context);
        isLoading = false;
        notifyListeners();
        return retreiveUrl;
      } else {
        retreiveUrl = await expenseServices.generateUrl(context);
        isLoading = false;
        notifyListeners();
        return retreiveUrl;
      }
    } catch (e) {
      logger.d('Get bank list failed with an exception$e');
      isLoading = false;
      notifyListeners();
      return null;
    }
  }

  StatusCheck? statusCheck;

  bool issloading = false;
  Future<void> fetchStatusCheck(context) async {
    // if (reqId == null) return;

    issloading = true;

    notifyListeners();

    try {
      String token = await SecureStorage.readToken('token');
      bool isTokenExpired = JwtDecoder.isExpired(token);
      if (isTokenExpired) {
        await refershTokenService.postRefershTocken(context);
        statusCheck = await expenseServices.fetchStatusCheck(context);

        if (statusCheck?.success == true &&
            statusCheck?.status?.txnStatus?.first.code ==
                'ReportGenerated' /*statusCheck[0].status?.txnStatus?[0].code == "ReportGenerated"*/) {
          //  if(statusCheck.isNotEmpty&&statusCheck[0].status?.txnStatus?[0].code=="ReportGenerated"){

          print(
              "Status Check txn_id: ${statusCheck?.status?.txnStatus?.first.txnId ?? ''}");

          _txn_id = statusCheck?.status?.txnStatus?.first.txnId ?? '';
          // final txnId = statusResponseData['responseData']['txn_id'];
          await retrieveReportAPI(context);
          issloading = false;
          notifyListeners();
        }

        /* if(statusCheck.isNotEmpty&&statusCheck[0].status?.txnStatus?[0].code=="ReportGenerated")*/
        //final statusResponseData = jsonDecode(response.body);
      } else {
        statusCheck = await expenseServices.fetchStatusCheck(context);

        if (statusCheck?.success == true &&
            statusCheck?.status?.txnStatus?.first.code ==
                'ReportGenerated' /*statusCheck[0].status?.txnStatus?[0].code == "ReportGenerated"*/) {
          //  if(statusCheck.isNotEmpty&&statusCheck[0].status?.txnStatus?[0].code=="ReportGenerated"){

          print(
              "Status Check txn_id: ${statusCheck?.status?.txnStatus?.first.txnId ?? ''}");

          _txn_id = statusCheck?.status?.txnStatus?.first.txnId ?? '';
          // final txnId = statusResponseData['responseData']['txn_id'];
          await retrieveReportAPI(context);
          issloading = false;
          notifyListeners();
        }
      }
    } on SocketException catch (_) {
      showFlushbar(context, 'Network error: Unable to connect to the server.');
      issloading = false;
      notifyListeners();
    } on FormatException catch (_) {
      showFlushbar(
          context, 'Format Execption:Unable to connect to the server.');
      issloading = false;
      notifyListeners();
    } on PlatformException catch (_) {
      showFlushbar(context, 'PlatformException :Please Check the Permissions.');
      issloading = false;
      notifyListeners();
    } catch (error) {
      showFlushbar(context, 'Status Check Exception: $error');
      issloading = false;
      notifyListeners();
    } finally {
      issloading = false;
      notifyListeners();
    }
  }

  Future<void> retrieveReportAPI(context) async {
    _isReportLoading = true;
    // ReportDataHiveModel reportDataModel = ReportDataHiveModel();
    notifyListeners();

    try {
      String token = await SecureStorage.readToken('token');
      bool isTokenExpired = JwtDecoder.isExpired(token);
      if (isTokenExpired) {
        await refershTokenService.postRefershTocken(context);
        expenseServices.retrieveReportAPI(context);
      } else {
        expenseServices.retrieveReportAPI(context);
      }
    } on SocketException catch (_) {
      showFlushbar(context, 'Network error: Unable to connect to the server.');
    } on FormatException catch (_) {
      showFlushbar(
          context, 'Format Execption:Unable to connect to the server.');
    } on PlatformException catch (_) {
      showFlushbar(context, 'PlatformException :Please Check the Permissions.');
    } catch (error) {
      showFlushbar(context, 'Report Retrieval Exception: $error');
    } finally {
      _isReportLoading = false;
      notifyListeners();
    }
  }
}
