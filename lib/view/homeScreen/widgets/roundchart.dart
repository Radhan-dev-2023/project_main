import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RoundChartWidget extends StatelessWidget {
  const RoundChartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final LinearGradient gradientColors = LinearGradient(
    //   colors: color,
    // );
    // Brightness brightness = Theme.of(context).brightness;

    //     .getChartValue(context, scheme);
    // final schemeController = Provider.of<SchemeDetailsController>(context);

    return Consumer<DashBoardController>(
        builder: (context, dashBoardController, child) {
      double totalAmount = double.parse(dashBoardController
          .summaryModel!.result!.totalAmount!
          .replaceAll('₹', '')
          .replaceAll(',', ''));
      double gain = double.parse(dashBoardController
          .summaryModel!.result!.netEquityGains!
          .replaceAll('₹', '')
          .replaceAll(',', ''));
      double invest = double.parse(dashBoardController
          .summaryModel!.result!.netInvestment!
          .replaceAll('₹', '')
          .replaceAll(',', ''));
      // double total = double.parse(dashBoardController
      //     .summaryModel!.result!.totalAmount!
      //     .replaceAll('₹', '')
      //     .replaceAll(',', ''));
      // dynamic percentage = (gain / invest) * 100;
      dynamic percetageforinvest = (invest / totalAmount) * 100;
      dynamic prectageForGain = (gain / totalAmount) * 100;
      // dynamic totelper = (total / totalAmount) * 100;
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.sp, right: 15.sp, top: 15.sp),
            child: SizedBox(
              height: 5.h,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 0,
                  sections: [
                    PieChartSectionData(
                      value: percetageforinvest,
                      title: '${percetageforinvest.toStringAsFixed(2)}%',
                      color: const Color(0xFFFFC700),
                      radius: 40,
                      titleStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    PieChartSectionData(
                      // showTitle: false,
                      value: prectageForGain,
                      title: '${prectageForGain.toStringAsFixed(2)}%',
                      color: const Color(0xFF6C8FF8),
                      radius: 40,
                      titleStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // PieChartSectionData(
                    //   // showTitle: false,
                    //   value: totelper,
                    //   title: '${totelper.toStringAsFixed(2)}%',
                    //   color: const Color(0xFF324053),
                    //   radius: 40,
                    //   titleStyle: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 14.sp,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),

                    // PieChartSectionData(
                    //   value: double.parse(dashBoardController
                    //       .summaryModel!.result!.netEquityGains!
                    //       .replaceAll('₹', '')
                    //       .replaceAll(',', '')),
                    //   color: Colors.amber,
                    // ),
                  ],
                  centerSpaceRadius: 50,
                ),
              ),
            ),
          ),
          VerticalSpacer(3.h),
        ],
      );
    });
  }

  //  List<Color> getColorList(List<NavDetails> data) {
  //   List<Color> colors = [];
  //   for (int i = 0; i < data.length - 1; i++) {
  //     if (data[i] < data[i + 1]) {
  //       colors.add(Colors.green);
  //     } else {
  //       colors.add(Colors.red);
  //     }
  //   }
  //   // The last color can be any color you want
  //   colors.add(Colors.green);
  //   return colors;
  // }
}
