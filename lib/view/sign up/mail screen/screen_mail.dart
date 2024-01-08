import 'package:finfresh_mobile/controller/auth/auth_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/sign%20up/enter%20phone%20number/sign_in_screen.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenMail extends StatelessWidget {
  const ScreenMail({super.key});

  // TextEditingController phonenumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authcontroller = Provider.of<AuthController>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15.sp),
          child: Form(
            key: authcontroller.formKey,
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
                  'Enter your Email',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 19.sp, fontWeight: FontWeight.w400),
                ),
                VerticalSpacer(4.h),
                // Text(
                //   'A verifaction code will be sent to this  number',
                //   style: Theme.of(context)
                //       .textTheme
                //       .labelMedium!
                //       .copyWith(color: Colors.grey, fontSize: 15.sp),
                // ),
                // VerticalSpacer(2.h),
                TextFormField(
                  style: Theme.of(context).textTheme.labelLarge!,
                  // keyboardType: TextInputType.emailAddress,
                  controller: authcontroller.emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    // fillColor: Color(0xFF0E1330),
                    // filled: true,
                    // prefix: const Text('+91'),
                    hintText: 'Enter your Email',
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(10.sp),
                    // ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }

                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return 'Please enter a valid Email address';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonWidget(
        onTap: () {
          if (authcontroller.formKey.currentState!.validate()) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ScreenEnterPhoneNumber(),
              ),
            );
          }
        },
        btName: 'Next'.toUpperCase(),
      ),
    );
  }
}
