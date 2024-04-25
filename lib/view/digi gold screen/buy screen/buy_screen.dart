import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenBuy extends StatelessWidget {
  const ScreenBuy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D5D5F),
      body: SingleChildScrollView(
        child: Column(
          children: [
            VerticalSpacer(20.h),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Buying from Finfresh \n 99.99% pure 24K gold',
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            VerticalSpacer(5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '₹ ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(
                  width: Adaptive.w(30),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.sp,
                        ),
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'field is required';
                    //   }
                    //   if (!RegExp(r"^[A-Za-z]{4}[a-zA-Z0-9]{7}$").hasMatch(value)) {
                    //     return 'Invalid IFSC code';
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '0',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            VerticalSpacer(5.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: Adaptive.h(5),
                    width: Adaptive.w(26),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.sp),
                        border: Border.all(color: Colors.white)),
                    child: const Center(
                      child: Text(
                        '201',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: Adaptive.h(5),
                    width: Adaptive.w(26),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.sp),
                        border: Border.all(color: Colors.white)),
                    child: const Center(
                      child: Text(
                        '501',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: Adaptive.h(5),
                    width: Adaptive.w(26),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.sp),
                        border: Border.all(color: Colors.white)),
                    child: const Center(
                      child: Text(
                        '1001',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            VerticalSpacer(5.h),
            const Text(
              'Price ₹ 7.56/mg (excl 3% GST)',
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            VerticalSpacer(15.h),
            InkWell(
              onTap: () {},
              child: Container(
                height: Adaptive.h(5),
                width: Adaptive.w(25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.sp),
                    // color: Color(0xFF2D5D5F),
                    color: const Color(0xFFF7BF05)),
                child: const Center(
                  child: Text(
                    'Buy',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D5D5F),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
