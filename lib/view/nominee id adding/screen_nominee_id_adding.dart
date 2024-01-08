import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NomineeIdAdding extends StatelessWidget {
  const NomineeIdAdding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpacer(2.h),
              Text(
                "Enter nominee's Aadhaar number",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 19.sp, fontWeight: FontWeight.w700),
              ),
              VerticalSpacer(2.h),
              const Text(
                  "We only need your nominee's Aadhaar number Documents are no required"),
              VerticalSpacer(2.h),
              TextFormField(
                style: Theme.of(context).textTheme.labelLarge!,
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'field is required';
                //   }
                //   return null;
                // },
                decoration: InputDecoration(
                  // fillColor: const Color(0xFF0E1330),
                  // filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Starting typing here",
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonWidget(
        onTap: () {},
        btName: 'Confirm identity proof'.toUpperCase(),
      ),
    );
  }
}
