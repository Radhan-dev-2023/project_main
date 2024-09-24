import 'package:finfresh_mobile/controller/expense%20summary%20controller/expense_summary_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/flushbar.dart';
import 'package:finfresh_mobile/view/expense%20summary/widgets/screen_webviewforexpense.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
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
    function();
  }

  void function() async {
    String? url =
        await Provider.of<ExpenseSummaryController>(context, listen: false)
            .generateUrl(context);
    print('----------->>>>>url $url');
    if (url != null) {
      showFlushbar(context, 'You will need to complete Digitap Verification');

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ScreenWebviewForExpense(url: url)),
      );
    } else {
      showFlushbar(context, "Failed to Digitap Verification");
    }
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
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            VerticalSpacer(1.h),
            Text('Select Month'),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10.0),
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
                        activeColor: Colors.black,
                        value: month,
                        groupValue: controller.selectedMonth,
                        onChanged: (DateTime? value) {
                          if (value != null) {
                            controller.changeValue(value);
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
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            VerticalSpacer(1.h),
            Text('Sort'),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10.0),
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
                        activeColor: Colors.black,
                        value: controller.intialStringforRadio,
                        groupValue: controller.sortList,
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

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseSummaryController>(
        builder: (context, controller, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Expenses'),
          actions: [
            GestureDetector(
              onTap: () {
                _showMonthPicker(context, controller);
              },
              child: Container(
                height: Adaptive.h(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 7, right: 5),
                  child: Row(
                    children: [
                      Text(controller.formattMonth),
                      HorizontalSpacer(Adaptive.w(0)),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
            ),
            HorizontalSpacer(Adaptive.w(5))
          ],
        ),
        body: controller.isLoading
            ? const LoadingWidget()
            : Container(
                margin: EdgeInsets.all(15.sp),
                child: Column(
                  children: [
                    // Date Picker Row
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       IconButton(
                    //         icon: Icon(Icons.arrow_left),
                    //         onPressed: () =>
                    //             _changeMonth(-1), // Decrease the date by 1 day
                    //       ),

                    //       // Date Button with Calendar Icon
                    //       ElevatedButton.icon(
                    //         onPressed: () {},
                    //         icon: Icon(Icons.calendar_today),
                    //         label: Text(monthFormat
                    //             .format(selectedDate)), // Display formatted date
                    //       ),

                    //       // Right arrow
                    //       IconButton(
                    //         icon: Icon(Icons.arrow_right),
                    //         onPressed: () =>
                    //             _changeMonth(1), // Increase the date by 1 day
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Circular Chart
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Axis Bank',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          'Balance',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'xxxxx035',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          '₹ 1008',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    VerticalSpacer(1.h),
                    SizedBox(
                      height: 200,
                      child: PieChart(
                        PieChartData(
                          sections: [
                            PieChartSectionData(
                                value: 95.3,
                                color: Colors.teal,
                                title: "95.3%"),
                            PieChartSectionData(
                                value: 1.5, color: Colors.pink, title: "1.5%"),
                            PieChartSectionData(
                                value: 1.5,
                                color: Colors.yellow,
                                title: "1.5%"),
                            PieChartSectionData(
                                value: 1.3, color: Colors.green, title: "1.3%"),
                          ],
                        ),
                      ),
                    ),
                    VerticalSpacer(Adaptive.h(2)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Income",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          "Expense",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "₹ 1234567",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          "₹ 123456",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    VerticalSpacer(Adaptive.h(2)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Transactions",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _showSortPicker(context, controller);
                          },
                          child: Icon(
                            Icons.sort,
                            size: Adaptive.h(3),
                          ),
                        )
                      ],
                    ),
                    VerticalSpacer(Adaptive.h(2)),
                    SizedBox(
                      height: Adaptive.h(42),
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return ListTile(
                              // tileColor: Colors.white,
                              leading: Icon(Icons.person),
                              title: Text('Expense Name ${index + 1}'),
                              subtitle: Text(
                                '24/Sept/2024',
                                style: TextStyle(color: Colors.grey),
                              ),
                              trailing: Text('₹100${index + 1}'),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              VerticalSpacer(Adaptive.h(1)),
                          itemCount: 10),
                    ),
                  ],
                ),
              ),
      );
    });
  }

  Widget _buildLegendItem(Color color, String text, String percentage) {
    return Row(
      children: [
        Container(width: 10, height: 10, color: color),
        SizedBox(width: 8),
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