import 'package:finfresh_mobile/controller/holdingns%20controller/holdings_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenMyHoldings extends StatefulWidget {
  final String isinNumber;
  final String trxnumber;
  const ScreenMyHoldings(
      {super.key, required this.isinNumber, required this.trxnumber});

  @override
  State<ScreenMyHoldings> createState() => _ScreenMyHoldingsState();
}

class _ScreenMyHoldingsState extends State<ScreenMyHoldings> {
  @override
  void initState() {
    super.initState();
    Provider.of<HoldingsController>(context, listen: false)
        .fetchReportDetails(context, widget.isinNumber, widget.trxnumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Holdings'),
      ),
      body: Consumer<HoldingsController>(
          builder: (context, holdingController, _) {
        return Container(
          margin: EdgeInsets.all(18.sp),
          child: holdingController.loading == true
              ? const LoadingWidget()
              : Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        surfaceTintColor: Colors.transparent,
                        child: Padding(
                          padding: EdgeInsets.all(15.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              VerticalSpacer(1.h),
                              Text(
                                holdingController.reportDetailsModel
                                        ?.transaction?.schemeName ??
                                    '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              VerticalSpacer(1.h),
                              Text(
                                '₹ ${holdingController.reportDetailsModel?.transaction?.totalAmount ?? ''}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      VerticalSpacer(2.h),
                                      const Text('Investment'),
                                      VerticalSpacer(1.h),
                                      const Text('Gains'),
                                      VerticalSpacer(1.h),
                                      const Text('Growth(Absolute)'),
                                      VerticalSpacer(1.h),
                                      const Text('Totel Units'),
                                      VerticalSpacer(1.h),
                                      const Text('Average NAV'),
                                      VerticalSpacer(1.h),
                                      const Text('Current NAV'),
                                      VerticalSpacer(1.h),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      VerticalSpacer(2.h),
                                      Text(
                                          '₹ ${holdingController.reportDetailsModel?.transaction?.investmentAmount ?? ''}'),
                                      VerticalSpacer(1.h),
                                      Text(
                                        '₹ ${holdingController.reportDetailsModel?.transaction?.gains ?? ''}',
                                        style: const TextStyle(
                                            color: Colors.green),
                                      ),
                                      VerticalSpacer(1.h),
                                      Text(
                                        holdingController.reportDetailsModel
                                                ?.transaction?.growthAbsolute ??
                                            '',
                                        style: const TextStyle(
                                            color: Colors.green),
                                      ),
                                      VerticalSpacer(1.h),
                                      Text(
                                          '${holdingController.reportDetailsModel?.transaction?.totalUnits ?? ''}'),
                                      VerticalSpacer(1.h),
                                      Text(
                                          '${holdingController.reportDetailsModel?.transaction?.averageNav ?? ''}'),
                                      VerticalSpacer(1.h),
                                      Text(
                                          '${holdingController.reportDetailsModel?.transaction?.currentNav ?? ''}'),
                                      VerticalSpacer(1.h),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    VerticalSpacer(2.h),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 3.h,
                      child: Row(
                        children: [
                          const Text('Folio'),
                          HorizontalSpacer(3.w),
                          Expanded(
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                holdingController
                                                    .changeindex(index);
                                              },
                                              child: Container(
                                                height: 3.h,
                                                width: 25.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.sp),
                                                  color: holdingController
                                                              .currentindex ==
                                                          index
                                                      ? Colors.purple
                                                      : const Color.fromARGB(
                                                          255, 224, 219, 219),
                                                ),
                                                child: Center(
                                                  child: Text(holdingController
                                                          .reportDetailsModel
                                                          ?.transaction
                                                          ?.purchaseDetails?[
                                                              index]
                                                          .folio ??
                                                      ''),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    HorizontalSpacer(3.w),
                                itemCount: holdingController
                                        .reportDetailsModel
                                        ?.transaction
                                        ?.purchaseDetails
                                        ?.length ??
                                    0),
                          ),
                        ],
                      ),
                    ),
                    VerticalSpacer(2.h),
                    const Divider(
                      color: Color.fromARGB(255, 224, 219, 219),
                    ),
                    // VerticalSpacer(1.h),
                    Text('Transaction'),
                    Divider(
                      color: const Color.fromARGB(255, 224, 219, 219),
                    ),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(holdingController
                                            .reportDetailsModel
                                            ?.transaction
                                            ?.purchaseDetails?[
                                                holdingController.currentindex]
                                            .transactions?[index]
                                            .transactionType ??
                                        ''),
                                    Text(
                                      '₹ ${holdingController.reportDetailsModel?.transaction?.purchaseDetails?[holdingController.currentindex].transactions?[index].purchasesmount}',
                                      style:
                                          const TextStyle(color: Colors.green),
                                    )
                                  ],
                                ),
                                VerticalSpacer(1.h),
                                Row(
                                  children: [
                                    Text(
                                      holdingController
                                              .reportDetailsModel
                                              ?.transaction
                                              ?.purchaseDetails?[
                                                  holdingController
                                                      .currentindex]
                                              .transactions?[index]
                                              .transactionDate ??
                                          '',
                                    ),
                                    HorizontalSpacer(19.5.w),
                                    Text(
                                        'NAV: ${holdingController.reportDetailsModel?.transaction?.purchaseDetails?[holdingController.currentindex].transactions?[index].nav}'),
                                    HorizontalSpacer(2.w),
                                    Text(
                                        'Units: ${holdingController.reportDetailsModel?.transaction?.purchaseDetails?[holdingController.currentindex].transactions?[index].units}')
                                  ],
                                )
                              ],
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(
                                color: Color.fromARGB(255, 224, 219, 219),
                              ),
                          itemCount: holdingController
                                  .reportDetailsModel
                                  ?.transaction
                                  ?.purchaseDetails?[
                                      holdingController.currentindex]
                                  .transactions
                                  ?.length ??
                              0),
                    )
                  ],
                ),
        );
      }),
    );
  }
}
