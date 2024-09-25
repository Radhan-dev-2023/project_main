import 'dart:developer';
import 'dart:io';
import 'package:finfresh_mobile/model/report%20summary%20model/report_summary_model.dart';
import 'package:finfresh_mobile/model/status%20check%20model/status_check_model.dart';
import 'package:finfresh_mobile/services/refersh%20token/refersh_token.dart';
import 'package:finfresh_mobile/utilities/constant/flushbar.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  bool _isfetched = false;
  bool get isfetched => _isfetched;
  double totalincome = 0.0;
  double totalExpense = 0.0;
  double totalTransactions = 0.0;
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
    log('tapped sort ------>>> $value');
    intialStringforRadio = value; // Set the selected month
    if (value == 'High to Low') {
      listofMonths.sort((a, b) => b.amount.compareTo(a.amount));
      notifyListeners();
    } else if (value == 'Low to High') {
      listofMonths.sort((a, b) => a.amount.compareTo(b.amount));
      notifyListeners();
    } else if (value == 'Current') {
      listofMonths.sort(
          (a, b) => b.transactionTimestamp.compareTo(a.transactionTimestamp));
      notifyListeners();
    }
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
  Future<bool> fetchStatusCheck(context) async {
    // if (reqId == null) return;

    issloading = true;

    notifyListeners();

    try {
      String token = await SecureStorage.readToken('token');
      bool isTokenExpired = JwtDecoder.isExpired(token);
      if (isTokenExpired) {
        await refershTokenService.postRefershTocken(context);
        statusCheck = await expenseServices.fetchStatusCheck(context);
        log('staatus checkkstaus ===${statusCheck?.status}');
        if (statusCheck?.success == true) {
          print(
              "Status Check txn_id: ${statusCheck?.status?.txnStatus?.first.txnId ?? ''}");

          _txn_id = statusCheck?.status?.txnStatus?.first.txnId ?? '';
          // final txnId = statusResponseData['responseData']['txn_id'];
          await retrieveReportAPI(context);
          issloading = false;
          notifyListeners();
          return true;
        } else {
          log('status check ===${statusCheck?.status}');
          return false;
        }

        /* if(statusCheck.isNotEmpty&&statusCheck[0].status?.txnStatus?[0].code=="ReportGenerated")*/
        //final statusResponseData = jsonDecode(response.body);
      } else {
        statusCheck = await expenseServices.fetchStatusCheck(context);
        log('staatus checkkstaus ===${statusCheck?.status}');
        // await retrieveReportAPI(context);
        // statusCheck?.status?.txnStatus?.first.code ==
        //     'ReportGenerated'
        if (statusCheck?.success == true) {
          print(
              "Status Check txn_id: ${statusCheck?.status?.txnStatus?.first.txnId ?? ''}");

          _txn_id = statusCheck?.status?.txnStatus?.first.txnId ?? '';
          // final txnId = statusResponseData['responseData']['txn_id'];
          await retrieveReportAPI(context);
          issloading = false;
          notifyListeners();
          return true;
        }
      }
    } on SocketException catch (_) {
      showFlushbar(context, 'Network error: Unable to connect to the server.');
      issloading = false;
      notifyListeners();
      return false;
    } on FormatException catch (_) {
      showFlushbar(
          context, 'Format Execption:Unable to connect to the server.');
      issloading = false;
      notifyListeners();
      return false;
    } on PlatformException catch (_) {
      showFlushbar(context, 'PlatformException :Please Check the Permissions.');
      issloading = false;
      notifyListeners();
      return false;
    } catch (error) {
      showFlushbar(context, 'Status Check Exception: $error');
      issloading = false;
      notifyListeners();
      return false;
    } finally {
      issloading = false;
      notifyListeners();
    }
    return false;
  }

  void changeBank(index) {
    currentindex = index;
    notifyListeners();
  }

  int currentindex = 0;
  ReportSummaryModel? reportSummaryModel;
  List<AccountTransaction> trasactionlist = [];
  Future<void> retrieveReportAPI(context) async {
    log('calling retrivereprot');
    _isReportLoading = true;
    notifyListeners();

    try {
      String token = await SecureStorage.readToken('token');
      bool isTokenExpired = JwtDecoder.isExpired(token);
      if (isTokenExpired) {
        await refershTokenService.postRefershTocken(context);
        reportSummaryModel = await expenseServices.retrieveReportAPI(context);
        filterListBasedonMonth(currentindex, selectedMonth?.month);
        _isfetched = true;
        notifyListeners();
      } else {
        reportSummaryModel = await expenseServices.retrieveReportAPI(context);
        filterListBasedonMonth(currentindex, selectedMonth?.month);
        _isfetched = true;
        notifyListeners();
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

  List<dynamic> listofMonths = [];
  void filterListBasedonMonth(index, int? selectMont) {
    trasactionlist.clear();
    listofMonths.clear();
    trasactionlist.addAll(reportSummaryModel
            ?.reportData?.banks?[index].accounts?[index].transactions ??
        []);
    if (trasactionlist.isNotEmpty) {
      listofMonths.addAll(trasactionlist.where((transactionlist) {
        return transactionlist.date?.month == selectMont;
      }).toList());
      calculateTotals(listofMonths);
      changeofSort(intialStringforRadio);
      calculatePercentage();
      log('monthlsit ===$listofMonths');
    }

    notifyListeners();
  }

  double incomePercentage = 0.0;
  double expensePercentage = 0.0;
  void calculatePercentage() {
    double total = totalincome + totalExpense;
    incomePercentage = total > 0 ? (totalincome / total) * 100 : 0;
    expensePercentage = total > 0 ? (totalExpense / total) * 100 : 0;
    notifyListeners();
  }

  void calculateTotals(List<dynamic> listofMonths) {
    totalincome = 0;
    totalExpense = 0;
    totalTransactions = 0;

    for (var transaction in listofMonths) {
      double amount = (transaction.amount ?? 0).toDouble();
      totalTransactions += amount.abs(); // Update total transactions

      if (amount > 0) {
        totalincome += amount; // Sum up income
        if (kDebugMode) {
          print("Added income: $amount");
        }
      } else if (amount < 0) {
        totalExpense += amount.abs(); // Sum up expenses
        if (kDebugMode) {
          print("Added expense: ${amount.abs()}");
        }
      }
    }

    // Output results
    print("Total Income: $totalincome");
    print("Total Expense: $totalExpense");
    print("Total Transactions: $totalTransactions");
  }

  Icon getCategoryIcon(String category) {
    switch (category) {
      case 'UPI':
        return const Icon(Icons.credit_card_off_sharp,
            size: 35, color: Colors.blue);
      case 'BY TRANSEFER':
        return const Icon(CupertinoIcons.paperplane_fill,
            size: 35, color: Colors.green);
      case 'Investment Expense':
        return const Icon(Icons.currency_rupee_sharp,
            size: 35, color: Colors.orange);
      case 'Insurance':
        return const Icon(CupertinoIcons.italic,
            size: 35, color: Colors.purple);
      case 'Travel':
        return const Icon(Icons.travel_explore_outlined,
            size: 35, color: Colors.red);
      case 'Cash Withdrawal':
        return const Icon(Icons.money_off, size: 35, color: Colors.red);
      case 'Bills & Utilities':
        return const Icon(CupertinoIcons.house_fill,
            size: 35, color: Colors.red);
      case 'Salary':
        return const Icon(Icons.account_balance_wallet_outlined,
            size: 35, color: Colors.red);
      case 'Interest':
        return const Icon(Icons.interests, size: 35, color: Colors.red);
      case 'Investment Income':
        return const Icon(Icons.money, size: 35, color: Colors.yellowAccent);
      case 'Charges':
        return const Icon(Icons.offline_bolt_outlined,
            size: 35, color: Colors.brown);
      case 'Others':
        return const Icon(CupertinoIcons.arrow_down_left_square_fill,
            size: 35, color: Color.fromRGBO(128, 155, 186, 1));
      default:
        return const Icon(CupertinoIcons.arrow_down_left_square_fill,
            size: 35,
            color: Color.fromRGBO(
                128, 155, 186, 1)); // Default icon if no match found
    }
  }
}
