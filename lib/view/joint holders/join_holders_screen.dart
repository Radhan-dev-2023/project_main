import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenJointHolders extends StatelessWidget {
  const ScreenJointHolders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15.sp),
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
              Card(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(children: [
                    VerticalSpacer(10.h),
                    const Text('Add Joint Holders'),
                    ButtonWidget(
                      btName: 'ADD',
                      onTap: () {
                        showBottomSheet(context);
                      },
                    )
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                    hintText: 'Joint holder name',
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
                    hintText: 'Joint holder PAN',
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
                    hintText: 'Joint holder DOB',
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
                    hintText: 'Joint holder Phonenumber',
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
                    hintText: 'Joint holder Email',
                  ),
                ),
                // Row(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     SizedBox(
                //       height: 60,
                //       width: 200,
                //       child: TextFormField(
                //         //               validator: (value) {
                //         //                 if(value == null || value.isEmpty){
                //         // return 'field is required';
                //         //                 }
                //         //                 return null;
                //         //               },
                //         decoration: InputDecoration(
                //             border: OutlineInputBorder(
                //                 borderRadius: BorderRadius.circular(10)),
                //             hintText: 'NRI City'),
                //       ),
                //     ),
                //     HorizontalSpacer(3.h),
                //     SizedBox(
                //       height: 60,
                //       width: 120,
                //       child: TextFormField(
                //         // validator: (value) {
                //         //   if(value == null || value.isEmpty){
                //         //     return 'field is required';
                //         //   }
                //         //   return null;
                //         // },
                //         decoration: InputDecoration(
                //             border: OutlineInputBorder(
                //                 borderRadius: BorderRadius.circular(10)),
                //             hintText: 'NRI State'),
                //       ),
                //     ),
                //   ],
                // ),
                // VerticalSpacer(3.h),
                // Row(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     SizedBox(
                //       height: 60,
                //       width: 200,
                //       child: TextFormField(
                //         //               validator: (value) {
                //         //                 if(value == null || value.isEmpty){
                //         // return 'field is required';
                //         //                 }
                //         //                 return null;
                //         //               },
                //         decoration: InputDecoration(
                //             border: OutlineInputBorder(
                //                 borderRadius: BorderRadius.circular(10)),
                //             hintText: 'NRI Country'),
                //       ),
                //     ),
                //     HorizontalSpacer(3.h),
                //     SizedBox(
                //       height: 60,
                //       width: 120,
                //       child: TextFormField(
                //         // validator: (value) {
                //         //   if(value == null || value.isEmpty){
                //         //     return 'field is required';
                //         //   }
                //         //   return null;
                //         // },
                //         decoration: InputDecoration(
                //             border: OutlineInputBorder(
                //                 borderRadius: BorderRadius.circular(10)),
                //             hintText: 'NRI Pincode'),
                //       ),
                //     ),
                //   ],
                // ),
                ButtonWidget(btName: 'ADD')
              ],
            ),
          ),
        );
      },
    );
  }
}
