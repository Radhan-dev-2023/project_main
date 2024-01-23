import 'dart:developer';

import 'package:finfresh_mobile/controller/auth/auth_controller.dart';
import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/db/model/investors_data_model.dart';
import 'package:finfresh_mobile/routes/routes.dart';
import 'package:finfresh_mobile/services/scheme%20services/scheme_services.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/view/kyc/occupation%20Screen/occupation_screen.dart';
import 'package:finfresh_mobile/view/kyc/pancard/screen_pan_card.dart';
import 'package:finfresh_mobile/view/kyc/tax%20status/screen_tax_status.dart';
import 'package:finfresh_mobile/view/onboarding%20screen/on_boarding_view_screen.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/stock_detail_screen.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// import 'placeholders.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    SchemeServices service = SchemeServices();
    Brightness platformBrightness = MediaQuery.of(context).platformBrightness;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      service.mutualFundBasedonCategoryAndQuery();
      Provider.of<DashBoardController>(context, listen: false).getusername();
      Provider.of<DashBoardController>(context, listen: false)
          .getDashBoardDetails(context);
    });

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0.0,
        leading: const SizedBox(),
        title: Text(
            'Welcome ${Provider.of<DashBoardController>(context, listen: false).username}'),
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
        child: Consumer<DashBoardController>(
            builder: (context, dashBoardController, child) {
          if (dashBoardController.loadingDashboard == true) {
            return const LoadingWidget();
          }
          return Container(
            margin: EdgeInsets.all(18.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // VerticalSpacer(3.h),
                dashBoardController.dashBoardModel?.result?.data
                            ?.activationStatus?.statusCode ==
                        'S01'
                    ? const AttensionWidget()
                    : const SizedBox(),
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
                                Text('Mid Cap',
                                    style: TextStyle(fontSize: 15.sp))
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Equity Small cap',
                                      style:
                                          Theme.of(context).textTheme.bodySmall
                                      // .copyWith(
                                      //   fontSize: 17.sp,
                                      //   fontWeight: FontWeight.w400,
                                      // ),
                                      ),
                                  Text(
                                    '3 y return',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
          );
        }),
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

class AttensionWidget extends StatelessWidget {
  const AttensionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // InvestorModel investorModel = InvestorModel();
    final dashBoardController = Provider.of<DashBoardController>(context);
    return SizedBox(
      height: 28.h,
      width: double.infinity,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VerticalSpacer(1.h),
            Icon(
              Icons.warning_outlined,
              color: Colors.red,
              size: 5.h,
            ),
            Text(
              'Attention required!',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
              // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
            VerticalSpacer(1.h),
            Text(
                'Your KYC details are  ${dashBoardController.dashBoardModel?.result?.data?.activationStatus?.message}'),
            VerticalSpacer(2.h),
            ButtonWidget(
              btName: 'Complete KYC',
              onTap: () {
                Routes.dashboardToKycPage(context);
              },
            )
          ],
        ),
      ),
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

// class ShimmerEffect extends StatelessWidget {
//   const ShimmerEffect({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//       baseColor: Colors.grey[300]!,
//       highlightColor: Colors.grey[100]!,
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 10.0),
//         width: double.infinity,
//         height: 150.0, // Adjust the height as needed
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(15.0),
//         ),
//       ),
//     );
//   }
// }

// class LoadingListPage extends StatefulWidget {
//   const LoadingListPage({super.key});

//   @override
//   State<LoadingListPage> createState() => _LoadingListPageState();
// }

// class _LoadingListPageState extends State<LoadingListPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Loading List'),
//       ),
//       body: Shimmer.fromColors(
//           baseColor: Colors.grey.shade300,
//           highlightColor: Colors.grey.shade100,
//           enabled: true,
//           child: const SingleChildScrollView(
//             physics: NeverScrollableScrollPhysics(),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 BannerPlaceholder(),
//                 TitlePlaceholder(width: double.infinity),
//                 SizedBox(height: 16.0),
//                 ContentPlaceholder(
//                   lineType: ContentLineType.threeLines,
//                 ),
//                 SizedBox(height: 16.0),
//                 TitlePlaceholder(width: 200.0),
//                 SizedBox(height: 16.0),
//                 ContentPlaceholder(
//                   lineType: ContentLineType.twoLines,
//                 ),
//                 SizedBox(height: 16.0),
//                 TitlePlaceholder(width: 200.0),
//                 SizedBox(height: 16.0),
//                 ContentPlaceholder(
//                   lineType: ContentLineType.twoLines,
//                 ),
//               ],
//             ),
//           )),
//     );
//   }
// }