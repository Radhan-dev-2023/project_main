import 'dart:developer';

import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:finfresh_mobile/controller/goldController/gold_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/flushbar.dart';
import 'package:finfresh_mobile/view/digi%20gold%20screen/buy%20screen/buy_screen.dart';
import 'package:finfresh_mobile/view/digi%20gold%20screen/sell%20gold%20listing%20screen/screen_sellgold_listing.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenGoldBuyingAndSelling extends StatefulWidget {
  const ScreenGoldBuyingAndSelling({super.key});

  @override
  State<ScreenGoldBuyingAndSelling> createState() =>
      _ScreenGoldBuyingAndSellingState();
}

final scaffoldState = GlobalKey<ScaffoldState>();

class _ScreenGoldBuyingAndSellingState
    extends State<ScreenGoldBuyingAndSelling> {
  @override
  void initState() {
    super.initState();
    Provider.of<GoldController>(context, listen: false).isCompleted();
    Provider.of<GoldController>(context, listen: false).getGoldrate(context);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GoldController>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (provider.isCompletedGoldPurchase == 'true') {
        provider.currentValue();
      }
    });
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: const Color(0xFF2D5D5F),
      //   iconTheme: const IconThemeData(color: Colors.white),
      //   surfaceTintColor: Colors.transparent,
      // ),
      body: RefreshIndicator(
        onRefresh: () async {
          Provider.of<GoldController>(context, listen: false).isCompleted();
          Provider.of<GoldController>(context, listen: false)
              .getGoldrate(context);
        },
        color: const Color(0xFFF7BF05),
        child: SingleChildScrollView(
          child:
              Consumer<GoldController>(builder: (context, goldController, _) {
            return goldController.isloading == true
                ? const LoadingWidget()
                : Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            // Color(0xFF2D5D5F)
                            // color: goldController.goldselecteed
                            //     ? const Color(0xFFF7BF05)
                            //     : const Color(0xFFE3E3E3),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: goldController.goldselecteed
                                    ? [
                                        const Color(0xFFF7BF05),
                                        const Color(0xFFF7BF05)
                                      ]
                                    : [
                                        const Color.fromARGB(
                                            255, 179, 178, 178),
                                        const Color(0xFFD0D0D0),
                                      ],
                                begin: Alignment
                                    .topLeft, // Starting point of the gradient
                                end: Alignment
                                    .bottomRight, // Ending point of the gradient
                              ),
                            ),
                            height: Adaptive.h(33),
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  VerticalSpacer(5.h),
                                  Container(
                                    height: Adaptive.h(5),
                                    width: Adaptive.w(52),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        Adaptive.sp(15),
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              goldController
                                                  .changeGoldSelected(context);
                                            },
                                            child: Container(
                                              height: Adaptive.h(5),
                                              width: Adaptive.w(25),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.sp),
                                                color: goldController
                                                        .goldselecteed
                                                    ? const Color(0xFFF7BF05)
                                                    : Colors.transparent,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Gold',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w500,
                                                    color: goldController
                                                            .goldselecteed
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              goldController
                                                  .changeSilverSelected(
                                                      context);
                                            },
                                            child: Container(
                                              height: Adaptive.h(5),
                                              width: Adaptive.w(25),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.sp),
                                                color: goldController
                                                        .silverSelected
                                                    ? const Color.fromARGB(
                                                        255, 197, 193, 193)
                                                    : Colors.transparent,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Silver',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w500,
                                                    color: goldController
                                                            .silverSelected
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  VerticalSpacer(1.5.h),
                                  Text(
                                    '₹${goldController.goldvalue ?? ''}/mg',
                                    style: TextStyle(
                                      fontSize: 23.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  VerticalSpacer(1.h),
                                  Text(
                                    goldController.goldselecteed
                                        ? 'Current gold buying price\n (exclusive 3% of Gst)'
                                        : 'Current silver buying price\n (exclusive 3% of Gst)',
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
                          ),
                          goldController.isCompletedGoldPurchase == 'true'
                              ? const SizedBox()
                              : Positioned(
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
                      //       color: goldController.goldselecteed
                      //           ? const Color(0xFFF7BF05)
                      //           : const Color(0xFFE3E3E3),
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
                      goldController
                              .goldlistingmodel!.res!.transactions!.isEmpty
                          ? SizedBox(
                              height: Adaptive.h(22),
                              child: const Center(
                                child: Text('No data found'),
                              ),
                            )
                          : SizedBox(
                              child: ListView.separated(
                                  padding: EdgeInsets.all(15.sp),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    dynamic value = goldController
                                        .calculateAmountAfterTax(goldController
                                            .goldlistingmodel
                                            ?.res
                                            ?.transactions?[index]
                                            .amount);
                                    dynamic gst = goldController
                                        .calculateAmountOfTax(goldController
                                            .goldlistingmodel
                                            ?.res
                                            ?.transactions?[index]
                                            .amount);
                                    bool isExpanded =
                                        goldController.isExpandedList[index];
                                    // goldController.sum = value;
                                    return Card(
                                      child: Column(
                                        children: [
                                          VerticalSpacer(1.h),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 15.sp, right: 15.sp),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      goldController
                                                              .goldselecteed
                                                          ? 'Buying Gold'
                                                          : 'Buying Silver',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                            fontSize: 15.5.sp,
                                                            letterSpacing: 2.sp,
                                                          ),
                                                    ),
                                                    SizedBox(height: 1.h),
                                                    Text(
                                                      "${goldController.goldlistingmodel?.res?.transactions?[index].addedon.toString().substring(0, 10)}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                            fontSize: 15.sp,
                                                            color: Colors.grey,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Visibility(
                                                          visible: isExpanded,
                                                          child: Text(
                                                            'Amount ',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium!
                                                                .copyWith(
                                                                  fontSize:
                                                                      14.5.sp,
                                                                ),
                                                          ),
                                                        ),
                                                        HorizontalSpacer(1.w),
                                                        Visibility(
                                                          visible: isExpanded,
                                                          child: Text(
                                                            ': ',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium!
                                                                .copyWith(
                                                                  fontSize:
                                                                      14.5.sp,
                                                                ),
                                                          ),
                                                        ),
                                                        HorizontalSpacer(2.w),
                                                        Visibility(
                                                          visible: isExpanded,
                                                          child: SizedBox(
                                                            width:
                                                                Adaptive.w(14),
                                                            child: Text(
                                                              ' ₹ ${value.toStringAsFixed(2)}',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        14.5.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign.end,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Visibility(
                                                          visible: isExpanded,
                                                          child: Text(
                                                            'Gst ',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium!
                                                                .copyWith(
                                                                  fontSize:
                                                                      14.5.sp,
                                                                ),
                                                          ),
                                                        ),
                                                        HorizontalSpacer(1.w),
                                                        Visibility(
                                                          visible: isExpanded,
                                                          child: Text(
                                                            ': ',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium!
                                                                .copyWith(
                                                                  fontSize:
                                                                      14.5.sp,
                                                                ),
                                                          ),
                                                        ),
                                                        HorizontalSpacer(4.w),
                                                        Visibility(
                                                          visible: isExpanded,
                                                          child: SizedBox(
                                                            width:
                                                                Adaptive.w(12),
                                                            child: Text(
                                                              ' ₹ ${gst.toStringAsFixed(2)}',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        14.5.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign.end,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Total ',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        14.5.sp,
                                                                  ),
                                                        ),
                                                        HorizontalSpacer(1.w),
                                                        Text(
                                                          ': ',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        14.5.sp,
                                                                  ),
                                                        ),
                                                        SizedBox(
                                                          width: Adaptive.w(16),
                                                          child: Text(
                                                            ' ₹ ${goldController.goldlistingmodel?.res?.transactions?[index].amount}',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium!
                                                                .copyWith(
                                                                  fontSize:
                                                                      14.5.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.end,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right:
                                                                        15.sp),
                                                            child: Text(
                                                              'Bought ${goldController.goldlistingmodel?.res?.transactions?[index].purchasedGold.toStringAsFixed(2)} mg ${goldController.valuetoBackend}',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        15.5.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              goldController
                                                                  .toggleExpansion(
                                                                      index);
                                                            },
                                                            child: Icon(isExpanded
                                                                ? Icons
                                                                    .expand_less
                                                                : Icons
                                                                    .expand_more),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          VerticalSpacer(0.5.h),
                                          VerticalSpacer(1.h),
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      VerticalSpacer(1.h),
                                  // const Divider(
                                  //   color: Colors.grey,
                                  //   thickness: 1,
                                  // ),
                                  itemCount: goldController.goldlistingmodel
                                          ?.res?.transactions?.length ??
                                      0),
                            ),
                      // : SizedBox(
                      //     child: ListView.separated(
                      //         padding: EdgeInsets.all(15.sp),
                      //         shrinkWrap: true,
                      //         physics: const NeverScrollableScrollPhysics(),
                      //         itemBuilder: (context, index) {
                      //           dynamic value = goldController
                      //               .calculateAmountAfterTax(goldController
                      //                   .goldlistingmodel
                      //                   ?.res
                      //                   ?.transactions?[index]
                      //                   .amount);
                      //           dynamic gst = goldController
                      //               .calculateAmountOfTax(goldController
                      //                   .goldlistingmodel
                      //                   ?.res
                      //                   ?.transactions?[index]
                      //                   .amount);
                      //           // goldController.sum = value;
                      //           return Card(
                      //             child: Column(
                      //               children: [
                      //                 VerticalSpacer(1.h),
                      //                 ListTile(
                      //                   contentPadding: EdgeInsets.only(
                      //                       left: 15.sp, right: 15.sp),
                      //                   subtitle: Column(
                      //                     crossAxisAlignment:
                      //                         CrossAxisAlignment.start,
                      //                     children: [
                      //                       Text(
                      //                         'Buying Gold',
                      //                         style: Theme.of(context)
                      //                             .textTheme
                      //                             .bodyMedium!
                      //                             .copyWith(
                      //                               fontSize: 15.5.sp,
                      //                               letterSpacing: 2.sp,
                      //                             ),
                      //                       ),
                      //                       VerticalSpacer(1.h),
                      //                       Text(
                      //                         "${goldController.goldlistingmodel?.res?.transactions?[index].addedon.toString().substring(0, 10)}",
                      //                         style: Theme.of(context)
                      //                             .textTheme
                      //                             .bodyMedium!
                      //                             .copyWith(
                      //                               fontSize: 15.sp,
                      //                               color: Colors.grey,
                      //                             ),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                   trailing: Row(
                      //                     mainAxisSize: MainAxisSize.min,
                      //                     children: [
                      //                       Column(
                      //                         crossAxisAlignment:
                      //                             CrossAxisAlignment.start,
                      //                         children: [
                      //                           // VerticalSpacer(1.h),
                      //                           Text(
                      //                             'Amount ',
                      //                             style: Theme.of(context)
                      //                                 .textTheme
                      //                                 .bodyMedium!
                      //                                 .copyWith(
                      //                                   fontSize: 14.5.sp,
                      //                                 ),
                      //                           ),
                      //                           VerticalSpacer(0.1.h),
                      //                           Text(
                      //                             'Gst ',
                      //                             style: Theme.of(context)
                      //                                 .textTheme
                      //                                 .bodyMedium!
                      //                                 .copyWith(
                      //                                   fontSize: 14.5.sp,
                      //                                 ),
                      //                           ),
                      //                           // VerticalSpacer(0.2.h),
                      //                           Text(
                      //                             'Total ',
                      //                             style: Theme.of(context)
                      //                                 .textTheme
                      //                                 .bodyMedium!
                      //                                 .copyWith(
                      //                                   fontSize: 14.5.sp,
                      //                                 ),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                       Column(
                      //                         children: [
                      //                           Text(
                      //                             ': ',
                      //                             style: Theme.of(context)
                      //                                 .textTheme
                      //                                 .bodyMedium!
                      //                                 .copyWith(
                      //                                   fontSize: 14.5.sp,
                      //                                 ),
                      //                           ),
                      //                           Text(
                      //                             ': ',
                      //                             style: Theme.of(context)
                      //                                 .textTheme
                      //                                 .bodyMedium!
                      //                                 .copyWith(
                      //                                   fontSize: 14.5.sp,
                      //                                 ),
                      //                           ),
                      //                           VerticalSpacer(0.4.h),
                      //                           Text(
                      //                             ': ',
                      //                             style: Theme.of(context)
                      //                                 .textTheme
                      //                                 .bodyMedium!
                      //                                 .copyWith(
                      //                                   fontSize: 14.5.sp,
                      //                                 ),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                       Column(
                      //                         crossAxisAlignment:
                      //                             CrossAxisAlignment.end,
                      //                         children: [
                      //                           // VerticalSpacer(1.h),
                      //                           Text(
                      //                             ' ₹ ${value.toStringAsFixed(2)}',
                      //                             style: Theme.of(context)
                      //                                 .textTheme
                      //                                 .bodyMedium!
                      //                                 .copyWith(
                      //                                     fontSize: 14.5.sp,
                      //                                     fontWeight:
                      //                                         FontWeight
                      //                                             .w400),
                      //                           ),
                      //                           VerticalSpacer(0.1.h),
                      //                           Text(
                      //                             ' ₹ ${gst.toStringAsFixed(2)}',
                      //                             style: Theme.of(context)
                      //                                 .textTheme
                      //                                 .bodyMedium!
                      //                                 .copyWith(
                      //                                   fontSize: 14.5.sp,
                      //                                   fontWeight:
                      //                                       FontWeight.w400,
                      //                                 ),
                      //                           ),
                      //                           // VerticalSpacer(0.2.h),
                      //                           Text(
                      //                             ' ₹ ${goldController.goldlistingmodel?.res?.transactions?[index].amount}',
                      //                             style: Theme.of(context)
                      //                                 .textTheme
                      //                                 .bodyMedium!
                      //                                 .copyWith(
                      //                                   fontSize: 14.5.sp,
                      //                                   fontWeight:
                      //                                       FontWeight.w400,
                      //                                 ),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //                 Padding(
                      //                   padding:
                      //                       EdgeInsets.only(right: 15.sp),
                      //                   child: Align(
                      //                     alignment: Alignment.bottomRight,
                      //                     child: Text(
                      //                       'Bought ${goldController.goldlistingmodel?.res?.transactions?[index].purchasedGold.toStringAsFixed(2)} mg gold',
                      //                       style: Theme.of(context)
                      //                           .textTheme
                      //                           .bodyMedium!
                      //                           .copyWith(
                      //                             fontSize: 15.5.sp,
                      //                             fontWeight:
                      //                                 FontWeight.w400,
                      //                           ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 VerticalSpacer(1.h),
                      //               ],
                      //             ),
                      //           );
                      //         },
                      //         separatorBuilder: (context, index) =>
                      //             VerticalSpacer(1.h),
                      //         // const Divider(
                      //         //   color: Colors.grey,
                      //         //   thickness: 1,
                      //         // ),
                      //         itemCount: goldController.goldlistingmodel
                      //                 ?.res?.transactions?.length ??
                      //             0),
                      //   ),
                      VerticalSpacer(3.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Visibility(
                            visible: Provider.of<DashBoardController>(context)
                                        .dashBoardModel
                                        ?.result
                                        ?.data
                                        ?.name ==
                                    'SHANMUGA BHUVANESWAR RAMALINGAM'
                                ? false
                                : false,
                            child: InkWell(
                              onTap: () {
                                goldController.selectvalue = null;
                                showBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Consumer<GoldController>(
                                        builder: (context, goldController, _) {
                                      return Container(
                                        margin: EdgeInsets.all(15.sp),
                                        height: 350,
                                        // color: Colors.white,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            VerticalSpacer(1.h),
                                            const Text(
                                              'Add Gold Rate',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            VerticalSpacer(3.h),
                                            TextFormField(
                                              controller: goldController
                                                  .goldRateController,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: const InputDecoration(
                                                hintText: 'Enter the gold rate',
                                                // border: OutlineInputBorder(),
                                              ),
                                            ),
                                            VerticalSpacer(2.h),
                                            DropdownButtonFormField<String>(
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              validator: (value) {
                                                if (value == null) {
                                                  return 'Please select cost type';
                                                }
                                                return null;
                                              },
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge!,
                                              value: goldController.selectvalue,
                                              decoration: InputDecoration(
                                                helperText: '',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                hintText: 'Select a cost type',
                                              ),
                                              onChanged: (String? newValue) {
                                                goldController
                                                    .updateselectValue(
                                                  newValue ?? '',
                                                );
                                              },
                                              items: goldController
                                                  .listForAddingRate
                                                  .map((String items) {
                                                return DropdownMenuItem<String>(
                                                  value: items,
                                                  child: Text(items),
                                                );
                                              }).toList(),
                                            ),
                                            VerticalSpacer(5.h),
                                            goldController.loading == true
                                                ? const LoadingButton()
                                                : ButtonWidget(
                                                    btName: 'Add',
                                                    onTap: () async {
                                                      if (goldController
                                                              .goldRateController
                                                              .text
                                                              .isNotEmpty &&
                                                          goldController
                                                                  .selectvalue !=
                                                              null) {
                                                        bool result =
                                                            await goldController
                                                                .addGoldRate(
                                                                    context);
                                                        if (result == true) {
                                                          // ignore: use_build_context_synchronously
                                                          goldController
                                                              .getGoldrate(
                                                                  context);
                                                          // ignore: use_build_context_synchronously
                                                          Navigator.pop(
                                                              context);
                                                          goldController
                                                              .goldRateController
                                                              .clear();
                                                        } else {
                                                          log('failed');
                                                        }
                                                      } else if (goldController
                                                              .selectvalue ==
                                                          null) {
                                                        showFlushbar(context,
                                                            'Please select a cost type');
                                                      } else {
                                                        showFlushbar(context,
                                                            'Please enter the gold rate');
                                                      }
                                                    },
                                                  )
                                          ],
                                        ),
                                      );
                                    });
                                  },
                                );
                              },
                              child: Container(
                                height: Adaptive.h(5),
                                width: Adaptive.w(30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.sp),
                                  color: const Color(0xFF2D5D5F),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Add Gold Rate',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFF7BF05),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          HorizontalSpacer(3.w),
                          InkWell(
                            onTap: () {
                              if (goldController.goldvalue == null) {
                                showFlushbar(
                                  context,
                                  goldController.goldselecteed
                                      ? 'The gold buy rate is not added'
                                      : 'The silver buy rate is not added',
                                );
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ScreenBuy(),
                                    ));
                              }
                            },
                            child: Container(
                              height: Adaptive.h(5),
                              width: Adaptive.w(25),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.sp),
                                color: const Color(0xFF2D5D5F),
                              ),
                              child: const Center(
                                child: Text(
                                  'Buy',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFF7BF05),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          HorizontalSpacer(3.w),
                          InkWell(
                            onTap: () {
                              if (goldController.sellrate == null) {
                                showFlushbar(
                                  context,
                                  goldController.goldselecteed
                                      ? 'The gold sell rate is not added'
                                      : 'The silver sell rate is not added',
                                );
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ScreenListingGold(),
                                    ));
                              }
                            },
                            child: Container(
                              height: Adaptive.h(5),
                              width: Adaptive.w(25),
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
                          HorizontalSpacer(5.w),
                        ],
                      ),
                      VerticalSpacer(15.h),
                    ],
                  );
          }),
        ),
      ),
    );
  }
}
