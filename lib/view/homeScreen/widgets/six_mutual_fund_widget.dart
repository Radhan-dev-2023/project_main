import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/all%20mutual%20fund/screen_all_mutual_fund.dart';
import 'package:finfresh_mobile/view/homeScreen/widgets/collection_widget.dart';
import 'package:finfresh_mobile/view/top%20mfs/screen_top_mfs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                            const Color(0xFFD8E2DC).withOpacity(0.2),
                        child: SizedBox(
                          height: Adaptive.h(8),
                          width: Adaptive.w(18),
                          child: CircleAvatar(
                            radius: 10,
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(27.sp),
                            // ),
                            // elevation: 0,
                            backgroundColor:
                                const Color(0xFFD8E2DC).withOpacity(0.4),
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
                                    color: Color.fromARGB(255, 89, 94, 91),
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
                            Color.fromARGB(255, 250, 234, 231).withOpacity(0.5),
                        child: SizedBox(
                          height: Adaptive.h(8),
                          width: Adaptive.w(18),
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Color.fromARGB(255, 252, 215, 209)
                                .withOpacity(0.4),
                            // color: const Color(0xFFE9DCFF),

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
                                    color: Color.fromARGB(255, 180, 114, 102),
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
                            Color.fromARGB(255, 250, 191, 234).withOpacity(0.2),
                        child: SizedBox(
                          height: Adaptive.h(8),
                          width: Adaptive.w(18),
                          child: CircleAvatar(
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(27.sp),
                            // ),
                            backgroundColor: Color.fromARGB(255, 245, 168, 224)
                                .withOpacity(0.3),
                            // elevation: 0,
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
                                    color: Color.fromARGB(255, 204, 45, 162),
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
                            const Color(0xFFA3FFBB).withOpacity(0.2),
                        child: SizedBox(
                          height: Adaptive.h(8),
                          width: Adaptive.w(18),
                          child: CircleAvatar(
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(27.sp),
                            // ),
                            // elevation: 0,
                            backgroundColor: Color.fromARGB(255, 186, 252, 203)
                                .withOpacity(0.5),
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
                                    color: Color.fromARGB(255, 35, 165, 67),
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
                            Color.fromARGB(255, 221, 176, 224).withOpacity(0.2),
                        child: SizedBox(
                          height: Adaptive.h(8),
                          width: Adaptive.w(18),
                          child: CircleAvatar(
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(27.sp),
                            // ),
                            backgroundColor: Color.fromARGB(255, 213, 169, 216)
                                .withOpacity(0.4),

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
                                    color: Color.fromARGB(255, 127, 17, 134),
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
                            Color.fromARGB(255, 253, 180, 191).withOpacity(0.2),
                        child: SizedBox(
                          height: Adaptive.h(8),
                          width: Adaptive.w(18),
                          child: CircleAvatar(
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(27.sp),
                            // ),
                            backgroundColor: Color.fromARGB(255, 250, 163, 176)
                                .withOpacity(0.4),
                            // elevation: 0,
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
                                    color: Color.fromARGB(255, 252, 75, 102),
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
                            Color.fromARGB(255, 247, 195, 154).withOpacity(0.2),
                        child: SizedBox(
                          height: Adaptive.h(8),
                          width: Adaptive.w(18),
                          child: CircleAvatar(
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(27.sp),
                            // ),
                            // elevation: 0,
                            backgroundColor: Color.fromARGB(255, 250, 188, 137)
                                .withOpacity(0.4),
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
                                    color: Color.fromARGB(255, 250, 155, 78),
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
                            Color.fromARGB(255, 181, 252, 241).withOpacity(0.2),
                        child: SizedBox(
                          height: Adaptive.h(8),
                          width: Adaptive.w(18),
                          child: CircleAvatar(
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(27.sp),
                            // ),
                            // elevation: 0,
                            backgroundColor: Color.fromARGB(255, 162, 252, 238)
                                .withOpacity(0.3),
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
