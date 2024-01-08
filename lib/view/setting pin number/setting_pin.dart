import 'package:finfresh_mobile/controller/login%20pin%20controller/login_pin_controller.dart';
import 'package:finfresh_mobile/controller/pin%20controller/pin_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/setting%20pin%20number/confirm%20pin/screen_confirm_pin.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenSetPinNumber extends StatelessWidget {
  const ScreenSetPinNumber({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    final pinController = Provider.of<PinController>(context, listen: false);
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
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15.sp),
          child: Form(
            key: pinController.formKeyForPin,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpacer(8.h),
                const Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: FlutterLogo(),
                  ),
                ),
                VerticalSpacer(8.h),
                Text(
                  biometricLoginController.buttonEnabled == true
                      ? 'Reset Finfresh pin'
                      : 'Enter your Finfresh pin ',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                VerticalSpacer(1.h),
                const Text(
                  'Enter pin for confirmation',
                  style: TextStyle(color: Colors.grey),
                ),
                VerticalSpacer(3.h),
                Pinput(
                  validator: (value) {
                    if (value?.length != 4 || value == null) {
                      return 'please Enter the  4-digit pin';
                    } else {
                      return null;
                    }
                  },
                  controller: pinController.pinController,
                  length: 4,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  errorPinTheme: errorPinTheme,
                ),
                VerticalSpacer(10.h),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonWidget(
        btName: 'VERIFY',
        onTap: () {
          if (pinController.formKeyForPin.currentState!.validate()) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ScreenConfirmPinNumber(),
              ),
            );
          }
          // setState(() {
          //   clicked = !clicked;
          // }
        },
      ),
    );
  }
}

bool clicked = false;
