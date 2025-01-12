import 'dart:developer';

import 'package:finfresh_mobile/controller/auth/auth_controller.dart';
import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/flushbar.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/view/otp%20screen/screen_otp.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/log_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenEnterPhoneNumber extends StatelessWidget {
  const ScreenEnterPhoneNumber({super.key});

  // bool iscliked = false;
  @override
  Widget build(BuildContext context) {
    final authcontroller = Provider.of<AuthController>(context);
    final kycController = Provider.of<KycController>(context);
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        authcontroller.phonenumberController.clear();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              authcontroller.phonenumberController.clear();
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(15.sp),
              child: Form(
                key: authcontroller.formKeyForPhone,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // VerticalSpacer(5.h),
                    const LogoWidget(),
                    VerticalSpacer(8.h),
                    Text(
                      'Enter phone number',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 19.sp, fontWeight: FontWeight.w400),
                    ),
                    VerticalSpacer(2.h),
                    Text(
                      'A verification code will be sent to this  number',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: Colors.grey, fontSize: 15.sp),
                    ),
                    VerticalSpacer(5.h),
                    TextFormField(
                      style: Theme.of(context).textTheme.labelLarge!,
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      controller: authcontroller.phonenumberController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        // fillColor: const Color(0xFF0E1330),
                        // filled: true,
                        prefix: const Text('+91 '),
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
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: const Color(0xFF4D84BD),
                          value: authcontroller.ischeked,
                          onChanged: (newValue) {
                            authcontroller.changeChecked(newValue!);
                          },
                        ),
                        const Text('Accept Terms And Condition')
                      ],
                    ),
                    VerticalSpacer(20.h),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: authcontroller.iscliked == true
            ? const LoadingButton()
            : ButtonWidget(
                onTap: () async {
                  kycController.phonenumber =
                      authcontroller.phonenumberController.text;
                  kycController.email = authcontroller.emailController.text;
                  log('phone numb ${kycController.phonenumber} ,emial=${kycController.email}');
                  if (authcontroller.formKeyForPhone.currentState!.validate()) {
                    if (authcontroller.ischeked == true) {
                      bool result = await authcontroller.userRegister(context);

                      if (result == true) {
                        authcontroller.addPhonenumber();
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const ScreenOtp(title: 'signup'),
                          ),
                        );
                      } else {
                        logger.d('Something went wrong');
                      }
                    } else {
                      showFlushbar(context,
                          "You must accept the terms and conditions to proceed.");
                    }
                  }
                },
                btName: 'Send OTP'.toUpperCase(),
              ),
      ),
    );
  }
}
