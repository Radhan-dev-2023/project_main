import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/model/holding%20nature%20model/holding_nature_model.dart';
import 'package:finfresh_mobile/model/tax%20status%20model/tax_status_model.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:finfresh_mobile/view/homeScreen/screen_home_view_screen.dart';
import 'package:finfresh_mobile/view/kyc/occupation%20Screen/occupation_screen.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/log_widget.dart';
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
    Provider.of<KycController>(context, listen: false).taxStatusValue = null;
    Provider.of<KycController>(context, listen: false).holdingValue = null;
    Provider.of<KycController>(context, listen: false)
        .callHodingAndTax(context);

    Provider.of<KycController>(context, listen: false).updatePagenumber('2');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;

    // final authcontroller = Provider.of<AuthController>(context);

    return Consumer<KycController>(builder: (context, kycController, child) {
      return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
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
                      const LogoWidget(),
                      VerticalSpacer(8.h),
                      Text(
                        'Select A Tax Status',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 19.sp, fontWeight: FontWeight.w400),
                      ),
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
                            hint: const Text('Select Holding Nature'),
                            value: kycController.holdingValue,
                            isExpanded: true,
                            underline: Container(
                              height: 0,
                            ),
                            items:
                                kycController.holdingList.map((String value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              // taxStatus = value;
                              kycController.updateHoldingValue(value);
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
                  } else if (kycController.holdingValue == null) {
                    showSnackBar(context, 'Select a Holding Nature');
                    return;
                  }

                  if (kycController.taxcode != '01') {
                    bool result =
                        await kycController.getNonIndividualTax(context);
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
                      showAlert();
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => const ScreenOccupation(),
                      //   ),
                      // );
                    }
                  } else {
                    bool result = await kycController.getInn();
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
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => const ScreenOccupation(),
                      //   ),
                      // );
                      showAlert();
                    }
                  }
                },
                btName: 'Proceed'.toUpperCase(),
              ),
      );
    });
  }

  void showAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titleTextStyle: Theme.of(context).textTheme.bodyMedium,
          title: const Text(
            "Would you like to add KYC (Know Your Customer) information?",
          ),
          content: VerticalSpacer(2.h),

          // content: Column(
          //   mainAxisSize: MainAxisSize.min,
          //   children: <Widget>[

          //     VerticalSpacer(2.h),
          //     // SizedBox(height: ),
          //     Text(
          //       'We are working on it',
          //       style: TextStyle(
          //         color: Colors.black,
          //         fontSize: 18.sp,
          //         fontWeight: FontWeight.w500,
          //       ),
          //     ),
          //   ],
          // ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.pop(context);

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ScreenOccupation(),
                  ),
                );
              },
              child: Container(
                height: 4.h,
                width: 13.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  color: const Color(0xFF4D84BD),
                ),
                child: const Center(
                  child: Text(
                    'YES',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const ScreenHomeView(),
                    ),
                  );
                },
                child: Container(
                  height: 4.h,
                  width: 13.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: const Color(0xFF4D84BD),
                  ),
                  child: const Center(
                    child: Text(
                      'NO',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ))
          ],
        );
      },
    );
  }
}
