import 'package:finfresh_mobile/controller/achController/ach_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
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
    Provider.of<AchController>(context, listen: false).getAchHistoy(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(15.sp),
        child: Consumer<AchController>(builder: (context, achController, _) {
          return achController.historyLoading == true
              ? const LoadingWidget()
              : Column(
                  children: [
                    Expanded(
                      child: achController.achHistoryModel?.result == null ||
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
                                            'Customer Id : ${achController.achHistoryModel?.result?[index].customerId ?? "null"}'),
                                        VerticalSpacer(1.h),
                                        Text(
                                            'Investor Name : ${achController.achHistoryModel?.result?[index].investorName ?? "null"}'),
                                        VerticalSpacer(1.h),
                                        Text(
                                            'Mandate Id : ${achController.achHistoryModel?.result?[index].mandateId ?? "null"}'),
                                        VerticalSpacer(1.h),
                                        Text(
                                            'Unique Ref No : ${achController.achHistoryModel?.result?[index].uniqueRefNo ?? "null"}'),
                                        VerticalSpacer(1.h),
                                        Text(
                                            'From Date : ${achController.achHistoryModel?.result?[index].fromDate ?? "null"}'),
                                        VerticalSpacer(1.h),
                                        Text(
                                            'To Date : ${achController.achHistoryModel?.result?[index].toDate ?? "null"}'),
                                        VerticalSpacer(1.h),
                                        Text(
                                            'Amount : ${achController.achHistoryModel?.result?[index].amount ?? "null"}'),
                                        VerticalSpacer(1.h),
                                        Text(
                                            'ACH Mandate Status : ${achController.achHistoryModel?.result?[index].achMandateStatus ?? "null"}'),
                                        VerticalSpacer(1.h),
                                        Text(
                                            'Expired Date Time : ${achController.achHistoryModel?.result?[index].expiredDateTime ?? "null"}'),
                                        VerticalSpacer(1.h),
                                        Text(
                                            'Process Mode : ${achController.achHistoryModel?.result?[index].processMode ?? "null"}'),
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
                );
        }),
      ),
    );
  }
}
