import 'package:finfresh_mobile/controller/achController/ach_controller.dart';
import 'package:finfresh_mobile/controller/auth/auth_controller.dart';
import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:finfresh_mobile/controller/login%20pin%20controller/login_pin_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/view/holding%20screen/screen_holdings.dart';
import 'package:finfresh_mobile/view/homeScreen/widgets/attension_widget.dart';
import 'package:finfresh_mobile/view/homeScreen/widgets/collection_widget.dart';
import 'package:finfresh_mobile/view/homeScreen/widgets/drawer_widget.dart';
import 'package:finfresh_mobile/view/kyc/uploading%20proofs/screen_upload_proof.dart';
import 'package:finfresh_mobile/view/kyc/uploading%20proofs/upload%20bank%20proof/upload_bank_proof.dart';
import 'package:finfresh_mobile/view/onboarding%20screen/on_boarding_view_screen.dart';
import 'package:finfresh_mobile/view/top%20mfs/screen_top_mfs.dart';
import 'package:finfresh_mobile/view/webview/screen_webview.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// import 'placeholders.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    // GlobalKey<ScaffoldState> drawerkey = GlobalKey();
    Brightness platformBrightness = MediaQuery.of(context).platformBrightness;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DashBoardController>(context, listen: false).getusername();
      Provider.of<DashBoardController>(context, listen: false)
          .callBothFunction(context);
    });

    return Scaffold(
      drawer: const DrawerWidget(),
      // key: drawerkey,
      appBar: AppBar(
        // leadingWidth: 0.0,
        // leading: const SizedBox(),
        title: Consumer<DashBoardController>(
            builder: (context, dashBoardController, child) {
          return Text(
            dashBoardController.dashBoardModel?.result?.data?.name == null
                ? dashBoardController.username
                : '${dashBoardController.dashBoardModel?.result?.data?.name}',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w500),
          );
        }),
        actions: [
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.search,
          //     color: platformBrightness == Brightness.light
          //         ? Colors.black
          //         : Colors.white,
          //   ),
          // ),
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

                dashBoardController.dashBoardModel?.result?.data
                            ?.activationStatus?.statusCode ==
                        'S02'
                    ? SizedBox(
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
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                              ),
                              VerticalSpacer(1.h),
                              const Text('Upload Your Proof'),
                              VerticalSpacer(2.h),
                              ButtonWidget(
                                btName: 'Upload Proof',
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ScreenUploadinProofs(),
                                      ));
                                },
                              )
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(),
                dashBoardController.dashBoardModel?.result?.data
                            ?.activationStatus?.statusCode ==
                        'S03'
                    ? SizedBox(
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
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                              ),
                              VerticalSpacer(1.h),
                              const Text('Upload Your Bank Proof'),
                              VerticalSpacer(2.h),
                              ButtonWidget(
                                btName: 'Upload Bank Proof',
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ScreenBankProofs(),
                                      ));
                                },
                              )
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(),
                dashBoardController.dashBoardModel?.result?.data
                            ?.activationStatus?.statusCode ==
                        'S07'
                    ? SizedBox(
                        height: 20.h,
                        width: double.infinity,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              VerticalSpacer(1.h),
                              Padding(
                                padding: EdgeInsets.all(10.0.sp),
                                child: Text(
                                  '${dashBoardController.dashBoardModel?.result?.data?.activationStatus?.message}',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(),
                SizedBox(
                  // height: 28.h,
                  width: double.infinity,
                  child: Consumer<AchController>(
                      builder: (context, achController, _) {
                    return Visibility(
                      visible: achController.visibilty,
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                              // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                            ),
                            VerticalSpacer(1.h),
                            const Text('Register ACH Mandate'),
                            VerticalSpacer(2.h),
                            achController.loadingAch == true
                                ? const LoadingButton()
                                : ButtonWidget(
                                    btName: 'Register',
                                    onTap: () async {
                                      bool result = await achController
                                          .registerAch(context, false);
                                      if (result == true) {
                                        // ignore: use_build_context_synchronously
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ScreenWebview(
                                                url: achController.result),
                                          ),
                                        );
                                      }
                                    },
                                  )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
                VerticalSpacer(2.h),
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
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const TopMfsScreen(
                                          category: 'Hybrid: Aggressive',
                                          appbarname: 'Aggressive',
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Collectionwidget(
                                      image: 'assets/images/1.png'),
                                ),
                                VerticalSpacer(3.h),
                                Text(
                                  'Aggressive',
                                  style: TextStyle(fontSize: 15.sp),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const TopMfsScreen(
                                          category: 'Equity: Flexi Cap',
                                          appbarname: "Flexi Cap",
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Collectionwidget(
                                      image: 'assets/images/2.png'),
                                ),
                                VerticalSpacer(3.h),
                                Text('Flexi Cap',
                                    style: TextStyle(fontSize: 15.sp))
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const TopMfsScreen(
                                          category: 'Equity: Multi Cap',
                                          appbarname: 'Multi Cap',
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Collectionwidget(
                                      image: 'assets/images/3.png'),
                                ),
                                VerticalSpacer(3.h),
                                Text('Multi Cap',
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
                                InkWell(
                                  onTap: () {
                                    //                              Provider.of<TopMFsController>(context, listen: false)
                                    // .getTopMfs(context, 'Eguity:Large Cap');
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
                                      image: 'assets/images/4.png'),
                                ),
                                VerticalSpacer(3.h),
                                Text('Large cap',
                                    style: TextStyle(fontSize: 15.sp))
                              ],
                            ),
                            Column(
                              children: [
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
                                      image: 'assets/images/5.png'),
                                ),
                                VerticalSpacer(3.h),
                                Text('Mid Cap',
                                    style: TextStyle(fontSize: 15.sp))
                              ],
                            ),
                            Column(
                              children: [
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
                                    image: 'assets/images/6.png',
                                  ),
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
                // Row(
                //   children: [
                //     Text(
                //       'Most bought on Finfresh',
                //       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                //             fontSize: 17.sp,
                //             fontWeight: FontWeight.w400,
                //           ),
                //       // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 2.h,
                ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       InkWell(
                //         onTap: () {
                //           // Navigator.push(
                //           //   context,
                //           //   MaterialPageRoute(
                //           //     builder: (context) => const StockDetailsScreen(),
                //           //   ),
                //           // );
                //         },
                //         child: Container(
                //           padding: EdgeInsets.symmetric(
                //               horizontal: 18.sp, vertical: 10.sp),
                //           height: 18.h,
                //           width: 72.w,
                //           decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(20.sp),
                //               border: Border.all(color: Colors.grey)),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               SizedBox(
                //                 height: 6.h,
                //                 width: 8.w,
                //                 child: const FlutterLogo(),
                //               ),
                //               VerticalSpacer(1.h),
                //               Row(
                //                 mainAxisAlignment:
                //                     MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   SizedBox(
                //                     child: Text(
                //                       'Quat Small Cap fund\nDirect plan growth',
                //                       style: Theme.of(context)
                //                           .textTheme
                //                           .bodyMedium!
                //                           .copyWith(
                //                             fontSize: 16.sp,
                //                             fontWeight: FontWeight.w400,
                //                           ),
                //                     ),
                //                   ),
                //                   const Text(
                //                     '45.03%',
                //                     style: TextStyle(color: Colors.red),
                //                   )
                //                 ],
                //               ),
                //               VerticalSpacer(1.h),
                //               Row(
                //                 mainAxisAlignment:
                //                     MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   Text('Equity Small cap',
                //                       style:
                //                           Theme.of(context).textTheme.bodySmall
                //                       // .copyWith(
                //                       //   fontSize: 17.sp,
                //                       //   fontWeight: FontWeight.w400,
                //                       // ),
                //                       ),
                //                   Text(
                //                     '3 y return',
                //                     style:
                //                         Theme.of(context).textTheme.bodySmall,
                //                   )
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //       HorizontalSpacer(3.w),
                //       Container(
                //         padding: EdgeInsets.symmetric(
                //             horizontal: 18.sp, vertical: 10.sp),
                //         height: 18.h,
                //         width: 72.w,
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(20.sp),
                //             border: Border.all(color: Colors.grey)),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             SizedBox(
                //               height: 6.h,
                //               width: 8.w,
                //               child: const FlutterLogo(),
                //             ),
                //             VerticalSpacer(1.h),
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 SizedBox(
                //                   child: Text(
                //                     'Quat Small Cap fund\nDirect plan growth',
                //                     style: Theme.of(context)
                //                         .textTheme
                //                         .bodyMedium!
                //                         .copyWith(
                //                           fontSize: 16.sp,
                //                           fontWeight: FontWeight.w400,
                //                         ),
                //                   ),
                //                 ),
                //                 const Text(
                //                   '45.03%',
                //                   style: TextStyle(color: Colors.red),
                //                 )
                //               ],
                //             ),
                //             VerticalSpacer(1.h),
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 Text('Equity Small cap',
                //                     style: Theme.of(context).textTheme.bodySmall
                //                     // .copyWith(
                //                     //   fontSize: 17.sp,
                //                     //   fontWeight: FontWeight.w400,
                //                     // ),
                //                     ),
                //                 Text(
                //                   '3 y return',
                //                   style: Theme.of(context).textTheme.bodySmall,
                //                 )
                //               ],
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // VerticalSpacer(3.h),
                // Row(
                //   children: [
                //     Text(
                //       'Most bought on Finfresh',
                //       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                //             fontSize: 17.sp,
                //             fontWeight: FontWeight.w400,
                //           ),
                //       // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                //     ),
                //   ],
                // ),
                // VerticalSpacer(2.h),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       InkWell(
                //         onTap: () {
                //           // Navigator.push(context, MaterialPageRoute(builder: (context) =>const ScreenProductDetails(),));
                //         },
                //         child: Container(
                //           padding: EdgeInsets.symmetric(
                //               horizontal: 18.sp, vertical: 10.sp),
                //           height: 15.h,
                //           width: 72.w,
                //           decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(20.sp),
                //               border: Border.all(color: Colors.grey)),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               SizedBox(
                //                 height: 6.h,
                //                 width: 8.w,
                //                 child: const FlutterLogo(),
                //               ),
                //               VerticalSpacer(1.h),
                //               Row(
                //                 mainAxisAlignment:
                //                     MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   SizedBox(
                //                     child: Text(
                //                       'Quat Small Cap fund\nDirect plan growth',
                //                       style: Theme.of(context)
                //                           .textTheme
                //                           .bodyMedium!
                //                           .copyWith(
                //                             fontSize: 16.sp,
                //                             fontWeight: FontWeight.w400,
                //                           ),
                //                     ),
                //                   ),
                //                   const Text(
                //                     '45.03%',
                //                     style: TextStyle(color: Colors.red),
                //                   )
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //       HorizontalSpacer(3.w),
                //       Container(
                //         padding: EdgeInsets.symmetric(
                //             horizontal: 18.sp, vertical: 10.sp),
                //         height: 15.h,
                //         width: 72.w,
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(20.sp),
                //             border: Border.all(color: Colors.grey)),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             SizedBox(
                //               height: 6.h,
                //               width: 8.w,
                //               child: const FlutterLogo(),
                //             ),
                //             VerticalSpacer(1.h),
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 SizedBox(
                //                   child: Text(
                //                     'Quat Small Cap fund\nDirect plan growth',
                //                     style: Theme.of(context)
                //                         .textTheme
                //                         .bodyMedium!
                //                         .copyWith(
                //                           fontSize: 16.sp,
                //                           fontWeight: FontWeight.w400,
                //                         ),
                //                   ),
                //                 ),
                //                 const Text(
                //                   '45.03%',
                //                   style: TextStyle(color: Colors.red),
                //                 )
                //               ],
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScreenHoldings(),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      surfaceTintColor: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.all(15.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mutual Funds Portfolio',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            VerticalSpacer(2.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Net Investment'),
                                    VerticalSpacer(1.h),
                                    const Text('Net Debt Gain'),
                                    VerticalSpacer(1.h),
                                    const Text('Net Equity Gain'),
                                    VerticalSpacer(1.h),
                                    const Text('Total'),
                                    VerticalSpacer(1.h),
                                    const Text('Growth'),
                                    VerticalSpacer(1.h),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        '₹ ${dashBoardController.summaryModel?.result?.netInvestment ?? ''}'),
                                    VerticalSpacer(1.h),
                                    Text(
                                        '₹ ${dashBoardController.summaryModel?.result?.netDebtGains ?? ''}'),
                                    VerticalSpacer(1.h),
                                    Text(
                                        '₹ ${dashBoardController.summaryModel?.result?.netEquityGains ?? ''}'),
                                    VerticalSpacer(1.h),
                                    Text(
                                        '₹ ${dashBoardController.summaryModel?.result?.totalAmount ?? ''}'),
                                    VerticalSpacer(1.h),
                                    Text(
                                      dashBoardController
                                              .summaryModel?.result?.growth ??
                                          '',
                                    ),
                                    VerticalSpacer(1.h),
                                  ],
                                )
                              ],
                            )
                          ],
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
                Provider.of<BiometricLogin>(context, listen: false)
                    .changeButtonEnabled(false);
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
