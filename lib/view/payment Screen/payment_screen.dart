import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenPayment extends StatefulWidget {
  const ScreenPayment({super.key});

  @override
  State<ScreenPayment> createState() => _ScreenPaymentState();
}

class _ScreenPaymentState extends State<ScreenPayment> {
  final List<String> items = ['UPI', 'Internet Banking', 'One Time Mandate'];
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          margin: EdgeInsets.all(15.sp),
          child: SizedBox(
            height: 45.h,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(15.sp),
                child: Column(
                  children: [
                    TextFormField(
                      // readOnly: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      // controller: kycController.banknameController,
                      style: Theme.of(context).textTheme.labelLarge!,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'field is required';
                        }
                        // if (!RegExp(r'^[a-zA-Z0-9\s\-&.,]+$').hasMatch(value)) {
                        //   return 'Enter valid bank name';
                        // }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Enter Account Number',
                      ),
                    ),
                    VerticalSpacer(2.h),
                    DropdownButtonFormField<String>(
                      style: Theme.of(context).textTheme.labelLarge!,
                      value: selectedItem,
                      decoration:
                          const InputDecoration(hintText: 'Select Item'),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedItem = newValue;
                        });
                      },
                      items: items.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                          ),
                        );
                      }).toList(),
                    ),
                    VerticalSpacer(2.h),
                    selectedItem == 'UPI'
                        ? TextFormField(
                            // readOnly: true,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            // controller: kycController.banknameController,
                            style: Theme.of(context).textTheme.labelLarge!,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'field is required';
                              }
                              // if (!RegExp(r'^[a-zA-Z0-9\s\-&.,]+$').hasMatch(value)) {
                              //   return 'Enter valid bank name';
                              // }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Enter Upi Number',
                            ),
                          )
                        : const SizedBox(),
                    VerticalSpacer(2.h),
                    ButtonWidget(
                      btName: 'PAY NOW',
                      onTap: () {},
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
