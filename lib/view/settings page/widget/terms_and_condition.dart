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
    return Card(
      elevation: 1,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 31.sp),
            child: const Divider(
              height: 1,
              color: Color.fromARGB(255, 219, 217, 217),
              thickness: 1,
            ),
          ),
          ListTile(
            leading: Container(
              height: 5.h,
              width: 10.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: Color(0xFF0E1330),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.5),
                child: Image.asset(
                  'assets/images/smartphone_4026359.png',
                  // color: platformBrightness == Brightness.light
                  //     ? Colors.black
                  //     : Colors.white,
                  color: Colors.white,
                  height: Adaptive.h(6),
                  width: Adaptive.w(6),
                ),
              ),
            ),
            title: Text(
              'Refund and Cancellation',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 3.sp,
                  ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 15.sp,
              color: Colors.grey,
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
                    builder: (context) =>
                        const ScreenWebview(url: 'https://finfresh.in/refund'),
                  ));
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 31.sp),
            child: const Divider(
              height: 1,
              color: Color.fromARGB(255, 219, 217, 217),
              thickness: 1,
            ),
          ),
          ListTile(
            leading: Container(
              height: 5.h,
              width: 10.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: Color(0xFF0E1330),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.5),
                child: Image.asset(
                  'assets/images/compliance_11494729.png',
                  // color: platformBrightness == Brightness.light
                  //     ? Colors.black
                  //     : Colors.white,
                  color: Colors.white,
                  height: Adaptive.h(6),
                  width: Adaptive.w(6),
                ),
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
                        url: 'https://finfresh.in/privacy-policy'),
                  ));
            },
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 15.sp,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 31.sp),
            child: const Divider(
              height: 1,
              color: Color.fromARGB(255, 219, 217, 217),
              thickness: 1,
            ),
          ),
          ListTile(
            leading: Container(
              height: 5.h,
              width: 10.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: Color(0xFF0E1330),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.5),
                child: Image.asset(
                  'assets/images/error_5709310.png',
                  // color: platformBrightness == Brightness.light
                  //     ? Colors.black
                  //     : Colors.white,
                  color: Colors.white,
                  height: Adaptive.h(6),
                  width: Adaptive.w(6),
                ),
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
                      url: 'https://finfresh.in/terms-of-use',
                    ),
                  ));
            },
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 15.sp,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 31.sp),
            child: const Divider(
              height: 1,
              color: Color.fromARGB(255, 219, 217, 217),
              thickness: 1,
            ),
          ),
          ListTile(
            leading: Container(
              height: 5.h,
              width: 10.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: Color(0xFF0E1330),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.5),
                child: Image.asset(
                  'assets/images/customer-service_10439779.png',
                  // color: platformBrightness == Brightness.light
                  //     ? Colors.black
                  //     : Colors.white,
                  color: Colors.white,
                  height: Adaptive.h(6),
                  width: Adaptive.w(6),
                ),
              ),
            ),
            title: Text(
              'Contact Us',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 3.sp,
                  ),
            ),
            subtitle: Text(
              'info@finfresh.in',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Colors.grey),
            ),
            onTap: () {},
            // trailing: Icon(
            //   Icons.arrow_forward_ios,
            //   size: 15.sp,
            //   color: Colors.grey,
            // ),
          ),
        ],
      ),
    );
  }
}
