import 'package:finfresh_mobile/controller/top%20MFs%20controller/top_mfs_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/all%20mutual%20fund/screen_all_mutual_fund.dart';
import 'package:finfresh_mobile/view/homeScreen/widgets/collection_widget.dart';
import 'package:finfresh_mobile/view/top%20funds/top_funds.dart';
import 'package:finfresh_mobile/view/top%20mfs/screen_top_mfs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SixMutualFundWidget extends StatelessWidget {
  const SixMutualFundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.sp),
      child: SizedBox(
        // height: Adaptive.h(30),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            VerticalSpacer(Adaptive.h(1)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: Adaptive.h(12),
                  width: Adaptive.w(20),
                  child: Card(
                    elevation: 6,
                    color: const Color(0xFFE1F5EA),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        VerticalSpacer(1.h),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TopMfsScreen(
                                  category: 'Hybrid: Aggressive',
                                  appbarname: 'Aggressive',
                                ),
                              ),
                            );
                          },
                          child: Collectionwidget(
                            image: 'assets/images/coin_8181194.png',
                            color: Color(0xFFA0CFA2),
                          ),
                        ),
                        VerticalSpacer(1.h),
                        // Text(
                        //   'Aggressive',
                        //   style: TextStyle(
                        //     fontSize: 15.5.sp,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        // VerticalSpacer(1.h),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Adaptive.h(12),
                  width: Adaptive.w(20),
                  child: Card(
                    color: Color(0xFFFDEAD3),
                    elevation: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        VerticalSpacer(1.h),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TopMfsScreen(
                                  category: 'Equity: Flexi Cap',
                                  appbarname: "Flexi Cap",
                                ),
                              ),
                            );
                          },
                          child: const Collectionwidget(
                            image: 'assets/images/wallet_8181552.png',
                            color: Color(0xFFF8B39B),
                          ),
                        ),
                        VerticalSpacer(1.h),
                        // VerticalSpacer(3.h),
                        // Text('Flexi Cap',
                        //     style: TextStyle(
                        //       fontSize: 15.5.sp,
                        //       fontWeight: FontWeight.bold,
                        //     )),
                        // VerticalSpacer(1.h),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Adaptive.h(12),
                  width: Adaptive.w(20),
                  child: Card(
                    color: Color(0xFFF9F5FF),
                    elevation: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        VerticalSpacer(1.h),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TopMfsScreen(
                                  category: 'Equity: Multi Cap',
                                  appbarname: 'Multi Cap',
                                ),
                              ),
                            );
                          },
                          child: const Collectionwidget(
                            image: 'assets/images/piggy-bank_1926629.png',
                            color: Color(0xFF8380B3),
                          ),
                        ),
                        VerticalSpacer(1.h),
                        // Text('Multi Cap',
                        //     style: TextStyle(
                        //       fontSize: 15.5.sp,
                        //       fontWeight: FontWeight.bold,
                        //     )),
                        // VerticalSpacer(1.h),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Adaptive.h(12),
                  width: Adaptive.w(20),
                  child: Card(
                    elevation: 6,
                    color: const Color(0xFFE1F5EA),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        VerticalSpacer(1.h),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TopMfsScreen(
                                  category: 'Equity: Large Cap',
                                  appbarname: 'Large Cap',
                                ),
                              ),
                            );
                          },
                          child: Collectionwidget(
                            image: 'assets/images/office_9155715.png',
                            // image: 'assets/images/bank_8690572.png',
                            color: Color(0xFF71BEE7),
                          ),
                        ),
                        VerticalSpacer(1.h),
                        // Text(
                        //   'Aggressive',
                        //   style: TextStyle(
                        //     fontSize: 15.5.sp,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        // VerticalSpacer(1.h),
                      ],
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
                  'Aggressive',
                  style: TextStyle(
                    fontSize: 15.5.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // HorizontalSpacer(16.w),
                Text('Flexi Cap',
                    style: TextStyle(
                      fontSize: 15.5.sp,
                      fontWeight: FontWeight.bold,
                    )),
                // HorizontalSpacer(19.w),
                Text('Multi Cap',
                    style: TextStyle(
                      fontSize: 15.5.sp,
                      fontWeight: FontWeight.bold,
                    )),
                Text('Large cap',
                    style: TextStyle(
                        fontSize: 15.5.sp, fontWeight: FontWeight.bold)),
              ],
            ),
            VerticalSpacer(1.5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SizedBox(
                //   width: Adaptive.w(27),
                //   child: Card(
                //     elevation: 5,
                //     child: Column(
                //       children: [
                //         VerticalSpacer(1.h),
                //         InkWell(
                //           onTap: () {
                //             Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) => const TopMfsScreen(
                //                   category: 'Equity: Large Cap',
                //                   appbarname: 'Large Cap',
                //                 ),
                //               ),
                //             );
                //           },
                //           child: const Collectionwidget(
                //             image: 'assets/images/largecap.png',
                //             // color: Color(0xFF7214FF),
                //           ),
                //         ),
                //         VerticalSpacer(1.h),
                //         Text('Large cap',
                //             style: TextStyle(
                //                 fontSize: 15.5.sp,
                //                 fontWeight: FontWeight.bold)),
                //         VerticalSpacer(1.h),
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: Adaptive.h(12),
                  width: Adaptive.w(20),
                  child: Card(
                    color: Color(0xFFF9FFB5),
                    elevation: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        VerticalSpacer(1.h),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TopMfsScreen(
                                  category: 'Equity: Mid Cap',
                                  appbarname: 'Mid Cap',
                                ),
                              ),
                            );
                          },
                          child: const Collectionwidget(
                            image: 'assets/images/bank_8690572.png',
                            color: Color.fromARGB(255, 219, 213, 88),
                            // color: Color(0xFFC5714E),
                          ),
                        ),
                        VerticalSpacer(1.h),
                        // Text('Mid Cap',
                        //     style: TextStyle(
                        //       fontSize: 15.5.sp,
                        //       fontWeight: FontWeight.bold,
                        //     )),
                        // VerticalSpacer(1.h),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Adaptive.h(12),
                  width: Adaptive.w(20),
                  child: Card(
                    color: Color.fromARGB(255, 200, 250, 207),
                    elevation: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        VerticalSpacer(1.h),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TopMfsScreen(
                                  category: 'Equity: Small Cap',
                                  appbarname: 'Small Cap',
                                ),
                              ),
                            );
                          },
                          child: const Collectionwidget(
                            image: 'assets/images/shop_3916677.png',
                            color: Color(0xFF42D6A4),
                          ),
                        ),
                        VerticalSpacer(1.h),
                        // Text('Small Cap',
                        //     style: TextStyle(
                        //       fontSize: 15.5.sp,
                        //       fontWeight: FontWeight.bold,
                        //     )),
                        // VerticalSpacer(1.h),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Adaptive.h(12),
                  width: Adaptive.w(20),
                  child: Card(
                    elevation: 6,
                    color: Color.fromARGB(255, 252, 219, 216),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        VerticalSpacer(1.h),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ScreenTopFunds(),
                              ),
                            );
                          },
                          child: Collectionwidget(
                            image: 'assets/images/profit_9720059.png',
                            color: Color.fromARGB(255, 238, 107, 95),
                          ),
                        ),
                        VerticalSpacer(1.h),
                        // Text(
                        //   'Aggressive',
                        //   style: TextStyle(
                        //     fontSize: 15.5.sp,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        // VerticalSpacer(1.h),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Adaptive.h(12),
                  width: Adaptive.w(20),
                  child: Card(
                    elevation: 6,
                    color: Color.fromARGB(255, 239, 223, 253),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        VerticalSpacer(1.h),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ScreenAllMutualFund(),
                              ),
                            );
                            // Provider.of<TopMFsController>(context,
                            //         listen: false)
                            //     .queryController
                            //     .clear();
                            // Provider.of<TopMFsController>(context,
                            //         listen: false)
                            //     .returns = '3 year';
                            // Provider.of<TopMFsController>(context,
                            //         listen: false)
                            //     .returntoBackend = '3y';
                            // Provider.of<TopMFsController>(context,
                            //         listen: false)
                            //     .getTopMfsFRomPeriod(context, 'All');
                          },
                          child: Collectionwidget(
                            image: 'assets/images/guarantee_1175296.png',
                            color: Color(0xFF9D94FF),
                          ),
                        ),
                        VerticalSpacer(1.h),
                        // Text(
                        //   'Aggressive',
                        //   style: TextStyle(
                        //     fontSize: 15.5.sp,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        // VerticalSpacer(1.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            VerticalSpacer(1.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Mid Cap',
                    style: TextStyle(
                      fontSize: 15.5.sp,
                      fontWeight: FontWeight.bold,
                    )),
                Text('Small Cap',
                    style: TextStyle(
                      fontSize: 15.5.sp,
                      fontWeight: FontWeight.bold,
                    )),
                Text('Top Funds',
                    style: TextStyle(
                      fontSize: 15.5.sp,
                      fontWeight: FontWeight.bold,
                    )),
                Text('All Funds',
                    style: TextStyle(
                      fontSize: 15.5.sp,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
