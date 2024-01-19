import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/kyc/adding%20bank/ifsc%20adding/enter_ifsc_code.dart';
import 'package:finfresh_mobile/view/kyc/adding%20bank/upload%20bank%20proof/uploading_bank_proof.dart';
import 'package:finfresh_mobile/view/kyc/adding%20nominee%20and%20guardian/adding_nominee_guardian.dart';
import 'package:finfresh_mobile/view/kyc/joint%20holders/join_holders_screen.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenBankAccountNumber extends StatelessWidget {
  const ScreenBankAccountNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final kycController = Provider.of<KycController>(context);
    kycController.updatePagenumber('10');
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15.sp),
          child: Form(
            key: kycController.bankAccountnumberFormkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpacer(10.h),
                Text(
                  'Enter your account number',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 19.sp, fontWeight: FontWeight.w700),
                ),
                VerticalSpacer(4.h),
                TextFormField(
                  controller: kycController.accountnumberCotroller,
                  style: Theme.of(context).textTheme.labelLarge!,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'field is required';
                    }
                    if (!RegExp(r'^\d{9,18}$').hasMatch(value)) {
                      return 'Invalid bank account number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Enter account number',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonWidget(
        onTap: () {
          if (kycController.bankAccountnumberFormkey.currentState!.validate()) {
            kycController.addingbankAccNumber();
            kycController.addbanknameAccountnumber();
            showAlertDialog(context);
          }
        },
        btName: 'Continue'.toUpperCase(),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    // Create the AlertDialog
    AlertDialog alert = AlertDialog(
      content: const Text('Do you want to add Joint Holders'),
      actions: [
        // You can add buttons to the alert dialog
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ScreenJointHolders(),
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
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddingNomineeAndGuadianScreen(),
              ),
            );
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
