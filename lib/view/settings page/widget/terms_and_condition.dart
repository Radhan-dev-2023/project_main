import 'package:finfresh_mobile/view/webview/screen_webview.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({
    super.key,
    required this.platformBrightness,
  });

  final Brightness platformBrightness;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Padding(
        //   padding: EdgeInsets.only(left: 31.sp),
        //   child: const Divider(
        //     height: 1,
        //     color: Color.fromARGB(255, 219, 217, 217),
        //     thickness: 1,
        //   ),
        // ),
        ListTile(
          leading: Image.asset(
            'assets/images/settingsicon/Swap.png',
            color: platformBrightness == Brightness.light
                ? Colors.black
                : Colors.white,
            // color: Colors.white,
            height: Adaptive.h(4),
            width: Adaptive.w(6),
          ),
          title: Text(
            'Refund and Cancellation',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3.sp,
                ),
          ),
          // trailing: Icon(
          //   Icons.arrow_forward_ios,
          //   size: 15.sp,
          //   color: Colors.grey,
          // ),
          // subtitle: Text(
          //   '',
          //   style: Theme.of(context)
          //       .textTheme
          //       .labelLarge!
          //       .copyWith(color: Colors.grey),
          // ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenWebview(
                      url: 'https://www.finfresh.in/rcp.php'),
                ));
          },
        ),
        Padding(
          padding: EdgeInsets.only(left: 18.sp),
          child: const Divider(
            height: 1,
            color: Color.fromARGB(255, 219, 217, 217),
            thickness: 1,
          ),
        ),
        ListTile(
          leading: Padding(
            padding: const EdgeInsets.all(6.5),
            child: Image.asset(
              'assets/images/settingsicon/Info Square.png',
              color: platformBrightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
              // color: Colors.white,
              height: Adaptive.h(4),
              width: Adaptive.w(6),
            ),
          ),
          title: Text(
            'Privacy Policy',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3.sp,
                ),
          ),
          // subtitle: Text(
          //   '',
          //   style: Theme.of(context)
          //       .textTheme
          //       .labelLarge!
          //       .copyWith(color: Colors.grey),
          // ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenWebview(
                      url: 'https://www.finfresh.in/privacy_policy.php'),
                ));
          },
          // trailing: Icon(
          //   Icons.arrow_forward_ios,
          //   size: 15.sp,
          //   color: Colors.grey,
          // ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 18.sp),
          child: const Divider(
            height: 1,
            color: Color.fromARGB(255, 219, 217, 217),
            thickness: 1,
          ),
        ),
        ListTile(
          leading: Padding(
            padding: const EdgeInsets.all(6.5),
            child: Image.asset(
              'assets/images/settingsicon/Shield Done.png',
              color: platformBrightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
              // color: Colors.white,
              height: Adaptive.h(4),
              width: Adaptive.w(6),
            ),
          ),
          title: Text(
            'Terms and Condition',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3.sp,
                ),
          ),
          // subtitle: Text(
          //   '',
          //   style: Theme.of(context)
          //       .textTheme
          //       .labelLarge!
          //       .copyWith(color: Colors.grey),
          // ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenWebview(
                    url: 'https://www.finfresh.in/terms.php',
                  ),
                ));
          },
          // trailing: Icon(
          //   Icons.arrow_forward_ios,
          //   size: 15.sp,
          //   color: Colors.grey,
          // ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 18.sp),
          child: const Divider(
            height: 1,
            color: Color.fromARGB(255, 219, 217, 217),
            thickness: 1,
          ),
        ),
        ListTile(
          leading: Image.asset(
            'assets/images/settingsicon/Profile.png',
            color: platformBrightness == Brightness.light
                ? Colors.black
                : Colors.white,
            // color: Colors.white,
            height: Adaptive.h(4),
            width: Adaptive.w(6),
          ),
          title: Text(
            'Customer Support',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3.sp,
                ),
          ),
          // subtitle: Text(
          //   'info@finfresh.in',
          //   style: Theme.of(context)
          //       .textTheme
          //       .labelLarge!
          //       .copyWith(color: Colors.grey),
          // ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenWebview(
                    url: 'https://www.finfresh.in/#contact',
                  ),
                ));
          },
          // trailing: Icon(
          //   Icons.arrow_forward_ios,
          //   size: 15.sp,
          //   color: Colors.grey,
          // ),
        ),
      ],
    );
  }
}
