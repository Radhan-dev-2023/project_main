import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/controller/login%20pin%20controller/login_pin_controller.dart';
import 'package:finfresh_mobile/controller/pin%20controller/pin_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/view/homeScreen/screen_home_view_screen.dart';
import 'package:finfresh_mobile/view/kyc/pancard/screen_pan_card.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenConfirmPinNumber extends StatelessWidget {
  const ScreenConfirmPinNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final pinController = Provider.of<PinController>(context);
    final biometricLoginController = Provider.of<BiometricLogin>(context);
    Brightness brightness = MediaQuery.of(context).platformBrightness;
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
            pinController.confirmPinController.clear();
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15.sp),
          child: Form(
            key: pinController.formKeyForConfirmPin,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  'Confirm your Finfresh PIN',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                VerticalSpacer(1.h),
                const Text(
                  'Re-enter your Finfresh PIN for confirmation',
                  style: TextStyle(color: Colors.grey),
                ),
                VerticalSpacer(10.h),
                Center(
                  child: Pinput(
                    validator: (value) {
                      logger.d('valuee==$value');
                      if (value?.length != 4 || value == null) {
                        return 'please Enter the  4-digit ';
                      }
                      if (pinController.pinController.text !=
                          pinController.confirmPinController.text) {
                        logger.d(
                            'pinController.pinController.text==${pinController.pinController.text}');
                        return 'PIN does not match';
                      }
                      return null;
                    },
                    controller: pinController.confirmPinController,
                    length: 4,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    errorPinTheme: errorPinTheme,
                  ),
                ),
                VerticalSpacer(10.h),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonWidget(
        btName: 'CONFIRM PIN',
        onTap: () {
          if (pinController.formKeyForConfirmPin.currentState!.validate()) {
            pinController.setPin();
            Provider.of<KycController>(context, listen: false)
                .updatePagenumber('1');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    biometricLoginController.buttonEnabled == true
                        ? const ScreenHomeView()
                        : const ScreenPanCard(),
              ),
            );
          }
        },
      ),
    );
  }
}
