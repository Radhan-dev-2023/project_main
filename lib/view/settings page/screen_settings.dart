import 'package:finfresh_mobile/view/ach%20history/screen_ach_history.dart';
import 'package:finfresh_mobile/view/ach%20registrarion/ach_registeration.dart';
import 'package:finfresh_mobile/view/add%20additional%20bank/screen_add_additional_bank.dart';
import 'package:finfresh_mobile/view/homeScreen/screen_home_view_screen.dart';
import 'package:finfresh_mobile/view/listing%20of%20banks/screen_listing_of_banks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenHomeView(),
                ),
              );
            }
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text('Setings'),
      ),
      body: Container(
        margin: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'ACH Mandate Registration',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScreenAchRegistration(),
                    ));
              },
            ),
            ListTile(
              title: Text(
                'Banks',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScreenListingOfBanks(),
                    ));
              },
            ),
            ListTile(
              title: Text(
                'ACH History',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScreenAchHistory(),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
