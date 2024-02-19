import 'package:finfresh_mobile/controller/auth/auth_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/sign%20in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void showAlertDialog(BuildContext context) {
  final authcontroller = Provider.of<AuthController>(context, listen: false);
  // Create the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      'user already exists please sign in',
      style: Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w500),
    ),
    content: VerticalSpacer(2.h),
    actions: [
      // You can add buttons to the alert dialog
      Container(
        height: 6.h,
        width: 20.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color: const Color(0xFF4D84BD),
        ),
        child: Center(
          child: TextButton(
            onPressed: () {
              authcontroller.emailController.clear();
              authcontroller.phonenumberController.clear();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const ScreenSignin()),
                (route) => false,
              );
            },
            child: const Text(
              'Sign In',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    ],
  );

  // Show the AlertDialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
