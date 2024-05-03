import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/digi%20gold%20screen/gold%20buying%20screen/screen_gold_buying_selling.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenDigiGold extends StatelessWidget {
  const ScreenDigiGold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D5D5F),
      body: Container(
        margin: EdgeInsets.all(15.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                child: Image.asset('assets/images/goldwelcomimage.png'),
              ),
            ),
            VerticalSpacer(3.h),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Invest your ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23.sp,
                      letterSpacing: 4.sp,
                    ),
                  ),
                  TextSpan(
                    text: 'Gold ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23.sp,
                      letterSpacing: 4.sp,
                      color: const Color(0xFFF7BF05),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'for the future',
              style: TextStyle(
                letterSpacing: 4.sp,
                fontWeight: FontWeight.bold,
                fontSize: 23.sp,
                color: Colors.white,
              ),
            ),
            VerticalSpacer(7.h),
            InkWell(
              onTap: () {
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return AlertDialog(
                //       backgroundColor: Colors.white,
                //       surfaceTintColor: Colors.white,
                //       content: Column(
                //         mainAxisSize: MainAxisSize.min,
                //         children: <Widget>[
                //           Lottie.asset(
                //             'assets/lottie/Animation - 1714021791830.json', // Replace with your Lottie animation file
                //             width: 150,
                //             height: 150,
                //             fit: BoxFit.fill,
                //           ),
                //           VerticalSpacer(2.h),
                //           // SizedBox(height: ),
                //           Text(
                //             'We are working on it',
                //             style: TextStyle(
                //               color: Colors.black,
                //               fontSize: 18.sp,
                //               fontWeight: FontWeight.w500,
                //             ),
                //           ),
                //         ],
                //       ),
                //     );
                //   },
                // );

                // // Close the dialog after 2 seconds
                // Future.delayed(const Duration(seconds: 5), () {
                //   Navigator.of(context).pop();
                // });

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScreenGoldBuyingAndSelling(),
                    ));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.sp),
                    color: const Color(0xFFF7BF05)),
                height: Adaptive.h(6),
                width: Adaptive.w(50),
                child: const Center(
                  child: Text(
                    'Start',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFF2D5D5F)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
