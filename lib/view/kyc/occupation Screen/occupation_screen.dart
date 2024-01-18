import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/kyc/user%20personal%20details/screen_personal_details.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenOccupation extends StatelessWidget {
  const ScreenOccupation({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<KycController>(context, listen: false).updatePagenumber('3');
    Brightness brightness = Theme.of(context).brightness;
    return Consumer<KycController>(builder: (context, kycController, child) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(18.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpacer(15.h),
                const Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: FlutterLogo(),
                  ),
                ),
                VerticalSpacer(8.h),
                Text(
                  'Occupation',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                VerticalSpacer(2.h),
                Text(
                  'Select one of the option',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Colors.grey, fontSize: 15.sp),
                ),
                VerticalSpacer(5.h),
                Center(
                  child: Wrap(
                    spacing: 18.0.sp,
                    runSpacing: 10.0,
                    children: List<Widget>.generate(
                      kycController.options.length,
                      (int index) {
                        return ChoiceChip(
                          backgroundColor: brightness == Brightness.dark
                              ? const Color(0xFF0E1330)
                              : const Color.fromARGB(255, 240, 233, 233),
                          showCheckmark: false,
                          label: Text(kycController.options[index]),
                          selected: kycController.selectedIndex == index,
                          onSelected: (bool selected) {
                            kycController.selectedIndex =
                                selected ? index : null;
                            kycController.setselectedIndex(index);
                            kycController.selectedValue =
                                kycController.options[index];
                          },
                        );
                      },
                    ).toList(),
                  ),
                ),
                VerticalSpacer(15.h),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: ButtonWidget(
          onTap: () {
            kycController.addOcupation();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ScreenPersonalDetails(),
              ),
            );
          },
          btName: 'Continue'.toUpperCase(),
        ),
      );
    });
  }
}
