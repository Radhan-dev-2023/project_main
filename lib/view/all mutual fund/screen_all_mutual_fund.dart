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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TopMFsController>(context, listen: false)
          .callinginInit(context);
    });
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
                TextFormField(
                  controller: topMfsController.queryController,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 16.sp),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    // helperText: '',
                    prefixIcon: Icon(
                      Icons.search,
                      size: Adaptive.h(2.3),
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.0.sp),
                    hintText: 'Search',
                  ),
                  onChanged: (value) {
                    topMfsController.searchItems();
                  },
                ),
                VerticalSpacer(Adaptive.h(2)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${topMfsController.filteredListForAllFunds.length ?? 0} SCHEMES',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.sp,
                          ),
                    ),
                    const DurationButton(
                      category: 'All',
                    )
                  ],
                ),
                VerticalSpacer(2.h),
                Expanded(
                  child: topMfsController.lodingList == true
                      ? const LoadingWidget()
                      : topMfsController.filteredListForAllFunds.isEmpty
                          ? Center(
                              child: Text(
                              'No data found',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ))
                          : ListView.separated(
                              itemBuilder: (context, index) {
                                topMfsController.returnValueallFunds(index);
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            StockDetailsScreen(
                                          scheme:
                                              '${topMfsController.filteredListForAllFunds[index].schemeAmfi}',
                                          isinNumber: topMfsController
                                                  .filteredListForAllFunds[
                                                      index]
                                                  .isinNo ??
                                              '',
                                          category: topMfsController
                                                  .filteredListForAllFunds[
                                                      index]
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
                                              HorizontalSpacer(1.w),
                                              SizedBox(
                                                height: 5.h,
                                                width: 10.w,
                                                child: Image.network(
                                                  topMfsController
                                                          .filteredListForAllFunds[
                                                              index]
                                                          .logo ??
                                                      '',
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return const SizedBox();
                                                  },
                                                ),
                                              ),
                                              HorizontalSpacer(1.w),
                                              Expanded(
                                                child: Text(
                                                  '${topMfsController.filteredListForAllFunds[index].schemeAmfi}',
                                                  overflow:
                                                      TextOverflow.visible,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                        fontSize: 17.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                          .filteredListForAllFunds[
                                                              index]
                                                          .schemeCategory ??
                                                      "",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                  overflow:
                                                      TextOverflow.visible,
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
                                                  padding:
                                                      EdgeInsets.all(10.0.sp),
                                                  child: Text(
                                                    '${topMfsController.filteredListForAllFunds[index].riskometer}',
                                                    style: TextStyle(
                                                        color: topMfsController
                                                                        .filteredListForAllFunds[
                                                                            index]
                                                                        .riskometer ==
                                                                    'Very High' ||
                                                                topMfsController
                                                                        .filteredListForAllFunds[
                                                                            index]
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                      '${topMfsController.returns} return'),
                                                  Text(
                                                      '${topMfsController.returnPercentageinAllFunds}%')
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
                              separatorBuilder: (context, index) =>
                                  VerticalSpacer(1.h),
                              itemCount: topMfsController
                                      .filteredListForAllFunds.length ??
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
