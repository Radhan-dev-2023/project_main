import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/view/kyc/adding%20nominee%20and%20guardian/adding_nominee_guardian.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/log_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenMobileRelation extends StatefulWidget {
  const ScreenMobileRelation({super.key});

  @override
  State<ScreenMobileRelation> createState() => _ScreenMobileRelationState();
}

class _ScreenMobileRelationState extends State<ScreenMobileRelation> {
  String? phoneNumber;
  String? email;
  void function() async {
    phoneNumber = await SecureStorage.readToken('phoneNumber');
    email = await SecureStorage.readToken('email');

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    function();
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    return Consumer<KycController>(builder: (context, kycController, _) {
      return Scaffold(
        appBar: AppBar(),
        body: Container(
          margin: EdgeInsets.all(15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LogoWidget(),
              VerticalSpacer(7.h),
              Text(
                'To whom this phone number $phoneNumber belongs?',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16.sp,
                    ),
              ),
              VerticalSpacer(2.h),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black),
                  borderRadius: BorderRadius.circular(8),
                  // color: brightness == Brightness.light
                  //     ? Colors.white
                  //     : const Color(0xFF0E1330),
                ),
                height: 60,
                // width: 120,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    value: kycController.mobileRation,
                    isExpanded: true,
                    underline: Container(
                      height: 0,
                    ),
                    items: kycController.mobileRelation.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      kycController.updateMobileRelationValue(value);
                    },
                  ),
                ),
              ),
              VerticalSpacer(3.h),
              Text(
                'To whom this email ID  $email  belongs?',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16.sp,
                    ),
              ),
              VerticalSpacer(2.h),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black),
                  borderRadius: BorderRadius.circular(8),
                  // color: brightness == Brightness.light
                  //     ? Colors.white
                  //     : const Color(0xFF0E1330),
                ),
                height: 60,
                // width: 120,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    value: kycController.emailRation,
                    isExpanded: true,
                    underline: Container(
                      height: 0,
                    ),
                    items: kycController.emailRelation.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      kycController.updateEmailRelationValue(value);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: ButtonWidget(
          onTap: () {
            bool result = kycController.validateNumber(context);
            if (result == true) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddingNomineeAndGuadianScreen(),
                ),
              );
            }
          },
          btName: 'Confirm '.toUpperCase(),
        ),
      );
    });
  }
}
