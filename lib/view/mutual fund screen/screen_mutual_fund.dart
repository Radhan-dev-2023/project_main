import 'package:finfresh_mobile/controller/top%20MFs%20controller/top_mfs_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/all%20mutual%20fund/screen_all_mutual_fund.dart';
import 'package:finfresh_mobile/view/mutual%20fund%20screen/widgets/funds_widget.dart';
import 'package:finfresh_mobile/view/mutual%20fund%20screen/widgets/goals_screen.dart';
import 'package:finfresh_mobile/view/mutual%20fund%20screen/widgets/widget_for_toppicks_goals.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/stock_detail_screen.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../stock details screen/widgets/overview_in_tabbar.dart';

class ScreenMutualFund extends StatefulWidget {
  const ScreenMutualFund({super.key});

  @override
  State<ScreenMutualFund> createState() => _ScreenMutualFundState();
}

class _ScreenMutualFundState extends State<ScreenMutualFund> {
  @override
  void initState() {
    super.initState();
    Provider.of<TopMFsController>(context, listen: false).indexForFunds = 0;
    Provider.of<TopMFsController>(context, listen: false)
        .callinginInit(context);
  }

  @override
  Widget build(BuildContext context) {
    Brightness platformBrightness = MediaQuery.of(context).platformBrightness;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mutual Funds'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenAllMutualFund(),
                  ));
            },
            child: Icon(
              Icons.search,
              size: Adaptive.h(2.3),
            ),
          ),
          HorizontalSpacer(2.w)
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15.sp),
          child: Consumer<TopMFsController>(
            builder: (context, topMfsController, child) {
              if (topMfsController.lodingList == true) {
                return const LoadingWidget();
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Top Picks',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    VerticalSpacer(1.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              topMfsController.changeFundindex(0);
                            },
                            child: Container(
                              height: Adaptive.h(4.5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.sp),
                                color: topMfsController.indexForFunds == 0
                                    ? const Color(0xFF33BEFB)
                                    : const Color(0xFFDFF5FF),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Center(
                                  child: CustomTextWidget(
                                    text: 'Sip Under 500',
                                    fontSize: 16.sp,
                                    color: topMfsController.indexForFunds == 0
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          HorizontalSpacer(3.w),
                          InkWell(
                            onTap: () {
                              topMfsController.changeFundindex(1);
                            },
                            child: Container(
                              height: Adaptive.h(4.5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.sp),
                                color: topMfsController.indexForFunds == 1
                                    ? const Color(0xFF33BEFB)
                                    : const Color(0xFFDFF5FF),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Center(
                                  child: CustomTextWidget(
                                    text: 'Finfresh Pick',
                                    fontSize: 16.sp,
                                    color: topMfsController.indexForFunds == 1
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          HorizontalSpacer(3.w),
                          InkWell(
                            onTap: () {
                              topMfsController.changeFundindex(2);
                            },
                            child: Container(
                              height: Adaptive.h(4.5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.sp),
                                color: topMfsController.indexForFunds == 2
                                    ? const Color(0xFF33BEFB)
                                    : const Color(0xFFDFF5FF),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Center(
                                  child: CustomTextWidget(
                                    text: 'Tax Savings',
                                    fontSize: 16.sp,
                                    color: topMfsController.indexForFunds == 2
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          HorizontalSpacer(3.w),
                          InkWell(
                            onTap: () {
                              topMfsController.changeFundindex(3);
                            },
                            child: Container(
                              height: Adaptive.h(4.5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.sp),
                                color: topMfsController.indexForFunds == 3
                                    ? const Color(0xFF33BEFB)
                                    : const Color(0xFFDFF5FF),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Center(
                                  child: CustomTextWidget(
                                    text: 'Sectoral',
                                    fontSize: 16.sp,
                                    color: topMfsController.indexForFunds == 3
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
                    VerticalSpacer(1.h),
                    WigetForTopPIcksAndGoals(
                      listname: topMfsController.topPicksModel?.result
                          ?.funds![topMfsController.indexForFunds],
                      wigetInTrailing: const SizedBox(),
                    ),
                    VerticalSpacer(2.h),
                    // const FundsWidget(),
                    // VerticalSpacer(2.h),
                    Text(
                      'Goals',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      height: Adaptive.h(48),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of columns
                          crossAxisSpacing: 10, // Spacing between columns
                          mainAxisSpacing: 10, // Spacing between rows
                        ),
                        itemCount: topMfsController.item.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ScreenGolas(
                                      heading: topMfsController.item[index],
                                      image: topMfsController.imageList[index],
                                    ),
                                  ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.sp),
                                // color: Color.fromARGB(255, 23, 79, 94),
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.sp),
                                    child: Image.asset(
                                      topMfsController.imageList[index],
                                      fit: BoxFit.fill,
                                      width: double.infinity,
                                      // height: Adaptive.h(18),
                                    ),
                                  ),
                                  // Positioned(
                                  //   bottom: 0,
                                  //   child: Container(
                                  //     width: 172,
                                  //     height: 45.5,
                                  //     decoration: BoxDecoration(
                                  //         color: const Color.fromARGB(
                                  //             255, 252, 250, 250),
                                  //         borderRadius: BorderRadius.only(
                                  //             bottomLeft:
                                  //                 Radius.circular(15.sp),
                                  //             bottomRight:
                                  //                 Radius.circular(15.sp))),
                                  //   ),
                                  // ),
                                  // Positioned(
                                  //   bottom: 12.sp,
                                  //   left: 22.sp,
                                  //   child: Text(
                                  //     topMfsController.item[index],
                                  //     style: TextStyle(
                                  //       color: Colors.white,
                                  //       fontSize: 19.sp,
                                  //       fontWeight: FontWeight.bold,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    VerticalSpacer(2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'All Funds',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ScreenAllMutualFund(),
                                ));
                          },
                          child: Text(
                            'View All',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF0066FF)),
                          ),
                        ),
                      ],
                    ),
                    VerticalSpacer(2.h),
                    SizedBox(
                      height: Adaptive.h(75),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          topMfsController.returnValueallFunds(index);
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StockDetailsScreen(
                                    scheme:
                                        '${topMfsController.filteredListForAllFunds[index].schemeAmfi}',
                                    isinNumber: topMfsController
                                            .filteredListForAllFunds[index]
                                            .isinNo ??
                                        '',
                                    category: topMfsController
                                            .filteredListForAllFunds[index]
                                            .schemeCategory ??
                                        "",
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 7,
                              child: Padding(
                                padding: EdgeInsets.all(10.sp),
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: SizedBox(
                                        height: 5.h,
                                        width: 10.w,
                                        child: Image.network(
                                          topMfsController
                                                  .filteredListForAllFunds[
                                                      index]
                                                  .logo ??
                                              '',
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const SizedBox();
                                          },
                                        ),
                                      ),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${topMfsController.filteredListForAllFunds[index].schemeAmfi}',
                                            overflow: TextOverflow.visible,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                            maxLines: 2,
                                          ),
                                          VerticalSpacer(1.h),
                                        ],
                                      ),
                                      subtitle: Text(
                                        topMfsController
                                                .filteredListForAllFunds[index]
                                                .schemeCategory ??
                                            "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                fontSize: 16.sp,
                                                color: Colors.grey),
                                        overflow: TextOverflow.visible,
                                      ),
                                      trailing: Container(
                                        decoration: BoxDecoration(
                                          color: platformBrightness ==
                                                  Brightness.light
                                              ? const Color.fromARGB(
                                                      255, 253, 217, 214)
                                                  .withOpacity(0.5)
                                              : const Color(0xFFCC324C)
                                                  .withOpacity(0.3),
                                          borderRadius: BorderRadius.circular(
                                            10.sp,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: 12.sp,
                                            right: 12.sp,
                                            top: 6.sp,
                                            bottom: 8.sp,
                                          ),
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
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            VerticalSpacer(0.5.h),
                        itemCount:
                            topMfsController.filteredListForAllFunds.length > 5
                                ? 5
                                : topMfsController
                                    .filteredListForAllFunds.length,
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.center,
                    //   child: SizedBox(
                    //     height: Adaptive.h(9),
                    //     width: Adaptive.w(45),
                    //     child: ButtonWidget(
                    //       btName: 'View More',
                    //       onTap: () {
                    //         Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //               builder: (context) =>
                    //                   const ScreenAllMutualFund(),
                    //             ));
                    //       },
                    //     ),
                    //   ),
                    // ),
                    VerticalSpacer(10.h)
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
