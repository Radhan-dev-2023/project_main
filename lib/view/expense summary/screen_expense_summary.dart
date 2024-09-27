import 'package:finfresh_mobile/controller/expense%20summary%20controller/expense_summary_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/flushbar.dart';
import 'package:finfresh_mobile/view/expense%20summary/widgets/alert_widget.dart';
import 'package:finfresh_mobile/view/expense%20summary/widgets/screen_webviewforexpense.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FinanceUI extends StatefulWidget {
  const FinanceUI({super.key});

  @override
  _FinanceUIState createState() => _FinanceUIState();
}

class _FinanceUIState extends State<FinanceUI> {
  @override
  void initState() {
    super.initState();
    Provider.of<ExpenseSummaryController>(context, listen: false).monthAsign();
    Provider.of<ExpenseSummaryController>(context, listen: false)
        .changevisibleInInit(true);
    // if (Provider.of<ExpenseSummaryController>(context, listen: false)
    //         .isfetched ==
    //     false) {
    //   // function();
    // } else {
    //   print('Already fetched');
    // }
  }

  void function() async {
    
  }

// void _changeMonth(int months) {
//   setState(() {
//     // Update the selectedDate by adding the number of months
//     int newYear = selectedDate.year;
//     int newMonth = selectedDate.month + months;

//     // Handle year changes when month overflows or underflows
//     if (newMonth > 12) {
//       newYear += (newMonth - 1) ~/ 12;
//       newMonth = newMonth % 12 == 0 ? 12 : newMonth % 12;
//     } else if (newMonth < 1) {
//       newYear += (newMonth ~/ 12) - 1;
//       newMonth = 12 + (newMonth % 12);
//     }

//     selectedDate = DateTime(newYear, newMonth);
//   });
// }

  void _showMonthPicker(
      BuildContext context, ExpenseSummaryController controller) {
    Brightness brightness = Theme.of(context).brightness;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            VerticalSpacer(1.h),
            const Text('Select Month'),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: 12, // 12 months in a year
                itemBuilder: (context, index) {
                  DateTime month =
                      DateTime(controller.selectedYear!, index + 1);
                  String formattedMonth = DateFormat('MMMM yy').format(month);

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0), // Add vertical padding
                    child: ListTile(
                      title: Text(
                        formattedMonth,
                        textAlign: TextAlign.left,
                      ),
                      trailing: Radio<DateTime>(
                        activeColor: brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                        value: month,
                        groupValue: controller.selectedMonth,
                        onChanged: (DateTime? value) {
                          if (value != null) {
                            controller.changeValue(value);
                            controller.filterListBasedonMonth(
                                controller.currentindex,
                                controller.selectedMonth?.month);
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  void _showSortPicker(
      BuildContext context, ExpenseSummaryController controller) {
    Brightness brightness = Theme.of(context).brightness;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            VerticalSpacer(1.h),
            const Text('Sort'),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: 3, // 12 months in a year
                itemBuilder: (context, index) {
                  // DateTime month =
                  //     DateTime(controller.selectedYear!, index + 1);
                  // String formattedMonth = DateFormat('MMMM yy').format(month);

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0), // Add vertical padding
                    child: ListTile(
                      title: Text(
                        controller.sortList[index],
                        textAlign: TextAlign.left,
                      ),
                      trailing: Radio(
                        activeColor: brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                        value: controller.sortList[index],
                        groupValue: controller.intialStringforRadio,
                        onChanged: (value) {
                          if (value != null) {
                            controller.changeofSort(value);

                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  void _showBankList(
      BuildContext context, ExpenseSummaryController controller) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            VerticalSpacer(1.h),
            const Text('Select Bank'),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount:
                    controller.reportSummaryModel?.reportData?.banks?.length ??
                        0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0), // Add vertical padding
                    child: ListTile(
                      onTap: () {
                        controller.changeBank(index);
                        Navigator.pop(context);
                      },
                      title: Text(
                        controller.reportSummaryModel?.reportData?.banks?[index]
                                .bank ??
                            '',
                        textAlign: TextAlign.left,
                      ),
                      subtitle: Text(controller.reportSummaryModel?.reportData
                              ?.banks?[index].accounts?[index].accountNumber ??
                          ''),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseSummaryController>(
        builder: (context, controller, child) {
      return Scaffold(
        // extendBodyBehindAppBar: true,

        body: controller.isLoading
            ? const LoadingWidget()
            : Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/back.png'),
                            fit: BoxFit.fill)),
                    child: controller.isReportLoading
                        ? const LoadingWidget()
                        : controller.reportSummaryModel == null ||
                                controller.listofMonths.isEmpty
                            ? const Center(
                                child: Text(
                                  "No data found for this month",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : SingleChildScrollView(
                                child: Column(
                                  children: [
                                    VerticalSpacer(Adaptive.h(2.5)),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15, top: 15),
                                      child: SizedBox(
                                        height: Adaptive.h(3.5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Expenses',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 19,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                _showMonthPicker(
                                                    context, controller);
                                              },
                                              child: Container(
                                                height: Adaptive.h(4),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.white),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 7, right: 5),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        controller.formattMonth,
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      HorizontalSpacer(
                                                          Adaptive.w(0)),
                                                      const Icon(
                                                        Icons.arrow_drop_down,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: SizedBox(
                                        child: Column(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                _showBankList(
                                                    context, controller);
                                              },
                                              child: SizedBox(
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          controller
                                                                  .reportSummaryModel
                                                                  ?.reportData
                                                                  ?.banks?[0]
                                                                  .bank ??
                                                              '',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        16.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          controller
                                                                  .reportSummaryModel
                                                                  ?.reportData
                                                                  ?.banks?[
                                                                      controller
                                                                          .currentindex]
                                                                  .accounts?[
                                                                      controller
                                                                          .currentindex]
                                                                  .accountNumber ??
                                                              '',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        16.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            VerticalSpacer(Adaptive.h(2)),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  height: Adaptive.h(12),
                                                  width: Adaptive.w(35),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      gradient:
                                                          const LinearGradient(
                                                              colors: [
                                                            Color(0xFF4CAF50),
                                                            Color(0xFFA0EEC0),
                                                          ])),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 15),
                                                          child: Container(
                                                            height:
                                                                Adaptive.h(3),
                                                            width:
                                                                Adaptive.w(8),
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.7)),
                                                            child: Center(
                                                              child: Transform
                                                                  .rotate(
                                                                angle: 4,
                                                                child: Icon(
                                                                  Icons
                                                                      .arrow_upward,
                                                                  color: Colors
                                                                      .white,
                                                                  size: Adaptive
                                                                      .h(2),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      VerticalSpacer(
                                                          Adaptive.h(0.5)),
                                                      SizedBox(
                                                        width: Adaptive.w(30),
                                                        child: Text(
                                                          "Income",
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .bodyMedium!
                                                              .copyWith(
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .white),
                                                          textAlign:
                                                              TextAlign.left,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      VerticalSpacer(
                                                          Adaptive.h(0.5)),
                                                      SizedBox(
                                                        width: Adaptive.w(30),
                                                        child: Text(
                                                          "₹ ${controller.totalincome.abs().toStringAsFixed(0)}",
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .bodyMedium!
                                                              .copyWith(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  height: Adaptive.h(12),
                                                  width: Adaptive.w(35),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      gradient:
                                                          const LinearGradient(
                                                              colors: [
                                                            Color(0xFFF2994A),
                                                            Color(0xFFFBC2A3),
                                                          ])),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 15),
                                                          child: Container(
                                                            height:
                                                                Adaptive.h(3),
                                                            width:
                                                                Adaptive.w(8),
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.7)),
                                                            child: Center(
                                                              child: Icon(
                                                                Icons
                                                                    .arrow_outward,
                                                                color: Colors
                                                                    .white,
                                                                size:
                                                                    Adaptive.h(
                                                                        2),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      VerticalSpacer(
                                                          Adaptive.h(0.5)),
                                                      SizedBox(
                                                        width: Adaptive.w(30),
                                                        child: Text(
                                                          "Expense",
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .bodyMedium!
                                                              .copyWith(
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .white),
                                                          textAlign:
                                                              TextAlign.left,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      VerticalSpacer(
                                                          Adaptive.h(0.5)),
                                                      SizedBox(
                                                        width: Adaptive.w(30),
                                                        child: Text(
                                                          "₹ ${controller.totalExpense.abs().toStringAsFixed(0)}",
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .bodyMedium!
                                                              .copyWith(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            VerticalSpacer(Adaptive.h(2)),
                                            SizedBox(
                                              height: 200,
                                              child: PieChart(
                                                PieChartData(
                                                  sections: [
                                                    PieChartSectionData(
                                                      value: controller
                                                          .totalincome,
                                                      color: const Color(
                                                          0xFF4CAF50), // Color for income
                                                      title:
                                                          "${controller.incomePercentage.toStringAsFixed(1)}%",
                                                      titleStyle:
                                                          const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                    PieChartSectionData(
                                                      value: controller
                                                          .totalExpense,
                                                      color: Color(
                                                          0xFFF2994A), // Color for expenses
                                                      title:
                                                          "${controller.expensePercentage.toStringAsFixed(1)}%",
                                                      titleStyle:
                                                          const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    VerticalSpacer(Adaptive.h(2.5)),
                                    Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            topRight: Radius.circular(30),
                                          ),
                                          color: Colors.white),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Column(
                                          children: [
                                            VerticalSpacer(
                                              Adaptive.h(2.5),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Transactions",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    _showSortPicker(
                                                        context, controller);
                                                  },
                                                  child: Icon(
                                                    Icons.sort,
                                                    size: Adaptive.h(3),
                                                    color: Colors.black,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              child: ListView.separated(
                                                  shrinkWrap: true,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return ListTile(
                                                      leading: controller
                                                          .getCategoryIcon(
                                                              controller
                                                                  .listofMonths[
                                                                      index]
                                                                  .category),
                                                      title: Text(
                                                        controller
                                                            .listofMonths[index]
                                                            .narration,
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      subtitle: Text(
                                                        controller
                                                            .listofMonths[index]
                                                            .transactionTimestamp
                                                            .toString()
                                                            .substring(0, 10),
                                                        style: const TextStyle(
                                                            color: Colors.grey),
                                                      ),
                                                      trailing: Text(
                                                        controller
                                                            .listofMonths[index]
                                                            .amount
                                                            .toString(),
                                                        // '${controller.reportSummaryModel?.reportData?.banks?[controller.currentindex].accounts?[controller.currentindex].transactions?[index].amount ?? 0.0}',
                                                        style: TextStyle(
                                                            fontSize: 19,
                                                            color: (controller
                                                                            .listofMonths[index]
                                                                            .amount ??
                                                                        0) <
                                                                    0
                                                                ? Colors.red
                                                                : Colors.green),
                                                      ),
                                                    );
                                                  },
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          VerticalSpacer(
                                                            Adaptive.h(0.5),
                                                          ),
                                                  itemCount: controller
                                                      .listofMonths.length),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                  ),
                  Visibility(
                      visible: controller.isVisible ?? false,
                      child: Center(child: CustomInputContainer())),
                ],
              ),
      );
    });
  }

  Widget _buildLegendItem(Color color, String text, String percentage) {
    return Row(
      children: [
        Container(width: 10, height: 10, color: color),
        const SizedBox(width: 8),
        Text("$text: $percentage"),
      ],
    );
  }
}

//  Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: GridView.count(
//                   shrinkWrap: true,
//                   crossAxisCount: 2,
//                   childAspectRatio: 5,
//                   children: [
//                     _buildLegendItem(Colors.teal, "Outgoing", "95.3%"),
//                     _buildLegendItem(Colors.pink, "Bills & Utilities", "1.5%"),
//                     _buildLegendItem(Colors.yellow, "ATM Withdrawals", "1.5%"),
//                     _buildLegendItem(Colors.green, "Loans/Credit", "1.3%"),
//                     // Add more items...
//                   ],
//                 ),
//               ),