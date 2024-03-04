import 'package:finfresh_mobile/view/ach%20history/screen_ach_history.dart';
import 'package:finfresh_mobile/view/ach%20registrarion/ach_registeration.dart';
import 'package:finfresh_mobile/view/add%20additional%20bank/screen_add_additional_bank.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                'Add Additional Bank',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScreenAddAdditionalBank(),
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
