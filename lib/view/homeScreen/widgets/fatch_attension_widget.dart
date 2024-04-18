import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../fatcha registration/fatcha_registeration.dart';

class FatchaAttension extends StatelessWidget {
  const FatchaAttension({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        // color: Color(0xFFFD7E14),
        elevation: 5,
        child: Column(
          children: [
            VerticalSpacer(1.h),
            ListTile(
              contentPadding: EdgeInsets.only(
                left: 9.sp,
                right: 15.sp,
              ),
              title: Text(
                'Attention required!',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 17.5.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3.5.sp,
                      // color: Color(0xFFACB2BA),
                    ),
              ),
              subtitle: Text(
                'Complete FATCA Registration',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.grey,
                    ),
              ),
              leading: const SizedBox(),
              trailing: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScreenFatchaRegistration(),
                      ));
                },
                child: SizedBox(
                  width: Adaptive.w(23),
                  height: Adaptive.h(5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      color: const Color(0xFF6C8FF8),
                    ),
                    child: Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            VerticalSpacer(1.h),
          ],
        ),
      ),
    );
  }
}
