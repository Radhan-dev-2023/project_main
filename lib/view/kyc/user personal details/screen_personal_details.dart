import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/kyc/address/address_screen.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenPersonalDetails extends StatelessWidget {
  const ScreenPersonalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final kycController = Provider.of<KycController>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15.sp),
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
                  'Enter your personal details',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 19.sp, fontWeight: FontWeight.w400),
                ),
                VerticalSpacer(5.h),
                TextFormField(
                  style: Theme.of(context).textTheme.labelLarge!,
                  // maxLength: 10,
                  controller: kycController.nameController,

                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    fillColor: const Color(0xFF0E1330),
                    filled: true,
                    // prefix: const Text('+91'),
                    hintText: 'Enter Your name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }

                    return null;
                  },
                ),
                VerticalSpacer(5.h),
                TextFormField(
                  style: Theme.of(context).textTheme.labelLarge!,
                  // maxLength: 10,
                  controller: kycController.dobController,

                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    fillColor: const Color(0xFF0E1330),
                    filled: true,
                    // prefix: const Text('+91'),
                    hintText: 'Enter Your DOB',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your DOB';
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
        btName: 'Continue'.toUpperCase(),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenAddress(),
            ),
          );
        },
      ),
    );
  }
}
