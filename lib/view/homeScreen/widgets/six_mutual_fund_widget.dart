import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/all%20mutual%20fund/screen_all_mutual_fund.dart';
import 'package:finfresh_mobile/view/homeScreen/widgets/collection_widget.dart';
import 'package:finfresh_mobile/view/top%20mfs/screen_top_mfs.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SixMutualFundWidget extends StatelessWidget {
  const SixMutualFundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Brightness platformBrightness = MediaQuery.of(context).platformBrightness;
    return SizedBox(
      // color: Colors.transparent,
      // surfaceTintColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              VerticalSpacer(Adaptive.h(3)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        // CircleAvatar(
                        //   radius: 40,
                        //   backgroundColor:
                        //       platformBrightness == Brightness.light
                        //           ? const Color.fromARGB(255, 250, 234, 231)
                        //               .withOpacity(0.5)
                        //           : const Color.fromARGB(255, 250, 234, 231)
                        //               .withOpacity(0.8),
                        //   child:
                        SizedBox(
                          height: Adaptive.h(7.5),
                          width: Adaptive.w(17.5),
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor:
                            platformBrightness == Brightness.light
                                ? const Color.fromARGB(255, 252, 215, 209)
                                .withOpacity(0.3)
                                : const Color.fromARGB(255, 250, 234, 231),

                            // color: const Color(0xFFE9DCFF),

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                VerticalSpacer(1.h),
                                InkWell(
                                  splashColor: Colors.white,
                                  highlightColor: Colors.white,
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
                                  child: Collectionwidget(
                                    // image: 'assets/images/piggy.png',
                                    image:
                                    'assets/images/fundsicons/piggy (2) 1.png',
                                    color:
                                    platformBrightness == Brightness.light
                                        ? const Color.fromARGB(
                                        255, 250, 124, 101)
                                        .withOpacity(0.5)
                                        : const Color.fromARGB(
                                        255, 250, 124, 101)
                                        .withOpacity(0.7),
                                  ),
                                ),
                                VerticalSpacer(1.h),
                              ],
                            ),
                          ),
                        ),
                        // ),
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
                        SizedBox(
                          height: Adaptive.h(7.5),
                          width: Adaptive.w(17.5),
                          // height: Adaptive.h(8),
                          // width: Adaptive.w(18),
                          child: InkWell(
                            splashColor: Colors.white,
                            highlightColor: Colors.white,
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
                            child: CircleAvatar(
                              // shape: RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.circular(27.sp),
                              // ),
                              backgroundColor:
                              platformBrightness == Brightness.light
                                  ? const Color.fromARGB(255, 245, 168, 224)
                                  .withOpacity(0.3)
                                  : const Color.fromARGB(255, 245, 168, 224),

                              // elevation: 0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  VerticalSpacer(1.h),
                                  Collectionwidget(
                                    image:
                                    'assets/images/fundsicons/financing 1.png',
                                    // image: 'assets/images/flexicappp.png',
                                    color:
                                    platformBrightness == Brightness.light
                                        ? const Color.fromARGB(
                                        255, 204, 45, 162)
                                        .withOpacity(0.5)
                                        : const Color.fromARGB(
                                        255, 204, 45, 162)
                                        .withOpacity(0.7),
                                  ),
                                  VerticalSpacer(1.h),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // ),
                        VerticalSpacer(1.h),
                        Text('Flexi Cap',
                            style: TextStyle(
                              fontSize: 14.5.sp,
                            )),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        // child: CircleAvatar(
                        //   radius: 40,
                        //   backgroundColor:
                        //       platformBrightness == Brightness.light
                        //           ? const Color.fromARGB(255, 247, 195, 154)
                        //               .withOpacity(0.2)
                        //           : const Color.fromARGB(255, 247, 195, 154)
                        //               .withOpacity(0.8),
                        child: SizedBox(
                          height: Adaptive.h(7.5),
                          width: Adaptive.w(17.5),
                          child: InkWell(
                            splashColor: Colors.white,
                            highlightColor: Colors.white,
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
                            child: CircleAvatar(
                              // shape: RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.circular(27.sp),
                              // ),
                              // elevation: 0,
                              backgroundColor:
                              platformBrightness == Brightness.light
                                  ? const Color.fromARGB(255, 250, 188, 137)
                                  .withOpacity(0.3)
                                  : const Color.fromARGB(255, 250, 188, 137),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  VerticalSpacer(1.h),
                                  Collectionwidget(
                                    image:
                                    'assets/images/fundsicons/sectorfundfordash.png',
                                    // image: 'assets/images/sectoralinfund.png',
                                    color:
                                    platformBrightness == Brightness.light
                                        ? const Color.fromARGB(
                                        255, 243, 127, 32)
                                        .withOpacity(0.5)
                                        : const Color.fromARGB(
                                        255, 243, 127, 32)
                                        .withOpacity(0.8),
                                  ),
                                  VerticalSpacer(1.h),
                                ],
                              ),
                              // ),
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
                  SizedBox(
                    child: Column(
                      children: [
                        // CircleAvatar(
                        //   radius: 40,
                        //   backgroundColor:
                        //       platformBrightness == Brightness.light
                        //           ? const Color(0xFFA3FFBB).withOpacity(0.2)
                        //           : const Color(0xFFA3FFBB).withOpacity(0.8),
                        //   child:
                        SizedBox(
                          height: Adaptive.h(7.5),
                          width: Adaptive.w(17.5),
                          child: InkWell(
                            splashColor: Colors.white,
                            highlightColor: Colors.white,
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
                            child: CircleAvatar(
                              // shape: RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.circular(27.sp),
                              // ),
                              // elevation: 0,
                              backgroundColor:
                              platformBrightness == Brightness.light
                                  ? const Color.fromARGB(255, 186, 252, 203)
                                  .withOpacity(0.3)
                                  : const Color.fromARGB(255, 186, 252, 203),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  VerticalSpacer(1.h),
                                  Collectionwidget(
                                    // image:
                                    //     'assets/images/fundsicons/largefundfordash.png',
                                    image: 'assets/images/largecap.png',
                                    color: platformBrightness ==
                                        Brightness.light
                                        ? const Color.fromARGB(255, 35, 165, 67)
                                        .withOpacity(0.5)
                                        : const Color.fromARGB(255, 35, 165, 67)
                                        .withOpacity(0.7),
                                  ),
                                  VerticalSpacer(1.h),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // ),
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
              VerticalSpacer(4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        // child: CircleAvatar(
                        //   radius: 40,
                        //   backgroundColor:
                        //       platformBrightness == Brightness.light
                        //           ? const Color.fromARGB(255, 221, 176, 224)
                        //               .withOpacity(0.2)
                        //           : const Color.fromARGB(255, 221, 176, 224)
                        //               .withOpacity(0.8),
                        child: SizedBox(
                          height: Adaptive.h(7.5),
                          width: Adaptive.w(17.5),
                          child: InkWell(
                            splashColor: Colors.white,
                            highlightColor: Colors.white,
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
                            child: CircleAvatar(
                              // shape: RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.circular(27.sp),
                              // ),
                              backgroundColor:
                              platformBrightness == Brightness.light
                                  ? const Color.fromARGB(255, 213, 169, 216)
                                  .withOpacity(0.3)
                                  : const Color.fromARGB(255, 213, 169, 216),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  VerticalSpacer(1.h),
                                  Collectionwidget(
                                    // image:
                                    //     'assets/images/fundsicons/midcapfordash.png',
                                    image: 'assets/images/midcapinfund.png',
                                    color:
                                    platformBrightness == Brightness.light
                                        ? const Color.fromARGB(
                                        255, 127, 17, 134)
                                        .withOpacity(0.5)
                                        : const Color.fromARGB(
                                        255, 127, 17, 134)
                                        .withOpacity(0.7),
                                  ),
                                  VerticalSpacer(1.h),
                                ],
                              ),
                              // ),
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
                        // child: CircleAvatar(
                        //   radius: 40,
                        //   backgroundColor:
                        //       platformBrightness == Brightness.light
                        //           ? const Color.fromARGB(255, 253, 180, 191)
                        //               .withOpacity(0.2)
                        //           : const Color.fromARGB(255, 253, 180, 191)
                        //               .withOpacity(0.8),
                        child: SizedBox(
                          height: Adaptive.h(7.5),
                          width: Adaptive.w(17.5),
                          child: InkWell(
                            splashColor: Colors.white,
                            highlightColor: Colors.white,
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
                            child: CircleAvatar(
                              // shape: RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.circular(27.sp),
                              // ),
                              backgroundColor:
                              platformBrightness == Brightness.light
                                  ? const Color.fromARGB(255, 250, 163, 176)
                                  .withOpacity(0.3)
                                  : const Color.fromARGB(255, 250, 163, 176),
                              // elevation: 0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  VerticalSpacer(1.h),
                                  InkWell(
                                    splashColor: Colors.white,
                                    highlightColor: Colors.white,
                                    child: Collectionwidget(
                                      image:
                                      'assets/images/fundsicons/smallcapfordash.png',
                                      // image: 'assets/images/smalcapinfunds.png',
                                      color:
                                      platformBrightness == Brightness.light
                                          ? const Color.fromARGB(
                                          255, 252, 104, 126)
                                          .withOpacity(0.5)
                                          : const Color.fromARGB(
                                          255, 252, 104, 126)
                                          .withOpacity(0.8),
                                    ),
                                  ),
                                  VerticalSpacer(1.h),
                                ],
                              ),
                              // ),
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
                        child: SizedBox(
                          height: Adaptive.h(7.5),
                          width: Adaptive.w(17.5),
                          child: InkWell(
                            splashColor: Colors.white,
                            highlightColor: Colors.white,
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
                            child: CircleAvatar(
                              // radius: 10,
                              // shape: RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.circular(27.sp),
                              // ),
                              // elevation: 0,
                              backgroundColor:
                              platformBrightness == Brightness.light
                                  ? const Color(0xFFD8E2DC).withOpacity(0.3)
                                  : const Color(0xFFD8E2DC),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  VerticalSpacer(1.h),
                                  Collectionwidget(
                                    image: 'assets/images/indexfund.png',
                                    // image:
                                    //     'assets/images/fundsicons/indexfordash.png',
                                    color: platformBrightness ==
                                        Brightness.light
                                        ? const Color.fromARGB(255, 89, 94, 91)
                                        .withOpacity(0.5)
                                        : const Color.fromARGB(255, 89, 94, 91)
                                        .withOpacity(0.7),
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
                  Column(
                    children: [
                      SizedBox(
                        // child: CircleAvatar(
                        //   radius: 40,
                        //   backgroundColor:
                        //       platformBrightness == Brightness.light
                        //           ? const Color.fromARGB(255, 181, 252, 241)
                        //               .withOpacity(0.2)
                        //           : const Color.fromARGB(255, 181, 252, 241)
                        //               .withOpacity(0.8),
                        child: SizedBox(
                          height: Adaptive.h(7.5),
                          width: Adaptive.w(17.5),
                          child: InkWell(
                            splashColor: Colors.white,
                            highlightColor: Colors.white,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                  const ScreenAllMutualFund(),
                                ),
                              );
                            },
                            child: CircleAvatar(
                              // shape: RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.circular(27.sp),
                              // ),
                              // elevation: 0,
                              backgroundColor:
                              platformBrightness == Brightness.light
                                  ? const Color.fromARGB(255, 162, 252, 238)
                                  .withOpacity(0.3)
                                  : const Color.fromARGB(255, 162, 252, 238),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  VerticalSpacer(1.h),
                                  Center(
                                    child: Collectionwidget(
                                      image:
                                      'assets/images/fundsicons/Group 14.png',
                                      // image: 'assets/images/mutual-fund.png',
                                      color:
                                      platformBrightness == Brightness.light
                                          ? const Color.fromARGB(
                                          255, 45, 126, 114)
                                          .withOpacity(0.5)
                                          : const Color.fromARGB(
                                          255, 45, 126, 114)
                                          .withOpacity(0.7),
                                    ),
                                  ),
                                  VerticalSpacer(1.5.h),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // ),
                      VerticalSpacer(1.h),
                      Text('All Funds',
                          style: TextStyle(
                            fontSize: 14.5.sp,
                          )),
                    ],
                  ),
                ],
              ),
              VerticalSpacer(Adaptive.h(3)),
            ],
          ),
        ),
      ),
    );
  }
}
