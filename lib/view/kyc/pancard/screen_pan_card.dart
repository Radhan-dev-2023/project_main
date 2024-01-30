import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/kyc/tax%20status/screen_tax_status.dart';
import 'package:finfresh_mobile/view/kyc/user%20personal%20details/screen_personal_details.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenPanCard extends StatelessWidget {
  const ScreenPanCard({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<KycController>(context, listen: false).updatePagenumber('1');
    return Consumer<KycController>(builder: (context, kycController, child) {
      return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              kycController.panController.clear();
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(15.sp),
            child: Form(
              key: kycController.panformKey,
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
                    'Enter your PAN',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 19.sp, fontWeight: FontWeight.w400),
                  ),
                  VerticalSpacer(2.h),
                  Text(
                    'PAN is compulsory for investing in India.',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: Colors.grey, fontSize: 15.sp),
                  ),
                  VerticalSpacer(6.h),
                  TextFormField(
                    controller: kycController.panController,
                    style: Theme.of(context).textTheme.labelLarge!,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      // fillColor: const Color(0xFF0E1330),
                      // filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'ABCDE1234F',

                      // labelText: 'Pan card number',
                    ),
                    //   inputFormatters: [
                    //   LengthLimitingTextInputFormatter(5), // Limit to 5 characters
                    //   FilteringTextInputFormatter.allow(RegExp(r'^[A-Z]*$')), // Allow only uppercase letters
                    // ],
                    // keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter PAN Card Number';
                      } else if (!RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]$')
                          .hasMatch(value)) {
                        return 'Invalid PAN format';
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
          onTap: () async {
            if (kycController.panformKey.currentState!.validate()) {
              kycController.addpancardnumber();
              // kycController.updatePagenumber('2');
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ScreenPersonalDetails();
              }));
              // bool result = await kycController

              //     .getInn(authcontroller.phonenumberController.text);
              // if (result) {
              //   // ignore: use_build_context_synchronously
              //   Navigator.of(context).push(
              //     MaterialPageRoute(
              //       builder: (context) => const ScreenHomeView(),
              //     ),
              //   );
              // } else {
              //   // ignore: use_build_context_synchronously
              //   Navigator.of(context).push(
              //     MaterialPageRoute(
              //       builder: (context) => const ScreenOccupation(),
              //     ),
              //   );
              // }
            }
          },
          btName: 'Continue'.toUpperCase(),
        ),
      );
    });
  }
}
