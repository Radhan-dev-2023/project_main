import 'dart:developer';

import 'package:finfresh_mobile/controller/goldController/gold_controller.dart';
import 'package:finfresh_mobile/services/get%20gold%20rate/get_gold_rate.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/digi%20gold%20screen/buy%20screen/buy_screen.dart';
import 'package:finfresh_mobile/view/digi%20gold%20screen/sell%20screen/sell_screen.dart';
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
    Provider.of<GoldController>(context, listen: false).getGoldrate(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
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
                              '₹${goldController.goldvalue}/mg',
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
                                  children: [
                                    VerticalSpacer(2.h),
                                    Text(
                                      'Current value',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                    VerticalSpacer(1.h),
                                    Text(
                                      '1800 mg',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    VerticalSpacer(1.h),
                                    Text(
                                      '20 % profit',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.sp),
                        child: SizedBox(
                          child: Column(
                            children: [
                              ListTile(
                                title: const Text('Selling gold'),
                                subtitle: const Text(
                                  '20.10.2024',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                trailing: Column(
                                  children: [
                                    VerticalSpacer(1.h),
                                    Text(
                                      '₹ 1000',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    const Text('Sold 259 mg gold')
                                  ],
                                ),
                              ),
                              ListTile(
                                title: const Text('Buying gold'),
                                subtitle: const Text(
                                  '20.10.2024',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                trailing: Column(
                                  children: [
                                    VerticalSpacer(1.h),
                                    Text(
                                      '₹ 1000',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    const Text('Brought 259 mg gold')
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      VerticalSpacer(10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              scaffoldState.currentState!.showBottomSheet(
                                (BuildContext context) {
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
                                          Text(
                                            'Add Gold Rate',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          VerticalSpacer(3.h),
                                          TextFormField(
                                            controller: goldController
                                                .goldRateController,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
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
                                                    bool result =
                                                        await goldController
                                                            .addGoldRate(
                                                                context);
                                                    if (result == true) {
                                                      // ignore: use_build_context_synchronously
                                                      Navigator.pop(context);
                                                    } else {
                                                      log('failed');
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
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ScreenSellGold(),
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
                      )
                    ],
                  );
          }),
        ),
      ),
    );
  }
}
