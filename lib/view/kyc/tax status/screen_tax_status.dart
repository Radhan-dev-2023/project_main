import 'package:finfresh_mobile/controller/auth/auth_controller.dart';
import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/model/tax%20status%20model/tax_status_model.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:finfresh_mobile/view/homeScreen/screen_home_view_screen.dart';
import 'package:finfresh_mobile/view/kyc/occupation%20Screen/occupation_screen.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenTaxStatus extends StatefulWidget {
  const ScreenTaxStatus({super.key});

  @override
  State<ScreenTaxStatus> createState() => _ScreenTaxStatusState();
}

class _ScreenTaxStatusState extends State<ScreenTaxStatus> {
  @override
  void initState() {
    Provider.of<KycController>(context, listen: false).getTaxStatus();
    Provider.of<KycController>(context, listen: false).updatePagenumber('2');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;

    final authcontroller = Provider.of<AuthController>(context);

    return Consumer<KycController>(builder: (context, kycController, child) {
      return Scaffold(
        body: SafeArea(
          child: kycController.taxpageloading == true
              ? Center(
                  child: CupertinoActivityIndicator(
                      color: brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black),
                )
              : Container(
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VerticalSpacer(8.h),
                      const Center(
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: FlutterLogo(),
                        ),
                      ),
                      VerticalSpacer(8.h),
                      Text(
                        'Select A Tax Status',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 19.sp, fontWeight: FontWeight.w400),
                      ),
                      const VerticalSpacer(4),
                      VerticalSpacer(3.h),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black),
                          borderRadius: BorderRadius.circular(8),
                          color: brightness == Brightness.light
                              ? Colors.white
                              : const Color(0xFF0E1330),
                        ),
                        height: 60,
                        // width: 120,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton(
                            hint: const Text('Select Tax Status'),
                            value: kycController.taxStatusValue,
                            isExpanded: true,
                            underline: Container(
                              height: 0,
                            ),
                            items: kycController
                                .taxStatusService.taxMaster.masterDetails!
                                .map((MasterDetail masterDetail) {
                              return DropdownMenuItem(
                                value: masterDetail,
                                child: Text(
                                  masterDetail.taxStatusDesc.toString(),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              // taxStatus = value;
                              kycController.updateTaxValue(value);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: kycController.iinLoading == true
            ? const LoadingButton()
            : ButtonWidget(
                onTap: () async {
                  if (kycController.taxStatusValue == null) {
                    showSnackBar(context, 'Select a Tax Status');
                    return;
                  }
                  bool result = await kycController
                      .getInn(authcontroller.phonenumberController.text);
                  if (result == true) {
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const ScreenHomeView(),
                      ),
                    );
                  } else {
                    kycController.updatePagenumber('3');
                    kycController.addtaxstatus();
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ScreenOccupation(),
                      ),
                    );
                  }
                },
                btName: 'Proceed'.toUpperCase(),
              ),
      );
    });
  }
}
