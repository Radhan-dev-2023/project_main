import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/kyc/parent%20details%20adding/adding_parent_details.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenAddress extends StatefulWidget {
  const ScreenAddress({super.key});

  @override
  State<ScreenAddress> createState() => _ScreenAddressState();
}

bool _isChecked = false;

class _ScreenAddressState extends State<ScreenAddress> {
  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    final kycController = Provider.of<KycController>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                VerticalSpacer(10.h),
                Text(
                  'Enter your address',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 19.sp, fontWeight: FontWeight.w700),
                ),
                VerticalSpacer(4.h),
                TextFormField(
                  style: Theme.of(context).textTheme.labelLarge!,
                  controller: kycController.address1Controller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'field is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      // filled: true,
                      // fillColor: const Color(0xFF0E1330),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Address 1'),
                ),
                VerticalSpacer(3.h),
                TextFormField(
                  controller: kycController.address2Controller,
                  style: Theme.of(context).textTheme.labelLarge!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'field is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      // filled: true,
                      // fillColor: const Color(0xFF0E1330),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Address 2'),
                ),
                VerticalSpacer(3.h),
                TextFormField(
                  controller: kycController.address3Controller,
                  style: Theme.of(context).textTheme.labelLarge!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'field is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      // filled: true,
                      // fillColor: const Color(0xFF0E1330),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Address 3'),
                ),
                VerticalSpacer(3.h),
                // Row(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [

                //     HorizontalSpacer(11.w),
                //   ],
                // ),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: TextFormField(
                    controller: kycController.cityController,
                    style: Theme.of(context).textTheme.labelLarge!,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'field is required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        // filled: true,
                        // fillColor: const Color(0xFF0E1330),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'City'),
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
                      value: kycController.stateValue,
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
                        kycController.updateStateValue(value);
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
                        controller: kycController.countryController,
                        style: Theme.of(context).textTheme.labelLarge!,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'field is required';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          // filled: true,
                          // fillColor: const Color(0xFF0E1330),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Country',
                        ),
                      ),
                    ),
                    HorizontalSpacer(5.w),
                    SizedBox(
                      height: 60,
                      width: 145,
                      child: TextFormField(
                        controller: kycController.pinCodeController,
                        style: Theme.of(context).textTheme.labelLarge!,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'field is required';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            // filled: true,
                            // fillColor: const Color(0xFF0E1330),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Pincode'),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Do you want to add office number'),
                    Checkbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      },
                    ),
                  ],
                ),
                _isChecked == false
                    ? const SizedBox()
                    : SizedBox(
                        child: Column(
                          children: [
                            TextFormField(
                              controller:
                                  kycController.residencenumberController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'Residence phone number',
                              ),
                            ),
                            VerticalSpacer(3.h),
                            TextFormField(
                              controller: kycController.officenumberController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'office phone number',
                              ),
                            ),
                            VerticalSpacer(3.h),
                            TextFormField(
                              controller: kycController.residencefaxController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'Residence Fax',
                              ),
                            ),
                            VerticalSpacer(3.h),
                            TextFormField(
                              controller: kycController.officefaxController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'Office fax',
                              ),
                            ),
                          ],
                        ),
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Do you want to add NRI address'),
                    TextButton(
                        onPressed: () {
                          showBottomSheet();
                        },
                        child: Text(
                          'Click',
                          style: Theme.of(context).textTheme.labelLarge!,
                        ))
                  ],
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenAddingParentDetails(),
            ),
          );
        },
        btName: 'Continue'.toUpperCase(),
      ),
    );
  }

  void showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'NRI adress 1',
                ),
              ),
              VerticalSpacer(3.h),
              TextFormField(
                // validator: (value) {
                //   if(value == null || value.isEmpty){
                //     return 'field is required';
                //   }
                //   return null;
                // },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'NRI adress 2',
                ),
              ),
              VerticalSpacer(3.h),
              TextFormField(
                // validator: (value) {
                //   if(value == null || value.isEmpty){
                //     return 'field is required';
                //   }
                //   return null;
                // },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'NRI adress 3',
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
                      //               validator: (value) {
                      //                 if(value == null || value.isEmpty){
                      // return 'field is required';
                      //                 }
                      //                 return null;
                      //               },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'NRI City'),
                    ),
                  ),
                  HorizontalSpacer(3.h),
                  SizedBox(
                    height: 60,
                    width: 130,
                    child: TextFormField(
                      // validator: (value) {
                      //   if(value == null || value.isEmpty){
                      //     return 'field is required';
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'NRI State'),
                    ),
                  ),
                ],
              ),
              VerticalSpacer(3.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 60,
                    width: 200,
                    child: TextFormField(
                      //               validator: (value) {
                      //                 if(value == null || value.isEmpty){
                      // return 'field is required';
                      //                 }
                      //                 return null;
                      //               },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'NRI Country'),
                    ),
                  ),
                  HorizontalSpacer(3.h),
                  SizedBox(
                    height: 60,
                    width: 130,
                    child: TextFormField(
                      // validator: (value) {
                      //   if(value == null || value.isEmpty){
                      //     return 'field is required';
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'NRI Pincode'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
