import 'package:finfresh_mobile/controller/achController/ach_controller.dart';
import 'package:finfresh_mobile/controller/auth/auth_controller.dart';
import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:finfresh_mobile/controller/goldController/gold_controller.dart';
import 'package:finfresh_mobile/controller/login%20pin%20controller/login_pin_controller.dart';
import 'package:finfresh_mobile/utilities/constant/flushbar.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/view/ach%20registrarion/ach_registeration.dart';
import 'package:finfresh_mobile/view/listing%20of%20banks/screen_listing_of_banks.dart';
import 'package:finfresh_mobile/view/onboarding%20screen/on_boarding_view_screen.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/widgets/overview_in_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness platformBrightness = MediaQuery.of(context).platformBrightness;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Container(
        margin: EdgeInsets.all(15.sp),
        child: Consumer<DashBoardController>(
            builder: (context, dashBoardController, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Image.asset(
                  'assets/images/profile/Phone no.png',
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
                  '+91 ${dashBoardController.dashBoardModel?.result?.data?.phoneNumber ?? ''}',
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
                  'assets/images/profile/address.png',
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
                  "${dashBoardController.dashBoardModel?.result?.customer?.addr1 ?? ''},${dashBoardController.dashBoardModel?.result?.customer?.addr2 ?? ''},${dashBoardController.dashBoardModel?.result?.customer?.addr3},${dashBoardController.dashBoardModel?.result?.customer?.city},${dashBoardController.dashBoardModel?.result?.customer?.state} ${dashBoardController.dashBoardModel?.result?.customer?.pincode}"
                  "",
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
                  'assets/images/profile/PanCard.png',
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
                  dashBoardController.dashBoardModel?.result?.data?.pan ?? '',
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
                  'assets/images/settingsicon/ph_bank-light.png',
                  color: platformBrightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  height: Adaptive.h(4),
                  width: Adaptive.w(6),
                ),
                // title: Text(
                //   'Bank Details',
                //   style: Theme.of(context).textTheme.labelLarge!.copyWith(
                //         fontSize: 17.sp,
                //         fontWeight: FontWeight.w400,
                //         letterSpacing: 3.sp,
                //       ),
                // ),
                title: Text(
                  'Banks Details',
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
                        builder: (context) => const ScreenListingOfBanks(),
                      ));
                },
                // trailing: Icon(
                //   Icons.arrow_forward_ios,
                //   size: 15.sp,
                //   color: Colors.grey,
                // ),
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
                  'assets/images/settingsicon/system-uicons_clipboard-notes.png',
                  color: platformBrightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  height: Adaptive.h(4),
                  width: Adaptive.w(6),
                  fit: BoxFit.fill,
                ),
                // title: Text(
                //   'ACH Mandate',
                //   style: Theme.of(context).textTheme.labelLarge!.copyWith(
                //         fontSize: 17.sp,
                //         fontWeight: FontWeight.w400,
                //         letterSpacing: 3.sp,
                //       ),
                // ),
                // trailing: Icon(
                //   Icons.arrow_forward_ios,
                //   size: 15.sp,
                //   color: Colors.grey,
                // ),
                title: Text(
                  'ACH Mandate Registration',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 3.sp,
                      ),
                ),
                onTap: () {
                  Provider.of<AchController>(context, listen: false)
                      .itialdataForFeilds();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScreenAchRegistration(),
                      ));
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
                leading: Icon(
                  Icons.delete_forever_outlined,
                  color: platformBrightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
                title: Text(
                  'Delete Account',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 3.sp,
                      ),
                ),
                // subtitle: Text(
                //   'Delete your account',
                //   style: Theme.of(context)
                //       .textTheme
                //       .labelLarge!
                //       .copyWith(color: Colors.grey),
                // ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Account Deletion"),
                        content: const Text(
                            "Are you sure you want to delete your account? This action cannot be undone. Contacting RM u will be able to delete"),
                        actions: <Widget>[
                          TextButton(
                            child: const CustomTextWidget(
                              text: "Cancel",
                              // fontWeight: FontWeight.bold,
                              color: Color(0xFF4D84BD),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                          ),
                          TextButton(
                            child: dashBoardController.loadingPage == true
                                ? const CupertinoActivityIndicator(
                                    color: Color(0xFF4D84BD),
                                  )
                                : const CustomTextWidget(
                                    text: "Delete",
                                    // fontWeight: FontWeight.bold,
                                    color: Color(0xFF4D84BD),
                                  ),
                            onPressed: () async {
                              bool result = await dashBoardController
                                  .deleteaccount(context);
                              if (result == true) {
                                // settingsController.image = null;

                                SecureStorage.clearSecureStoragevalue('token');
                                SecureStorage.clearSecureStoragevalue(
                                    'username');
                                SecureStorage.clearSecureStoragevalue('iin');
                                Provider.of<BiometricLogin>(context,
                                        listen: false)
                                    .changeButtonEnabled(false);
                                Provider.of<GoldController>(context,
                                        listen: false)
                                    .formattedValue = '';
                                Provider.of<DashBoardController>(context,
                                        listen: false)
                                    .currentIndex = 2;
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const BoardingViewScreen(),
                                  ),
                                  (route) => false,
                                );
                                Provider.of<AuthController>(context,
                                        listen: false)
                                    .clearTheControllerValue();
                                showFlushbar(
                                  context,
                                  "Account deleted successfully",
                                );
                              }
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
