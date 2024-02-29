import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:finfresh_mobile/view/kyc/nri%20address/nri_address_screen.dart';
import 'package:finfresh_mobile/view/kyc/parent%20details%20adding/adding_parent_details.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/log_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenAddress extends StatefulWidget {
  const ScreenAddress({super.key});

  @override
  State<ScreenAddress> createState() => _ScreenAddressState();
}

class _ScreenAddressState extends State<ScreenAddress> {
  @override
  void initState() {
    Provider.of<KycController>(context, listen: false).updatePagenumber('5');
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    final kycController = Provider.of<KycController>(context);

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            kycController.clearValueinAdress();
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
              key: kycController.addressFormkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LogoWidget(),
                  VerticalSpacer(5.h),
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Address 1';
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
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'field is required';
                    //   }
                    //   return null;
                    // },
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
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'field is required';
                    //   }
                    //   return null;
                    // },
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
                    width: double.infinity,
                    child: TextFormField(
                      controller: kycController.cityController,
                      style: Theme.of(context).textTheme.labelLarge!,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the city name';
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
                        // height: 60,
                        width: 50.w,
                        child: TextFormField(
                          controller: kycController.countryController,
                          style: Theme.of(context).textTheme.labelLarge!,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter the country name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            helperText: '',
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
                        // height: 60,
                        width: 37.w,
                        child: TextFormField(
                          controller: kycController.pinCodeController,
                          style: Theme.of(context).textTheme.labelLarge!,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              kycController.getStateAndDistrict(value, context);
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter the pincode';
                            }
                            if (!RegExp(r'^\d{6}$').hasMatch(value)) {
                              return 'Invalid Pincode';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              helperText: '',
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
                      const Text('Do you want to add phone number ?'),
                      Checkbox(
                        activeColor: Colors.transparent,
                        checkColor: brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                        value: kycController.isChecked,
                        onChanged: (bool? value) {
                          kycController.updateChecked(value!);
                        },
                      ),
                    ],
                  ),
                  kycController.isChecked == false
                      ? const SizedBox()
                      : SizedBox(
                          child: Column(
                            children: [
                              TextFormField(
                                style: Theme.of(context).textTheme.labelLarge!,
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
                                style: Theme.of(context).textTheme.labelLarge!,
                                controller:
                                    kycController.officenumberController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Office phone number',
                                ),
                              ),
                              VerticalSpacer(3.h),
                              TextFormField(
                                style: Theme.of(context).textTheme.labelLarge!,
                                controller:
                                    kycController.residencefaxController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Residence fax',
                                ),
                              ),
                              VerticalSpacer(3.h),
                              TextFormField(
                                style: Theme.of(context).textTheme.labelLarge!,
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
                      const Text('Do you want to add NRI address ?'),
                      TextButton(
                          onPressed: () {
                            if (kycController.addressFormkey.currentState!
                                .validate()) {
                              if (kycController.stateValue != "State") {
                                kycController.addAddress();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ScreenNriAdress(),
                                  ),
                                );
                              } else {
                                showSnackBar(context,
                                    'Enter the All The Mandatory Fields');
                              }
                            } else {
                              showAlertDialog(context);
                            }
                          },
                          child: Text(
                            'Yes',
                            style: Theme.of(context).textTheme.labelLarge!,
                          ))
                    ],
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
        onTap: () {
          if (kycController.addressFormkey.currentState!.validate()) {
            if (kycController.stateValue != "State") {
              kycController.addAddress();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenAddingParentDetails(),
                ),
              );
            } else {
              showSnackBar(context, 'Please select a state');
            }
          }
        },
        btName: 'Continue'.toUpperCase(),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    // Create the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        'Please fill the address details before adding NRI address',
        style: Theme.of(context)
            .textTheme
            .labelLarge!
            .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w500),
      ),
      content: VerticalSpacer(2.h),
      actions: [
        // You can add buttons to the alert dialog

        Container(
          height: 5.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            color: const Color(0xFF4D84BD),
          ),
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Close the dialog
            },
            child: const Text('OK', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );

    // Show the AlertDialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
