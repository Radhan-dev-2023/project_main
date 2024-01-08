import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenBoarding extends StatelessWidget {
  final List<String> headingsOfOnboarding;
  final List<String> condent;
  final int index;
  const ScreenBoarding(
      {super.key,
      required this.headingsOfOnboarding,
      required this.index,
      required this.condent});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            brightness == Brightness.dark
                ? Container(
                    height: 50.h,
                    width: 80.w,
                    decoration: const BoxDecoration(
                        // image: DecorationImage(
                        //   opacity: 0.9,
                        //   image: AssetImage(
                        //     'assets/images/515319-PIRK7R-406.jpg',
                        //   ),
                        //   fit: BoxFit.cover,
                        // ),
                        ),
                    child: const FlutterLogo(),
                  )
                : Container(
                    height: 50.h,
                    width: 80.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        opacity: 0.9,
                        image: AssetImage(
                          'assets/images/515319-PIRK7R-406.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // child: const FlutterLogo(),
                  ),
            // SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalSpacer(3.h),
                  Center(
                    child: Text(
                      headingsOfOnboarding[index],
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  VerticalSpacer(2.h),
                  Center(
                    child: Text(
                      condent[index], textAlign: TextAlign.center,
                      // '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book''',
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
