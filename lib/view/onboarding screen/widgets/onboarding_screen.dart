import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenBoarding extends StatelessWidget {
  final List<String> headingsOfOnboarding;
  final List<String> condent;
  final int index;
  final List<String> imagelist;
  const ScreenBoarding({
    super.key,
    required this.headingsOfOnboarding,
    required this.index,
    required this.condent,
    required this.imagelist,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 45.h,
              width: 80.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  opacity: 0.9,
                  image: AssetImage(
                    imagelist[index],
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
                  VerticalSpacer(2.h),
                  Center(
                    child: Text(
                      headingsOfOnboarding[index],
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  VerticalSpacer(.5.h),
                  Center(
                    child: Text(
                      'BACKED BY NSEMF , HDFC ',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            fontSize: 14.sp,
                          ),
                      textAlign: TextAlign.center,
                      // '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book''',
                    ),
                  ),
                  VerticalSpacer(1.5.h),
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
