import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/kyc/adding%20nominee%20and%20guardian/adding_nominee_guardian.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenGuardianAdding extends StatelessWidget {
  const ScreenGuardianAdding({super.key});

  @override
  Widget build(BuildContext context) {
    final kycController = Provider.of<KycController>(context);
    kycController.updatePagenumber('17');
    Brightness brightness = Theme.of(context).brightness;
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpacer(10.h),
                Text(
                  'Guardian details',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 19.sp, fontWeight: FontWeight.w700),
                ),
                VerticalSpacer(3.h),
                TextFormField(
                  style: Theme.of(context).textTheme.labelLarge!,
                  controller: kycController.guardnameCotroller,
                  decoration: InputDecoration(
                    // filled: true,
                    // fillColor: const Color(0xFF0E1330),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Guardian Name",
                  ),
                ),
                VerticalSpacer(3.h),
                TextFormField(
                  style: Theme.of(context).textTheme.labelLarge!,
                  controller: kycController.guardDOBController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (!RegExp(r'^\d{2}-[a-zA-Z]{3}-\d{4}$')
                        .hasMatch(value!)) {
                      return 'Invalid DOB format(DD-MMM-YYYY))';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    // filled: true,
                    // fillColor: const Color(0xFF0E1330),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Guardian date of birth(DD-MMM-YYYY)",
                  ),
                ),
                VerticalSpacer(3.h),
                TextFormField(
                  controller: kycController.guardpanController,
                  style: Theme.of(context).textTheme.labelLarge!,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Enter guardian pan number(ABCDE1234F)',

                    // labelText: 'Pan card number',
                  ),
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
                      value: kycController.mobileRation,
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
                        kycController.updateMobileRelationValue(value);
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
                      value: kycController.guardianrelationvalue,
                      isExpanded: true,
                      underline: Container(
                        height: 0,
                      ),
                      items: kycController.guardianRelation.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        kycController.updateguardRelationValue(value);
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
                      value: kycController.emailRation,
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
                        kycController.updateEmailRelationValue(value);
                      },
                    ),
                  ),
                ),
                VerticalSpacer(10.h),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonWidget(
        onTap: () {
          kycController.changeGuardianSelected(true);
          kycController.addGuardian();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const AddingNomineeAndGuadianScreen(),
            ),
          );
        },
        btName: 'Confirm '.toUpperCase(),
      ),
    );
  }
}
