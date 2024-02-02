import 'package:finfresh_mobile/controller/auth/auth_controller.dart';
import 'package:finfresh_mobile/controller/login%20pin%20controller/login_pin_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:finfresh_mobile/view/homeScreen/screen_home_view_screen.dart';
import 'package:finfresh_mobile/view/setting%20pin%20number/setting_pin.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenOtp extends StatelessWidget {
  final String title;
  const ScreenOtp({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    final authController = Provider.of<AuthController>(context, listen: false);
    final biometricLoginController = Provider.of<BiometricLogin>(context);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: brightness == Brightness.dark ? Colors.white : Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15.sp),
        color: brightness == Brightness.light
            ? Colors.white
            : const Color(0xFF0E1330),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      color: brightness == Brightness.light
          ? Colors.white
          : const Color(0xFF0E1330),
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: brightness == Brightness.light
            ? Colors.white
            : const Color(0xFF0E1330),
      ),
    );
    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
          // color: Colors.red,
          border: Border.all(color: Colors.red)),
    );
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            authController.otpController.clear();
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15.sp),
          child: Form(
            key: authController.formKeyForPinput,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                VerticalSpacer(5.h),
                const Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: FlutterLogo(),
                  ),
                ),
                VerticalSpacer(8.h),
                Text(
                  'Verification ',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                VerticalSpacer(2.h),
                Text(
                  'Enter the verification code sent to your number',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Colors.grey, fontSize: 15.sp),
                ),
                // VerticalSpacer(6.h),
                // SizedBox(
                //   child: Image.asset('assets/images/otp.jpg'),
                // ),
                VerticalSpacer(6.h),
                Center(
                  child: Pinput(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter the OTP';
                      }
                      if (value.length != 6) {
                        // otpPinput.clear();
                        return 'Incorrect OTP';
                      } else {
                        return null;
                      }
                    },
                    controller: authController.otpController,
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    errorPinTheme: errorPinTheme,
                    errorTextStyle:
                        TextStyle(color: Colors.red, fontSize: 15.sp),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: authController.otploading == true ||
              authController.otploadingforlogin == true
          ? const LoadingButton()
          : ButtonWidget(
              onTap: () async {
                if (authController.formKeyForPinput.currentState!.validate()) {
                  bool result = title == 'signup'
                      // ignore: use_build_context_synchronously
                      ? await authController.otpVerfy(context)
                      // ignore: use_build_context_synchronously
                      : await authController.otpVerifyForLogin(context);
                  logger.d('resultotp===$result');
                  if (result == true) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => title == 'signup' ||
                                biometricLoginController.buttonEnabled == true
                            ? const ScreenSetPinNumber()
                            : const ScreenHomeView(),
                      ),
                    );
                    authController.otpController.clear();
                  } else {
                    // ignore: use_build_context_synchronously
                    showSnackBar(context, 'Incorrect OTP');
                  }
                  logger.d('result===$result');

                  // Navigator.push
                  // Replacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const ScreenPassword(),
                  //   ),
                  // );
                }
                // } else if (authController.otpController.text.length < 4) {
                //   showSnackBar(context, 'Enter the OTP');
                // }
              },
              btName: 'Verify OTP'.toUpperCase(),
            ),
    );
  }
}
