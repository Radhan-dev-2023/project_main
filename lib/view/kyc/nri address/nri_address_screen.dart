import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/kyc/parent%20details%20adding/adding_parent_details.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenNriAdress extends StatelessWidget {
  const ScreenNriAdress({super.key});

  @override
  Widget build(BuildContext context) {
    final kycController = Provider.of<KycController>(context);
    kycController.updatePagenumber('6');
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpacer(10.h),
                Text(
                  'Enter your NRI Address',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 19.sp, fontWeight: FontWeight.w700),
                ),
                VerticalSpacer(4.h),
                TextFormField(
                  style: Theme.of(context).textTheme.labelLarge!,
                  controller: kycController.nriaddress1Controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'NRI address 1',
                  ),
                ),
                VerticalSpacer(3.h),
                TextFormField(
                  style: Theme.of(context).textTheme.labelLarge!,
                  controller: kycController.nriaddress2Controller,
                  // validator: (value) {
                  //   if(value == null || value.isEmpty){
                  //     return 'field is required';
                  //   }
                  //   return null;
                  // },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'NRI address 2',
                  ),
                ),
                VerticalSpacer(3.h),
                TextFormField(
                  style: Theme.of(context).textTheme.labelLarge!,
                  controller: kycController.nriaddress3Controller,
                  // validator: (value) {
                  //   if(value == null || value.isEmpty){
                  //     return 'field is required';
                  //   }
                  //   return null;
                  // },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'NRI address 3',
                  ),
                ),
                VerticalSpacer(3.h),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 50.w,
                      child: TextFormField(
                        style: Theme.of(context).textTheme.labelLarge!,
                        controller: kycController.nricityController,
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
                    HorizontalSpacer(2.h),
                    SizedBox(
                      width: 38.w,
                      child: TextFormField(
                        style: Theme.of(context).textTheme.labelLarge!,
                        controller: kycController.nriStateController,
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
                      width: 50.w,
                      child: TextFormField(
                        style: Theme.of(context).textTheme.labelLarge!,
                        controller: kycController.nriCountryController,
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
                    HorizontalSpacer(2.h),
                    SizedBox(
                      width: 38.w,
                      child: TextFormField(
                        style: Theme.of(context).textTheme.labelLarge!,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: kycController.nriPincodeController,
                        validator: (value) {
                          if (!RegExp(r'^\d{6}$').hasMatch(value!)) {
                            return 'Invalid Pincode';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'NRI Pincode'),
                      ),
                    ),
                  ],
                ),
                VerticalSpacer(15.h),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonWidget(
        onTap: () {
          kycController.addnriAccount();
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
}
