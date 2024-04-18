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
        child: Card(
          child: Consumer<DashBoardController>(
              builder: (context, dashBoardController, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                VerticalSpacer(7.h),
                const RoundChartWidget(),
                VerticalSpacer(8.h),
                Text(
                  dashBoardController.summaryModel?.result?.totalAmount ?? '',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                VerticalSpacer(1.h),
                Padding(
                  padding: EdgeInsets.all(12.sp),
                  child: Row(
                    children: [
                      Text(
                        'Investment Amount',
                        style:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(),
                      ),
                      HorizontalSpacer(5.w),
                      Text(
                        'Total Gain',
                        style:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(),
                      ),
                      HorizontalSpacer(7.5.w),
                      Text(
                        'Total Amount',
                        style:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    children: [
                      HorizontalSpacer(3.w),
                      Text(
                        dashBoardController
                                .summaryModel?.result?.netInvestment ??
                            '',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFFFC700),
                            ),
                      ),
                      HorizontalSpacer(20.w),
                      Text(
                        dashBoardController
                                .summaryModel?.result?.netEquityGains ??
                            '',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF6C8FF8),
                            ),
                      ),
                      HorizontalSpacer(11.5.w),
                      Text(
                        dashBoardController.summaryModel?.result?.totalAmount ??
                            '',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF324053),
                            ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
