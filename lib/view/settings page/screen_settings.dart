import 'package:finfresh_mobile/controller/auth/auth_controller.dart';
import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:finfresh_mobile/controller/login%20pin%20controller/login_pin_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/view/ach%20history/screen_ach_history.dart';
import 'package:finfresh_mobile/view/ach%20registrarion/ach_registeration.dart';
import 'package:finfresh_mobile/view/fatcha%20registration/fatcha_registeration.dart';
import 'package:finfresh_mobile/view/homeScreen/screen_home_view_screen.dart';
import 'package:finfresh_mobile/view/listing%20of%20banks/screen_listing_of_banks.dart';
import 'package:finfresh_mobile/view/onboarding%20screen/on_boarding_view_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness platformBrightness = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text('Settings'),
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
                        leading: Icon(Icons.person),
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
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) =>
                          //           const ScreenAchRegistration(),
                          //     ));
                        },
                      ),
                      // Divider(
                      //   color: Colors.grey,
                      // ),
                      Padding(
                        padding: EdgeInsets.only(left: 31.sp),
                        child: Divider(
                          height: 1,
                          color: const Color.fromARGB(255, 219, 219, 219),
                          thickness: 1,
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.mobile_friendly),
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
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) =>
                          //           const ScreenAchRegistration(),
                          //     ));
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 31.sp),
                        child: Divider(
                          height: 1,
                          color: const Color.fromARGB(255, 219, 217, 217),
                          thickness: 1,
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.email),
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
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) =>
                          //           const ScreenAchRegistration(),
                          //     ));
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 31.sp),
                        child: Divider(
                          height: 1,
                          color: const Color.fromARGB(255, 219, 217, 217),
                          thickness: 1,
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.edit_document),
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
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) =>
                          //           const ScreenAchRegistration(),
                          //     ));
                        },
                      ),
                    ],
                  ),
                );
              }),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Image.asset(
                        'assets/images/mandate.png',
                        height: Adaptive.h(6),
                        width: Adaptive.w(6),
                      ),
                      title: Text(
                        'ACH Mandate',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15.sp,
                        color: Colors.grey,
                      ),
                      subtitle: Text(
                        'ACH Mandate Registration',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Colors.grey),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ScreenAchRegistration(),
                            ));
                      },
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
                      leading: Image.asset(
                        'assets/images/bankdetails.png',
                        height: Adaptive.h(6),
                        width: Adaptive.w(6),
                      ),
                      title: Text(
                        'Bank Details',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      subtitle: Text(
                        'Add Banks',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Colors.grey),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ScreenListingOfBanks(),
                            ));
                      },
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15.sp,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 31.sp),
                      child: Divider(
                        height: 1,
                        color: const Color.fromARGB(255, 219, 217, 217),
                        thickness: 1,
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/images/fatcharegistrario.png',
                        height: Adaptive.h(6),
                        width: Adaptive.w(6),
                      ),
                      title: Text(
                        'FATCA',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      subtitle: Text(
                        'FATCA Registration',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Colors.grey),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ScreenFatchaRegistration(),
                            ));
                      },
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15.sp,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 31.sp),
                      child: Divider(
                        height: 1,
                        color: const Color.fromARGB(255, 219, 217, 217),
                        thickness: 1,
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/images/achhistory.png',
                        height: Adaptive.h(6),
                        width: Adaptive.w(6),
                      ),
                      title: Text(
                        'ACH',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      subtitle: Text(
                        'ACH History',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Colors.grey),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ScreenAchHistory(),
                            ));
                      },
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              VerticalSpacer(2.h),
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
