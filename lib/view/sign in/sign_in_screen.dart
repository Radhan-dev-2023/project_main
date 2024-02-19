import 'package:finfresh_mobile/controller/auth/auth_controller.dart';
import 'package:finfresh_mobile/controller/login%20pin%20controller/login_pin_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/onboarding%20screen/on_boarding_view_screen.dart';
import 'package:finfresh_mobile/view/otp%20screen/screen_otp.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/log_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenSignin extends StatelessWidget {
  const ScreenSignin({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    final authController = Provider.of<AuthController>(context);
    final biometricLoginController = Provider.of<BiometricLogin>(context);

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        authController.phonenumberControllerforlogin.clear();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color:
                  brightness == Brightness.dark ? Colors.white : Colors.black,
            ),
            onPressed: () {
              authController.phonenumberControllerforlogin.clear();
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BoardingViewScreen(),
                  ),
                );
              }
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(15.sp),
              child: Form(
                key: authController.formKeyforlogin,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LogoWidget(),
                    VerticalSpacer(7.h),
                    Text(
                      biometricLoginController.buttonEnabled == true
                          ? 'Enter phone number for reset PIN'
                          : 'Enter phone number',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 19.sp, fontWeight: FontWeight.w400),
                    ),
                    VerticalSpacer(2.h),
                    Text(
                      'A verification code will be sent to this number',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: Colors.grey, fontSize: 15.sp),
                    ),
                    VerticalSpacer(2.h),
                    TextFormField(
                      style: Theme.of(context).textTheme.labelLarge!,
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      controller: authController.phonenumberControllerforlogin,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        // fillColor: const Color(0xFF0E1330),
                        // filled: true,
                        prefix: const Text('+91'),
                        hintText: 'Enter Phone Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a phone number';
                        }

                        if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                          return 'Please enter a valid 10-digit phone number';
                        }
                        return null;
                      },
                    ),
                    VerticalSpacer(20.h),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: authController.loginClicked == true
            ? const LoadingButton()
            : ButtonWidget(
                onTap: () async {
                  if (authController.formKeyforlogin.currentState!.validate()) {
                    bool result = await authController.generateOtp(context);
                    if (result == true) {
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ScreenOtp(title: 'login'),
                        ),
                      );
                    }
                  }
                },
                btName: 'Login'.toUpperCase(),
              ),
      ),
    );
  }
}
