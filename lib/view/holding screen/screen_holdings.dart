import 'dart:developer';

import 'package:finfresh_mobile/controller/holdingns%20controller/holdings_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/holding%20screen/my%20holdings/screen_my_holdings.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenHoldings extends StatefulWidget {
  const ScreenHoldings({super.key});

  @override
  State<ScreenHoldings> createState() => _ScreenHoldingsState();
}

class _ScreenHoldingsState extends State<ScreenHoldings> {
  @override
  void initState() {
    super.initState();
    Provider.of<HoldingsController>(context, listen: false)
        .fetchTransactionReport(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Holdings'),
      ),
      body: Consumer<HoldingsController>(
          builder: (context, holdingController, _) {
        return Container(
          margin: EdgeInsets.all(18.sp),
          child: holdingController.loadingHoldingpage == true
              ? const LoadingWidget()
              : Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            log('length${holdingController.transactionReport?.result?.length}');
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ScreenMyHoldings(
                                      isinNumber: holdingController
                                          .transactionReport!
                                          .result![index]
                                          .isin!,
                                      trxnumber: holdingController
                                          .transactionReport!
                                          .result![index]
                                          .userTrxnno!,
                                      productname: holdingController
                                              .transactionReport!
                                              .result![index]
                                              .productName ??
                                          '',
                                    ),
                                  ),
                                );
                              },
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Card(
                                  surfaceTintColor: Colors.transparent,
                                  child: Padding(
                                    padding: EdgeInsets.all(15.sp),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        VerticalSpacer(1.h),
                                        Text(
                                          holdingController
                                                  .transactionReport
                                                  ?.result?[index]
                                                  .productName ??
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
                                          ' ${holdingController.transactionReport?.result?[index].totalAmount ?? ''}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        VerticalSpacer(2.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Investment',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                VerticalSpacer(1.h),
                                                const Text(
                                                  'Gains',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                VerticalSpacer(1.h),
                                                const Text(
                                                  'Growth',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                VerticalSpacer(1.h),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  ' ${holdingController.transactionReport?.result?[index].investmentAmount ?? ''}',
                                                  style: const TextStyle(
                                                    color: Colors.green,
                                                  ),
                                                ),
                                                VerticalSpacer(1.h),
                                                Text(
                                                  ' ${holdingController.transactionReport?.result?[index].gains ?? ''}',
                                                  style: const TextStyle(
                                                    color: Colors.green,
                                                  ),
                                                ),
                                                VerticalSpacer(1.h),
                                                Text(
                                                  holdingController
                                                          .transactionReport
                                                          ?.result?[index]
                                                          .growth
                                                          .toString() ??
                                                      '',
                                                  style: const TextStyle(
                                                    color: Colors.green,
                                                  ),
                                                ),
                                                VerticalSpacer(1.h),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              VerticalSpacer(1.h),
                          itemCount: holdingController
                                  .transactionReport?.result?.length ??
                              0),
                    ),
                  ],
                ),
        );
      }),
    );
  }
}
