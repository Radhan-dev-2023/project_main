import 'package:finfresh_mobile/view/ach%20history/screen_ach_history.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Registrationwidget extends StatelessWidget {
  const Registrationwidget({
    super.key,
    required this.platformBrightness,
  });

  final Brightness platformBrightness;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ListTile(
        //   leading: Image.asset(
        //     'assets/images/settingsicon/ph_note-light.png',
        //     color: platformBrightness == Brightness.light
        //         ? Colors.black
        //         : Colors.white,
        //     height: Adaptive.h(4),
        //     width: Adaptive.w(6),
        //   ),
        //   // title: Text(
        //   //   'FATCA',
        //   //   style: Theme.of(context).textTheme.labelLarge!.copyWith(
        //   //         fontSize: 17.sp,
        //   //         fontWeight: FontWeight.w400,
        //   //         letterSpacing: 3.sp,
        //   //       ),
        //   // ),
        //   title: Text(
        //     'FATCA Registration',
        //     style: Theme.of(context).textTheme.labelLarge!.copyWith(
        //           fontSize: 17.sp,
        //           fontWeight: FontWeight.w400,
        //           letterSpacing: 3.sp,
        //         ),
        //   ),
        //   onTap: () {
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => const ScreenFatchaRegistration(),
        //         ));
        //   },
        //   // trailing: Icon(
        //   //   Icons.arrow_forward_ios,
        //   //   size: 15.sp,
        //   //   color: Colors.grey,
        //   // ),
        // ),
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
            'assets/images/settingsicon/pixelarticons_notes.png',
            color: platformBrightness == Brightness.light
                ? Colors.black
                : Colors.white,
            // color: Colors.white,
            height: Adaptive.h(4),
            width: Adaptive.w(6),
          ),
          title: Text(
            'Mandate',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3.sp,
                ),
          ),
          // title: Text(
          //   'ACH History',
          //   style: Theme.of(context)
          //       .textTheme
          //       .labelLarge!
          //       .copyWith(color: Colors.grey),
          // ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenAchHistory(),
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
