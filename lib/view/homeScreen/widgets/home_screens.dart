import 'dart:developer';

import 'package:finfresh_mobile/controller/auth/auth_controller.dart';
import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/view/onboarding%20screen/on_boarding_view_screen.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/stock_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness platformBrightness = MediaQuery.of(context).platformBrightness;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<KycController>(context, listen: false).getusername();
      // log('username is ${Provider.of<KycController>(context, listen: false).username}');
    });

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0.0,
        leading: const SizedBox(),
        title: Text('Welcome ${Provider.of<KycController>(context).username}'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: platformBrightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              showLogoutAlertDialog(context);
            },
            icon: Icon(
              Icons.logout,
              color: platformBrightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
            ),
          ),
          // CircleAvatar(
          //   backgroundColor: platformBrightness == Brightness.dark
          //       ? Colors.white
          //       : Colors.black,
          //   child: const FlutterLogo(),
          // )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(18.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // VerticalSpacer(3.h),
              Text(
                'Collections',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                    ),
                // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
              VerticalSpacer(3.h),
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const Collectionwidget(
                                  image: 'assets/images/1.png'),
                              VerticalSpacer(3.h),
                              Text(
                                'High return',
                                style: TextStyle(fontSize: 15.sp),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              const Collectionwidget(
                                  image: 'assets/images/2.png'),
                              VerticalSpacer(3.h),
                              Text('SIP with 100',
                                  style: TextStyle(fontSize: 15.sp))
                            ],
                          ),
                          Column(
                            children: [
                              const Collectionwidget(
                                  image: 'assets/images/3.png'),
                              VerticalSpacer(3.h),
                              Text('Tax Saving',
                                  style: TextStyle(fontSize: 15.sp))
                            ],
                          ),
                        ],
                      ),
                      VerticalSpacer(3.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const Collectionwidget(
                                  image: 'assets/images/4.png'),
                              VerticalSpacer(3.h),
                              Text('Large cap',
                                  style: TextStyle(fontSize: 15.sp))
                            ],
                          ),
                          Column(
                            children: [
                              const Collectionwidget(
                                  image: 'assets/images/5.png'),
                              VerticalSpacer(3.h),
                              Text('Mid Cap', style: TextStyle(fontSize: 15.sp))
                            ],
                          ),
                          Column(
                            children: [
                              const Collectionwidget(
                                image: 'assets/images/6.png',
                              ),
                              VerticalSpacer(3.h),
                              Text('Small Cap',
                                  style: TextStyle(fontSize: 15.sp))
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              VerticalSpacer(3.h),
              Row(
                children: [
                  Text(
                    'Most bought on Finfresh',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w400,
                        ),
                    // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StockDetailsScreen(),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.sp, vertical: 10.sp),
                        height: 18.h,
                        width: 72.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.sp),
                            border: Border.all(color: Colors.grey)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 6.h,
                              width: 8.w,
                              child: const FlutterLogo(),
                            ),
                            VerticalSpacer(1.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  child: Text(
                                    'Quat Small Cap fund\nDirect plan growth',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                ),
                                const Text(
                                  '45.03%',
                                  style: TextStyle(color: Colors.red),
                                )
                              ],
                            ),
                            VerticalSpacer(1.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Equity Small cap',
                                    style: Theme.of(context).textTheme.bodySmall
                                    // .copyWith(
                                    //   fontSize: 17.sp,
                                    //   fontWeight: FontWeight.w400,
                                    // ),
                                    ),
                                Text(
                                  '3 y return',
                                  style: Theme.of(context).textTheme.bodySmall,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    HorizontalSpacer(3.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 18.sp, vertical: 10.sp),
                      height: 18.h,
                      width: 72.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.sp),
                          border: Border.all(color: Colors.grey)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 6.h,
                            width: 8.w,
                            child: const FlutterLogo(),
                          ),
                          VerticalSpacer(1.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                child: Text(
                                  'Quat Small Cap fund\nDirect plan growth',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ),
                              const Text(
                                '45.03%',
                                style: TextStyle(color: Colors.red),
                              )
                            ],
                          ),
                          VerticalSpacer(1.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Equity Small cap',
                                  style: Theme.of(context).textTheme.bodySmall
                                  // .copyWith(
                                  //   fontSize: 17.sp,
                                  //   fontWeight: FontWeight.w400,
                                  // ),
                                  ),
                              Text(
                                '3 y return',
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              VerticalSpacer(3.h),
              Row(
                children: [
                  Text(
                    'Most bought on Finfresh',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w400,
                        ),
                    // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ],
              ),
              VerticalSpacer(2.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) =>const ScreenProductDetails(),));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.sp, vertical: 10.sp),
                        height: 15.h,
                        width: 72.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.sp),
                            border: Border.all(color: Colors.grey)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 6.h,
                              width: 8.w,
                              child: const FlutterLogo(),
                            ),
                            VerticalSpacer(1.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  child: Text(
                                    'Quat Small Cap fund\nDirect plan growth',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                ),
                                const Text(
                                  '45.03%',
                                  style: TextStyle(color: Colors.red),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    HorizontalSpacer(3.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 18.sp, vertical: 10.sp),
                      height: 15.h,
                      width: 72.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.sp),
                          border: Border.all(color: Colors.grey)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 6.h,
                            width: 8.w,
                            child: const FlutterLogo(),
                          ),
                          VerticalSpacer(1.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                child: Text(
                                  'Quat Small Cap fund\nDirect plan growth',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ),
                              const Text(
                                '45.03%',
                                style: TextStyle(color: Colors.red),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              VerticalSpacer(10.h),
            ],
          ),
        ),
      ),
    );
  }

  void showLogoutAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                SecureStorage.clearSecureStoragevalue('token');
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BoardingViewScreen(),
                  ),
                  (route) => false,
                );
                Provider.of<AuthController>(context, listen: false)
                    .clearTheControllerValue();
              },
              child: Text(
                'Yes',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            TextButton(
              onPressed: () {
                // Dismiss the alert dialog when 'No' is pressed
                Navigator.of(context).pop();
              },
              child: Text(
                'No',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ],
        );
      },
    );
  }
}

class Collectionwidget extends StatelessWidget {
  final String image;
  const Collectionwidget({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 7.h,
      width: 15.w,
      child: Image.asset(
        image,
        fit: BoxFit.fill,
      ),
    );
  }
}
