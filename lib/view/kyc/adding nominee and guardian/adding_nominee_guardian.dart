import 'dart:developer';

import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/flushbar.dart';
import 'package:finfresh_mobile/view/homeScreen/screen_home_view_screen.dart';
import 'package:finfresh_mobile/view/kyc/Nominee%20adding/nominee%20type/screen_nominee_count.dart';
import 'package:finfresh_mobile/view/kyc/guardian%20screen/screen_guardian.dart';
import 'package:finfresh_mobile/view/kyc/uploading%20proofs/screen_upload_proof.dart';
import 'package:finfresh_mobile/view/kyc/uploading%20proofs/upload%20bank%20proof/upload_bank_proof.dart';
import 'package:finfresh_mobile/view/showing%20animation%20screen/screen_showing_animation.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/log_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddingNomineeAndGuadianScreen extends StatefulWidget {
  const AddingNomineeAndGuadianScreen({super.key});

  @override
  State<AddingNomineeAndGuadianScreen> createState() =>
      _AddingNomineeAndGuadianScreenState();
}

class _AddingNomineeAndGuadianScreenState
    extends State<AddingNomineeAndGuadianScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<KycController>(context, listen: false).updatePagenumber('12');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final kycController = Provider.of<KycController>(context);
    Brightness brightness = MediaQuery.of(context).platformBrightness;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: brightness == Brightness.dark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              const LogoWidget(),
              VerticalSpacer(8.h),
              Consumer<KycController>(builder: (context, kyccontroller, _) {
                return kyccontroller.typevalue == 'Minor'
                    ? const SizedBox()
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: ListTile(
                          onTap: () {
                            showAlertDialog(context);

                            // if (kycController.nomineeOption == 'N') {
                            //   showAlertDialog(context);
                            // }
                          },
                          title: Text(
                            'Nominee',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Add nominee',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(fontSize: 15.sp),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                      );
              }),
              VerticalSpacer(3.h),
              kycController.typevalue == 'Select a type' ||
                      kycController.typevalue == 'Major'
                  ? const SizedBox()
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: ListTile(
                        onTap: () {
                          if (kycController.guardianSelectedInguardianAdding ==
                              false) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ScreenGuardianAdding(),
                              ),
                            );
                          }
                        },
                        title: Text(
                          'Guardian',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontSize: 19.sp, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Add guardian',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(fontSize: 15.sp),
                        ),
                        // trailing: kycController.guardianSelected == false
                        //     ? const SizedBox()
                        //     : const Icon(Icons.arrow_forward_ios),
                        trailing: Consumer<KycController>(
                            builder: (context, kycconroller, _) {
                          return kycController
                                      .guardianSelectedInguardianAdding ==
                                  true
                              ? SizedBox()
                              : const Icon(Icons.arrow_forward_ios);
                        }),
                      ),
                    ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: kycController.loading == true ||
              kycController.createcustomerLoading == true
          ? const LoadingButton()
          : ButtonWidget(
              onTap: () async {
                if (kycController.typevalue == 'Minor' &&
                    kycController.guardianSelectedInguardianAdding == false) {
                  showFlushbar(context, 'Please add guardian');
                } else {
                  await kycController.addingvaluetoModel();
                  // ignore: use_build_context_synchronously
                  bool result = await kycController.createCustomer(context);
                  log('result is $result');
                  if (result == true) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => kycController
                                    .createCustomerService
                                    .customerResponseModel
                                    .newCustomer ==
                                true
                            ? const ScreenBankProofs()
                            : const ScreenCompletedScreen(),
                      ),
                      (route) => false,
                    );
                  }
                }
              },
              btName: 'Submit Kyc'.toUpperCase(),
            ),
    );
  }

  void showAlertDialog(BuildContext context) {
    // Create the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        'Do you want to add Nominee ?',
        style: Theme.of(context)
            .textTheme
            .labelLarge!
            .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w500),
      ),
      content: VerticalSpacer(2.h),
      actions: [
        // You can add buttons to the alert dialog
        Container(
          height: 5.h,
          width: 15.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            color: const Color(0xFF4D84BD),
          ),
          child: Center(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
                Provider.of<KycController>(context, listen: false).countvalue =
                    'Select Nominee Count';
                Provider.of<KycController>(context, listen: false)
                    .nomineeChosse('Y');

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenNomineeCount(),
                  ),
                );
              },
              child: const Text(
                'YES',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Container(
          height: 5.h,
          width: 15.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            color: const Color(0xFF4D84BD),
          ),
          child: TextButton(
            onPressed: () {
              Provider.of<KycController>(context, listen: false)
                  .nomineeChosse('N');
              Navigator.pop(context);
              // Close the dialog
            },
            child: const Text(
              'NO',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );

    // Show the AlertDialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
