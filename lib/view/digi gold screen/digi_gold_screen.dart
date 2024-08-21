import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/digi%20gold%20screen/gold%20buying%20screen/screen_gold_buying_selling.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenDigiGold extends StatelessWidget {
  const ScreenDigiGold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF2D5D5F),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/goldimages/Rectangle 2772.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 9.h,
            child: Center(
              child: SizedBox(
                height: Adaptive.h(35),
                width: Adaptive.w(105),
                child: Image.asset(
                  'assets/images/goldimages/pngwing.com (34).png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          VerticalSpacer(3.h),
          Positioned(
            left: 9.h,
            bottom: 60.h,
            child: RichText(
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
          ),
          Positioned(
            left: 11.8.h,
            bottom: 55.h,
            child: Text(
              'for the future',
              style: TextStyle(
                letterSpacing: 4.sp,
                fontWeight: FontWeight.bold,
                fontSize: 23.sp,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: 11.5.h,
            bottom: 46.h,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScreenGoldBuyingAndSelling(),
                    ));
                // if (Provider.of<DashBoardController>(context, listen: false)
                //             .dashBoardModel
                //             ?.result
                //             ?.data
                //             ?.activationStatus
                //             ?.statusCode ==
                //         'S06' ||
                //     Provider.of<DashBoardController>(context, listen: false)
                //             .dashBoardModel
                //             ?.result
                //             ?.data
                //             ?.activationStatus
                //             ?.statusCode ==
                //         'S12') {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) =>
                //             const ScreenGoldBuyingAndSelling(),
                //       ));
                // } else {
                //   showFlushbar(context, 'Your Account Not Activated');
                // }
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.sp),
                    color: const Color(0xFFF7BF05)),
                height: Adaptive.h(6),
                width: Adaptive.w(50),
                child: Center(
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 17.sp),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
