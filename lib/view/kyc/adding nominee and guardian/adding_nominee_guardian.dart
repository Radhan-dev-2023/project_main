import 'dart:developer';

import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:finfresh_mobile/view/homeScreen/screen_home_view_screen.dart';
import 'package:finfresh_mobile/view/kyc/Nominee%20adding/nominee%20type/screen_nominee_count.dart';
import 'package:finfresh_mobile/view/kyc/guardian%20screen/screen_guardian.dart';
import 'package:finfresh_mobile/view/kyc/uploading%20proofs/screen_upload_proof.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddingNomineeAndGuadianScreen extends StatelessWidget {
  const AddingNomineeAndGuadianScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final kycController = Provider.of<KycController>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15.sp),
          child: Column(
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: ListTile(
                  onTap: () {
                    if (kycController.nomineeOption == 'N') {
                      showAlertDialog(context);
                    } else {
                      showSnackBar(context, 'Already added nominee');
                    }
                  },
                  title: Text(
                    'Nominee',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 19.sp, fontWeight: FontWeight.bold),
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
              ),
              VerticalSpacer(3.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: ListTile(
                  onTap: () {
                    if (kycController.guardianSelected == false) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ScreenGuardianAdding(),
                        ),
                      );
                    } else {
                      showSnackBar(context, 'Already added guardian');
                    }
                  },
                  title: Text(
                    'Guardian',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 19.sp, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Add guardian',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 15.sp),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonWidget(
        onTap: () async {
          kycController.addingvaluetoModel();
          bool result = await kycController.createCustomer(context);
          log('result is $result');
          if (result == true) {
            // ignore: use_build_context_synchronously
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const ScreenUploadinProofs(),
              ),
              (route) => false,
            );
          }
        },
        btName: 'Submit Kyc'.toUpperCase(),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    // Create the AlertDialog
    AlertDialog alert = AlertDialog(
      content: const Text('Do you want to add Nominee'),
      actions: [
        // You can add buttons to the alert dialog
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ScreenNomineeCount(),
              ),
            );
          },
          child: Text(
            'YES',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        TextButton(
          onPressed: () {
            Provider.of<KycController>(context, listen: false)
                .nomineeChosse('N');
            Navigator.pop(context);
            // Close the dialog
          },
          child: Text(
            'NO',
            style: Theme.of(context).textTheme.labelLarge,
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
