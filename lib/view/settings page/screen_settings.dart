import 'dart:developer';

import 'package:finfresh_mobile/controller/auth/auth_controller.dart';
import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:finfresh_mobile/controller/goldController/gold_controller.dart';
import 'package:finfresh_mobile/controller/login%20pin%20controller/login_pin_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/view/onboarding%20screen/on_boarding_view_screen.dart';
import 'package:finfresh_mobile/view/settings%20page/widget/terms_and_condition.dart';
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
    // TODO: implement initState
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
      body: Container(
        margin: EdgeInsets.all(15.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<DashBoardController>(
                  builder: (context, dashBoardController, _) {
                log('namee${dashBoardController.dashBoardModel?.result?.data?.name}');
                return Card(
                  elevation: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VerticalSpacer(1.h),
                      Padding(
                        padding: EdgeInsets.only(left: 19.sp),
                        child: Text(
                          'Account',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 3.sp,
                                  ),
                        ),
                      ),
                      ListTile(
                        leading: Container(
                            height: 5.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Color(0xFF0E1330),
                            ),
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                            )),
                        title: Text(
                          'Name',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 3.sp,
                                  ),
                        ),
                        subtitle: Text(
                          dashBoardController
                                  .dashBoardModel?.result?.data?.name ??
                              dashBoardController.username,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: Colors.grey),
                        ),
                        onTap: () {},
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 33.sp),
                        child: const Divider(
                          height: 1,
                          color: Color.fromARGB(255, 219, 219, 219),
                          thickness: 1,
                        ),
                      ),
                      ListTile(
                        leading: Container(
                          height: 5.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: Color(0xFF0E1330),
                          ),
                          child: const Icon(
                            Icons.mobile_friendly,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          'Phone',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 3.sp,
                                  ),
                        ),
                        subtitle: Text(
                          dashBoardController
                                  .dashBoardModel?.result?.data?.phoneNumber ??
                              '',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: Colors.grey),
                        ),
                        onTap: () {},
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 33.sp),
                        child: const Divider(
                          height: 1,
                          color: Color.fromARGB(255, 219, 217, 217),
                          thickness: 1,
                        ),
                      ),
                      ListTile(
                        leading: Container(
                            height: 5.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Color(0xFF0E1330),
                            ),
                            child: const Icon(
                              Icons.email,
                              color: Colors.white,
                            )),
                        title: Text(
                          'Email',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 3.sp,
                                  ),
                        ),
                        subtitle: Text(
                          dashBoardController
                                  .dashBoardModel?.result?.data?.email ??
                              '',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: Colors.grey),
                        ),
                        onTap: () {},
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 33.sp),
                        child: const Divider(
                          height: 1,
                          color: Color.fromARGB(255, 219, 217, 217),
                          thickness: 1,
                        ),
                      ),
                      ListTile(
                        leading: Container(
                            height: 5.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Color(0xFF0E1330),
                            ),
                            child: const Icon(
                              Icons.edit_document,
                              color: Colors.white,
                            )),
                        title: Text(
                          'IIN',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 3.sp,
                                  ),
                        ),
                        subtitle: Text(
                          dashBoardController
                                  .dashBoardModel?.result?.data?.iin ??
                              '',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: Colors.grey),
                        ),
                        onTap: () {},
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 33.sp),
                        child: const Divider(
                          height: 1,
                          color: Color.fromARGB(255, 219, 217, 217),
                          thickness: 1,
                        ),
                      ),
                      ListTile(
                        leading: Container(
                            height: 5.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Color(0xFF0E1330),
                            ),
                            child: const Icon(
                              Icons.fingerprint,
                              color: Colors.white,
                            )),
                        title: Text(
                          'Fingerprint',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 3.sp,
                                  ),
                        ),
                        subtitle: Text(
                          'Enable Fringerprint',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: Colors.grey),
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
                    ],
                  ),
                );
              }),
              Registrationwidget(platformBrightness: platformBrightness),
              TermsAndCondition(platformBrightness: platformBrightness),
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
                Provider.of<BiometricLogin>(context, listen: false)
                    .changeButtonEnabled(false);
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
