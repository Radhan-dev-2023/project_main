import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
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
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            kycController.clearJh2Value();
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
              key: kycController.jh2Formkey,
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
                  VerticalSpacer(5.h),
                  Text(
                    'Enter Joint Holder 2 details',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 19.sp, fontWeight: FontWeight.w700),
                  ),
                  VerticalSpacer(2.h),
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
                      hintText: 'Enter Name',
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
                      hintText: 'Enter PAN number',
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
                        return 'Please enter your Date of Birth(01-Jan-1950))';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Enter DOB(01-Jan-1950)',
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
                      hintText: 'Enter Phonenumber',
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
                      hintText: 'Enter Email',
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
            kycController.addJointholder1();
            Navigator.push(
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
