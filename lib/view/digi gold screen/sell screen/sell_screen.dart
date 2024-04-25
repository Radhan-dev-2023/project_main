import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenSellGold extends StatelessWidget {
  const ScreenSellGold({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness platformBrightness = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      backgroundColor: const Color(0xFF2D5D5F),
      body: SingleChildScrollView(
        child: Column(
          children: [
            VerticalSpacer(20.h),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Selling from Finfresh \n 99.99% pure 24K gold',
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
                Container(
                  color: const Color(0xFF2D5D5F),
                  width: Adaptive.w(35),
                  child: TextFormField(
                    style: TextStyle(
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
                      filled: true,
                      fillColor: platformBrightness == Brightness.dark
                          ? const Color(0xFF2D5D5F)
                          : const Color(0xFF2D5D5F),
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
            const Text(
              'Price ₹ 7.56/mg (excl 3% GST)',
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            VerticalSpacer(25.h),
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
                    'Sell',
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
