import 'dart:developer';

import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/kyc/adding%20nominee%20and%20guardian/adding_nominee_guardian.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/log_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../utilities/constant/flushbar.dart';

class ScreenNominee3 extends StatefulWidget {
  const ScreenNominee3({super.key});

  @override
  State<ScreenNominee3> createState() => _ScreenNominee3State();
}

class _ScreenNominee3State extends State<ScreenNominee3> {
  @override
  void initState() {
    super.initState();
    Provider.of<KycController>(context, listen: false).updatePagenumber('16');
  }

  @override
  Widget build(BuildContext context) {
    final kycController = Provider.of<KycController>(context);

    Brightness brightness = Theme.of(context).brightness;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            kycController.clearnom3Value();
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: brightness == Brightness.dark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LogoWidget(),
                VerticalSpacer(3.h),
                Text(
                  'Enter Nominee 3 Details',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 19.sp, fontWeight: FontWeight.w700),
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
                      value: kycController.typevalueNominee3,
                      isExpanded: true,
                      underline: Container(
                        height: 0,
                      ),
                      items: kycController.typeList.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        kycController.updateTypeOfnominee3(value);
                      },
                    ),
                  ),
                ),
                VerticalSpacer(3.h),
                TextFormField(
                  controller: kycController.nominee3nameController,
                  style: Theme.of(context).textTheme.labelLarge!,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Enter Name"),
                ),
                VerticalSpacer(3.h),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: kycController.nominee3Percentage,
                  style: Theme.of(context).textTheme.labelLarge!,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Enter Percentage',
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
                      value: kycController.selectRelationValueNominne3,
                      isExpanded: true,
                      underline: Container(
                        height: 0,
                      ),
                      items: kycController.relation.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        kycController.updateRelationNominee3(value);
                      },
                    ),
                  ),
                ),
                VerticalSpacer(3.h),
                TextFormField(
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) {
                      String selectdate =
                          DateFormat('dd-MMM-yyyy').format(picked);
                      log('selected date ===$selectdate');
                      kycController.nominee3DOBController.text = selectdate;
                    }
                  },
                  readOnly: true,
                  controller: kycController.nominee3DOBController,
                  style: Theme.of(context).textTheme.labelLarge!,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (!RegExp(r'^\d{2}-[a-zA-Z]{3}-\d{4}$')
                        .hasMatch(value!)) {
                      return 'Please enter your Date of Birth(01-Jan-1950))';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    // filled: true,
                    // fillColor: const Color(0xFF0E1330),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Enter date of birth(01-Jan-1950)",
                  ),
                ),
                VerticalSpacer(3.h),
                TextFormField(
                  controller: kycController.nominee3panCotroller,
                  style: Theme.of(context).textTheme.labelLarge!,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Enter pan number(ABCDE1234F)',

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
                kycController.typevalueNominee3 == 'Major'
                    ? const SizedBox()
                    : VerticalSpacer(3.h),
                kycController.typevalueNominee3 == 'Major'
                    ? const SizedBox()
                    : TextFormField(
                        controller: kycController.nominee3gurdnameCotroller,
                        style: Theme.of(context).textTheme.labelLarge!,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "Enter guardian name",
                        ),
                      ),
                kycController.typevalueNominee3 == 'Major'
                    ? const SizedBox()
                    : VerticalSpacer(3.h),
                kycController.typevalueNominee3 == 'Major'
                    ? const SizedBox()
                    : TextFormField(
                        controller: kycController.nominee3guardpanController,
                        style: Theme.of(context).textTheme.labelLarge!,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "Enter Guardian PAN",
                        ),
                      ),
                kycController.typevalueNominee3 == 'Major'
                    ? const SizedBox()
                    : VerticalSpacer(3.h),
                kycController.typevalueNominee3 == 'Major'
                    ? const SizedBox()
                    : Container(
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
                            value: kycController.nominee3guardRelationvalue,
                            isExpanded: true,
                            underline: Container(
                              height: 0,
                            ),
                            items: kycController.guardianRelation
                                .map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(
                                  items,
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              kycController.updatenom3guardRelationValue(value);
                            },
                          ),
                        ),
                      ),
                VerticalSpacer(3.h),
                VerticalSpacer(20.h)
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonWidget(
        onTap: () {
          int sum = kycController.calculatePercentage();
          if (sum > 100) {
            showFlushbar(context, 'Percentage of holding is over 100%');
          } else {
            Provider.of<KycController>(context, listen: false).addNominee();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const AddingNomineeAndGuadianScreen(),
              ),
            );
          }
          // kycController.addingvaluetoModel();
          // bool result = await kycController.createCustomer(context);
          // if (result == true) {
          //   // ignore: use_build_context_synchronously
          //   Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const ScreenHomeView(),
          //     ),
          //     (route) => false,
          //   );
          // }
        },
        btName: 'Confirm '.toUpperCase(),
      ),
    );
  }
}
