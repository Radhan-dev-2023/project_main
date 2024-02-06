import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: 13.h,
          width: 50.w,
          child: const Image(
            image: AssetImage('assets/images/logosecond.png'),
          )),
    );
  }
}
