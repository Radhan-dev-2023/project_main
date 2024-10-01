import 'dart:developer';
import 'package:finfresh_mobile/controller/auth/auth_controller.dart';
import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:finfresh_mobile/controller/goldController/gold_controller.dart';
import 'package:finfresh_mobile/controller/login%20pin%20controller/login_pin_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/view/onboarding%20screen/on_boarding_view_screen.dart';
import 'package:finfresh_mobile/view/screen%20profile/screen_profile.dart';
import 'package:finfresh_mobile/view/settings%20page/widget/terms_and_condition.dart';
import 'package:finfresh_mobile/view/transaction%20screen/screen_transaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'widget/register_wiget.dart';

class ScreenSettings extends StatefulWidget {
  const ScreenSettings({super.key});

  @override
  State<ScreenSettings> createState() => _ScreenSettingsState();
}

class _ScreenSettingsState extends State<ScreenSettings> {
  @override
  void initState() {
    super.initState();
    Provider.of<DashBoardController>(context, listen: false)
        .fringerprintCheck();
    Provider.of<DashBoardController>(context, listen: false).getusername();
  }

  @override
  Widget build(BuildContext context) {
    Brightness platformBrightness = MediaQuery.of(context).platformBrightness;

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text('Settings'),
        // actions: [
        // IconButton(
        //   onPressed: () {
        //     showLogoutAlertDialog(context);
        //   },
        //   icon: Icon(
        //     Icons.logout,
        //     color: platformBrightness == Brightness.light
        //         ? Colors.black
        //         : Colors.white,
        //   ),
        // ),
        // ],
      ),
      body: Container(
        margin: EdgeInsets.all(15.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<DashBoardController>(
                  builder: (context, dashBoardController, _) {
                log('namee${dashBoardController.dashBoardModel?.result?.data?.name}');
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        child: Column(
                          children: [
                            Text(
                                dashBoardController
                                        .dashBoardModel?.result?.data?.name ??
                                    dashBoardController.username,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                      fontSize: 19.sp,
                                    )),
                            // VerticalSpacer(0.5.h),
                            // Text(
                            //     ' +91 ${dashBoardController.dashBoardModel?.result?.data?.phoneNumber ?? ''}',
                            //     style: Theme.of(context).textTheme.labelLarge!),
                          ],
                        ),
                      ),
                    ),
                    VerticalSpacer(1.h),
                    Padding(
                      padding: EdgeInsets.only(left: 15.5.sp),
                      child: Text(
                        'Account settings',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16.sp,
                            // fontWeight: FontWeight.bold,
                            letterSpacing: 3.sp,
                            color: const Color(0xFF888888)),
                      ),
                    ),
                    // ListTile(
                    //   leading: Container(
                    //       height: 5.h,
                    //       width: 10.w,
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(10.sp),
                    //         color: const Color(0xFF0E1330),
                    //       ),
                    //       child: const Icon(
                    //         Icons.person,
                    //         color: Colors.white,
                    //       )),
                    //   title: Text(
                    //     'Name',
                    //     style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    //           fontSize: 17.sp,
                    //           fontWeight: FontWeight.w400,
                    //           letterSpacing: 3.sp,
                    //         ),
                    //   ),
                    //   subtitle: Text(
                    //     dashBoardController
                    //             .dashBoardModel?.result?.data?.name ??
                    //         dashBoardController.username,
                    //     style: Theme.of(context)
                    //         .textTheme
                    //         .labelLarge!
                    //         .copyWith(color: Colors.grey),
                    //   ),
                    //   onTap: () {},
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.only(left: 33.sp),
                    //   child: const Divider(
                    //     height: 1,
                    //     color: Color.fromARGB(255, 219, 219, 219),
                    //     thickness: 1,
                    //   ),
                    // ),
                    // ListTile(
                    //   leading: Container(
                    //     height: 5.h,
                    //     width: 10.w,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10.sp),
                    //       color: const Color(0xFF0E1330),
                    //     ),
                    //     child: const Icon(
                    //       Icons.mobile_friendly,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    //   title: Text(
                    //     'Phone',
                    //     style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    //           fontSize: 17.sp,
                    //           fontWeight: FontWeight.w400,
                    //           letterSpacing: 3.sp,
                    //         ),
                    //   ),
                    //   subtitle: Text(
                    //     dashBoardController
                    //             .dashBoardModel?.result?.data?.phoneNumber ??
                    //         '',
                    //     style: Theme.of(context)
                    //         .textTheme
                    //         .labelLarge!
                    //         .copyWith(color: Colors.grey),
                    //   ),
                    //   onTap: () {},
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.only(left: 33.sp),
                    //   child: const Divider(
                    //     height: 1,
                    //     color: Color.fromARGB(255, 219, 217, 217),
                    //     thickness: 1,
                    //   ),
                    // ),

                    ListTile(
                      leading: Image.asset(
                        'assets/images/settingsicon/Group (3).png',
                        height: Adaptive.h(4),
                        width: Adaptive.w(6),
                        color: platformBrightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),

                      // title: Text(
                      //   'Email',
                      //   style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      //         fontSize: 17.sp,
                      //         fontWeight: FontWeight.w400,
                      //         letterSpacing: 3.sp,
                      //       ),
                      // ),
                      title: Text(
                        dashBoardController
                                .dashBoardModel?.result?.data?.email ??
                            '',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 3.sp,
                            ),
                      ),
                    ),

                    // Padding(
                    //   padding: EdgeInsets.only(left: 33.sp),
                    //   child: const Divider(
                    //     height: 1,
                    //     color: Color.fromARGB(255, 219, 217, 217),
                    //     thickness: 1,
                    //   ),
                    // ),
                    // ListTile(
                    //   leading: Container(
                    //       height: 5.h,
                    //       width: 10.w,
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(10.sp),
                    //         color: const Color(0xFF0E1330),
                    //       ),
                    //       child: const Icon(
                    //         Icons.delete_forever_outlined,
                    //         color: Colors.white,
                    //       )),
                    //   title: Text(
                    //     'Delete Account',
                    //     style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    //           fontSize: 17.sp,
                    //           fontWeight: FontWeight.w400,
                    //           letterSpacing: 3.sp,
                    //         ),
                    //   ),
                    //   subtitle: Text(
                    //     'Delete your account',
                    //     style: Theme.of(context)
                    //         .textTheme
                    //         .labelLarge!
                    //         .copyWith(color: Colors.grey),
                    //   ),
                    //   onTap: () {
                    //     showDialog(
                    //       context: context,
                    //       builder: (BuildContext context) {
                    //         return AlertDialog(
                    //           title: const Text("Account Deletion"),
                    //           content: const Text(
                    //               "Are you sure you want to delete your account? This action cannot be undone."),
                    //           actions: <Widget>[
                    //             TextButton(
                    //               child: const CustomTextWidget(
                    //                 text: "Cancel",
                    //                 // fontWeight: FontWeight.bold,
                    //                 color: Color(0xFF4D84BD),
                    //               ),
                    //               onPressed: () {
                    //                 Navigator.of(context).pop(false);
                    //               },
                    //             ),
                    //             TextButton(
                    //               child: dashBoardController.loadingPage == true
                    //                   ? const CupertinoActivityIndicator(
                    //                       color: Color(0xFF4D84BD),
                    //                     )
                    //                   : const CustomTextWidget(
                    //                       text: "Delete",
                    //                       // fontWeight: FontWeight.bold,
                    //                       color: Color(0xFF4D84BD),
                    //                     ),
                    //               onPressed: () async {
                    //                 bool result = await dashBoardController
                    //                     .deleteaccount(context);
                    //                 if (result == true) {
                    //                   // settingsController.image = null;

                    //                   SecureStorage.clearSecureStoragevalue(
                    //                       'token');
                    //                   SecureStorage.clearSecureStoragevalue(
                    //                       'username');
                    //                   SecureStorage.clearSecureStoragevalue(
                    //                       'iin');
                    //                   Provider.of<BiometricLogin>(context,
                    //                           listen: false)
                    //                       .changeButtonEnabled(false);
                    //                   Provider.of<GoldController>(context,
                    //                           listen: false)
                    //                       .formattedValue = '';
                    //                   Provider.of<DashBoardController>(context,
                    //                           listen: false)
                    //                       .currentIndex = 2;
                    //                   Navigator.pushAndRemoveUntil(
                    //                     context,
                    //                     MaterialPageRoute(
                    //                       builder: (context) =>
                    //                           const BoardingViewScreen(),
                    //                     ),
                    //                     (route) => false,
                    //                   );
                    //                   Provider.of<AuthController>(context,
                    //                           listen: false)
                    //                       .clearTheControllerValue();
                    //                   showFlushbar(
                    //                     context,
                    //                     "Account deleted successfully",
                    //                   );
                    //                 }
                    //               },
                    //             ),
                    //           ],
                    //         );
                    //       },
                    //     );
                    //   },
                    // ),

                    Padding(
                      padding: EdgeInsets.only(left: 18.sp),
                      child: const Divider(
                        height: 1,
                        color: Color.fromARGB(255, 219, 217, 217),
                        thickness: 1,
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/images/settingsicon/f7_number.png',
                        height: Adaptive.h(4),
                        width: Adaptive.w(6),
                        color: platformBrightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                      // title: Text(
                      //   'IIN',
                      //   style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      //         fontSize: 17.sp,
                      //         fontWeight: FontWeight.w400,
                      //         letterSpacing: 3.sp,
                      //       ),
                      // ),
                      title: Text(
                        dashBoardController.dashBoardModel?.result?.data?.iin ??
                            '',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 3.sp,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 18.sp),
                      child: const Divider(
                        height: 1,
                        color: Color.fromARGB(255, 219, 217, 217),
                        thickness: 1,
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/images/profile/p1.png',
                        height: Adaptive.h(4),
                        width: Adaptive.w(6),
                        color: platformBrightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                      title: Text(
                        'Profile',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 3.sp,
                            ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ScreenProfile(),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 18.sp),
                      child: const Divider(
                        height: 1,
                        color: Color.fromARGB(255, 219, 217, 217),
                        thickness: 1,
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.fingerprint,
                      ),
                      // title: Text(
                      //   'Fingerprint',
                      //   style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      //         fontSize: 17.sp,
                      //         fontWeight: FontWeight.w400,
                      //         letterSpacing: 3.sp,
                      //       ),
                      // ),
                      title: Text(
                        'Enable Fingerprint',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 3.sp,
                            ),
                      ),
                      trailing: Transform.scale(
                        scale: 0.8,
                        child: Switch(
                          activeColor: const Color(0xFF4D84BD),
                          value: dashBoardController.isSwitched,
                          onChanged: (value) {
                            dashBoardController.changeToogle();
                          },
                        ),
                      ),
                      onTap: () {},
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 18.sp),
                      child: const Divider(
                        height: 1,
                        color: Color.fromARGB(255, 219, 217, 217),
                        thickness: 1,
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/images/navicons/exchange (1) 1.png',
                        height: Adaptive.h(4),
                        width: Adaptive.w(6),
                        color: platformBrightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),

                      // title: Text(
                      //   'Email',
                      //   style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      //         fontSize: 17.sp,
                      //         fontWeight: FontWeight.w400,
                      //         letterSpacing: 3.sp,
                      //       ),
                      // ),
                      title: Text(
                        'Transactions',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 3.sp,
                            ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ScreeenTranscations(),
                            ));
                      },
                    ),
                  ],
                );
              }),
              Padding(
                padding: EdgeInsets.only(left: 18.sp),
                child: const Divider(
                  height: 1,
                  color: Color.fromARGB(255, 219, 217, 217),
                  thickness: 1,
                ),
              ),
              Registrationwidget(platformBrightness: platformBrightness),
              VerticalSpacer(1.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.5.sp),
                  child: Text(
                    'General settings',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16.sp,
                        // fontWeight: FontWeight.bold,
                        letterSpacing: 3.sp,
                        color: const Color(0xFF888888)),
                  ),
                ),
              ),
              VerticalSpacer(1.h),
              TermsAndCondition(platformBrightness: platformBrightness),
              VerticalSpacer(1.h),
              ListTile(
                leading: Image.asset(
                  'assets/images/settingsicon/ri_logout-circle-r-line.png',
                  // color: platformBrightness == Brightness.light
                  //     ? Colors.black
                  //     : Colors.white,
                  // color: Colors.white,
                  height: Adaptive.h(4),
                  width: Adaptive.w(6),
                ),
                title: Text(
                  'Logout',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 3.sp,
                      color: const Color(0xFFFF0000)),
                ),

                onTap: () {
                  showLogoutAlertDialog(context);
                },
                // trailing: Icon(
                //   Icons.arrow_forward_ios,
                //   size: 15.sp,
                //   color: Colors.grey,
                // ),
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
                SecureStorage.clearSecureStoragevalue('username');
                SecureStorage.clearSecureStoragevalue('iin');
                SecureStorage.clearSecureStoragevalue('pin');
                Provider.of<BiometricLogin>(context, listen: false)
                    .changeButtonEnabled(false);
                Provider.of<BiometricLogin>(context, listen: false)
                    .changeisPinEmpty(false);
                Provider.of<GoldController>(context, listen: false)
                    .formattedValue = '';
                Provider.of<DashBoardController>(context, listen: false)
                    .currentIndex = 2;
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
