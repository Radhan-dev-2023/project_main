import 'package:finfresh_mobile/controller/achController/ach_controller.dart';
import 'package:finfresh_mobile/controller/filter%20controller/filter_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/flushbar.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenAchHistory extends StatefulWidget {
  const ScreenAchHistory({super.key});

  @override
  State<ScreenAchHistory> createState() => _ScreenAchHistoryState();
}

class _ScreenAchHistoryState extends State<ScreenAchHistory> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AchController>(context, listen: false).resetFilter();
    Provider.of<AchController>(context, listen: false).getAchHistoy(
      context,
      '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ACH History'),
        actions: [
          InkWell(
            onTap: () {
              showmodalBottomSheet(context);
            },
            child: Icon(
              Icons.filter_list,
            ),
          ),
          HorizontalSpacer(4.w)
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(15.sp),
        child: Consumer<AchController>(builder: (context, achController, _) {
          return achController.historyLoading == true
              ? const LoadingWidget()
              : Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: achController.achHistoryModel?.result ==
                                      null ||
                                  achController.achHistoryModel!.result!.isEmpty
                              ? const Center(
                                  child: Text('Sorry No Data Found'),
                                )
                              : ListView.separated(
                                  itemBuilder: (context, index) {
                                    return Card(
                                      child: Padding(
                                        padding: EdgeInsets.all(12.sp),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            VerticalSpacer(1.h),
                                            Text(
                                                'Customer Id : ${achController.achHistoryModel?.result?[index].customerId ?? "-"}'),
                                            VerticalSpacer(1.h),
                                            Text(
                                                'Investor Name : ${achController.achHistoryModel?.result?[index].investorName ?? "-"}'),
                                            VerticalSpacer(1.h),
                                            Text(
                                                'Mandate Id : ${achController.achHistoryModel?.result?[index].mandateId ?? "-"}'),
                                            VerticalSpacer(1.h),
                                            Text(
                                                'Unique Ref No : ${achController.achHistoryModel?.result?[index].uniqueRefNo ?? "-"}'),
                                            VerticalSpacer(1.h),
                                            Text(
                                                'From Date : ${achController.achHistoryModel?.result?[index].fromDate ?? "-"}'),
                                            VerticalSpacer(1.h),
                                            Text(
                                                'To Date : ${achController.achHistoryModel?.result?[index].toDate ?? "-"}'),
                                            VerticalSpacer(1.h),
                                            Text(
                                                'Amount : ${achController.achHistoryModel?.result?[index].amount ?? "-"}'),
                                            VerticalSpacer(1.h),
                                            Text(
                                                'ACH Mandate Status : ${achController.achHistoryModel?.result?[index].achMandateStatus ?? "-"}'),
                                            VerticalSpacer(1.h),
                                            Text(
                                                'Expired Date Time : ${achController.achHistoryModel?.result?[index].expiredDateTime ?? "-"}'),
                                            VerticalSpacer(1.h),
                                            Text(
                                                'Process Mode : ${achController.achHistoryModel?.result?[index].processMode ?? "-"}'),
                                            VerticalSpacer(1.h),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      VerticalSpacer(1.h),
                                  itemCount: achController.achHistoryService
                                      .achHistoryModel.result!.length,
                                ),
                        )
                      ],
                    ),
                    // Positioned(
                    //   bottom: 10.sp,
                    //   right: 45.sp,
                    //   child: InkWell(
                    //     onTap: () {
                    //       showmodalBottomSheet(context);
                    //     },
                    //     child: Container(
                    //       height: Adaptive.h(6),
                    //       width: Adaptive.w(34),
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(14.sp),
                    //         color: const Color(0xFF4D84BD),
                    //       ),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           const Icon(
                    //             Icons.filter_list,
                    //             color: Colors.white,
                    //           ),
                    //           HorizontalSpacer(Adaptive.w(2.5)),
                    //           Text(
                    //             'Filter',
                    //             style: TextStyle(
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.w500,
                    //               fontSize: 17.sp,
                    //             ),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                );
        }),
      ),
    );
  }

  void showmodalBottomSheet(BuildContext context) {
    // Brightness brightness = MediaQuery.of(context).platformBrightness;
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Consumer<AchController>(builder: (context, achController, _) {
          return SizedBox(
            height: 330,
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(left: 20.sp, right: 20.sp, top: 15.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Filter',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      InkWell(
                        onTap: () {
                          achController.resetFilter();
                          achController.getAchHistoy(context, '');
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Reset',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      )
                    ],
                  ),
                ),
                VerticalSpacer(1.h),
                const Divider(
                  color: Colors.grey,
                ),
                VerticalSpacer(2.h),
                // Row(
                //   children: [
                //     HorizontalSpacer(4.w),
                //     Checkbox(
                //       checkColor: Colors.white,
                //       activeColor: const Color(0xFF4D84BD),
                //       value: achController.pendinginhistory,
                //       onChanged: (value) {
                //         achController.changependingvalue(value!);
                //       },
                //     ),
                //     const Text('Pending'),
                //   ],
                // ),
                Row(
                  children: [
                    HorizontalSpacer(4.w),
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: const Color(0xFF4D84BD),
                      value: achController.acceptesvalue,
                      onChanged: (value) {
                        achController.changeacceptedvalue(value!);
                      },
                    ),
                    const Text('Accepted'),
                  ],
                ),
                Row(
                  children: [
                    HorizontalSpacer(4.w),
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: const Color(0xFF4D84BD),
                      value: achController.rejected,
                      onChanged: (value) {
                        achController.changeFailedvalue(value!);
                      },
                    ),
                    const Text('Rejected'),
                  ],
                ),
                Row(
                  children: [
                    HorizontalSpacer(4.w),
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: const Color(0xFF4D84BD),
                      value: achController.allvalue,
                      onChanged: (value) {
                        achController.changeAllvalue(value!);
                      },
                    ),
                    HorizontalSpacer(1.w),
                    const Text('All'),
                  ],
                ),
                VerticalSpacer(Adaptive.h(2)),
                Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Align(
                    alignment: AlignmentDirectional.center,
                    child: InkWell(
                      onTap: () {
                        if (achController.acceptesvalue == true ||
                            achController.rejected == true ||
                            achController.allvalue == true) {
                          achController.callAchHistory(context);
                          Navigator.pop(context);
                        } else {
                          showFlushbar(context, 'Please select one of them');
                        }
                      },
                      child: Container(
                        height: Adaptive.h(6),
                        width: Adaptive.w(27),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.sp),
                          color: const Color(0xFF4D84BD),
                        ),
                        child: Center(
                          child: Text(
                            'Apply',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 17.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
      },
    );
  }
}
