// import 'package:finfresh_mobile/controller/achController/ach_controller.dart';
// import 'package:finfresh_mobile/controller/auth/auth_controller.dart';
// import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
// import 'package:finfresh_mobile/controller/login%20pin%20controller/login_pin_controller.dart';
// import 'package:finfresh_mobile/controller/search%20controller/search_controller.dart';
// import 'package:finfresh_mobile/utilities/constant/app_size.dart';
// import 'package:finfresh_mobile/utilities/constant/logger.dart';
// import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
// import 'package:finfresh_mobile/view/fatcha%20registration/fatcha_registeration.dart';
// import 'package:finfresh_mobile/view/holding%20screen/screen_holdings.dart';
// import 'package:finfresh_mobile/view/homeScreen/widgets/attension_widget.dart';
// import 'package:finfresh_mobile/view/homeScreen/widgets/collection_widget.dart';
// import 'package:finfresh_mobile/view/homeScreen/widgets/drawer_widget.dart';
// import 'package:finfresh_mobile/view/homeScreen/widgets/portFolio_mutual_fund.dart';
// import 'package:finfresh_mobile/view/homeScreen/widgets/six_mutual_fund_widget.dart';
// import 'package:finfresh_mobile/view/kyc/uploading%20proofs/screen_upload_proof.dart';
// import 'package:finfresh_mobile/view/kyc/uploading%20proofs/upload%20bank%20proof/upload_bank_proof.dart';
// import 'package:finfresh_mobile/view/onboarding%20screen/on_boarding_view_screen.dart';
// import 'package:finfresh_mobile/view/search%20screen/search_screen.dart';
// import 'package:finfresh_mobile/view/top%20mfs/screen_top_mfs.dart';
// import 'package:finfresh_mobile/view/webview/screen_webview.dart';
// import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
// import 'package:finfresh_mobile/view/widgets/custom_loading_button_widget.dart';
// import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// // import 'placeholders.dart';

// class ScreenHome extends StatefulWidget {
//   const ScreenHome({super.key});

//   @override
//   State<ScreenHome> createState() => _ScreenHomeState();
// }

// class _ScreenHomeState extends State<ScreenHome> {
//   Future<void> function() async {
//     await Provider.of<DashBoardController>(context, listen: false)
//         .getDashBoardDetails(context);
//   }

//   @override
//   void initState() {
//     super.initState();

//     Provider.of<DashBoardController>(context, listen: false).getusername();
//     function();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Brightness platformBrightness = MediaQuery.of(context).platformBrightness;
//     // WidgetsBinding.instance.addPostFrameCallback((_) {
//     // Provider.of<DashBoardController>(context, listen: false).getusername();
//     //  Provider.of<DashBoardController>(context, listen: false)
//     //     .callBothFunction(context);
//     // });

//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       drawer: const DrawerWidget(),
//       // key: drawerkey,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         title: Consumer<DashBoardController>(
//             builder: (context, dashBoardController, child) {
//           return Text(
//             dashBoardController.dashBoardModel?.result?.data?.name == null
//                 ? dashBoardController.username
//                 : '${dashBoardController.dashBoardModel?.result?.data?.name}',
//             style: Theme.of(context)
//                 .textTheme
//                 .labelLarge!
//                 .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w500),
//           );
//         }),
//         actions: [
//           IconButton(
//             onPressed: () {
//               showLogoutAlertDialog(context);
//             },
//             icon: Icon(
//               Icons.logout,
//               color: platformBrightness == Brightness.light
//                   ? Colors.black
//                   : Colors.white,
//             ),
//           ),
//         ],
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage(
//                   'assets/images/dd.png',
//                 ),
//                 fit: BoxFit.fill)),
//         child: SingleChildScrollView(
//           child: Consumer<DashBoardController>(
//               builder: (context, dashBoardController, child) {
//             if (dashBoardController.loadingDashboard == true) {
//               return const LoadingWidget();
//             }
//             logger.d(
//                 'achCompleted================${dashBoardController.dashBoardModel?.result?.data?.achmandate?.achCompleted}');
//             return SafeArea(
//               child: Container(
//                 margin: EdgeInsets.all(18.sp),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // VerticalSpacer(3.h),
//                     dashBoardController.dashBoardModel?.result?.data
//                                 ?.activationStatus?.statusCode ==
//                             'S01'
//                         ? const AttensionWidget()
//                         : const SizedBox(),

//                     dashBoardController.dashBoardModel?.result?.data
//                                 ?.activationStatus?.statusCode ==
//                             'S02'
//                         ? SizedBox(
//                             height: 28.h,
//                             width: double.infinity,
//                             child: Card(
//                               elevation: 5,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   VerticalSpacer(1.h),
//                                   Icon(
//                                     Icons.warning_outlined,
//                                     color: Colors.red,
//                                     size: 5.h,
//                                   ),
//                                   Text(
//                                     'Attention required!',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodyMedium!
//                                         .copyWith(
//                                           fontSize: 17.sp,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                     // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
//                                   ),
//                                   VerticalSpacer(1.h),
//                                   const Text('Upload Your Proof'),
//                                   VerticalSpacer(2.h),
//                                   ButtonWidget(
//                                     btName: 'Upload Proof',
//                                     onTap: () {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) =>
//                                                 const ScreenUploadinProofs(),
//                                           ));
//                                     },
//                                   )
//                                 ],
//                               ),
//                             ),
//                           )
//                         : const SizedBox(),
//                     dashBoardController.dashBoardModel?.result?.data
//                                 ?.activationStatus?.statusCode ==
//                             'S03'
//                         ? SizedBox(
//                             height: 28.h,
//                             width: double.infinity,
//                             child: Card(
//                               elevation: 5,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   VerticalSpacer(1.h),
//                                   Icon(
//                                     Icons.warning_outlined,
//                                     color: Colors.red,
//                                     size: 5.h,
//                                   ),
//                                   Text(
//                                     'Attention required!',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodyMedium!
//                                         .copyWith(
//                                           fontSize: 17.sp,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                     // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
//                                   ),
//                                   VerticalSpacer(1.h),
//                                   const Text('Upload Your Bank Proof'),
//                                   VerticalSpacer(2.h),
//                                   ButtonWidget(
//                                     btName: 'Upload Bank Proof',
//                                     onTap: () {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) =>
//                                                 const ScreenBankProofs(),
//                                           ));
//                                     },
//                                   )
//                                 ],
//                               ),
//                             ),
//                           )
//                         : const SizedBox(),

//                     dashBoardController.dashBoardModel?.result?.data
//                                 ?.activationStatus?.statusCode ==
//                             'S07'
//                         ? SizedBox(
//                             height: 20.h,
//                             width: double.infinity,
//                             child: Card(
//                               elevation: 5,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   VerticalSpacer(1.h),
//                                   Padding(
//                                     padding: EdgeInsets.all(10.0.sp),
//                                     child: Text(
//                                       '${dashBoardController.dashBoardModel?.result?.data?.activationStatus?.message}',
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .bodyMedium,
//                                       textAlign: TextAlign.center,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           )
//                         : const SizedBox(),
//                     dashBoardController.dashBoardModel?.result?.data
//                                 ?.activationStatus?.statusCode ==
//                             'S04'
//                         ? SizedBox(
//                             height: 28.h,
//                             width: double.infinity,
//                             child: Card(
//                               elevation: 5,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   VerticalSpacer(1.h),
//                                   Icon(
//                                     Icons.warning_outlined,
//                                     color: Colors.red,
//                                     size: 5.h,
//                                   ),
//                                   Text(
//                                     'Attention required!',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodyMedium!
//                                         .copyWith(
//                                           fontSize: 17.sp,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                     // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
//                                   ),
//                                   VerticalSpacer(1.h),
//                                   const Text('Complete FATCA Registration'),
//                                   VerticalSpacer(2.h),
//                                   ButtonWidget(
//                                     btName: 'FATCHA Register',
//                                     onTap: () {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) =>
//                                                 const ScreenFatchaRegistration(),
//                                           ));
//                                     },
//                                   )
//                                 ],
//                               ),
//                             ),
//                           )
//                         : const SizedBox(),
//                     SizedBox(
//                       // height: 28.h,
//                       width: double.infinity,
//                       child: Consumer<AchController>(
//                           builder: (context, achController, _) {
//                         return Visibility(
//                           visible: dashBoardController.dashBoardModel?.result
//                                       ?.data?.achmandate?.achCompleted ==
//                                   "Not completed"
//                               ? true
//                               : false,
//                           child: Card(
//                             elevation: 5,
//                             // color: const Color(0xFF4D84BD),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 VerticalSpacer(1.h),
//                                 Icon(
//                                   Icons.warning_outlined,
//                                   color: Colors.red,
//                                   size: 5.h,
//                                 ),
//                                 Text(
//                                   'Attention required!',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodyMedium!
//                                       .copyWith(
//                                         fontSize: 17.sp,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                 ),
//                                 VerticalSpacer(1.h),
//                                 const Text('Register ACH Mandate'),
//                                 VerticalSpacer(2.h),
//                                 achController.loadingAch == true
//                                     ? const LoadingButton()
//                                     : ButtonWidget(
//                                         btName: 'Register',
//                                         onTap: () async {
//                                           bool result = await achController
//                                               .registerAch(context, false);
//                                           if (result == true) {
//                                             // ignore: use_build_context_synchronously
//                                             Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     ScreenWebview(
//                                                         url: achController
//                                                             .result),
//                                               ),
//                                             );
//                                           }
//                                         },
//                                       )
//                               ],
//                             ),
//                           ),
//                         );
//                       }),
//                     ),
//                     VerticalSpacer(2.h),
//                     Text(
//                       'Collections',
//                       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                             fontSize: 18.sp,
//                             fontWeight: FontWeight.bold,
//                           ),
//                       // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
//                     ),
//                     VerticalSpacer(1.h),
//                     const SixMutualFundWidget(),

//                     VerticalSpacer(1.h),

//                     dashBoardController.summaryModel?.result == null
//                         ? SizedBox(
//                             width: MediaQuery.of(context).size.width,
//                             child: Card(
//                               elevation: 5,
//                               // surfaceTintColor:
//                               //     const Color.fromARGB(255, 236, 230, 230),
//                               child: Padding(
//                                 padding: EdgeInsets.all(13.sp),
//                                 child: Column(
//                                   children: [
//                                     VerticalSpacer(1.h),
//                                     Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         'Mutual Funds Portfolio',
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .bodyMedium!
//                                             .copyWith(
//                                               fontSize: 17.sp,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                       ),
//                                     ),
//                                     VerticalSpacer(3.h),
//                                     Text(
//                                       'Your portfolio is currently empty!',
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .bodyMedium!
//                                           .copyWith(
//                                             fontSize: 16.sp,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                     ),
//                                     VerticalSpacer(1.h),
//                                     const Text(
//                                       'After you start investing,your mutual funds/n portfolio will appear here.',
//                                       textAlign: TextAlign.center,
//                                     ),
//                                     VerticalSpacer(2.h),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           )
//                         : const PortFolioMutualFund(),
//                     VerticalSpacer(10.h),
//                   ],
//                 ),
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }

//   void showLogoutAlertDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Logout'),
//           content: const Text('Are you sure you want to logout?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 SecureStorage.clearSecureStoragevalue('token');
//                 SecureStorage.clearSecureStoragevalue('username');
//                 SecureStorage.clearSecureStoragevalue('iin');
//                 Provider.of<BiometricLogin>(context, listen: false)
//                     .changeButtonEnabled(false);
//                 Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const BoardingViewScreen(),
//                   ),
//                   (route) => false,
//                 );
//                 Provider.of<AuthController>(context, listen: false)
//                     .clearTheControllerValue();
//               },
//               child: Text(
//                 'Yes',
//                 style: Theme.of(context).textTheme.labelLarge,
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 // Dismiss the alert dialog when 'No' is pressed
//                 Navigator.of(context).pop();
//               },
//               child: Text(
//                 'No',
//                 style: Theme.of(context).textTheme.labelLarge,
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
import 'dart:ffi';

import 'package:finfresh_mobile/controller/achController/ach_controller.dart';
import 'package:finfresh_mobile/controller/auth/auth_controller.dart';
import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:finfresh_mobile/controller/login%20pin%20controller/login_pin_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/view/fatcha%20registration/fatcha_registeration.dart';
import 'package:finfresh_mobile/view/homeScreen/widgets/attension_widget.dart';
import 'package:finfresh_mobile/view/homeScreen/widgets/drawer_widget.dart';
import 'package:finfresh_mobile/view/homeScreen/widgets/portfolio_mutual_fund.dart';
import 'package:finfresh_mobile/view/homeScreen/widgets/roundChart.dart';
import 'package:finfresh_mobile/view/homeScreen/widgets/six_mutual_fund_widget.dart';
import 'package:finfresh_mobile/view/kyc/uploading%20proofs/screen_upload_proof.dart';
import 'package:finfresh_mobile/view/kyc/uploading%20proofs/upload%20bank%20proof/upload_bank_proof.dart';
import 'package:finfresh_mobile/view/onboarding%20screen/on_boarding_view_screen.dart';
import 'package:finfresh_mobile/view/webview/screen_webview.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  Future<void> function() async {
    await Provider.of<DashBoardController>(context, listen: false)
        .getDashBoardDetails(context);
  }

  @override
  void initState() {
    super.initState();

    Provider.of<DashBoardController>(context, listen: false).getusername();
    function();
  }

  @override
  Widget build(BuildContext context) {
    Brightness platformBrightness = MediaQuery.of(context).platformBrightness;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      // drawer: const DrawerWidget(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: const SizedBox(),
            pinned: true,
            toolbarHeight: Adaptive.h(6),
            // backgroundColor: Colors.transparent,
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
              },
            ),
            actions: [
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
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Consumer<DashBoardController>(
                builder: (context, dashBoardController, child) {
                  if (dashBoardController.loadingDashboard == true) {
                    return const LoadingWidget();
                  }
                  return Container(
                    margin: EdgeInsets.only(
                        left: 15.sp, right: 15.sp, bottom: 18.sp),
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
                                  elevation: 5,
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
                                  elevation: 5,
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
                                  elevation: 5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      VerticalSpacer(1.h),
                                      Padding(
                                        padding: EdgeInsets.all(10.0.sp),
                                        child: Text(
                                          '${dashBoardController.dashBoardModel?.result?.data?.activationStatus?.message}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        // SizedBox(
                        //   height: 28.h,
                        //   width: double.infinity,
                        //   child: Lottie.asset('assets/lottie/attension.json',
                        //       fit: BoxFit.fill),
                        // ),

                        dashBoardController.dashBoardModel?.result?.data
                                    ?.activationStatus?.statusCode ==
                                'S04'
                            ? SizedBox(
                                width: double.infinity,
                                child: Card(
                                  // color: Color(0xFFFD7E14),
                                  elevation: 5,
                                  child: Column(
                                    children: [
                                      VerticalSpacer(1.h),
                                      ListTile(
                                        contentPadding: EdgeInsets.only(
                                          left: 9.sp,
                                          right: 15.sp,
                                        ),
                                        title: Text(
                                          'Attention required!',
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
                                          'Complete FATCA Registration',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                color: Colors.grey,
                                              ),
                                        ),
                                        leading: const SizedBox(),
                                        trailing: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ScreenFatchaRegistration(),
                                                ));
                                          },
                                          child: SizedBox(
                                            width: Adaptive.w(23),
                                            height: Adaptive.h(5),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.sp),
                                                color: const Color(0xFF6C8FF8),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Register',
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
                                  // child: Column(
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   // crossAxisAlignment:
                                  //   //     CrossAxisAlignment.start,
                                  //   children: [
                                  //     VerticalSpacer(1.h),
                                  //     Icon(
                                  //       Icons.warning_outlined,
                                  //       color: Colors.red,
                                  //       size: 5.h,
                                  //     ),
                                  //     Text(
                                  //       'Attention required!',
                                  //       style: Theme.of(context)
                                  //           .textTheme
                                  //           .bodyMedium!
                                  //           .copyWith(
                                  //             fontSize: 18.sp,
                                  //             fontWeight: FontWeight.bold,
                                  //             letterSpacing: 3.5.sp,
                                  //           ),
                                  //       // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                                  //     ),
                                  //     VerticalSpacer(1.h),
                                  //     const Text(
                                  //       'Complete FATCA Registration',
                                  //     ),
                                  //     VerticalSpacer(1.h),
                                  //     SizedBox(
                                  //       width: Adaptive.w(50),
                                  //       child: ButtonWidget(
                                  //         btName: 'FATCHA Register',
                                  //         onTap: () {
                                  //           Navigator.push(
                                  //               context,
                                  //               MaterialPageRoute(
                                  //                 builder: (context) =>
                                  //                     const ScreenFatchaRegistration(),
                                  //               ));
                                  //         },
                                  //       ),
                                  //     )
                                  //   ],
                                  // ),
                                ),
                              )
                            : const SizedBox(),
                        SizedBox(
                          // height: 15.h,
                          width: double.infinity,
                          child: Consumer<AchController>(
                              builder: (context, achController, _) {
                            return Visibility(
                              visible: dashBoardController
                                          .dashBoardModel
                                          ?.result
                                          ?.data
                                          ?.achmandate
                                          ?.achCompleted ==
                                      "Not completed"
                                  ? true
                                  : false,
                              child: Center(
                                child: Card(
                                  elevation: 5,
                                  child: Column(
                                    children: [
                                      VerticalSpacer(1.h),
                                      ListTile(
                                        contentPadding: EdgeInsets.only(
                                          left: 9.sp,
                                          right: 15.sp,
                                        ),
                                        title: Text(
                                          'Attention required!',
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
                                          'Register ACH Mandate',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                color: Colors.grey,
                                              ),
                                        ),
                                        leading: const SizedBox(),
                                        trailing: InkWell(
                                          onTap: () async {
                                            bool result = await achController
                                                .registerAch(context, false);
                                            if (result == true) {
                                              // ignore: use_build_context_synchronously
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ScreenWebview(
                                                          url: achController
                                                              .result),
                                                ),
                                              );
                                            }
                                          },
                                          child: SizedBox(
                                            width: Adaptive.w(23),
                                            height: Adaptive.h(5),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.sp),
                                                color: const Color(0xFF6C8FF8),
                                              ),
                                              child: Center(
                                                child: achController
                                                            .loadingAch ==
                                                        true
                                                    ? const CupertinoActivityIndicator(
                                                        color: Colors.white)
                                                    : Text(
                                                        'Register',
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
                            );
                          }),
                        ),
                        VerticalSpacer(2.h),
                        SizedBox(
                          height: 40.h,
                          width: double.infinity,
                          child: Card(
                            elevation: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                VerticalSpacer(7.h),
                                const RoundChartWidget(),
                                VerticalSpacer(8.h),
                                Text(
                                  dashBoardController
                                          .summaryModel?.result?.totalAmount ??
                                      '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                VerticalSpacer(1.h),
                                Padding(
                                  padding: EdgeInsets.all(12.sp),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Investment Amount',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(),
                                      ),
                                      HorizontalSpacer(5.w),
                                      Text(
                                        'Total Gain',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(),
                                      ),
                                      HorizontalSpacer(8.w),
                                      Text(
                                        'Total Amount',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Row(
                                    children: [
                                      HorizontalSpacer(3.w),
                                      Text(
                                        dashBoardController.summaryModel?.result
                                                ?.netInvestment ??
                                            '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xFFFFC700),
                                            ),
                                      ),
                                      HorizontalSpacer(20.w),
                                      Text(
                                        dashBoardController.summaryModel?.result
                                                ?.netEquityGains ??
                                            '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xFF6C8FF8),
                                            ),
                                      ),
                                      HorizontalSpacer(13.w),
                                      Text(
                                        dashBoardController.summaryModel?.result
                                                ?.totalAmount ??
                                            '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xFF324053),
                                            ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        VerticalSpacer(2.h),
                        Text(
                          'Funds',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                          // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                        ),
                        VerticalSpacer(1.h),
                        const SixMutualFundWidget(),

                        VerticalSpacer(1.h),

                        // dashBoardController.summaryModel?.result == null
                        //     ? SizedBox(
                        //         width: MediaQuery.of(context).size.width,
                        //         child: Card(
                        //           elevation: 5,
                        //           // surfaceTintColor:
                        //           //     const Color.fromARGB(255, 236, 230, 230),
                        //           child: Padding(
                        //             padding: EdgeInsets.all(13.sp),
                        //             child: Column(
                        //               children: [
                        //                 VerticalSpacer(1.h),
                        //                 Align(
                        //                   alignment: Alignment.topLeft,
                        //                   child: Text(
                        //                     'Mutual Funds Portfolio',
                        //                     style: Theme.of(context)
                        //                         .textTheme
                        //                         .bodyMedium!
                        //                         .copyWith(
                        //                           fontSize: 17.sp,
                        //                           fontWeight: FontWeight.bold,
                        //                         ),
                        //                   ),
                        //                 ),
                        //                 VerticalSpacer(3.h),
                        //                 Text(
                        //                   'Your portfolio is currently empty!',
                        //                   style: Theme.of(context)
                        //                       .textTheme
                        //                       .bodyMedium!
                        //                       .copyWith(
                        //                         fontSize: 16.sp,
                        //                         fontWeight: FontWeight.bold,
                        //                       ),
                        //                 ),
                        //                 VerticalSpacer(1.h),
                        //                 const Text(
                        //                   'After you start investing,your mutual funds/n portfolio will appear here.',
                        //                   textAlign: TextAlign.center,
                        //                 ),
                        //                 VerticalSpacer(2.h),
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //       )
                        //     : const PortFolioMutualFund(),
                        VerticalSpacer(10.h),
                      ],
                    ),
                  );
                },
              ),
            ]),
          ),
        ],
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
                SecureStorage.clearSecureStoragevalue('username');
                SecureStorage.clearSecureStoragevalue('iin');
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
