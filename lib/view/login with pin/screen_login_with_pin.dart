import 'package:finfresh_mobile/controller/login%20pin%20controller/login_pin_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/view/homeScreen/screen_home_view_screen.dart';
import 'package:finfresh_mobile/view/sign%20in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PinEnterForLoginScreen extends StatefulWidget {
  const PinEnterForLoginScreen({super.key});

  @override
  State<PinEnterForLoginScreen> createState() => _PinEnterForLoginScreenState();
}

class _PinEnterForLoginScreenState extends State<PinEnterForLoginScreen> {
  Future<void> functionForFingerprin() async {
    final biometricLoginController =
        Provider.of<BiometricLogin>(context, listen: false);

    await biometricLoginController.authenticate();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    functionForFingerprin();
  }

  @override
  Widget build(BuildContext context) {
    String pin = '';
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    final biometricLoginController = Provider.of<BiometricLogin>(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // showFingerprintBottomSheet(context);
      // await biometricLoginController.authenticate();
      pin = await biometricLoginController.getpin();
    });

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
    biometricLoginController.addListener(() {
      if (biometricLoginController.loginSuccess) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const ScreenHomeView(),
          ),
          (route) => false,
        );
      }
    });
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(15.sp),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(
              //   'Hi,Edward P',
              //   // style: AppStyle.headingStyle.copyWith(fontSize: 18.sp),
              // ),
              VerticalSpacer(1.h),
              const Text(
                'Enter your Finfresh PIN',
                // style: TextStyle(color: Colors.grey),
              ),
              VerticalSpacer(5.h),
              Pinput(
                validator: (value) {
                  logger.d('pin===$pin');
                  if (value == pin) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScreenHomeView(),
                      ),
                      (route) => false,
                    );
                  } else {
                    biometricLoginController.changeButtonEnabled(true);
                    return '';
                  }
                  if (value?.length != 4 || value == null) {
                    // otpPinput.clear();
                    return 'Wrong PIN';
                  } else {
                    return null;
                  }
                },
                // controller: otpPinput,
                length: 4,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                errorPinTheme: errorPinTheme,
              ),
              biometricLoginController.buttonEnabled == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Incorrect PIN',
                          style: TextStyle(color: Colors.red),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ScreenSignin(),
                              ),
                            );
                          },
                          child: Text(
                            'Reset Pin?',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        HorizontalSpacer(12.w)
                      ],
                    )
                  : const SizedBox(),
              VerticalSpacer(10.h),
              TextButton(
                onPressed: () async {
                  // showFingerprintBottomSheet(context);
                  await biometricLoginController.authenticate();
                },
                child: Text(
                  'Use fingerprint',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> showFingerprintBottomSheet(BuildContext context) async {
  await showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Login using fingerprint',
              style: TextStyle(fontSize: 18.0),
            ),
            VerticalSpacer(3.h),
            SizedBox(
              height: 18.0,
              child: Icon(
                Icons.fingerprint,
                size: 25.sp,
              ),
            ),
            VerticalSpacer(3.h),
            const Text(
              'Scan your fringerprint',
              style: TextStyle(color: Colors.grey),
            ),
            VerticalSpacer(4.h),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Enter the Finfresh pin',
                // style: AppStyle.headingStyle,
              ),
            ),
          ],
        ),
      );
    },
  );
}
