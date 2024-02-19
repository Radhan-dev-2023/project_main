import 'package:finfresh_mobile/view/homeScreen/screen_home_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenCompletedScreen extends StatefulWidget {
  const ScreenCompletedScreen({super.key});

  @override
  State<ScreenCompletedScreen> createState() => _ScreenCompletedScreenState();
}

class _ScreenCompletedScreenState extends State<ScreenCompletedScreen> {
  @override
  void initState() {
    super.initState();
    navigateToDashBoard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/lottie/Animation - 1708335495029.json',
          width: 70.w,
          height: 30.h,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  void navigateToDashBoard() async {
    await Future.delayed(
      const Duration(seconds: 3),
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
