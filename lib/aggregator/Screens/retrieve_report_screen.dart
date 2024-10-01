import 'dart:math';
import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:finfresh_mobile/aggregator/Screens/expense_screen.dart';
import 'package:finfresh_mobile/aggregator/Screens/provider_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:provider/provider.dart';
import '../Helpers/colors.dart';
import '../Helpers/snackBar.dart';
import '../Helpers/styles.dart';
import '../widgets/custom_container.dart';
import 'income_screen.dart';

class RetrieveReportScreen extends StatefulWidget {
  const RetrieveReportScreen({super.key});

  @override
  State<RetrieveReportScreen> createState() => _RetrieveReportScreenState();
}

class _RetrieveReportScreenState extends State<RetrieveReportScreen> {
  late DateTime _dateTime;
  DateTime? selectedDate;
  TextEditingController dateFromController = TextEditingController();
  TextEditingController dateToController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  int? touchedIndex;
  Offset? touchedPosition;
  int? selectedBankIndex = 0;

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.now();
    dateController.text = DateFormat('MMMM yyyy').format(_dateTime);
    final provider = Provider.of<TransactionProvider>(context, listen: false);
    // int bankIndex = 0;
    // provider.transactionFilter(bankIndex);
    DateTime currentDate = DateTime.now();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      int bankIndex = 0;
      provider.transactionFilter(bankIndex);
      provider.setIncomeExpense(currentDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*   appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const IncomeScreen()));
          },
          child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0x0f979797)),
              child: const Icon(Icons.more_horiz, color: Colors.black)),
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/474x/8c/ca/13/8cca13ceb744afdf49c93bf809bfaf9a.jpg'),
          ),
          SizedBox(width: 16),
        ],
      ),*/
      body: Consumer<TransactionProvider>(
        builder: (context, provider, child) {
          if (provider.isReportLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        textAlign: TextAlign.start,
                        'My Banks',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: provider
                                .reportDataModel.reportData?.banks?.length ??
                            0,
                        itemBuilder: (context, bankIndex) {
                          final bank = provider
                              .reportDataModel.reportData?.banks?[bankIndex];

                          if (bank == null || bank.accounts == null) {
                            return const SizedBox(
                              width: 100,
                              child:
                                  Center(child: Text("No accounts available")),
                            );
                          } else {
                            final random = Random();
                            final randomColor = provider.cardColors[
                                random.nextInt(provider.cardColors.length)];
                            return Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 8),
                                  Expanded(
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: bank.accounts?.length ?? 0,
                                      itemBuilder: (context, accountIndex) {
                                        final account =
                                            bank.accounts?[accountIndex];
                                        if (account == null) {
                                          return Text(
                                            bank.bank ?? "Unknown Bank",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          );
                                        } else {
                                          return InkWell(
                                            onTap: () {
                                              provider
                                                  .transactionFilter(bankIndex);
                                              provider.showAlertDialog(
                                                  context, bank);
                                            },
                                            child: CardWidget(
                                                bankName:
                                                    bank.bank ?? "Unknown Bank",
                                                cardNumber:
                                                    account.accountNumber ??
                                                        "N/A",
                                                cardHolder: (account
                                                                .currentBalance !=
                                                            null &&
                                                        account.currentBalance!
                                                            .isNotEmpty)
                                                    ? "${account.currentBalance}"
                                                    : "NOT AVAILABLE",
                                                expiryDate:
                                                    account.accountStatus ??
                                                        "Unknown Status",
                                                currency: (account.currency !=
                                                            null &&
                                                        account.currency!
                                                            .isNotEmpty)
                                                    ? "${account.currency}"
                                                    : "INR",
                                                color: randomColor),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.09,
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: Consumer<TransactionProvider>(
                            builder: (context, provider, child) {
                              return ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: greenShade,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const IncomeScreen()));
                                },
                                icon: Icon(
                                  CupertinoIcons.arrow_up,
                                  color: green,
                                  size: 30,
                                ),
                                label: Text(
                                  'Income\n₹ ${provider.totalIncome.abs().toStringAsFixed(0)}',
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.09,
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: redShade,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ExpenseScreen()));
                            },
                            icon: Icon(
                              CupertinoIcons.arrow_down,
                              color: red,
                              size: 30,
                            ),
                            label: Text(
                                "Expense\n₹ ${provider.totalExpense.abs().toStringAsFixed(0)}",
                                style: TextStyle(
                                    color: black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    IntrinsicWidth(
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: () {
                              if (selectedBankIndex != null) {
                                pickedDate(context, provider);
                              }
                            },
                            child: Icon(Icons.arrow_drop_down_circle_outlined,
                                color: greenColor),
                          ),
                          hintText:
                              DateFormat('MMMM yyyy').format(provider.dateTime),
                          hintStyle: TextStyle(
                              color: greenColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: white, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: white,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 8,
                          ),
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: greenColor,
                        ),
                        controller: dateController,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        if (!provider.isTransactionAvailable == true) ...[
                          EasyPieChart(
                            key: const Key('chart'),
                            children: provider.incomeExpenseMapData.entries
                                .map((entry) {
                              return PieData(
                                value: entry.value,
                                color: provider.getColorForIncomeCategories(
                                  provider.incomeExpenseMapData.keys
                                      .toList()
                                      .indexOf(entry.key),
                                ),
                              );
                            }).toList(),
                            borderWidth: 70,
                            showValue: false,
                            animateFromEnd: true,
                            borderEdge: StrokeCap.butt,
                            pieType: PieType.crust,
                            onTap: (index) {
                              if (index < provider.categoryEntries.length) {
                                touchedIndex = index;
                                provider.onSelectCategoryItem(
                                  index: index,
                                  selectedCategory:
                                      provider.categoryEntries[index].key,
                                );
                                setState(() {});
                              } else {
                                print('Invalid index: $index');
                              }
                            },
                            gap: 1,
                            start: 0,
                            size: 240,
                          ),
                          Container(
                            width: 150,
                            height: 155,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 12,
                                color: touchedIndex != null
                                    ? provider.getColorForIncomeCategories(
                                        touchedIndex!)
                                    : const Color.fromRGBO(232, 142, 42, 1),
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    touchedIndex != null
                                        ? provider.incomeExpenseMapData.entries
                                            .elementAt(touchedIndex!)
                                            .key
                                        : "ACTIVE",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    touchedIndex != null
                                        ? "${provider.incomeExpenseMapData.entries.elementAt(touchedIndex!).value.toStringAsFixed(0)}%"
                                        : "Outgoing\nTransfers",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ] else ...[
                          const Center(
                            child: Text(
                              "No Income & Expense available for this month",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                    ),
                    // if (!provider.noTransactionsAvailable)
                    Wrap(
                      alignment: WrapAlignment.start,
                      runSpacing: 30.0,
                      spacing: MediaQuery.of(context).size.width * 0.042,
                      children: List.generate(
                        provider.incomeExpenseMapData.entries
                            .where((entry) => entry.value > 0)
                            .length,
                        (index) {
                          var sortedEntries = provider
                              .incomeExpenseMapData.entries
                              .where((entry) => entry.value > 0)
                              .toList()
                            ..sort((a, b) => b.value.compareTo(a.value));
                          var entry = sortedEntries[index];
                          return SizedBox(
                            width: MediaQuery.of(context).size.width / 2 - 24,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: provider.getColorForIncomeCategories(
                                      provider.incomeExpenseMapData.keys
                                          .toList()
                                          .indexOf(entry.key),
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    entry.key,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(45, 45, 45, 1),
                                    ),
                                  ),
                                ),
                                Text(
                                  ": ${entry.value.toStringAsFixed(0)}%",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(45, 45, 45, 1),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Transactions",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: black,
                          ),
                        ),
                        InkWell(
                          child: const Icon(
                            Icons.sort,
                            size: 30,
                          ),
                          onTap: () {
                            _showFilterOptions(context, provider);
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    if (provider.filteredTransactions.isNotEmpty)
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: provider.filteredTransactions.length ?? 0,
                          itemBuilder: (context, index) {
                            provider.filteredTransactions
                                .sort((a, b) => b?.date.compareTo(a?.date));

                            final List<Color> colors = [
                              const Color.fromRGBO(168, 226, 156, 1),
                              const Color.fromRGBO(226, 211, 156, 1),
                              const Color.fromRGBO(195, 247, 236, 1),
                              const Color.fromRGBO(239, 183, 234, 1),
                              const Color.fromRGBO(154, 175, 225, 1),
                              const Color.fromRGBO(180, 224, 241, 1),
                              const Color.fromRGBO(229, 210, 239, 1),
                            ];
                            final Random random = Random();
                            final randomColor =
                                colors[random.nextInt(colors.length)];
                            var transaction =
                                provider.filteredTransactions[index];
                            final Map<String, dynamic> datas = {
                              'narration': transaction.category ?? '',
                              'amount': transaction.amount ?? 0,
                              'balance': transaction.balance ?? '0.00',
                              'mode_from_source':
                                  transaction.modeFromSource ?? 'Unknown',
                              'date': transaction.date ?? 'Unknown',
                              'transaction_timestamp':
                                  transaction.transactionTimestamp ?? '',
                            };
                            return Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: randomColor,
                                border: Border.all(color: black, width: 2),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25.0),
                                ),
                              ),
                              margin: const EdgeInsets.all(12),
                              child: ListTile(
                                leading: provider.getLeadingIcon(
                                    transaction.category,
                                    provider.categoryIcons),
                                title: Text(
                                  "${transaction.narration}",
                                  maxLines: 1,
                                  style: AppTextStyles.largeText,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                ),
                                trailing: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "₹ ${transaction.amount}",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: (transaction.amount ?? 0) < 0
                                            ? red
                                            : green,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(3),
                                      margin: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            234, 240, 240, 2),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          _showTransactionDetails(
                                              context, datas);
                                        },
                                        child: const Text(
                                          'View Details ▼',
                                          style: AppTextStyles.smallText,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    transaction.amount! > 0
                                        ? const Text(
                                            "Incoming Transfers",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    105, 105, 105, 1),
                                                fontWeight: FontWeight.bold),
                                          )
                                        : const Text(
                                            "Outgoing Transfers",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    105, 105, 105, 1),
                                                fontWeight: FontWeight.bold),
                                          ),
                                    const SizedBox(height: 5),
                                    Text(
                                      DateFormat('dd-MM-yyyy')
                                          .format(transaction.date!),
                                      style: TextStyle(
                                          color: indigoAccent,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    else ...[
                      Center(
                        child: Text(
                          "No Transactions available for this month",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            );
          }
        },
      ),
     /* bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.4,
              child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const IncomeScreen()));
                  },
                  icon: const Icon(Icons.analytics,
                      size: 24, color: Colors.white),
                  label: const Text(
                    "Analytics",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  )),
            ),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      ),*/
    );
  }

  void _showFilterOptions(
      BuildContext context, TransactionProvider transactionProvider) async {
    DateTime? selectedDateFrom;
    DateTime? selectedDateTo;

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            Future<void> selectDateFrom(BuildContext context) async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: selectedDateFrom ?? DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
              );
              if (picked != null && picked != selectedDateFrom) {
                setState(() {
                  selectedDateFrom = picked;
                  dateFromController.text =
                      DateFormat('dd MMM yyyy').format(picked);
                });
              }
            }

            Future<void> selectDateTo(BuildContext context) async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: selectedDateTo ?? DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime.now(),
              );
              if (picked != null && picked != selectedDateTo) {
                setState(() {
                  selectedDateTo = picked;
                  dateToController.text =
                      DateFormat('dd MMM yyyy').format(picked);
                });
              }
            }

            return Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "FILTER BY",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(57, 112, 104, 1),
                    ),
                  ),
                  CheckboxListTile(
                    title: const Text(
                      'DEBIT',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    value: transactionProvider.selectedValues.contains('DEBIT'),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          transactionProvider.selectedValues.add('DEBIT');
                        } else {
                          transactionProvider.selectedValues.remove('DEBIT');
                        }
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text(
                      'CREDIT',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    value:
                        transactionProvider.selectedValues.contains('CREDIT'),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          transactionProvider.selectedValues.add('CREDIT');
                        } else {
                          transactionProvider.selectedValues.remove('CREDIT');
                        }
                      });
                    },
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "MODE OF TRANSACTION",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(57, 112, 104, 1),
                    ),
                  ),
                  const SizedBox(height: 5),
                  CheckboxListTile(
                    title: const Text(
                      'UPI',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    value: transactionProvider.selectedValues.contains('UPI'),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          transactionProvider.selectedValues.add('UPI');
                        } else {
                          transactionProvider.selectedValues.remove('UPI');
                        }
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text(
                      'ATM',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    value: transactionProvider.selectedValues.contains('ATM'),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          transactionProvider.selectedValues.add('ATM');
                        } else {
                          transactionProvider.selectedValues.remove('ATM');
                        }
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text(
                      'OTHERS',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    value:
                        transactionProvider.selectedValues.contains('OTHERS'),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          transactionProvider.selectedValues.add('OTHERS');
                        } else {
                          transactionProvider.selectedValues.remove('OTHERS');
                        }
                      });
                    },
                  ),
                  const Text(
                    "DATE FILTER",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(57, 112, 104, 1),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: dateFromController,
                          readOnly: true,
                          onTap: () {
                            selectDateFrom(context);
                          },
                          decoration: const InputDecoration(
                            hintText: "Date From",
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: dateToController,
                          readOnly: true,
                          onTap: () {
                            selectDateTo(context);
                          },
                          decoration: const InputDecoration(
                            hintText: "Date To",
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(57, 112, 104, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      onPressed: () {
                        if (transactionProvider.selectedValues.isNotEmpty) {
                          transactionProvider.applyFilter(
                              selectedDateFrom, selectedDateTo);
                          Navigator.of(context).pop();
                          dateFromController.clear();
                          dateToController.clear();
                          //transactionProvider.resetFilter(dateFromController, dateToController);
                        } else {
                          showSnackBar(
                              'Please select at least one filter option.');
                        }
                      },
                      child: Text(
                        'Apply Filter'.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      onPressed: () {
                        int index=0;
                        setState(() {
                          transactionProvider.resetFilter(
                              dateFromController, dateToController,index);
                          selectedDateFrom = null;
                          selectedDateTo = null;
                        });
                        Navigator.pop(context);
                      },
                      child: Text(
                        'RESET'.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  pickedDate(BuildContext context, TransactionProvider provider,
      [bool isFromInitialStart = false]) async {
    // DateTime startDate = DateTime(2023, 5, 1);

    DateTime? date;

    if (isFromInitialStart) {
      date = DateTime.now();
    } else {
      date = await showMonthPicker(
        context: context,
        initialDate: provider.getDate,
        /* provider.reportDataModel.reportData?.banks?.first.accounts?.first
                    .transactionStartDate ??
                DateTime.now(),*/
        firstDate: provider.reportDataModel.reportData?.banks?.first.accounts
            ?.first.transactionStartDate ??
            DateTime.now(),
        lastDate: provider.reportDataModel.reportData?.banks?.first.accounts
            ?.first.transactionEndDate ??
            DateTime.now(),
      );
    }

    if (date != null) {
      // dateController.text = DateFormat('yyyy-MM-dd').format(date);
      dateController.text = DateFormat('MMMM yyyy').format(date);
      provider.setIncomeExpense(date);
      // provider.setCategoryDatasExpense(date);
    }
    // setState(() {
    //   touchedIndex = null;
    //   touchedPosition = null;
    // });
  }

  void _showTransactionDetails(
      BuildContext context, Map<String, dynamic> transaction) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        DateTime transactionDateTime;
        try {
          transactionDateTime = transaction['transaction_timestamp'];
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
          height: MediaQuery.of(context).size.height * 0.7,
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
                          fontSize: 22,
                          color: Color.fromRGBO(57, 112, 104, 1)),
                    ),
                    const SizedBox(height: 5),
                    transactionContainer(
                      "Transaction To:".toUpperCase(),
                      transaction['narration'] ?? '',
                      Icons.transcribe,
                    ),
                    transactionContainer(
                      "Transaction Type:".toUpperCase(),
                      transaction['amount'] < 0 ? 'DEBIT' : 'CREDIT',
                      getTypeIcon(
                          transaction['amount'] < 0 ? 'DEBIT' : 'CREDIT'),
                    ),
                    transactionContainer(
                      "Amount:".toUpperCase(),
                      "₹ ${transaction['amount']}",
                      Icons.currency_rupee_sharp,
                    ),
                    transactionContainer(
                      "Mode Of Payment:".toUpperCase(),
                      transaction['mode_from_source'] ?? 'Unknown',
                      Icons.payment,
                    ),
                    transactionContainer(
                      "Payment Date:".toUpperCase(),
                      formattedDate,
                      Icons.date_range,
                    ),
                    // transactionContainer(
                    //   "Transaction Time:".toUpperCase(),
                    //   formattedTime,
                    //   Icons.access_time,
                    // ),
                    transactionContainer(
                      "Current Balance:".toUpperCase(),
                      "₹ ${transaction['balance']}",
                      Icons.account_balance_wallet,
                    ),
                    const SizedBox(height: 5),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(57, 112, 104, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'CLOSE',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: white,
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
}
