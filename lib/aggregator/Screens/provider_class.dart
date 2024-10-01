import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:finfresh_mobile/aggregator/Screens/retrieve_report_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import '../../main.dart';
import '../Helpers/colors.dart';
import '../Model/StatusCheck.dart';
import '../Model/report.dart';
import '../helpers/snackBar.dart';
import 'package:intl/intl.dart';
import '../widgets/custom_container.dart';
import 'home_screen.dart';

class TransactionProvider extends ChangeNotifier {
  TransactionProvider() {
    _initializeReportBox();
  }

  List<AccountTransaction> _filteredTransactions = [];

  List<dynamic> get filteredTransactions => _filteredTransactions;

  List<AccountTransaction> _filtered = [];

  List<dynamic> get filtered => _filtered;

  bool isLoading = true;

  List<String> selectedValues = [];

  String? selectedCategory;

  String? selectedCategoryName;

  String? selectedCategoryNames;

  double selectedCategoryNameTotalAmount = 0.0;

  double selectedCategoryNameTotalAmounts = 0.0;

  Map<String, double> get datasMap => incomeExpenseMapData;

  double choseMonthTotalAmount = 0.0;

  double choseTotalAMount = 0.0;

  double totalCredit = 0.0;

  double totalDebit = 0.0;

  double totalInvestment = 0.0;

  double totalBillsUtilities = 0.0;

  double totalTravel = 0.0;

  double totalTransferToBharatPe = 0.0;

  double totalIncome = 0.0;

  double totalExpense = 0.0;

  DateTime _dateTime = DateTime.now();

  DateTime get dateTime => _dateTime;

  DateTime _getDate = DateTime.now();

  DateTime get getDate => _getDate;

  bool issloading = false;

  bool get isloading => issloading;

  bool _isReportLoading = false;

  bool get isReportLoading => _isReportLoading;

  String? _requestId;

  String? get requestId => _requestId;

  String? _txn_id;

  String? get txn_id => _txn_id;

  String? phnno;

  String? reqId;

  Box<ReportDataHiveModel>? retrieveReportBox;

  ReportDataHiveModel reportDataModel = ReportDataHiveModel();

  Box<String>? phoneNumberBox;

  String? phoneNumber;

  Box<DateTime>? expireTimeBox;

  DateTime? expireTime;

  bool isTransactionAvailable = false;

  String? _selectedCategory;

  bool showAll = false;

  List<AccountTransaction> calenderRangeTransactionDate = [];

  List<AccountTransaction> calenderRangesTransactionDate = [];

  List<MapEntry<String, double>> categoryEntries = [];

  List<MapEntry<String, double>> categoryEntry = [];

  Map<String, double>? countCategory;

  Map<String, double>? countedCategory;

  void enableShowAll() {
    showAll = !showAll;
    notifyListeners();
  }

  void transactionFilter(int bankIndex) {
    _filteredTransactions = reportDataModel
            .reportData?.banks?[bankIndex].accounts?[0].transactions ??
        [];
    notifyListeners();
  }

  void showAlertDialog(BuildContext context, Bank account) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Bank Details",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, color: black),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("You have choose ${account.bank ?? 'Unknown Bank'}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: black)),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Please Choose the DATE to Categorize your INCOME & EXPENSE",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14, color: brown),
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "OK",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void applyCategoryFilter(
      {required String categoryNameFromServer,
      required bool isFromCategoryIncome}) {
    if (isFromCategoryIncome == true) {
      selectedCategoryName = categoryNameFromServer;

      calenderRangeTransactionDate = _filteredTransactions;

      selectedCategoryNameTotalAmount = calenderRangeTransactionDate
          .where((AccountTransaction accountTransaction) =>
              accountTransaction.category == categoryNameFromServer)
          .fold(
              0.0,
              (previousValue, element) =>
                  previousValue + (element.amount ?? 0.0));

      calenderRangeTransactionDate = calenderRangeTransactionDate
          .where((AccountTransaction accountTransaction) =>
              accountTransaction.category?.contains(categoryNameFromServer) ??
              false)
          .toList();

      if (kDebugMode) {
        print("Filtered list length: ${calenderRangeTransactionDate.length}");
      }

      notifyListeners();
    } else {
      selectedCategoryNames = categoryNameFromServer;

      calenderRangesTransactionDate = _filteredTransactions;

      selectedCategoryNameTotalAmounts = calenderRangesTransactionDate
          .where((AccountTransaction accountTransaction) =>
              accountTransaction.category == categoryNameFromServer)
          .fold(
              0.0,
              (previousValue, element) =>
                  previousValue + (element.amount ?? 0.0));

      calenderRangesTransactionDate = calenderRangesTransactionDate
          .where((AccountTransaction accountTransaction) =>
              accountTransaction.category?.contains(categoryNameFromServer) ??
              false)
          .toList();

      if (kDebugMode) {
        print("Filtered list length: ${calenderRangesTransactionDate.length}");
      }

      notifyListeners();
    }
  }

  void setSelectedCategory(String? category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void filterTransactions(String searchText) {
    var banks = reportDataModel.reportData?.banks;
    if (banks == null || banks.isEmpty) {
      return;
    }

    var accounts = banks[0].accounts;
    if (accounts == null || accounts.isEmpty) {
      return;
    }

    _filtered = accounts[0].transactions?.where((transaction) {
          bool matchesNarration = transaction.narration!.contains(searchText) ||
              transaction.narration!.contains(searchText.toUpperCase()) ||
              transaction.narration!.contains(searchText.toLowerCase());

          bool matchesCategory = _selectedCategory != null
              ? transaction.narration == _selectedCategory
              : true;

          return matchesNarration && matchesCategory;
        }).toList() ??
        [];

    notifyListeners();
  }

  void selectNarrations(DateTime selectedDate) {
    if (kDebugMode) {
      print(selectedDate.toString());
    }

    _filtered = reportDataModel.reportData?.banks?[0].accounts?[0].transactions
            ?.where((transaction) {
          return transaction.date != null &&
              transaction.date!.year == selectedDate.year &&
              transaction.date!.month == selectedDate.month;
        }).toList() ??
        [];

    notifyListeners();
  }

  Future _initializeReportBox() async {
    try {
      _isReportLoading = true;
      retrieveReportBox =
          await Hive.openBox<ReportDataHiveModel>('reportDataBox');
      phoneNumberBox = await Hive.openBox<String>('phoneNumberBox');
      expireTimeBox = await Hive.openBox<DateTime>('expireTimeBox');

      phoneNumber = phoneNumberBox?.get('phoneNumberKey');
      expireTime = expireTimeBox?.get('expireTimeKey');

      if (_isTimeExpired()) {
        // await _deleteReportData();
        await retrieveReportAPI();
      } else {
        _getHiveData();
      }
    } catch (error) {
      showSnackBar('Error in Database $error');
    }
  }

  void _getHiveData() {
    if (retrieveReportBox?.isEmpty ?? true) {
      const SizedBox.shrink();
    } else {
      reportDataModel = retrieveReportBox!.get('reportDataKey')!;
      if (kDebugMode) {
        print("reportDataModelreportDataModel$reportDataModel");
      }
    }

    expireTime = expireTimeBox?.get('expireTimeKey');
    phoneNumber = phoneNumberBox?.get('phoneNumberKey');

    _isReportLoading = false;
    notifyListeners();
  }

  bool _isTimeExpired() {
    if (expireTime == null) {
      return false;
    } else if (DateTime.now().isAfter(expireTime!)) {
      return true;
    } else {
      return false;
    }
  }

  Future storeReportDataAndExpireTime(
      ReportDataHiveModel? reportDataModel) async {
    if (reportDataModel?.reportData == null) {
      return;
    }

    await retrieveReportBox?.put('reportDataKey', reportDataModel!);
    await expireTimeBox?.put(
        'expireTimeKey', DateTime.now().add(const Duration(days: 1)));

    _getHiveData();
  }

  Future _storePhoneNumber() async {
    if (phnno == null) {
      return;
    }

    await phoneNumberBox?.put('phoneNumberKey', phnno!);
    phoneNumber = phoneNumberBox?.get('phoneNumberKey');
  }

  Future _deleteReportData() async {
    await retrieveReportBox!.clear();
    await expireTimeBox!.clear();
  }

  void showTransactionDetails(
    BuildContext context,
    AccountTransaction transaction,
    TransactionProvider transactionProvider,
  ) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        DateTime transactionDateTime;
        try {
          transactionDateTime =
              transaction.transactionTimestamp ?? DateTime.now();
        } catch (e) {
          transactionDateTime = DateTime.now();
        }

        String formattedDate =
            DateFormat('yyyy-MM-dd').format(transactionDateTime);
        String formattedTime = DateFormat.jm().format(transactionDateTime);

        IconData getTypeIcon(String type) {
          return type == 'DEBIT'
              ? CupertinoIcons.arrow_up_right_square_fill
              : CupertinoIcons.arrow_down_left_square_fill;
        }

        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.67,
          child: SingleChildScrollView(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              borderOnForeground: true,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Transaction Details",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue),
                    ),
                    const SizedBox(height: 5),
                    transactionContainer(
                      "Transaction To:".toUpperCase(),
                      transaction.narration ?? '',
                      Icons.transcribe,
                    ),
                    transactionContainer(
                      "Transaction Type:".toUpperCase(),
                      (transaction.amount ?? 0.0) < 0 ? 'DEBIT' : 'CREDIT',
                      getTypeIcon(
                          (transaction.amount ?? 0.0) < 0 ? 'DEBIT' : 'CREDIT'),
                    ),
                    transactionContainer(
                      "Amount:".toUpperCase(),
                      "₹ ${(transaction.amount ?? 0.0)}",
                      Icons.currency_rupee_sharp,
                    ),
                    transactionContainer(
                      "Mode Of Payment:".toUpperCase(),
                      transaction.modeFromSource ?? 'Unknown',
                      Icons.payment,
                    ),
                    transactionContainer(
                      "Payment Date:".toUpperCase(),
                      formattedDate,
                      Icons.date_range,
                    ),
                    transactionContainer(
                      "Payment Time:".toUpperCase(),
                      formattedTime,
                      Icons.date_range,
                    ),
                    transactionContainer(
                      "Current Balance:".toUpperCase(),
                      "₹ ${transaction.balance}",
                      Icons.account_balance_wallet,
                    ),
                    const SizedBox(height: 5),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'CLOSE',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<String> selectedCategories = [];

  void onCategorySelected(String category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }
    notifyListeners();
  }

  List<AccountTransaction> getFilteredTransactions() {
    if (selectedCategories.isEmpty) {
      return calenderRangeTransactionDate;
    }

    return calenderRangeTransactionDate.where((transaction) {
      return selectedCategories.contains(transaction.category);
    }).toList();
  }

  Map<String, double> countCategories(
      List<AccountTransaction> calenderRangeTransactionDate) {
    Map<String, double> categoryCount = {};
    for (var userChoosedDataItem in calenderRangeTransactionDate) {
      String category = userChoosedDataItem.category ?? '';
      if (categoryCount.containsKey(category)) {
        categoryCount[category] = categoryCount[category]! + 1.0;
      } else {
        categoryCount[category] = 1.0;
      }
    }

    return categoryCount;
  }


  double percentageCalculation(
      double sameCategoryChosenMonthTotalAmount, double totalAmount) {
    if (totalAmount == 0) {
      return 0;
    } else {
      return (sameCategoryChosenMonthTotalAmount / totalAmount) * 100;
    }
  }

  double percentageCalculationExpense(
      double sameCategoryChosenMonthTotalAmounts, double totalAmount) {
    if (totalAmount == 0) {
      return 0;
    } else {
      return (sameCategoryChosenMonthTotalAmounts / totalAmount) * 100;
    }
  }

/*  void updateEntry(String key, double newValue) {
    bool entryFound = false;

    for (int i = 0; i < categoryEntries.length; i++) {
      if (categoryEntries[i].key == key) {
        // Add the new percentage to the existing percentage
        double updatedValue = categoryEntries[i].value + newValue;
        categoryEntries[i] = MapEntry(key, updatedValue);
        entryFound = true;
        break;
      }
    }
    if (!entryFound) {
      categoryEntries.add(MapEntry(key, newValue));
    }
  }*/

  void updateEntryForExpense(String key, double newValue) {
    bool entryFound = false;

    for (int i = 0; i < categoryEntry.length; i++) {
      if (categoryEntry[i].key == key) {
        double updatedValue = categoryEntry[i].value + newValue.abs();
        categoryEntry[i] = MapEntry(key, updatedValue);
        entryFound = true;
        break;
      }
    }

    if (!entryFound) {
      categoryEntry.add(MapEntry(key, newValue.abs()));
    }
  }

  void calculateAnalyticsForIncome() {
    List<AccountTransaction> transactions = _filteredTransactions;

    if (transactions.isEmpty) {
      notifyListeners();
      showNoTransactionsMessage(
        message: 'Transaction Data is Empty !!',
      );
      return;
    }

    // Filter transactions for the selected month and year
    calenderRangeTransactionDate = transactions.where((AccountTransaction element) {
      return element.date != null &&
          element.date!.year == _dateTime.year &&
          element.date!.month == _dateTime.month &&
          element.amount != null &&
          element.amount! > 0;
    }).toList();

    if (calenderRangeTransactionDate.isEmpty) {
      showNoTransactionsMessage(
        message: 'INCOME Data is not available for the chosen date',
      );
      return;
    }

    // Calculate total absolute amount for income transactions
    double totalAbsoluteAmount = calenderRangeTransactionDate.fold(
        0.0,
            (previousValue, element) =>
        previousValue + (element.amount?.toDouble().abs() ?? 0.0));

    choseMonthTotalAmount = totalAbsoluteAmount;

    // Initialize a map to accumulate income by category
    Map<String, double> incomeByCategory = {};

    // Accumulate the amounts for each category
    for (var userChosenDataItem in calenderRangeTransactionDate) {
      String category = userChosenDataItem.category ?? '';
      double amount = userChosenDataItem.amount?.toDouble() ?? 0.0;

      if (amount > 0) {
        incomeByCategory.update(category, (value) => value += amount,
            ifAbsent: () => amount);
      }
    }

    // Calculate the total amount of income by category
    double sumOfCategories = incomeByCategory.values.fold(0, (a, b) => a + b);

    // Clear previous entries
    categoryEntries.clear();

    // Use updateEntry to calculate percentages based on total amount of income by category
    for (var entry in incomeByCategory.entries) {
      String category = entry.key;
      double categoryAmount = entry.value;


      double percentage = (categoryAmount / sumOfCategories) * 100;

      // Call updateEntry method directly
      updateEntry(category, percentage);
    }

    // Ensure the total percentages equal 100% by adjusting for rounding errors
    double totalPercentage = categoryEntries.fold(0.0, (sum, entry) => sum + entry.value);
    if (totalPercentage != 100) {
      // Adjust the first category entry to make the total exactly 100%
      double difference = 100 - totalPercentage;
      if (categoryEntries.isNotEmpty) {
        categoryEntries[0] = MapEntry(categoryEntries[0].key, categoryEntries[0].value + difference);
      }
    }



    notifyListeners();
  }

  void updateEntry(String key, double newValue) {
    bool entryFound = false;

    for (int i = 0; i < categoryEntries.length; i++) {
      if (categoryEntries[i].key == key) {
        double updatedValue = categoryEntries[i].value + newValue;
        categoryEntries[i] = MapEntry(key, updatedValue);
        entryFound = true;
        break;
      }
    }

    if (!entryFound) {
      categoryEntries.add(MapEntry(key, newValue));
    }
  }




/*  void calculateAnalyticsForIncome() {
    List<AccountTransaction> transactions = _filteredTransactions;
    if (transactions.isEmpty) {
      notifyListeners();
      showNoTransactionsMessage(
        message: 'Transaction Data is Empty !!',
      );
      return;
    }

    calenderRangeTransactionDate =
        transactions.where((AccountTransaction element) {
      return element.date != null &&
          element.date!.year == _dateTime.year &&
          element.date!.month == _dateTime.month &&
          element.amount != null &&
          element.amount! > 0;
    }).toList();

    if (calenderRangeTransactionDate.isEmpty) {
      showNoTransactionsMessage(
        message: 'INCOME Data is not available for the chosen date',
      );
      return;
    }

    double totalAbsoluteAmount = calenderRangeTransactionDate.fold(
        0.0,
        (previousValue, element) =>
            previousValue + (element.amount?.toDouble().abs() ?? 0.0));

    choseMonthTotalAmount = totalAbsoluteAmount;

    countCategory = countCategories(calenderRangeTransactionDate);

    categoryEntries =
        countCategories(calenderRangeTransactionDate).entries.toList();

    categoryEntries = categoryEntries.toList()
      ..sort((a, b) {
        final percentageA = a.value.truncate() > 0 ? a.value.truncate() : 0;
        final percentageB = b.value.truncate() > 0 ? b.value.truncate() : 0;
        return percentageB.compareTo(percentageA);
      });

    Map<String, double> incomeByCategory = {};

    for (var userChosenDataItem in calenderRangeTransactionDate) {
      String category = userChosenDataItem.category ?? '';
      double amount = userChosenDataItem.amount?.toDouble() ?? 0.0;

      if (amount > 0) {
        incomeByCategory.update(category, (value) => value += amount,
            ifAbsent: () => amount);

        double percentage = (amount.abs() / totalAbsoluteAmount) * 100;
        updateEntry(category, percentage);

        if (kDebugMode) {
          print(
              "Income Category: $category, Amount: $amount, Percentage: $percentage%");
        }
      }
    }

    notifyListeners();
  }*/

  void calculateAnalyticsForExpense() {
    List<AccountTransaction> transactions = _filteredTransactions;

    if (transactions.isEmpty) {
      notifyListeners();
      showNoTransactionsMessage(
        message: 'Transaction Data is Empty !!',
      );
      return;
    }

    calenderRangesTransactionDate =
        transactions.where((AccountTransaction element) {
      return element.date != null &&
          element.date!.year == _dateTime.year &&
          element.date!.month == _dateTime.month &&
          element.category != null &&
          element.amount != null &&
          element.amount! < 0;
    }).toList();

    if (calenderRangesTransactionDate.isEmpty) {
      showNoTransactionsMessage(
        message: 'EXPENSE Data is not available for the chosen date',
      );
      return;
    }

    double totalAbsoluteAmounts = calenderRangesTransactionDate.fold(
        0.0,
        (previousValue, element) =>
            previousValue + (element.amount?.toDouble().abs() ?? 0.0));

    choseTotalAMount = totalAbsoluteAmounts;

    Map<String, double> expenseByCategory = {};

    for (var userChosenDataItem in calenderRangesTransactionDate) {
      String category = userChosenDataItem.category ?? '';
      double amount = userChosenDataItem.amount?.toDouble() ?? 0.0;

      if (amount < 0) {
        double absoluteAmount = amount.abs();
        expenseByCategory.update(category, (value) => value + absoluteAmount,
            ifAbsent: () => absoluteAmount);
      }
    }

    const double percentageThreshold = 1;

    categoryEntry = expenseByCategory.entries
        .map((entry) {
          double percentage = (entry.value / totalAbsoluteAmounts) * 100;
          return MapEntry(entry.key, percentage);
        })
        .where((entry) => entry.value > percentageThreshold)
        .toList();

    categoryEntry.sort((a, b) => b.value.compareTo(a.value));

    notifyListeners();
  }

  void showNoTransactionsMessage({String? message}) {
    if (message != null) {
      showSnackBar(message);
    }

    notifyListeners();
  }

  Map<String, double> incomeExpenseMapData = {
    "Income": 0.0,
    "Expense": 0.0,
  };



  void calculateIncomeAndExpense() {
    final transactions = _filteredTransactions;

    if (transactions.isNotEmpty) {
      double totalIncome = 0.0;
      double totalExpense = 0.0;
      double totalTransactions = 0.0;

      for (var transaction in transactions) {
        DateTime? transactionDate = transaction.transactionTimestamp;

        if (transactionDate != null) {
          if (transactionDate.year == _getDate.year &&
              transactionDate.month == _getDate.month) {
            double amount = (transaction.amount ?? 0).toDouble();
            totalTransactions += amount.abs();

            if (amount > 0) {
              totalIncome += amount;
              if (kDebugMode) {
                print("Added income: $amount");
              }
            } else if (amount < 0) {
              totalExpense += amount.abs();
              if (kDebugMode) {
                print("Added expense: ${amount.abs()}");
              }
            }
          }
        } else {
          if (kDebugMode) {
            print("Transaction timestamp is null.");
          }
        }
      }

      if (totalTransactions > 0) {
        double incomePercentage = (totalIncome / totalTransactions) * 100;
        double expensePercentage = (totalExpense / totalTransactions) * 100;

        incomeExpenseMapData = {
          "Income": incomePercentage,
          "Expense": expensePercentage,
        };

        isTransactionAvailable = false;
      } else {
        isTransactionAvailable = true;
      }

      this.totalIncome = totalIncome;
      this.totalExpense = totalExpense;

      notifyListeners();
      if (kDebugMode) {
        print('Total Income for selected month: $totalIncome');
        print('Total Expense for selected month: $totalExpense');
      }
    } else {
      if (kDebugMode) {
        print('No transactions found.');
      }
      isTransactionAvailable = true;
    }
  }



  void setIncomeExpense(DateTime newDateTime) {
    _getDate = newDateTime;
    //  calculateIncomeExpenseAnalytics();
    calculateIncomeAndExpense();

    notifyListeners();
  }

  void setCategoryDatas(DateTime newDateTime) {
    _dateTime = newDateTime;
    calculateAnalyticsForIncome();

    notifyListeners();
  }

  void setCategoryDatasExpense(DateTime newDateTime) {
    _dateTime = newDateTime;
    calculateAnalyticsForExpense();

    notifyListeners();
  }

  void onSelectFilterName(String selectedCategory) {
    calenderRangeTransactionDate = calenderRangeTransactionDate
        .where((element) =>
            element.category == selectedCategory && (element.amount ?? 0.0) > 0)
        .toList();
    notifyListeners();
  }

  void onSelectCategoryItem({
    required int index,
    required String selectedCategory,
  }) {
    selectedCategoryName = selectedCategory;

    selectedCategoryNameTotalAmount = calenderRangeTransactionDate
        .where(
          (AccountTransaction accountTransaction) =>
              accountTransaction.category == selectedCategory,
        )
        .fold(0.0,
            (previousValue, element) => previousValue + (element.amount ?? 0));

    notifyListeners();
  }

  void onSelectCategoryItems({
    required int index,
    required String selectedCategory,
  }) {
    selectedCategoryNames = selectedCategory;

    selectedCategoryNameTotalAmount = calenderRangesTransactionDate
        .where(
          (AccountTransaction accountTransaction) =>
              accountTransaction.category == selectedCategory,
        )
        .fold(0.0,
            (previousValue, element) => previousValue + (element.amount ?? 0));

    notifyListeners();
  }

  Color getColorForEntry(
      {required MapEntry<String, double> entry, required bool isFromIncome}) {
    final List<Color> colors = [
      const Color.fromRGBO(168, 226, 156, 1),
      const Color.fromRGBO(226, 211, 156, 1),
      const Color.fromRGBO(195, 247, 236, 1),
      const Color.fromRGBO(239, 183, 234, 1),
      const Color.fromRGBO(154, 175, 225, 1),
      const Color.fromRGBO(180, 224, 241, 1),
      const Color.fromRGBO(229, 210, 239, 1),
      const Color.fromRGBO(255, 215, 186, 1),
      const Color.fromRGBO(210, 250, 220, 1),
      const Color.fromRGBO(255, 239, 186, 1),
    ];
    if (isFromIncome == true) {
      int index = categoryEntries.indexOf(entry);

      if (index < 0 || index >= colors.length) {
        index = index % colors.length;
      }

      return colors[index];
    } else {
      int index = categoryEntry.indexOf(entry);

      if (index < 0 || index >= colors.length) {
        index = index % colors.length;
      }

      return colors[index];
    }
  }

  String formatCategoryName(String category) {
    if (category.startsWith('Transfer to')) {
      return category.replaceFirst('Transfer to', '').trim();
    } else if (category.startsWith('Transfer from')) {
      return category.replaceFirst('Transfer from', '').trim();
    }
    return category;
  }

  Color getColorForIncomeCategories(int index) {
    const colors = [
      Color.fromRGBO(226, 211, 156, 1),
      Color.fromRGBO(239, 183, 234, 1),
    ];
    return colors[index % colors.length];
  }

  void applyFilter(DateTime? selectedDateFrom, DateTime? selectedDateTo) {
    _filteredTransactions =
        reportDataModel.reportData?.banks?[0].accounts?[0].transactions ?? [];

    if (selectedDateFrom != null &&
        selectedDateTo != null &&
        selectedDateFrom.isAfter(selectedDateTo)) {
      showSnackBar(
          'Please check the date range: From date cannot be after To date.');
      return;
    }

    _filteredTransactions = _filteredTransactions.where((transaction) {
      int matchedFilters = 0;

      if (selectedValues.contains('DEBIT') && transaction.amount! < 0) {
        matchedFilters++;
      }

      if (selectedValues.contains('CREDIT') && transaction.amount! > 0) {
        matchedFilters++;
      }

      if (selectedValues.contains('UPI') &&
          transaction.modeFromSource == 'UPI') {
        matchedFilters++;
      }

      if (selectedValues.contains('ATM') &&
          transaction.modeFromSource == 'ATM') {
        matchedFilters++;
      }

      if (selectedValues.contains('OTHERS') &&
          transaction.modeFromSource == 'OTHERS') {
        matchedFilters++;
      }

      bool isValid = matchedFilters >= 1;

      if (isValid) {
        if (selectedDateFrom != null && selectedDateTo != null) {
          DateTime? transactionDate = transaction.transactionTimestamp;
          if (transactionDate != null) {
            isValid = transactionDate.isAfter(selectedDateFrom) &&
                transactionDate
                    .isBefore(selectedDateTo.add(const Duration(days: 1)));
          } else {
            isValid = false;
          }
        }
      }

      return isValid;
    }).toList();

    if (_filteredTransactions.isEmpty) {
      showSnackBar('No transactions found for the selected filters');
    }

    if (selectedValues.isEmpty) {
      showSnackBar('Please choose at least one filter option');
    }

    notifyListeners();
  }

  void resetFilter(TextEditingController dateFromController,
      TextEditingController dateToController, int bankIndex) {
    selectedValues.clear();
    dateFromController.clear();
    dateToController.clear();
    transactionFilter(bankIndex);
    notifyListeners();
  }

  Map<String, Icon> categoryIcons = {
    'UPI':
        const Icon(Icons.credit_card_off_sharp, size: 35, color: Colors.blue),
    'Transfer in': const Icon(CupertinoIcons.arrow_down_left_square_fill,
        size: 35, color: Colors.green),
    'Transfer out': const Icon(CupertinoIcons.arrow_down_right_square_fill,
        size: 35, color: Colors.green),
    'Transfer to': const Icon(CupertinoIcons.arrow_down_right_square_fill,
        size: 35, color: Colors.green),
    'Transfer from': const Icon(CupertinoIcons.arrow_down_left_square_fill,
        size: 35, color: Colors.green),
    'Investment Expense':
        const Icon(Icons.currency_rupee_sharp, size: 35, color: Colors.orange),
    'Insurance':
        const Icon(CupertinoIcons.italic, size: 35, color: Colors.purple),
    'Travel':
        const Icon(Icons.travel_explore_outlined, size: 35, color: Colors.red),
    'Cash Withdrawal': const Icon(Icons.money_off, size: 35, color: Colors.red),
    'Bills & Utilities':
        const Icon(CupertinoIcons.house_fill, size: 35, color: Colors.red),
    'Salary': const Icon(Icons.account_balance_wallet_outlined,
        size: 35, color: Colors.red),
    'Interest': const Icon(Icons.interests, size: 35, color: Colors.red),
    'Investment Income': const Icon(
      Icons.money,
      size: 35,
      color: Colors.yellowAccent,
    ),
    'Charges': const Icon(
      Icons.offline_bolt_outlined,
      size: 35,
      color: Colors.brown,
    ),
    'Others': const Icon(CupertinoIcons.slowmo, size: 35, color: Colors.black),
  };

  Icon? getLeadingIcon(String? category, Map<String, Icon> categoryIcons) {
    if (category != null) {
      for (var key in categoryIcons.keys) {
        if (category.toLowerCase().contains(key.toLowerCase())) {
          return categoryIcons[key];
        }
      }
    }
    return categoryIcons['Others'];
  }

  List<Color> cardColors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.red,
  ];

  Future<String?> generatedUrl(String phoneNumber) async {
    isLoading = true;
    notifyListeners();

    final generateUrl =
        Uri.parse('https://aaa-prd.onrender.com/api/v1/generateUrl');
    String? receivedUrl;

    try {
      final response = await http.post(
        generateUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'phoneNumber': phoneNumber}),
      );

      if (kDebugMode) {
        print('generatedUrl-------->>> ${response.body}');
      }

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData['success']) {
          receivedUrl = responseData['responseData']['url'];
          // _requestId = responseData['updatedUser']['requestId'];
          phnno = responseData['updatedUser']['phoneNumber'];
          reqId = responseData['updatedUser']['requestId'];

          if (kDebugMode) {
            print("Received URL: $receivedUrl");
          }
          if (kDebugMode) {
            print("Request ID: $_requestId");
          }
          // fetchStatusCheck();
          // await statusCheck(context, phoneNumber, _requestId);
        } else if (response.statusCode == 400) {
          showSnackBar('Failed: ${responseData['message']}');
        } else if (response.statusCode == 500) {
          showSnackBar('Failed: ${responseData['message']}');
        } else {
          showSnackBar('Failed: ${responseData['message']}');
        }
      } else {
        showSnackBar('Server responded with status: ${response.statusCode}');
      }
    } on SocketException catch (_) {
      showSnackBar('Network error: Unable to connect to the server.');
    } on FormatException catch (_) {
      showSnackBar('Format Execption:Unable to connect to the server.');
    } on PlatformException catch (_) {
      showSnackBar('PlatformException :Please Check the Permissions.');
    } catch (error) {
      showSnackBar('Exception: $error');
    } finally {
      issloading = false;
      notifyListeners();
    }

    return receivedUrl;
  }



  Future<void> fetchStatusCheck() async {
    issloading = true;
    notifyListeners();

    final statusCheckUrl = Uri.parse('https://aaa-prd.onrender.com/api/v1/statusCheck');

    try {
      final response = await http.post(
        statusCheckUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'phoneNumber': phnno}),
      );

      if (kDebugMode) {
        print('fetchStatusCheck-------->>> ${response.body}');
      }

      if (response.statusCode == 200) {
        StatusCheck statusCheckResponse = StatusCheck.fromJson(json.decode(response.body));

        if (statusCheckResponse.success == true) {
          if (statusCheckResponse.status?.txnStatus?.first.code == 'ReportGenerated') {
            await _storePhoneNumber();
            await retrieveReportAPI();

            // Automatically navigate to RetrieveReportScreen
            // Navigator.pushReplacement(
            //   navigatorKey.currentContext!,
            //   MaterialPageRoute(builder: (context) => const RetrieveReportScreen()),
            // );
          } else if (statusCheckResponse.status?.txnStatus?.first.code == "TxnProcessing") {
            Future.delayed(const Duration(minutes: 1), () {
              fetchStatusCheck();
            });
          } else {
            showSnackBar('Status Check Failed Due to: ${statusCheckResponse.status?.txnStatus?.first.msg}');
          }
        } else {
          showSnackBar('Status Check Failed: ${statusCheckResponse.status?.txnStatus?.first.msg}');
        }
      } else {
        showSnackBar('Status Check Server responded with status: ${response.statusCode}');
      }
    } catch (error) {
      showSnackBar("$error");
    } finally {
      issloading = false;
      notifyListeners();
    }
  }

  Future<void> retrieveReportAPI() async {
    _isReportLoading = true;
    ReportDataHiveModel reportDataModel = ReportDataHiveModel();
    notifyListeners();

    final retrieveReportUrl = Uri.parse('https://aaa-prd.onrender.com/api/v1/retrieveReport');

    try {
      final response = await http.post(
        retrieveReportUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'phoneNumber': phoneNumber}),
      );

      print('retrieveReportAPI-------->>> ${response.body}');

      if (response.statusCode == 200) {
        reportDataModel = ReportDataHiveModel.fromJson(response.body);

        if (reportDataModel.success == true) {
          // await _storePhoneNumber();
          await _deleteReportData();
          await storeReportDataAndExpireTime(reportDataModel);
          notifyListeners();

          // Automatically navigate to RetrieveReportScreen if success is true
          Navigator.pushReplacement(
            navigatorKey.currentContext!,
            MaterialPageRoute(builder: (context) => const RetrieveReportScreen()),
          );
          showSnackBar('Your Monthly Statement has been Generated');
        } else {
          showSnackBar('Report Retrieval Server responded with status: ${response.statusCode}');
        }
      } else {
        showSnackBar('Report Retrieval Server responded with status: ${response.statusCode}');
      }
    } catch (error) {
      showSnackBar('Report Retrieval Exception: $error');
    } finally {
      _isReportLoading = false;
      notifyListeners();
    }
  }









  Future<void> fetchPeriodicRetrieveReport() async {
    if (reqId == null) return;

    issloading = true;
    notifyListeners();

    final statusCheckUrl = Uri.parse(
        'https://accountaggregator.onrender.com/api/v1/periodicretriveReport');

    try {
      final response = await http.post(
        statusCheckUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'phoneNumber': phnno}),
      );
      //  print("${response.body}");
      if (response.statusCode == 200) {
        final statusResponseData = jsonDecode(response.body);

        StatusCheck statusCheckResponse =
            StatusCheck.fromJson(json.decode(response.body));

        if (statusCheckResponse.success == true) {
          if (kDebugMode) {
            print(
                "Status Check txn_id: ${statusCheckResponse.status?.txnStatus?.first.txnId ?? ''}");
          }
          _txn_id = statusCheckResponse.status?.txnStatus?.first.txnId ?? '';
          // final txnId = statusResponseData['responseData']['txn_id'];
          /// await retrieveReport();
        } else {
          showSnackBar('Status Check Failed: ${statusResponseData['message']}');
        }
      } else {
        showSnackBar(
            'Status Check Server responded with status: ${response.statusCode}');
      }
    } catch (error) {
      showSnackBar('Status Check Exception: $error');
    } finally {
      issloading = false;
      notifyListeners();
    }
  }

  bool _isLoaded = false;
  bool _isSmsSent = false;

  bool get isLoaded => _isLoaded;
  bool get isSmsSent => _isSmsSent;



  void setLoading(bool value) {
    _isLoaded = value;
    notifyListeners();
  }

  void setSmsSent(bool value) {
    _isSmsSent = value;
    notifyListeners();
  }
}


