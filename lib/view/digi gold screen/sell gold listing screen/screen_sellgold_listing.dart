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
    // TODO: implement initState
    super.initState();
    Provider.of<GoldController>(context, listen: false)
        .getSellGoldListing(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GoldController>(builder: (context, goldController, _) {
        return SingleChildScrollView(
          child: goldController.sellListingLoading == true
              ? const LoadingWidget()
              : Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          color: const Color(0xFF2D5D5F),
                          height: Adaptive.h(40),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              VerticalSpacer(8.h),
                              Text(
                                '₹${goldController.sellrate ?? ''}/mg',
                                style: TextStyle(
                                  fontSize: 23.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 3.sp,
                                ),
                              ),
                              VerticalSpacer(1.h),
                              const Text(
                                'Current gold selling price',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                              VerticalSpacer(5.h),
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
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.sp),
                                child: Image.asset(
                                  'assets/images/goldimagein.jpg',
                                  height: Adaptive.h(14),
                                  width: Adaptive.w(31),
                                  fit: BoxFit.fill,
                                ),
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
                                    goldController.formattedValue,
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
                    SizedBox(
                      child: ListView.separated(
                        padding: EdgeInsets.all(15.sp),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CustomTextWidget(
                                    text: 'Sold Gold',
                                  ),
                                  VerticalSpacer(0.5.h),
                                  CustomTextWidget(
                                    text:
                                        "${goldController.sellGoldListingModel?.result?[index].sellDate.toString().substring(0, 10)}",
                                    color: Colors.grey,
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
                                      // VerticalSpacer(1.h),
                                      Text(
                                        'Amount ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      VerticalSpacer(0.1.h),
                                      Text(
                                        'Status ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      // VerticalSpacer(0.2.h),
                                      Text(
                                        'SoldMg ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        ': ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      Text(
                                        ': ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      VerticalSpacer(0.4.h),
                                      Text(
                                        ': ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      // VerticalSpacer(1.h),
                                      Text(
                                        ' ₹ ${goldController.sellGoldListingModel?.result?[index].amount.toStringAsFixed(2)}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      VerticalSpacer(0.1.h),
                                      Text(
                                        '${goldController.sellGoldListingModel?.result?[index].status}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      // VerticalSpacer(0.2.h),
                                      Text(
                                        '${goldController.sellGoldListingModel?.result?[index].soldmg}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: goldController
                                .sellGoldListingModel?.result?.length ??
                            0,
                      ),
                    ),
                    VerticalSpacer(2.h),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ScreenSellGold(),
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
                    VerticalSpacer(10.h),
                  ],
                ),
        );
      }),
    );
  }
}
