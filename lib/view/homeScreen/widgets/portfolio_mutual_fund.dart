import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/holding%20screen/screen_holdings.dart';
import 'package:finfresh_mobile/view/homeScreen/widgets/roundchart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PortfolioWidget extends StatelessWidget {
  const PortfolioWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Brightness platformBrightness = MediaQuery.of(context).platformBrightness;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ScreenHoldings(),
          ),
        );
      },
      child: SizedBox(
        height: 40.h,
        width: double.infinity,
        child: Consumer<DashBoardController>(
            builder: (context, dashBoardController, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // VerticalSpacer(7.h),
              const RoundChartWidget(),
              VerticalSpacer(8.h),
              Text(
                dashBoardController.indexForButtonForGraph == 0
                    ? dashBoardController.summaryModel?.result?.totalAmount ??
                        ''
                    : dashBoardController.indexForButtonForGraph == 1
                        ? dashBoardController
                                .summaryModel?.result?.gold?.totalAmount ??
                            ''
                        : dashBoardController.indexForButtonForGraph == 2
                            ? dashBoardController.summaryModel?.result?.silver
                                    ?.totalAmount ??
                                ''
                            : 'No Data Available',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              VerticalSpacer(2.h),
              Padding(
                padding: EdgeInsets.all(12.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Investment Amount',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(),
                        ),
                        VerticalSpacer(1.h),
                        Text(
                          dashBoardController.indexForButtonForGraph == 0
                              ? dashBoardController
                                      .summaryModel?.result?.netInvestment ??
                                  ''
                              : dashBoardController.indexForButtonForGraph == 1
                                  ? dashBoardController.summaryModel?.result
                                          ?.gold?.totalInvested ??
                                      ''
                                  : dashBoardController
                                              .indexForButtonForGraph ==
                                          2
                                      ? dashBoardController.summaryModel?.result
                                              ?.silver?.totalInvested ??
                                          ''
                                      : 'No Data Available',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFFFFC700),
                                  ),
                        ),
                      ],
                    ),
                    // HorizontalSpacer(5.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Gain',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(),
                        ),
                        VerticalSpacer(1.h),
                        Text(
                          dashBoardController.indexForButtonForGraph == 0
                              ? dashBoardController
                                      .summaryModel?.result?.netEquityGains ??
                                  ''
                              : dashBoardController.indexForButtonForGraph == 1
                                  ? dashBoardController.summaryModel?.result
                                          ?.gold?.totalGain!
                                          .toStringAsFixed(2) ??
                                      ''
                                  : dashBoardController
                                              .indexForButtonForGraph ==
                                          2
                                      ? dashBoardController.summaryModel?.result
                                              ?.silver?.totalGain!
                                              .toStringAsFixed(2) ??
                                          ''
                                      : 'No Data Available',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF6C8FF8),
                                  ),
                        ),
                      ],
                    ),
                    // HorizontalSpacer(7.5.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Amount',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(),
                        ),
                        VerticalSpacer(1.h),
                        Text(
                          dashBoardController.indexForButtonForGraph == 0
                              ? dashBoardController
                                      .summaryModel?.result?.totalAmount ??
                                  ''
                              : dashBoardController.indexForButtonForGraph == 1
                                  ? dashBoardController.summaryModel?.result
                                          ?.gold?.totalAmount ??
                                      ''
                                  : dashBoardController
                                              .indexForButtonForGraph ==
                                          2
                                      ? dashBoardController.summaryModel?.result
                                              ?.silver?.totalAmount ??
                                          ''
                                      : 'No Data Available',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                // color: const Color(0xFF324053),
                                color: platformBrightness == Brightness.dark
                                    ? const Color.fromARGB(255, 211, 226, 248)
                                    : const Color(0xFF324053),
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(0),
              //   child: Row(
              //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       HorizontalSpacer(3.w),
              //       Text(
              //         dashBoardController.summaryModel?.result?.netInvestment ??
              //             '',
              //         style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              //               fontWeight: FontWeight.bold,
              //               color: const Color(0xFFFFC700),
              //             ),
              //       ),
              //       HorizontalSpacer(21.5.w),
              //       Text(
              //         dashBoardController
              //                 .summaryModel?.result?.netEquityGains ??
              //             '',
              //         style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              //               fontWeight: FontWeight.bold,
              //               color: const Color(0xFF6C8FF8),
              //             ),
              //       ),
              //       HorizontalSpacer(10.w),
              //       Text(
              //         dashBoardController.summaryModel?.result?.totalAmount ??
              //             '',
              //         style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              //               fontWeight: FontWeight.bold,
              //               // color: const Color(0xFF324053),
              //               color: platformBrightness == Brightness.dark
              //                   ? const Color.fromARGB(255, 211, 226, 248)
              //                   : const Color(0xFF324053),
              //             ),
              //       ),
              //     ],
              //   ),
              // )
            ],
          );
        }),
      ),
    );
  }
}
