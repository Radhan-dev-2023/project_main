import 'package:finfresh_mobile/controller/top%20MFs%20controller/top_mfs_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/stock_detail_screen.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TopMfsScreen extends StatelessWidget {
  final String category;
  final String? appbarname;
  const TopMfsScreen({super.key, required this.category, this.appbarname});

  @override
  Widget build(BuildContext context) {
    Provider.of<TopMFsController>(context, listen: false)
        .getTopMfs(context, category);
    return Scaffold(
      appBar:
          AppBar(title: Text(appbarname == null ? 'Top MFs' : '$appbarname')),
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
                Text(
                  'Top Funds',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                VerticalSpacer(2.h),
                // if (category == 'Hybrid: Aggressive')
                //   InkWell(
                //     onTap: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => const StockDetailsScreen(
                //               scheme:
                //                   'Quant Absolute Fund - Growth Option - Regular Plan',
                //               isinNumber: 'INF966L01267'),
                //         ),
                //       );
                //     },
                //     child: const DummyWidget(
                //       productname:
                //           "Quant Absolute Fund - Growth Option - Regular Plan",
                //       fundname: 'Hybrid: Aggressive',
                //       riskometer: 'Very High',
                //       percentage: '25.4%',
                //     ),
                //   )
                // else
                //   const SizedBox(),
                // category == 'Equity: Flexi Cap'
                //     ? InkWell(
                //         onTap: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) => const StockDetailsScreen(
                //                 scheme:
                //                     'JM Flexicap Fund (Regular) - Growth option',
                //                 isinNumber: 'INF192K01635',
                //               ),
                //             ),
                //           );
                //         },
                //         child: const DummyWidget(
                //           productname:
                //               'JM Flexicap Fund (Regular) - Growth option',
                //           fundname: "Equity: Flexi Cap",
                //           riskometer: 'Very High',
                //           percentage: '25.03%',
                //         ),
                //       )
                //     : const SizedBox(),
                // category == 'Equity: Large Cap'
                //     ? InkWell(
                //         onTap: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) => const StockDetailsScreen(
                //                 scheme:
                //                     'Taurus Large Cap Fund - Regular Plan - Growth',
                //                 isinNumber: 'INF044D01773',
                //               ),
                //             ),
                //           );
                //         },
                //         child: const DummyWidget(
                //           productname:
                //               'Taurus Large Cap Fund - Regular Plan - Growth',
                //           fundname: "Equity: Large Cap",
                //           riskometer: 'Very High',
                //           percentage: '15.28%',
                //         ),
                //       )
                // : const SizedBox(),
                // category == 'Equity: Mid Cap'
                //     ? InkWell(
                //         onTap: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) => const StockDetailsScreen(
                //                 scheme:
                //                     'ITI Mid Cap Fund - Regular Plan - Growth Option',
                //                 isinNumber: 'INF00XX01895',
                //               ),
                //             ),
                //           );
                //         },
                //         child: const DummyWidget(
                //           productname:
                //               'ITI Mid Cap Fund - Regular Plan - Growth Option',
                //           fundname: "Equity: Mid Cap",
                //           riskometer: 'Very High',
                //           percentage: '0.0%',
                //         ),
                //       )
                //     : const SizedBox(),
                // category == 'Equity: Multi Cap'
                //     ? InkWell(
                //         onTap: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) => const StockDetailsScreen(
                //                 scheme:
                //                     'Kotak Multicap Fund-Regular Plan-Growth',
                //                 isinNumber: 'INF174KA1HS9',
                //               ),
                //             ),
                //           );
                //         },
                //         child: const DummyWidget(
                //           productname:
                //               'Kotak Multicap Fund-Regular Plan-Growth',
                //           fundname: "Equity: Multi Cap",
                //           riskometer: 'Very High',
                //           percentage: '0.0%',
                //         ),
                //       )
                //     : const SizedBox(),
                // category == 'Equity: Small Cap'
                //     ? InkWell(
                //         onTap: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) => const StockDetailsScreen(
                //                 scheme:
                //                     'Quant Small Cap Fund - Growth - Regular Plan',
                //                 isinNumber: 'INF966L01AA0',
                //               ),
                //             ),
                //           );
                //         },
                //         child: const DummyWidget(
                //           productname:
                //               'Quant Small Cap Fund - Growth - Regular Plan',
                //           fundname: "Equity: Small Cap",
                //           riskometer: 'Very High',
                //           percentage: '44.55%',
                //         ),
                //       )
                //     : const SizedBox(),
                VerticalSpacer(2.h),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
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
                                        const Text('3 year Return'),
                                        Text(
                                            '${topMfsController.topPerformingMutualFundModel?.list?[index].returnsCmp3Year}%')
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
                    itemCount: 5,
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

class DummyWidget extends StatelessWidget {
  final String productname;
  final String fundname;
  final String riskometer;
  final String percentage;

  const DummyWidget({
    super.key,
    required this.productname,
    required this.fundname,
    required this.riskometer,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10.sp),
        child: Column(
          children: [
            Row(
              children: [
                // SizedBox(
                //   height: 5.h,
                //   width: 15.w,
                //   child: Image.network(
                //     topMfsController
                //             .topPerformingMutualFundModel
                //             ?.list?[index]
                //             .logo ??
                //         '',
                //     errorBuilder: (context, error, stackTrace) {
                //       return const SizedBox();
                //     },
                //   ),
                // ),
                HorizontalSpacer(5.w),
                Expanded(
                  child: Text(
                    productname,
                    overflow: TextOverflow.visible,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
            VerticalSpacer(2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    fundname,
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
                      riskometer,
                      style: TextStyle(color: Colors.red),
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
                    const Text('3 year Return'),
                    Text(percentage),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
