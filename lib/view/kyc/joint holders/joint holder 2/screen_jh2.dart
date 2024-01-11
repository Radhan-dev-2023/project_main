import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/kyc/Nominee%20adding/nominee%20type/screen_nominee_count.dart';
import 'package:finfresh_mobile/view/kyc/adding%20nominee%20and%20guardian/adding_nominee_guardian.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Jh2Screen extends StatelessWidget {
  const Jh2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final kycController = Provider.of<KycController>(context);
    Brightness brightness = Theme.of(context).brightness;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15.sp),
            child: Form(
              key: kycController.jh2Formkey,
              child: Column(
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
                  // Text(
                  //   'Joint Holders',
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .bodyMedium!
                  //       .copyWith(fontSize: 19.sp, fontWeight: FontWeight.bold),
                  // ),
                  TextFormField(
                    style: Theme.of(context).textTheme.labelLarge!,
                    controller: kycController.jh2nameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value!)) {
                        return 'Enter valid name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Joint holder2 name',
                    ),
                  ),
                  VerticalSpacer(3.h),
                  TextFormField(
                    style: Theme.of(context).textTheme.labelLarge!,
                    controller: kycController.jh2panController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (!RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]$')
                          .hasMatch(value!)) {
                        return 'Invalid PAN format';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Joint holder2 PAN',
                    ),
                  ),
                  VerticalSpacer(3.h),
                  TextFormField(
                    style: Theme.of(context).textTheme.labelLarge!,
                    controller: kycController.jh2DOBController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (!RegExp(r'^\d{2}-[a-zA-Z]{3}-\d{4}$')
                          .hasMatch(value!)) {
                        return 'Invalid DOB format(01-Jan-1950))';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Joint holder2 DOB(01-Jan-1950)',
                    ),
                  ),
                  VerticalSpacer(3.h),
                  TextFormField(
                    style: Theme.of(context).textTheme.labelLarge!,
                    controller: kycController.jh2phoneNumberCotroller,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (!RegExp(r'^\d{10}$').hasMatch(value!)) {
                        return 'Please enter a valid 10-digit phone number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Joint holder2 Phonenumber',
                    ),
                  ),
                  VerticalSpacer(3.h),
                  TextFormField(
                    style: Theme.of(context).textTheme.labelLarge!,
                    controller: kycController.jh2emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!)) {
                        return 'Please enter a valid Email address';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Joint holder2 Email',
                    ),
                  ),
                  VerticalSpacer(3.h),

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black),
                      borderRadius: BorderRadius.circular(8),
                      color: brightness == Brightness.light
                          ? Colors.white
                          : const Color(0xFF0E1330),
                    ),
                    height: 60,
                    // width: 120,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton(
                        value: kycController.jh2MobileRelation,
                        isExpanded: true,
                        underline: Container(
                          height: 0,
                        ),
                        items: kycController.mobileRelation.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          kycController.updateJH2MobileRelationValue(value);
                        },
                      ),
                    ),
                  ),

                  VerticalSpacer(3.h),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black),
                      borderRadius: BorderRadius.circular(8),
                      color: brightness == Brightness.light
                          ? Colors.white
                          : const Color(0xFF0E1330),
                    ),
                    height: 60,
                    // width: 120,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton(
                        value: kycController.jh2emailRation,
                        isExpanded: true,
                        underline: Container(
                          height: 0,
                        ),
                        items: kycController.emailRelation.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          kycController.updatejh2EmailRelationValue(value);
                        },
                      ),
                    ),
                  ),
                  VerticalSpacer(3.h),
                  VerticalSpacer(10.h),
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
          if (kycController.jh2Formkey.currentState!.validate()) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const AddingNomineeAndGuadianScreen(),
              ),
            );
          }
        },
      ),
    );
  }
}
