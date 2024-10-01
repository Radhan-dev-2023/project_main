import 'dart:developer';

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
      if (dashBoardController.indexForButtonForGraph == 0) {
        dashBoardController.totalAmount = double.parse(dashBoardController
            .summaryModel!.result!.totalAmount!
            .replaceAll('₹', '')
            .replaceAll(',', ''));
        dashBoardController.gain = double.parse(dashBoardController
            .summaryModel!.result!.netEquityGains!
            .replaceAll('₹', '')
            .replaceAll(',', ''));
        dashBoardController.invest = double.parse(dashBoardController
            .summaryModel!.result!.netInvestment!
            .replaceAll('₹', '')
            .replaceAll(',', ''));
        // double total = double.parse(dashBoardController
        //     .summaryModel!.result!.totalAmount!
        //     .replaceAll('₹', '')
        //     .replaceAll(',', ''));
        // dynamic percentage = (gain / invest) * 100;
        dashBoardController.percetageforinvest =
            (dashBoardController.invest / dashBoardController.totalAmount) *
                100;
        dashBoardController.prectageForGain =
            (dashBoardController.gain / dashBoardController.totalAmount) * 100;

        // log('percetageforinvest :$percetageforinvest,$prectageForGain ');
        bool isLoss = dashBoardController.prectageForGain < 0;
        if (isLoss) {
          dashBoardController.prectageForGain = 0.0;
        }
      } else if (dashBoardController.indexForButtonForGraph == 1) {
        dashBoardController.totalAmount = double.parse(dashBoardController
            .summaryModel!.result!.gold!.totalAmount!
            .replaceAll(',', ''));
        dashBoardController.gain =
            dashBoardController.summaryModel!.result!.gold!.totalGain!;

        dashBoardController.invest = double.parse(dashBoardController
            .summaryModel!.result!.gold!.totalInvested!
            .replaceAll(',', ''));
        // double total = double.parse(dashBoardController
        //     .summaryModel!.result!.totalAmount!
        //     .replaceAll('₹', '')
        //     .replaceAll(',', ''));
        // dynamic percentage = (gain / invest) * 100;
        dashBoardController.percetageforinvest =
            (dashBoardController.invest / dashBoardController.totalAmount) *
                100;
        dashBoardController.prectageForGain =
            (dashBoardController.gain / dashBoardController.totalAmount) * 100;

        // log('percetageforinvest :$percetageforinvest,$prectageForGain ');
        bool isLoss = dashBoardController.prectageForGain < 0;
        if (isLoss) {
          dashBoardController.prectageForGain = 0.0;
        }
      } else if (dashBoardController.indexForButtonForGraph == 2) {
        dashBoardController.totalAmount = double.parse(dashBoardController
            .summaryModel!.result!.silver!.totalAmount!
            .replaceAll(',', ''));
        dashBoardController.gain =
            dashBoardController.summaryModel!.result!.silver!.totalGain!;

        dashBoardController.invest = double.parse(dashBoardController
            .summaryModel!.result!.silver!.totalInvested!
            .replaceAll(',', ''));

        dashBoardController.percetageforinvest =
            (dashBoardController.invest / dashBoardController.totalAmount) *
                100;
        dashBoardController.prectageForGain =
            (dashBoardController.gain / dashBoardController.totalAmount) * 100;

        log('percetageforinvest :${dashBoardController.percetageforinvest},${dashBoardController.prectageForGain}');
        bool isLoss = dashBoardController.prectageForGain < 0;
        if (isLoss) {
          dashBoardController.prectageForGain = 0.0;
        }
      }
      // dynamic totelper = (total / totalAmount) * 100;
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.sp, right: 15.sp, top: 15.sp),
            child: SizedBox(
              height: 50,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 0,
                  sections: [
                    PieChartSectionData(
                      value: dashBoardController.percetageforinvest,
                      title:
                          '${dashBoardController.percetageforinvest.toStringAsFixed(2)}%',
                      // color: const Color(0xFFFFC700),
                      // color: const Color(0xFF4A90E2),
                      color: dashBoardController.graphColor,
                      radius: 40,
                      titleStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    PieChartSectionData(
                      // showTitle: false,
                      value: dashBoardController.prectageForGain,
                      title:
                          '${dashBoardController.prectageForGain.toStringAsFixed(2)}%',
                      // color: const Color(0xFF6C8FF8),
                      color: const Color(0xFF4CAF50),
                      radius: 40,
                      titleStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
