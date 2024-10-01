import 'dart:math';

import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:finfresh_mobile/aggregator/Screens/provider_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:provider/provider.dart';

import '../Helpers/colors.dart';
import '../Helpers/snackBar.dart';
import '../Helpers/spacing.dart';
import '../Model/report.dart';
import '../widgets/custom_container.dart';
import 'expense_screen.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({super.key});

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  late DateTime _dateTime;
  int defaultIndex = 0;

  TextEditingController dateController = TextEditingController();
  int? touchedIndex;
  Offset? touchedPosition;
  int index = 0;
  String trimCategoryName = '';
  final List<bool> selected = [true, false];

  void onChartTap(int index, Offset position) {
    setState(() {
      touchedIndex = index;
      touchedPosition = position;
    });
  }

  @override
  void initState() {
    super.initState();
    _dateTime =
        Provider.of<TransactionProvider>(context, listen: false).dateTime;
    dateController.text = DateFormat('MMMM yyyy').format(_dateTime);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pickedDate(
        context,
        Provider.of<TransactionProvider>(context, listen: false),
        true,
      );
    });
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   pickedDates(
    //     context,
    //     Provider.of<TransactionProvider>(context, listen: false),
    //     true,
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    var spacing = const SizedBox(height: 40);
    return Scaffold(
        appBar: AppBar(
          actions: [

            InkWell(
              onTap: (){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const ExpenseScreen()));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    "Expense Chart",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
          ],
          title: Text(
            "Income Chart".toUpperCase(),
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(child:
            Consumer<TransactionProvider>(builder: (context, provider, child) {
          if (provider.isReportLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IntrinsicWidth(
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {
                            pickedDate(context, provider);
                            // pickedDates(context, provider);
                          },
                          child: const Icon(
                            Icons.arrow_drop_down_circle_outlined,
                            color: Color.fromRGBO(57, 112, 104, 1),
                          ),
                        ),
                        hintText:
                            DateFormat('MMMM yyyy').format(provider.dateTime),
                        hintStyle: const TextStyle(
                            color: Color.fromRGBO(57, 112, 104, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFedf0f8), width: 2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        filled: true,
                        fillColor: const Color(0xFFedf0f8),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 8,
                        ),
                      ),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(57, 112, 104, 1),
                      ),
                      controller: dateController,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  if (provider.calenderRangeTransactionDate.isNotEmpty) ...[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        if (provider.categoryEntries
                            .any((entry) => entry.value > 0)) ...[
                          EasyPieChart(
                            key: const Key('chart'),
                            children: provider.categoryEntries
                                .where((entry) => entry.value > 0)
                                .where((entry) {
                                  final totalValue = provider.categoryEntries
                                      .where((e) => e.value > 0)
                                      .fold(0.0, (sum, e) => sum + e.value);

                                  final percentage =
                                      (entry.value / totalValue) * 100;
                                  // Return entries with percentage > 0
                                  return percentage > 0.0;
                                })
                                .map((entry) => PieData(
                                      value: entry.value,
                                      color: provider.getColorForEntry(
                                          entry: entry, isFromIncome: true),
                                    ))
                                .toList(),
                            borderWidth: 70,
                            showValue: false,
                            animateFromEnd: true,
                            borderEdge: StrokeCap.butt,
                            pieType: PieType.crust,
                            onTap: (index) {
                              touchedIndex = index;
                              provider.onSelectCategoryItem(
                                index: index,
                                selectedCategory:
                                    provider.categoryEntries[index].key,
                              );
                              setState(() {});
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
                                color: touchedIndex != null &&
                                        touchedIndex! <
                                            provider.categoryEntries.length
                                    ? provider.getColorForEntry(
                                        entry: provider.categoryEntries
                                            .elementAt(touchedIndex!),
                                        isFromIncome: true)
                                    : const Color.fromRGBO(242, 242, 242, 1),
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    touchedIndex != null
                                        ? provider
                                            .formatCategoryName(provider
                                                .categoryEntries
                                                .elementAt(touchedIndex!)
                                                .key)
                                            .toUpperCase()
                                        : "ACTIVE",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    touchedIndex != null &&
                                            touchedIndex! <
                                                provider.categoryEntries.length
                                        ? "₹ ${provider.selectedCategoryNameTotalAmount.toStringAsFixed(0)}"
                                        : "INCOMING\nTransfers",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ] else ...[
                          const Center(
                            child: Text(
                              "No income available",
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
                    spacing,
                    spacing,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          alignment: WrapAlignment.start,
                          runSpacing: 15.0,
                          spacing: MediaQuery.of(context).size.width * 0.042,
                          children: List.generate(
                            (provider.showAll == false)
                                ? provider.categoryEntries.take(10).length
                                : provider.categoryEntries.length,
                            (int index) {
                              final entry = provider.categoryEntries[index];
                              String category = entry.key;
                              String categoryName = category;
                              if (category.startsWith('Transfer to')) {
                                categoryName = category
                                    .replaceFirst('Transfer to', '')
                                    .trim();
                              } else if (category.startsWith('Transfer from')) {
                                categoryName = category
                                    .replaceFirst('Transfer from', '')
                                    .trim();
                              }

                              int percentage = entry.value.truncate() > 0
                                  ? entry.value.truncate()
                                  : 0;

                              if (percentage <= 0) {
                                return const SizedBox.shrink();
                              }

                              return GestureDetector(
                                onTap: () {
                                  touchedIndex = index;
                                  provider.onSelectCategoryItem(
                                    index: index,
                                    selectedCategory: entry.key,
                                  );
                                  setState(() {});
                                },
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1 - 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                        decoration: BoxDecoration(
                                          color: provider.getColorForEntry(
                                              entry: entry, isFromIncome: true),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                      ),
                                      Expanded(
                                        child: Text(
                                          categoryName.toUpperCase(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.brown),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                      ),
                                      Text(
                                        "$percentage %",
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(45, 45, 45, 1),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "FILTER BY CATEGORIES",
                          style: style,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                          onPressed: () {
                            _showFilterOptionsForIncome(context);
                          },
                          icon: const Icon(
                            Icons.filter_alt,
                            size: 32,
                          ),
                        )
                      ],
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: provider.calenderRangeTransactionDate.length,
                        itemBuilder: (context, index) {
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
                          AccountTransaction transaction =
                              provider.calenderRangeTransactionDate[index];

                          return (transaction.amount ?? 0) > 0
                              ? Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: randomColor,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.8,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        bottomRight: Radius.circular(25.0)),
                                  ),
                                  margin: const EdgeInsets.all(12),
                                  child: ListTile(
                                    leading: provider.getLeadingIcon(
                                        transaction.category,
                                        provider.categoryIcons),
                                    title: Text(
                                      "${transaction.narration}",
                                      style: style,
                                      maxLines: 1,
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
                                                ? Colors.red
                                                : Colors.green,
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(3),
                                          margin: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                234, 240, 240, 2),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              provider.showTransactionDetails(
                                                  context,
                                                  transaction,
                                                  provider);
                                            },
                                            child: Text('View Details ▼',
                                                style: styles),
                                          ),
                                        ),
                                      ],
                                    ),
                                    subtitle: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Flexible(
                                              child: Text(
                                                transaction.category ?? '',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start,
                                                style: const TextStyle(
                                                  color: Color.fromRGBO(
                                                      105, 105, 105, 1),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            GestureDetector(
                                              onTap: () {},
                                              child: const Icon(
                                                Icons.edit,
                                                color: Colors.grey,
                                                size: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          "${transaction.date != null ? DateFormat('dd-MM-yyyy').format(transaction.date!) : transaction.date}",
                                          style: const TextStyle(
                                              color: Colors.indigoAccent,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Container();
                        }),
                    const SizedBox(
                      height: 12,
                    ),
                  ] else ...[
                    Column(
                      children: [
                        const SizedBox(height: 300),
                        Text(
                          "No Income available for this Month",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: red),
                        ),
                      ],
                    )
                  ]
                ],
              ),
            );
          }
        })));
  }

  pickedDate(BuildContext context, TransactionProvider provider,
      [bool isFromInitialStart = false]) async {
    // DateTime startDate = DateTime(2023, 5, 1);

    DateTime? date;

    if (isFromInitialStart) {
      date = provider.getDate;
    } else {
      date = await showMonthPicker(
        context: context,
        initialDate: provider.getDate,
        /* provider.reportDataModel.reportData?.banks?.first.accounts
                ?.first.transactionStartDate ??
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
      provider.setCategoryDatas(date);
      // provider.setCategoryDatasExpense(date);
    }
    // setState(() {
    //   touchedIndex = null;
    //   touchedPosition = null;
    // });
  }

  void _showFilterOptionsForIncome(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Select Category',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Consumer<TransactionProvider>(
                    builder: (context, provider, child) {
                      return Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: provider.categoryEntries.length,
                          itemBuilder: (BuildContext context, int index) {
                            String category =
                                provider.categoryEntries[index].key;
                            return RadioListTile<String>(
                              title: Text(
                                category,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              value: category,
                              groupValue: provider.selectedCategory,
                              onChanged: (String? value) {
                                setState(() {
                                  provider.selectedCategory = value;
                                  print("Selected Category: $value");
                                });
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Consumer<TransactionProvider>(
                      builder: (context, provider, child) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(57, 112, 104, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                          onPressed: () {
                            if (provider.selectedCategory != null) {
                              // Apply the selected category filter
                              provider.applyCategoryFilter(
                                categoryNameFromServer:
                                    provider.selectedCategory!,
                                isFromCategoryIncome: true,
                              );
                              print(
                                  "Filter applied for category: ${provider.selectedCategory}");

                              // Close the bottom sheet
                              Navigator.pop(context);
                            } else {
                              showSnackBar(
                                  "Please select a category to apply filter.");
                            }
                          },
                          child: const Text(
                            'Apply Filter',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
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
}
