import 'package:finfresh_mobile/controller/top%20MFs%20controller/top_mfs_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/all%20mutual%20fund/screen_all_mutual_fund.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/stock_detail_screen.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenMutualFund extends StatelessWidget {
  const ScreenMutualFund({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TopMFsController>(context, listen: false)
          .callinginInit(context);
    });
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
                    // TextFormField(
                    //   controller: topMfsController.queryController,
                    //   style: Theme.of(context)
                    //       .textTheme
                    //       .labelLarge!
                    //       .copyWith(fontSize: 16.sp),
                    //   autovalidateMode: AutovalidateMode.onUserInteraction,
                    //   decoration: InputDecoration(
                    //     // helperText: '',
                    //     prefixIcon: Icon(
                    //       Icons.search,
                    //       size: Adaptive.h(2.3),
                    //     ),

                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     contentPadding: EdgeInsets.symmetric(horizontal: 12.0.sp),
                    //     hintText: 'Search',
                    //   ),
                    //   onChanged: (value) {
                    //     topMfsController.searchItems();
                    //   },
                    // ),
                    // VerticalSpacer(Adaptive.h(2)),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       '${topMfsController.filteredListForAllFunds.length ?? 0} SCHEMES',
                    //       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    //             fontSize: 16.sp,
                    //             fontWeight: FontWeight.bold,
                    //             letterSpacing: 3.sp,
                    //           ),
                    //     ),
                    //     const DurationButton(
                    //       category: 'All',
                    //     )
                    //   ],
                    // ),
                    SizedBox(
                      height: Adaptive.h(15.5),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                        child: Column(
                          children: [
                            VerticalSpacer(1.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(27.sp),
                                  ),
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundColor: const Color(0xFFEFF0FC),
                                    child: Image.asset(
                                      'assets/images/anniversary_6520985.png',
                                      height: Adaptive.h(5),
                                      width: Adaptive.w(5),
                                      color: const Color(0xFF71BEE7),
                                    ),
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(27.sp),
                                  ),
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundColor: const Color(0xFFEFFBF8),
                                    child: Image.asset(
                                      'assets/images/top-games-star_40894.png',
                                      height: Adaptive.h(5),
                                      width: Adaptive.w(5),
                                      color: const Color(0xFF42D6A4),
                                    ),
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(27.sp),
                                  ),
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundColor: const Color(0xFFF6F7F8),
                                    child: Image.asset(
                                      'assets/images/up_5920480.png',
                                      height: Adaptive.h(5),
                                      width: Adaptive.w(5),
                                      color: const Color(0xFF8380B3),
                                    ),
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(27.sp),
                                  ),
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundColor: const Color(0xFFFFF4F3),
                                    child: Image.asset(
                                      'assets/images/user_1077114.png',
                                      height: Adaptive.h(5),
                                      width: Adaptive.w(5),
                                      color: const Color.fromARGB(
                                          255, 238, 107, 95),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            VerticalSpacer(1.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'SIP with 100',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  'Top Performing',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  'High Returns',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  'Only For You',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            VerticalSpacer(1.h),
                            ListTile(
                              contentPadding: EdgeInsets.only(
                                left: 9.sp,
                                right: 15.sp,
                              ),
                              leading: const SizedBox(),
                              title: Text(
                                'Start a SIP',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 17.5.sp,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 3.5.sp,
                                      // color: Color(0xFFACB2BA),
                                    ),
                              ),
                              subtitle: Text(
                                'For a longer term growth and goals.',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.grey,
                                    ),
                              ),
                              trailing: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ScreenAllMutualFund(),
                                      ));
                                },
                                child: SizedBox(
                                  width: Adaptive.w(20),
                                  height: Adaptive.h(4.5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                      color: const Color(0xFF6C8FF8),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Start',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            VerticalSpacer(1.h),
                          ],
                        ),
                      ),
                    ),
                    VerticalSpacer(2.h),
                    Text(
                      'Lumpsum',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    // VerticalSpacer(2.h),
                    SizedBox(
                      height: Adaptive.h(15.5),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                        child: Column(
                          children: [
                            VerticalSpacer(1.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(27.sp),
                                  ),
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundColor: const Color(0xFFEFF0FC),
                                    child: Image.asset(
                                      'assets/images/check_1232237.png',
                                      height: Adaptive.h(5),
                                      width: Adaptive.w(5),
                                      color: const Color(0xFF71BEE7),
                                    ),
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(27.sp),
                                  ),
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundColor: const Color(0xFFEFFBF8),
                                    child: Image.asset(
                                      'assets/images/1-year_12068439.png',
                                      height: Adaptive.h(5),
                                      width: Adaptive.w(5),
                                      color: const Color(0xFF42D6A4),
                                    ),
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(27.sp),
                                  ),
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundColor: const Color(0xFFF6F7F8),
                                    child: Image.asset(
                                      'assets/images/5th-years_11945704.png',
                                      height: Adaptive.h(5),
                                      width: Adaptive.w(5),
                                      color: const Color(0xFF8380B3),
                                    ),
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(27.sp),
                                  ),
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundColor: const Color(0xFFFFF4F3),
                                    child: Image.asset(
                                      'assets/images/trophy_7018676.png',
                                      height: Adaptive.h(6),
                                      width: Adaptive.w(6),
                                      color: const Color.fromARGB(
                                          255, 238, 107, 95),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            VerticalSpacer(1.h),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Start from 10000',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                HorizontalSpacer(4.w),
                                Text(
                                  '1 year goal',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                HorizontalSpacer(10.w),
                                Text(
                                  '5 years',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                HorizontalSpacer(13.w),
                                Text(
                                  '7+ years',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            VerticalSpacer(1.h),
                            ListTile(
                              contentPadding: EdgeInsets.only(
                                left: 9.sp,
                                right: 15.sp,
                              ),
                              leading: const SizedBox(),
                              title: Text(
                                'Start a Lumpsum',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 17.5.sp,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 3.5.sp,
                                      // color: Color(0xFFACB2BA),
                                    ),
                              ),
                              subtitle: Text(
                                'For a longer term growth and goals.',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.grey,
                                    ),
                              ),
                              trailing: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ScreenAllMutualFund(),
                                      ));
                                },
                                child: SizedBox(
                                  width: Adaptive.w(20),
                                  height: Adaptive.h(4.5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                      color: const Color(0xFF6C8FF8),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Start',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            VerticalSpacer(1.h),
                          ],
                        ),
                      ),
                    ),

                    VerticalSpacer(2.h),
                    Text(
                      'All Funds',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    VerticalSpacer(2.h),
                    // topMfsController.lodingList == true
                    //     ? const LoadingWidget()
                    //     : topMfsController.filteredListForAllFunds.isEmpty
                    //         ? Center(
                    //             child: Text(
                    //               'No data found',
                    //               style: Theme.of(context)
                    //                   .textTheme
                    //                   .bodyMedium!
                    //                   .copyWith(
                    //                     fontSize: 16.sp,
                    //                     fontWeight: FontWeight.w500,
                    //                   ),
                    //             ),
                    //           )
                    // :
                    SizedBox(
                      height: Adaptive.h(84),
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
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
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
                                          color:
                                              Color.fromARGB(255, 253, 217, 214)
                                                  .withOpacity(0.5),
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

                                    // Row(
                                    //   children: [
                                    //     HorizontalSpacer(1.w),
                                    //     SizedBox(
                                    //       height: 5.h,
                                    //       width: 10.w,
                                    //       child: Image.network(
                                    //         topMfsController
                                    //                 .filteredListForAllFunds[
                                    //                     index]
                                    //                 .logo ??
                                    //             '',
                                    //         errorBuilder: (context, error,
                                    //             stackTrace) {
                                    //           return const SizedBox();
                                    //         },
                                    //       ),
                                    //     ),
                                    //     HorizontalSpacer(1.w),
                                    //     Expanded(
                                    //       child: Text(
                                    //         '${topMfsController.filteredListForAllFunds[index].schemeAmfi}',
                                    //         overflow:
                                    //             TextOverflow.visible,
                                    //         style: Theme.of(context)
                                    //             .textTheme
                                    //             .bodyMedium!
                                    //             .copyWith(
                                    //               fontSize: 17.sp,
                                    //               fontWeight:
                                    //                   FontWeight.bold,
                                    //             ),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    // VerticalSpacer(2.h),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     HorizontalSpacer(2.w),
                                    //     Expanded(
                                    //       child: Text(
                                    //         topMfsController
                                    //                 .filteredListForAllFunds[
                                    //                     index]
                                    //                 .schemeCategory ??
                                    //             "",
                                    //         style: Theme.of(context)
                                    //             .textTheme
                                    //             .bodyMedium!
                                    //             .copyWith(
                                    //               fontSize: 16.sp,
                                    //               fontWeight:
                                    //                   FontWeight.w500,
                                    //             ),
                                    //         overflow:
                                    //             TextOverflow.visible,
                                    //       ),
                                    //     ),
                                    //     Container(
                                    //       decoration: BoxDecoration(
                                    //         border: Border.all(),
                                    //         borderRadius:
                                    //             BorderRadius.circular(
                                    //           10.sp,
                                    //         ),
                                    //       ),
                                    //       child: Padding(
                                    //         padding:
                                    //             EdgeInsets.all(10.0.sp),
                                    //         child: Text(
                                    //           '${topMfsController.filteredListForAllFunds[index].riskometer}',
                                    //           style: TextStyle(
                                    //               color: topMfsController
                                    //                               .filteredListForAllFunds[
                                    //                                   index]
                                    //                               .riskometer ==
                                    //                           'Very High' ||
                                    //                       topMfsController
                                    //                               .filteredListForAllFunds[
                                    //                                   index]
                                    //                               .riskometer ==
                                    //                           'High'
                                    //                   ? Colors.red
                                    //                   : Colors.amber),
                                    //         ),
                                    //       ),
                                    //     )
                                    //   ],
                                    // ),
                                    // VerticalSpacer(2.h),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.end,
                                    //   children: [
                                    //     Column(
                                    //       children: [
                                    //         Text(
                                    //             '${topMfsController.returns} return'),
                                    //         Text(
                                    //             '${topMfsController.returnPercentageinAllFunds}%')
                                    //       ],
                                    //     )
                                    //   ],
                                    // )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            VerticalSpacer(1.h),
                        itemCount:
                            topMfsController.filteredListForAllFunds.length > 5
                                ? 5
                                : topMfsController
                                    .filteredListForAllFunds.length,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: Adaptive.h(9),
                        width: Adaptive.w(45),
                        child: ButtonWidget(
                          btName: 'View More',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ScreenAllMutualFund(),
                                ));
                          },
                        ),
                      ),
                    ),
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
