import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/holding%20screen/screen_holdings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PortFolioMutualFund extends StatelessWidget {
  const PortFolioMutualFund({
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
        width: MediaQuery.of(context).size.width,
        child: Card(
          // color: Color.fromARGB(255, 235, 245, 247),
          elevation: 6,
          // surfaceTintColor: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Consumer<DashBoardController>(
                builder: (context, dashBoardController, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mutual Funds Portfolio',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  VerticalSpacer(2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Net Investment'),
                          VerticalSpacer(1.h),
                          // const Text('Net Debt Gain'),
                          // VerticalSpacer(1.h),
                          const Text('Net Equity Gain'),
                          VerticalSpacer(1.h),
                          const Text('Total'),
                          // VerticalSpacer(1.h),
                          // const Text('Growth'),
                          VerticalSpacer(1.h),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              ' ${dashBoardController.summaryModel?.result?.netInvestment ?? ''}'),
                          VerticalSpacer(1.h),
                          // Text(
                          //     '₹ ${dashBoardController.summaryModel?.result?.netDebtGains ?? ''}'),
                          // VerticalSpacer(1.h),
                          Text(
                              ' ${dashBoardController.summaryModel?.result?.netEquityGains ?? ''}'),
                          VerticalSpacer(1.h),
                          Text(dashBoardController
                                  .summaryModel?.result?.totalAmount ??
                              ''),
                          // VerticalSpacer(1.h),
                          // Text(
                          //   dashBoardController.summaryModel
                          //           ?.result?.growth
                          //           .toString() ??
                          //       '',
                          // ),
                          VerticalSpacer(1.h),
                        ],
                      )
                    ],
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
