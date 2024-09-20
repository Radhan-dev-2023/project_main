import 'dart:developer';

import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:finfresh_mobile/controller/goldController/gold_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/digi%20gold%20screen/sell%20screen/sell_screen.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/widgets/overview_in_tabbar.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenListingGold extends StatefulWidget {
  const ScreenListingGold({super.key});

  @override
  State<ScreenListingGold> createState() => _ScreenListingGoldState();
}

class _ScreenListingGoldState extends State<ScreenListingGold> {
  @override
  void initState() {
    super.initState();
    Provider.of<GoldController>(context, listen: false).getSellGoldListing(
        context,
        Provider.of<DashBoardController>(context, listen: false)
                .dashBoardModel
                ?.result
                ?.data
                ?.email ??
            '');
  }

  @override
  Widget build(BuildContext context) {
    log('listing model in gold${Provider.of<GoldController>(context, listen: false).sellGoldListingModel?.toJson()}');
    return Scaffold(
      body: Consumer<GoldController>(builder: (context, goldController, _) {
        return RefreshIndicator(
          onRefresh: () => goldController.getSellGoldListing(
              context,
              Provider.of<DashBoardController>(context, listen: false)
                      .dashBoardModel
                      ?.result
                      ?.data
                      ?.email ??
                  ''),
          color: const Color(0xFFF7BF05),
          child: goldController.sellListingLoading == true
              ? const LoadingWidget()
              : Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: goldController.goldselecteed
                                  ? [
                                      const Color(0xFFF7BF05),
                                      const Color(0xFFF7BF05)
                                    ]
                                  : [
                                      const Color.fromARGB(255, 179, 178, 178),
                                      const Color(0xFFD0D0D0),
                                    ],
                              begin: Alignment
                                  .topLeft, // Starting point of the gradient
                              end: Alignment
                                  .bottomRight, // Ending point of the gradient
                            ),
                          ),
                          height: Adaptive.h(30),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              VerticalSpacer(8.h),
                              Text(
                                goldController.goldselecteed
                                    ? '₹${goldController.sellrate ?? ''}/mg'
                                    : '₹${goldController.sellrate ?? ''}/g',
                                style: TextStyle(
                                  fontSize: 23.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 3.sp,
                                ),
                              ),
                              VerticalSpacer(1.h),
                              Text(
                                goldController.goldselecteed
                                    ? 'Current gold selling price'
                                    : 'Current silver selling price',
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.white),
                              ),
                              VerticalSpacer(1.h),
                              Text(
                                'Current value',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                ),
                              ),
                              // VerticalSpacer(1.h),
                              Text(
                                goldController.formattedValue,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 26.sp,
                          left: 17.sp,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    // Padding(
                    //   padding: EdgeInsets.all(15.sp),
                    //   child: SizedBox(
                    //     height: Adaptive.h(18),
                    //     width: MediaQuery.of(context).size.width,
                    //     child: Card(
                    //       color: const Color(0xFF2D5D5F),
                    //       child: Row(
                    //         children: [
                    //           HorizontalSpacer(3.w),
                    //           ClipRRect(
                    //             borderRadius: BorderRadius.circular(15.sp),
                    //             child: Image.asset(
                    //               'assets/images/goldimagein.jpg',
                    //               height: Adaptive.h(14),
                    //               width: Adaptive.w(31),
                    //               fit: BoxFit.fill,
                    //             ),
                    //           ),
                    //           HorizontalSpacer(22.w),
                    //           Column(
                    //             crossAxisAlignment: CrossAxisAlignment.end,
                    //             children: [
                    //               VerticalSpacer(4.h),
                    //               Text(
                    //                 'Current value',
                    //                 style: TextStyle(
                    //                   color: Colors.white,
                    //                   fontSize: 18.sp,
                    //                 ),
                    //               ),
                    //               VerticalSpacer(1.h),
                    //               Text(
                    //                 goldController.formattedValue,
                    //                 style: TextStyle(
                    //                   color: Colors.white,
                    //                   fontSize: 20.sp,
                    //                   fontWeight: FontWeight.bold,
                    //                 ),
                    //                 overflow: TextOverflow.ellipsis,
                    //               ),
                    //               VerticalSpacer(1.h),
                    //               // Text(
                    //               //   '20 % profit',
                    //               //   style: TextStyle(
                    //               //     color: Colors.white,
                    //               //     fontSize: 18.sp,
                    //               //   ),
                    //               // ),
                    //             ],
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    goldController.sellGoldListingModel == null ||
                            goldController.sellGoldListingModel!.result!.isEmpty
                        ? SizedBox(
                            height: Adaptive.h(60),
                            child: const Center(
                              child: Text('No data found'),
                            ),
                          )
                        : Expanded(
                            child: SizedBox(
                              child: ListView.separated(
                                padding: EdgeInsets.all(15.sp),
                                itemBuilder: (context, index) {
                                  return Card(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15,
                                          right: 15,
                                          top: 10,
                                          bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomTextWidget(
                                                text:
                                                    goldController.goldselecteed
                                                        ? 'Sold Gold'
                                                        : 'Sold Silver',
                                                fontSize: 15.5.sp,
                                                letterSpacing: 2.sp,
                                              ),
                                              VerticalSpacer(0.5.h),
                                              CustomTextWidget(
                                                text:
                                                    "${goldController.sellGoldListingModel?.result?[index].sellDate.toString().substring(0, 10)}",
                                                color: Colors.grey,
                                                fontSize: 14.5.sp,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  VerticalSpacer(0.5.h),

                                                  // VerticalSpacer(1.h),
                                                  Text(
                                                    'Amount ',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          fontSize: 14.5.sp,
                                                        ),
                                                  ),
                                                  VerticalSpacer(0.1.h),
                                                  Text(
                                                    'Status ',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          fontSize: 14.5.sp,
                                                        ),
                                                  ),
                                                  // VerticalSpacer(0.2.h),
                                                  Text(
                                                    goldController.goldselecteed
                                                        ? 'SoldMg '
                                                        : 'Sold g ',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          fontSize: 14.5.sp,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  VerticalSpacer(0.5.h),
                                                  Text(
                                                    ': ',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          fontSize: 14.5.sp,
                                                        ),
                                                  ),
                                                  Text(
                                                    ': ',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          fontSize: 14.5.sp,
                                                        ),
                                                  ),
                                                  VerticalSpacer(0.4.h),
                                                  Text(
                                                    ': ',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          fontSize: 14.5.sp,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  VerticalSpacer(0.5.h),
                                                  // VerticalSpacer(1.h),
                                                  Text(
                                                    ' ₹ ${goldController.sellGoldListingModel?.result?[index].amount.toStringAsFixed(2)}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          fontSize: 14.5.sp,
                                                        ),
                                                  ),
                                                  VerticalSpacer(0.1.h),
                                                  Text(
                                                    '${goldController.sellGoldListingModel?.result?[index].status}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          fontSize: 14.5.sp,
                                                        ),
                                                  ),
                                                  // VerticalSpacer(0.2.h),
                                                  Text(
                                                    '${goldController.sellGoldListingModel?.result?[index].soldmg}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          fontSize: 14.5.sp,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    VerticalSpacer(1.h),
                                itemCount: goldController
                                        .sellGoldListingModel?.result?.length ??
                                    0,
                              ),
                            ),
                          ),
                    VerticalSpacer(7.h),

                    // VerticalSpacer(10.h),
                  ],
                ),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Wrap(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenSellGold(),
                  ));
            },
            child: Container(
              height: Adaptive.h(6),
              width: Adaptive.w(35),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.sp),
                color: const Color(0xFF2D5D5F),
              ),
              child: const Center(
                child: Text(
                  'Sell',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF7BF05),
                  ),
                ),
              ),
            ),
          ),
          VerticalSpacer(Adaptive.h(8)),
        ],
      ),
    );
  }
}
