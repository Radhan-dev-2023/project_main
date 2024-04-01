import 'package:finfresh_mobile/controller/top%20MFs%20controller/top_mfs_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/stock_detail_screen.dart';
import 'package:finfresh_mobile/view/top%20mfs/widget/duration_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenAllMutualFund extends StatelessWidget {
  const ScreenAllMutualFund({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mutual Funds')),
      body: Container(
        margin: EdgeInsets.all(15.sp),
        child: Consumer<TopMFsController>(
            builder: (context, topMfsController, child) {
          if (topMfsController.loading == true) {
            return const LoadingWidget();
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${topMfsController.topPerformingMutualFundModel?.list?.length ?? 0} SCHEMES',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16.sp,
                          ),
                    ),
                    const DurationButton(
                      category: 'All',
                    )
                  ],
                ),
                VerticalSpacer(2.h),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      topMfsController.returnValue(index);
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StockDetailsScreen(
                                scheme:
                                    '${topMfsController.topPerformingMutualFundModel?.list?[index].schemeAmfi}',
                                isinNumber: topMfsController
                                        .topPerformingMutualFundModel
                                        ?.list?[index]
                                        .isinNo ??
                                    '',
                                category: topMfsController
                                        .topPerformingMutualFundModel
                                        ?.list?[index]
                                        .schemeCategory ??
                                    "",
                              ),
                            ),
                          );
                        },
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(10.sp),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 5.h,
                                      width: 15.w,
                                      child: Image.network(
                                        topMfsController
                                                .topPerformingMutualFundModel
                                                ?.list?[index]
                                                .logo ??
                                            '',
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const SizedBox();
                                        },
                                      ),
                                    ),
                                    HorizontalSpacer(5.w),
                                    Expanded(
                                      child: Text(
                                        '${topMfsController.topPerformingMutualFundModel?.list?[index].schemeAmfi}',
                                        overflow: TextOverflow.visible,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                VerticalSpacer(2.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        topMfsController
                                                .topPerformingMutualFundModel
                                                ?.list?[index]
                                                .schemeCategory ??
                                            "",
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(
                                          10.sp,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.sp),
                                        child: Text(
                                          '${topMfsController.topPerformingMutualFundModel?.list?[index].riskometer}',
                                          style: TextStyle(
                                              color: topMfsController
                                                              .topPerformingMutualFundModel
                                                              ?.list?[index]
                                                              .riskometer ==
                                                          'Very High' ||
                                                      topMfsController
                                                              .topPerformingMutualFundModel
                                                              ?.list?[index]
                                                              .riskometer ==
                                                          'High'
                                                  ? Colors.red
                                                  : Colors.amber),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                VerticalSpacer(2.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                            '${topMfsController.returns} return'),
                                        Text(
                                            '${topMfsController.returnPercentage}%')
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => VerticalSpacer(1.h),
                    itemCount: topMfsController
                            .topPerformingMutualFundModel?.list?.length ??
                        0,
                  ),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
