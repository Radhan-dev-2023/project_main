import 'package:finfresh_mobile/view/ach%20history/screen_ach_history.dart';
import 'package:finfresh_mobile/view/ach%20registrarion/ach_registeration.dart';
import 'package:finfresh_mobile/view/fatcha%20registration/fatcha_registeration.dart';
import 'package:finfresh_mobile/view/listing%20of%20banks/screen_listing_of_banks.dart';
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
    return Card(
      elevation: 1,
      child: Column(
        children: [
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
                  'assets/images/mandate.png',
                  color: Colors.white,
                  height: Adaptive.h(4),
                  width: Adaptive.w(4),
                ),
              ),
            ),
            title: Text(
              'ACH Mandate',
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
            subtitle: Text(
              'ACH Mandate Registration',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Colors.grey),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenAchRegistration(),
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
                  'assets/images/bankdetails.png',
                  color: Colors.white,
                  height: Adaptive.h(5),
                  width: Adaptive.w(5),
                ),
              ),
            ),
            title: Text(
              'Bank Details',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 3.sp,
                  ),
            ),
            subtitle: Text(
              'Add Banks',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Colors.grey),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenListingOfBanks(),
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
                  'assets/images/fatcharegistrario.png',
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
              'FATCA',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 3.sp,
                  ),
            ),
            subtitle: Text(
              'FATCA Registration',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Colors.grey),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenFatchaRegistration(),
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
            leading: Padding(
              padding: const EdgeInsets.all(6.5),
              child: Container(
                height: 5.h,
                width: 10.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  color: Color(0xFF0E1330),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.5),
                  child: Image.asset(
                    'assets/images/achhistory.png',
                    // color: platformBrightness == Brightness.light
                    //     ? Colors.black
                    //     : Colors.white,
                    color: Colors.white,
                    height: Adaptive.h(6),
                    width: Adaptive.w(6),
                  ),
                ),
              ),
            ),
            title: Text(
              'ACH',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 3.sp,
                  ),
            ),
            subtitle: Text(
              'ACH History',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Colors.grey),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenAchHistory(),
                  ));
            },
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 15.sp,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
