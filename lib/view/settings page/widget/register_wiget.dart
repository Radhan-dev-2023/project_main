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
      child: Column(
        children: [
          ListTile(
            leading: Image.asset(
              'assets/images/mandate.png',
              color: platformBrightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
              height: Adaptive.h(6),
              width: Adaptive.w(6),
            ),
            title: Text(
              'ACH Mandate',
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
                    builder: (context) =>
                        const ScreenAchRegistration(),
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
              'assets/images/bankdetails.png',
              color: platformBrightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
              height: Adaptive.h(6),
              width: Adaptive.w(6),
            ),
            title: Text(
              'Bank Details',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
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
                    builder: (context) =>
                        const ScreenListingOfBanks(),
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
              'assets/images/fatcharegistrario.png',
              color: platformBrightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
              height: Adaptive.h(6),
              width: Adaptive.w(6),
            ),
            title: Text(
              'FATCA',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
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
                    builder: (context) =>
                        const ScreenFatchaRegistration(),
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
              'assets/images/achhistory.png',
              color: platformBrightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
              height: Adaptive.h(6),
              width: Adaptive.w(6),
            ),
            title: Text(
              'ACH',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
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