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
      child: Column(
        children: [
          // ListTile(
          //   leading: Icon(
          //     Icons.edit,
          //     size: Adaptive.h(2.5),
          //   ),
          //   // leading: Image.asset(
          //   //   'assets/images/mandate.png',
          //   //   color: platformBrightness == Brightness.light
          //   //       ? Colors.black
          //   //       : Colors.white,
          //   //   height: Adaptive.h(3),
          //   //   width: Adaptive.w(5),
          //   // ),
          //   title: Text(
          //     'Edit Profile',
          //     style: Theme.of(context).textTheme.labelLarge!.copyWith(
          //           fontSize: 18.sp,
          //           fontWeight: FontWeight.bold,
          //         ),
          //   ),
          //   trailing: Icon(
          //     Icons.arrow_forward_ios,
          //     size: 15.sp,
          //     color: Colors.grey,
          //   ),
          //   // subtitle: Text(
          //   //   '',
          //   //   style: Theme.of(context)
          //   //       .textTheme
          //   //       .labelLarge!
          //   //       .copyWith(color: Colors.grey),
          //   // ),
          //   onTap: () {},
          // ),
          Padding(
            padding: EdgeInsets.only(left: 31.sp),
            child: const Divider(
              height: 1,
              color: Color.fromARGB(255, 219, 217, 217),
              thickness: 1,
            ),
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/smartphone_4026359.png',
              color: platformBrightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
              height: Adaptive.h(6),
              width: Adaptive.w(6),
            ),
            title: Text(
              'Refund and Cancellation',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
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
            leading: Image.asset(
              'assets/images/compliance_11494729.png',
              color: platformBrightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
              height: Adaptive.h(6),
              width: Adaptive.w(6),
            ),
            title: Text(
              'Privacy Policy',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
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
            leading: Image.asset(
              'assets/images/error_5709310.png',
              color: platformBrightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
              height: Adaptive.h(6),
              width: Adaptive.w(6),
            ),
            title: Text(
              'Terms and Condition',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
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
            leading: Image.asset(
              'assets/images/customer-service_10439779.png',
              color: platformBrightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
              height: Adaptive.h(6),
              width: Adaptive.w(6),
            ),
            title: Text(
              'Contact Us',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
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
