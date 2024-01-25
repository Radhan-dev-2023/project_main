import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/kyc/adding%20nominee%20and%20guardian/adding_nominee_guardian.dart';
import 'package:finfresh_mobile/view/kyc/joint%20holders/joint%20holder%202/screen_jh2.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenJointHolders extends StatelessWidget {
  const ScreenJointHolders({super.key});

  @override
  Widget build(BuildContext context) {
    final kycController = Provider.of<KycController>(context);
    kycController.updatePagenumber('11');
    Brightness brightness = Theme.of(context).brightness;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            kycController.clearJH1value();
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
              key: kycController.jh1Formkey,
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
                    'Enter Joint Holder 1 details',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 19.sp, fontWeight: FontWeight.w700),
                  ),
                  VerticalSpacer(2.h),
                  TextFormField(
                    style: Theme.of(context).textTheme.labelLarge!,
                    controller: kycController.jh1nameController,
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
                    controller: kycController.jh1panController,
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
                    controller: kycController.jh1DOBController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (!RegExp(r'^\d{2}-[a-zA-Z]{3}-\d{4}$')
                          .hasMatch(value!)) {
                        return 'Please enter your Date of Birth(01-Jan-1950)';
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
                    controller: kycController.jh1phoneNumberCotroller,
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
                    controller: kycController.jh1emailController,
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
                        value: kycController.jh1MobileRelation,
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
                          kycController.updateJH1MobileRelationValue(value);
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
                        value: kycController.jh1emailRation,
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
                          kycController.updatejh1EmailRelationValue(value);
                        },
                      ),
                    ),
                  ),
                  VerticalSpacer(3.h),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Jh2Screen(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: brightness == Brightness.light
                              ? Colors.black
                              : Colors.white,
                          radius: 9,
                          child: Center(
                            child: Icon(
                              Icons.add,
                              size: 13,
                              color: brightness == Brightness.light
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                        HorizontalSpacer(3.w),
                        const Text('Add Another Joint Holder'),
                      ],
                    ),
                  ),
                  VerticalSpacer(15.h),
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
          if (kycController.jh1Formkey.currentState!.validate()) {
            kycController.addJointholder1();
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
