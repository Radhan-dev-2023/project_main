import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/all%20mutual%20fund/screen_all_mutual_fund.dart';
import 'package:finfresh_mobile/view/homeScreen/widgets/collection_widget.dart';
import 'package:finfresh_mobile/view/top%20funds/top_funds.dart';
import 'package:finfresh_mobile/view/top%20mfs/screen_top_mfs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            VerticalSpacer(Adaptive.h(1)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor:
                            const Color(0xFF8AC9FE).withOpacity(0.5),
                        child: SizedBox(
                          height: Adaptive.h(9),
                          width: Adaptive.w(18),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(27.sp),
                            ),
                            elevation: 0,
                            color: const Color(0xFF8AC9FE),
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
                                            const TopMfsScreen(
                                          category: 'Index Fund',
                                          appbarname: 'Index Fund',
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Collectionwidget(
                                    image: 'assets/images/indexfund.png',
                                    color: Color.fromARGB(255, 16, 49, 78),
                                  ),
                                ),
                                VerticalSpacer(1.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    VerticalSpacer(1.h),
                    Text('Index Fund',
                        style: TextStyle(
                          fontSize: 14.5.sp,
                        )),
                  ],
                ),
                SizedBox(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor:
                            const Color(0xFFE9DCFF).withOpacity(0.5),
                        child: SizedBox(
                          height: Adaptive.h(9),
                          width: Adaptive.w(18),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(27.sp),
                            ),
                            color: const Color(0xFFE9DCFF),
                            elevation: 0,
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
                                            const TopMfsScreen(
                                          category: 'Equity: Elss',
                                          appbarname: "Tax Savings",
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Collectionwidget(
                                    image: 'assets/images/piggy.png',
                                    color: Color.fromARGB(200, 100, 60, 200),
                                  ),
                                ),
                                VerticalSpacer(1.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                      VerticalSpacer(1.h),
                      Text('Tax Savings',
                          style: TextStyle(
                            fontSize: 14.5.sp,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor:
                            const Color(0xFFFE8AE0).withOpacity(0.5),
                        child: SizedBox(
                          height: Adaptive.h(9),
                          width: Adaptive.w(18),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(27.sp),
                            ),
                            color: const Color(0xFFFE8AE0),
                            elevation: 0,
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
                                            const TopMfsScreen(
                                          category: 'Equity: Flexi Cap',
                                          appbarname: 'Flexi Cap',
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Collectionwidget(
                                    image: 'assets/images/flexicappp.png',
                                    color: Color.fromARGB(255, 170, 2, 125),
                                  ),
                                ),
                                VerticalSpacer(1.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                      VerticalSpacer(1.h),
                      Text('Flexi Cap',
                          style: TextStyle(
                            fontSize: 14.5.sp,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor:
                            const Color(0xFFA3FFBB).withOpacity(0.5),
                        child: SizedBox(
                          height: Adaptive.h(9),
                          width: Adaptive.w(18),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(27.sp),
                            ),
                            elevation: 0,
                            color: const Color(0xFFA3FFBB),
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
                                            const TopMfsScreen(
                                          category: 'Equity: Large Cap',
                                          appbarname: 'Large Cap',
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Collectionwidget(
                                    image: 'assets/images/largecap.png',
                                    color: Color.fromARGB(255, 44, 138, 67),
                                  ),
                                ),
                                VerticalSpacer(1.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                      VerticalSpacer(1.h),
                      Text('Large Cap',
                          style: TextStyle(
                            fontSize: 14.5.sp,
                          )),
                    ],
                  ),
                ),
              ],
            ),
            VerticalSpacer(1.5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor:
                            const Color(0xFFF89FFE).withOpacity(0.5),
                        child: SizedBox(
                          height: Adaptive.h(9),
                          width: Adaptive.w(18),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(27.sp),
                            ),
                            color: const Color(0xFFF89FFE),
                            elevation: 0,
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
                                            const TopMfsScreen(
                                          category: 'Equity: Mid Cap',
                                          appbarname: 'Mid Cap',
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Collectionwidget(
                                    image: 'assets/images/midcapinfund.png',
                                    color: Color.fromARGB(255, 133, 70, 138),
                                  ),
                                ),
                                VerticalSpacer(1.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    VerticalSpacer(1.h),
                    Text('Mid Cap',
                        style: TextStyle(
                          fontSize: 14.5.sp,
                        )),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor:
                            const Color(0xFFFE8A9B).withOpacity(0.5),
                        child: SizedBox(
                          height: Adaptive.h(9),
                          width: Adaptive.w(18),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(27.sp),
                            ),
                            color: const Color(0xFFFE8A9B),
                            elevation: 0,
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
                                            const TopMfsScreen(
                                          category: 'Equity: Small Cap',
                                          appbarname: 'Small Cap',
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Collectionwidget(
                                    image: 'assets/images/smalcapinfunds.png',
                                    color: Color.fromARGB(255, 129, 17, 34),
                                  ),
                                ),
                                VerticalSpacer(1.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    VerticalSpacer(1.h),
                    Text('Small Cap',
                        style: TextStyle(
                          fontSize: 14.5.sp,
                        )),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor:
                            const Color(0xFFFBA054).withOpacity(0.5),
                        child: SizedBox(
                          height: Adaptive.h(9),
                          width: Adaptive.w(18),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(27.sp),
                            ),
                            elevation: 0,
                            color: const Color(0xFFFBA054),
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
                                            const TopMfsScreen(
                                          category:
                                              'Equity: Sectoral-Infrastructure',
                                          appbarname: 'Sectoral',
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Collectionwidget(
                                    image: 'assets/images/sectoralinfund.png',
                                    color: Color.fromARGB(255, 148, 72, 9),
                                  ),
                                ),
                                VerticalSpacer(1.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    VerticalSpacer(1.h),
                    Text('Sectoral Fund',
                        style: TextStyle(
                          fontSize: 14.5.sp,
                        )),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor:
                            const Color(0xFF8AFEED).withOpacity(0.5),
                        child: SizedBox(
                          height: Adaptive.h(9),
                          width: Adaptive.w(18),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(27.sp),
                            ),
                            elevation: 0,
                            color: const Color(0xFF8AFEED),
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
                                  },
                                  child: const Collectionwidget(
                                    image: 'assets/images/mutual-fund.png',
                                    color: Color.fromARGB(255, 45, 126, 114),
                                  ),
                                ),
                                VerticalSpacer(1.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    VerticalSpacer(1.h),
                    Text('All Funds',
                        style: TextStyle(
                          fontSize: 14.5.sp,
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
