import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/view/kyc/address/address_screen.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenPersonalDetails extends StatelessWidget {
  const ScreenPersonalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final kycController = Provider.of<KycController>(context, listen: false);
    kycController.updatePagenumber('4');
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15.sp),
            child: Form(
              key: kycController.investornameFormkey,
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
                      // prefix: const Text('+91'),
                      hintText: 'Enter Your name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'field is required';
                      }
                      if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                        return 'Enter valid name';
                      }
                      return null;
                    },
                  ),
                  VerticalSpacer(3.h),
                  TextFormField(
                    style: Theme.of(context).textTheme.labelLarge!,
                    // maxLength: 10,
                    controller: kycController.dobController,
                    validator: (value) {
                      if (!RegExp(r'^\d{2}-[a-zA-Z]{3}-\d{4}$')
                          .hasMatch(value!)) {
                        return 'Invalid DOB format(01-Jan-1950))';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      // prefix: const Text('+91'),
                      hintText: 'Enter Your DOB(01-Jan-1950)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                    ),
                  ),
                  VerticalSpacer(30.h),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonWidget(
        btName: 'Continue'.toUpperCase(),
        onTap: () {
          if (kycController.investornameFormkey.currentState!.validate()) {
            SecureStorage.addToken(
                'username', kycController.nameController.text);
            kycController.addnameAndDOB();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ScreenAddress(),
              ),
            );
          }
        },
      ),
    );
  }
}
