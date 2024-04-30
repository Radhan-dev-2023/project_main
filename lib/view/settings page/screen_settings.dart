import 'package:finfresh_mobile/controller/auth/auth_controller.dart';
import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:finfresh_mobile/controller/login%20pin%20controller/login_pin_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/view/onboarding%20screen/on_boarding_view_screen.dart';
import 'package:finfresh_mobile/view/settings%20page/widget/terms_and_condition.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'widget/register_wiget.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({super.key});

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
                return Card(
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
                                    fontSize: 21.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(
                          'Name',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        subtitle: Text(
                          dashBoardController
                                  .dashBoardModel?.result?.data?.name ??
                              '',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: Colors.grey),
                        ),
                        onTap: () {},
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 31.sp),
                        child: const Divider(
                          height: 1,
                          color: Color.fromARGB(255, 219, 219, 219),
                          thickness: 1,
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.mobile_friendly),
                        title: Text(
                          'Phone',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
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
                        padding: EdgeInsets.only(left: 31.sp),
                        child: const Divider(
                          height: 1,
                          color: Color.fromARGB(255, 219, 217, 217),
                          thickness: 1,
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.email),
                        title: Text(
                          'Email',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
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
                        padding: EdgeInsets.only(left: 31.sp),
                        child: const Divider(
                          height: 1,
                          color: Color.fromARGB(255, 219, 217, 217),
                          thickness: 1,
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.edit_document),
                        title: Text(
                          'IIN',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
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
