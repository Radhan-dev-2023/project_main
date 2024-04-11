import 'package:finfresh_mobile/controller/top%20MFs%20controller/top_mfs_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/stock_detail_screen.dart';
import 'package:finfresh_mobile/view/top%20mfs/widget/duration_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TopMfsScreen extends StatefulWidget {
  final String category;
  final String? appbarname;
  const TopMfsScreen({super.key, required this.category, this.appbarname});

  @override
  State<TopMfsScreen> createState() => _TopMfsScreenState();
}

class _TopMfsScreenState extends State<TopMfsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TopMFsController>(context, listen: false).lodingList = false;
    Provider.of<TopMFsController>(context, listen: false).returns = '3 year';
    Provider.of<TopMFsController>(context, listen: false).returntoBackend =
        '3y';
    Provider.of<TopMFsController>(context, listen: false)
        .getTopMfs(context, widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              widget.appbarname == null ? 'Top MFs' : '${widget.appbarname}')),
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
                      'Top Funds',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    DurationButton(
                      category: widget.category,
                    )
                  ],
                ),
                VerticalSpacer(2.h),
                Expanded(
                  child: topMfsController.lodingList == true
                      ? const LoadingWidget()
                      : ListView.separated(
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
                                elevation: 5,
                                child: Padding(
                                  padding: EdgeInsets.all(10.sp),
                                  child: Column(
                                    children: [
                                      VerticalSpacer(1.h),
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
                                          HorizontalSpacer(2.w),
                                          Expanded(
                                            child: Text(
                                              topMfsController
                                                      .topPerformingMutualFundModel
                                                      ?.list?[index]
                                                      .schemeCategory ??
                                                  "",
                                              overflow: TextOverflow.visible,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10.sp,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(8.sp),
                                              child: Text(
                                                '${topMfsController.topPerformingMutualFundModel?.list?[index].riskometer}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: topMfsController
                                                                    .topPerformingMutualFundModel
                                                                    ?.list?[
                                                                        index]
                                                                    .riskometer ==
                                                                'Very High' ||
                                                            topMfsController
                                                                    .topPerformingMutualFundModel
                                                                    ?.list?[
                                                                        index]
                                                                    .riskometer ==
                                                                'High'
                                                        ? Colors.red
                                                        : Colors.amber),
                                              ),
                                            ),
                                          ),
                                          HorizontalSpacer(2.w),
                                        ],
                                      ),
                                      VerticalSpacer(2.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                '${topMfsController.returns} return',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                              Text(
                                                '${topMfsController.returnPercentage}%',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                              VerticalSpacer(1.h),
                                            ],
                                          ),
                                          HorizontalSpacer(2.w),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              VerticalSpacer(1.h),
                          itemCount: topMfsController
                                  .topPerformingMutualFundModel?.list?.length ??
                              0,
                        ),
                ),
                VerticalSpacer(1.h),
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
