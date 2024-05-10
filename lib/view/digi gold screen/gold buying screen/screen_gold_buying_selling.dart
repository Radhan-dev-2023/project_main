import 'dart:developer';

import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:finfresh_mobile/controller/goldController/gold_controller.dart';
import 'package:finfresh_mobile/services/get%20gold%20rate/get_gold_rate.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/flushbar.dart';
import 'package:finfresh_mobile/view/digi%20gold%20screen/buy%20screen/buy_screen.dart';
import 'package:finfresh_mobile/view/digi%20gold%20screen/digi_gold_screen.dart';
import 'package:finfresh_mobile/view/digi%20gold%20screen/sell%20screen/sell_screen.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D5D5F),
        iconTheme: const IconThemeData(color: Colors.white),
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Consumer<GoldController>(builder: (context, goldController, _) {
            return goldController.isloading == true
                ? const LoadingWidget()
                : Column(
                    children: [
                      Container(
                        color: const Color(0xFF2D5D5F),
                        height: Adaptive.h(30),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '₹${goldController.goldvalue ?? ''}/mg',
                              style: TextStyle(
                                fontSize: 23.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 3.sp,
                              ),
                            ),
                            VerticalSpacer(1.h),
                            const Text(
                              'Current gold buying price\n (inclusice of tax)',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                            VerticalSpacer(5.h),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.sp),
                        child: SizedBox(
                          height: Adaptive.h(18),
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            color: const Color(0xFF2D5D5F),
                            child: Row(
                              children: [
                                HorizontalSpacer(3.w),
                                SizedBox(
                                  child: Image.asset(
                                      'assets/images/Screenshot.png'),
                                ),
                                HorizontalSpacer(22.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    VerticalSpacer(4.h),
                                    Text(
                                      'Current value',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                    VerticalSpacer(1.h),
                                    Text(
                                      '${goldController.formattedValue}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    VerticalSpacer(1.h),
                                    // Text(
                                    //   '20 % profit',
                                    //   style: TextStyle(
                                    //     color: Colors.white,
                                    //     fontSize: 18.sp,
                                    //   ),
                                    // ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      goldController.goldlistingmodel == null
                          ? const SizedBox()
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
                                    goldController.sum = value;
                                    return Column(
                                      children: [
                                        ListTile(
                                          contentPadding: EdgeInsets.only(
                                              left: 15.sp, right: 15.sp),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text('Buying Gold'),
                                              VerticalSpacer(1.h),
                                              Text(
                                                "${goldController.goldlistingmodel?.res?.transactions?[index].addedon.toString().substring(0, 10)}",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                          trailing: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              // VerticalSpacer(1.h),
                                              Text(
                                                '₹ ${value}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                              ),
                                              VerticalSpacer(1.h),
                                              Text(
                                                  'Brought ${goldController.goldlistingmodel?.res?.transactions?[index].purchasedGold.toStringAsFixed(2)} mg gold'),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) => Divider(
                                        color: Colors.grey,
                                        thickness: 1,
                                      ),
                                  itemCount: goldController.goldlistingmodel
                                          ?.res?.transactions?.length ??
                                      0),
                            ),
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
                                ? true
                                : false,
                            child: InkWell(
                              onTap: () {
                                showBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Consumer<GoldController>(
                                        builder: (context, goldController, _) {
                                      return Container(
                                        margin: EdgeInsets.all(15.sp),
                                        height: 300,
                                        color: Colors.white,
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
                                            VerticalSpacer(5.h),
                                            goldController.loading == true
                                                ? const LoadingButton()
                                                : ButtonWidget(
                                                    btName: 'Add',
                                                    onTap: () async {
                                                      if (goldController
                                                          .goldRateController
                                                          .text
                                                          .isNotEmpty) {
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ScreenBuy(),
                                  ));
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
                          // InkWell(
                          //   onTap: () {
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (context) =>
                          //               const ScreenSellGold(),
                          //         ));
                          //   },
                          //   child: Container(
                          //     height: Adaptive.h(5),
                          //     width: Adaptive.w(25),
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(20.sp),
                          //       color: const Color(0xFF2D5D5F),
                          //     ),
                          //     child: const Center(
                          //       child: Text(
                          //         'Sell',
                          //         style: TextStyle(
                          //           fontWeight: FontWeight.bold,
                          //           color: Color(0xFFF7BF05),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          HorizontalSpacer(5.w),
                        ],
                      ),
                      VerticalSpacer(5.h),
                    ],
                  );
          }),
        ),
      ),
    );
  }
}
