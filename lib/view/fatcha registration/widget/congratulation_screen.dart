import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../homeScreen/screen_home_view_screen.dart';

class CongratualtionScreen extends StatefulWidget {
  const CongratualtionScreen({super.key});

  @override
  State<CongratualtionScreen> createState() => _CongratualtionScreenState();
}

class _CongratualtionScreenState extends State<CongratualtionScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToDashBoard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15.sp),
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: Adaptive.h(35),
              child: Column(
                children: [
                  SizedBox(
                    child: Lottie.asset(
                      'assets/lottie/Animation - 1713331696928.json',
                      fit: BoxFit.fill,
                      height: Adaptive.h(24),
                    ),
                  ),
                  Text(
                    'Congratulation',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 19.5.sp,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  VerticalSpacer(1.h),
                  const Text(
                    'You Are Ready For Investment',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void navigateToDashBoard() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    // ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const ScreenHomeView(),
        ),
        (route) => false);
  }
}
