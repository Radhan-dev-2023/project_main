import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/flushbar.dart';
import 'package:finfresh_mobile/view/kyc/Nominee%20adding/Nominee%202/screen_nominee_2.dart';
import 'package:finfresh_mobile/view/kyc/adding%20nominee%20and%20guardian/adding_nominee_guardian.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/log_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenAddingNominee extends StatefulWidget {
  const ScreenAddingNominee({super.key});

  @override
  State<ScreenAddingNominee> createState() => _ScreenAddingNomineeState();
}

class _ScreenAddingNomineeState extends State<ScreenAddingNominee> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<KycController>(context, listen: false).typevalue =
        'Select a type';
    Provider.of<KycController>(context, listen: false)
        .nominee1guardRelationvalue = "Select Guardian Relationship";
    Provider.of<KycController>(context, listen: false).updatePagenumber('14');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final kycController = Provider.of<KycController>(context);

    Brightness brightness = Theme.of(context).brightness;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            kycController.clearNom1vlaue();
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
                // VerticalSpacer(10.h),
                const LogoWidget(),
                VerticalSpacer(3.h),
                Text(
                  'Enter Nominee 1 Details',
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
                      value: kycController.typevalue,
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
                        kycController.updateTypeOfnominee(value);
                      },
                    ),
                  ),
                ),
                VerticalSpacer(3.h),
                TextFormField(
                  style: Theme.of(context).textTheme.labelLarge!,
                  controller: kycController.nominee1nameController,
                  decoration: InputDecoration(
                      // filled: true,
                      // fillColor: const Color(0xFF0E1330),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Enter Name"),
                ),
                VerticalSpacer(3.h),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: kycController.nominee1Percentage,
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
                      value: kycController.selectRelationValue,
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
                        kycController.updateRelation(value);
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
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            primaryTextTheme: TextTheme(
                                bodyMedium: TextStyle(fontSize: 15.sp),
                                bodyLarge: TextStyle(fontSize: 15.sp)),
                            colorScheme: const ColorScheme.light(
                              primary:
                                  Color(0xFF4D84BD), // header background color
                              onPrimary: Colors.white, // header text color
                              onSurface: Colors.black, // body text color
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                foregroundColor: const Color(
                                    0xFF4D84BD), // button text color
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (picked != null) {
                      String selectdate =
                          DateFormat('dd-MMM-yyyy').format(picked);
                      // log('selected date ===$selectdate');
                      kycController.nominee1DOBController.text = selectdate;
                    }
                  },
                  readOnly: true,
                  style: Theme.of(context).textTheme.labelLarge!,
                  controller: kycController.nominee1DOBController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (!RegExp(r'^\d{2}-[a-zA-Z]{3}-\d{4}$')
                        .hasMatch(value!)) {
                      return 'Please enter your Date of Birth(01-Jan-1950)';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    // filled: true,
                    // fillColor: const Color(0xFF0E1330),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Enter Date of Birth(01-Jan-1950)",
                  ),
                ),
                kycController.typevalue == 'Major'
                    ? const SizedBox()
                    : VerticalSpacer(3.h),
                kycController.typevalue == 'Major'
                    ? const SizedBox()
                    : TextFormField(
                        controller: kycController.nominee1gurdnameCotroller,
                        style: Theme.of(context).textTheme.labelLarge!,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "Enter Guardian name",
                        ),
                      ),
                kycController.typevalue == 'Major'
                    ? const SizedBox()
                    : VerticalSpacer(3.h),
                kycController.typevalue == 'Major'
                    ? const SizedBox()
                    : TextFormField(
                        controller: kycController.nominee1guardpanController,
                        style: Theme.of(context).textTheme.labelLarge!,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "Enter Guardian PAN number",
                        ),
                      ),
                kycController.typevalue == 'Major'
                    ? const SizedBox()
                    : VerticalSpacer(3.h),
                kycController.typevalue == 'Major'
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
                            value: kycController.nominee1guardRelationvalue,
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
                              kycController.updatenom1guardRelationValue(value);
                            },
                          ),
                        ),
                      ),
                VerticalSpacer(3.h),
                SizedBox(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: kycController.nominee1panCotroller,
                        style: Theme.of(context).textTheme.labelLarge!,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Enter nominee pan number(ABCDE1234F)',

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
                      // VerticalSpacer(3.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                              'Do you want to add address same as investor?'),
                          Checkbox(
                            activeColor: Colors.transparent,
                            checkColor: brightness == Brightness.light
                                ? Colors.black
                                : Colors.white,
                            value: kycController.isChecked,
                            onChanged: (bool? value) {
                              kycController.addAress(value!);
                            },
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: kycController.nominee1address1Controller,
                        style: Theme.of(context).textTheme.labelLarge!,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Enter Address 1'),
                      ),
                      VerticalSpacer(3.h),
                      TextFormField(
                        controller: kycController.nominee1address2Controller,
                        style: Theme.of(context).textTheme.labelLarge!,
                        decoration: InputDecoration(
                            // filled: true,
                            // fillColor: const Color(0xFF0E1330),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Enter Address 2'),
                      ),
                      VerticalSpacer(3.h),
                      TextFormField(
                        controller: kycController.nominee1address3Controller,
                        style: Theme.of(context).textTheme.labelLarge!,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Enter Address 3'),
                      ),
                      VerticalSpacer(3.h),
                      SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: TextFormField(
                          style: Theme.of(context).textTheme.labelLarge!,
                          controller: kycController.nominee1cityController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Enter City'),
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
                            value: kycController.nominee1stateValue,
                            isExpanded: true,
                            underline: Container(
                              height: 0,
                            ),
                            items: kycController.stateList.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(
                                  items,
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              kycController.updateNominee1StateValue(value);
                            },
                          ),
                        ),
                      ),
                      VerticalSpacer(3.h),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 60,
                            width: 200,
                            child: TextFormField(
                              controller:
                                  kycController.nominee1CountryController,
                              style: Theme.of(context).textTheme.labelLarge!,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'Enter Country',
                              ),
                            ),
                          ),
                          HorizontalSpacer(5.w),
                          SizedBox(
                            height: 60,
                            width: 37.w,
                            child: TextFormField(
                              style: Theme.of(context).textTheme.labelLarge!,
                              controller:
                                  kycController.nominee1pincodeController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: 'Enter Pincode',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                VerticalSpacer(3.h),
                kycController.countvalue == "1"
                    ? const SizedBox()
                    : InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ScreenNominee2(),
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
                            const Text('Add another nominee'),
                          ],
                        ),
                      ),
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
          // log('result is $result');
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
