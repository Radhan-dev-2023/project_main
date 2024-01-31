import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/model/account%20type%20model/account_type_model.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:finfresh_mobile/view/kyc/adding%20nominee%20and%20guardian/adding_nominee_guardian.dart';
import 'package:finfresh_mobile/view/kyc/joint%20holders/join_holders_screen.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenBankAccountNumber extends StatefulWidget {
  const ScreenBankAccountNumber({super.key});

  @override
  State<ScreenBankAccountNumber> createState() =>
      _ScreenBankAccountNumberState();
}

class _ScreenBankAccountNumberState extends State<ScreenBankAccountNumber> {
  @override
  void initState() {
    Provider.of<KycController>(context, listen: false).acountypeValue = null;
    Provider.of<KycController>(context, listen: false).getAccountType();
    Provider.of<KycController>(context, listen: false).updatePagenumber('10');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    // Provider.of<KycController>(context, listen: false).getAccountType();
    final kycController = Provider.of<KycController>(context);
    // kycController.updatePagenumber('10');
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            kycController.accountnumberCotroller.clear();
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15.sp),
          child: Form(
            key: kycController.bankAccountnumberFormkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpacer(7.h),
                Text(
                  'Enter your account number & account type',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w700),
                ),
                VerticalSpacer(4.h),
                TextFormField(
                  controller: kycController.accountnumberCotroller,
                  style: Theme.of(context).textTheme.labelLarge!,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Account Number';
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
                      hint: const Text('Select account type'),
                      value: kycController.acountypeValue,
                      isExpanded: true,
                      underline: Container(
                        height: 0,
                      ),
                      items: kycController.accountTypeModel?.masterDetails!
                          .map((MasterAccountDetail masterDetail) {
                        return DropdownMenuItem(
                          value: masterDetail,
                          child: Text(
                            masterDetail.description.toString(),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        // taxStatus = value;
                        kycController.updateAccountType(value);
                      },
                    ),
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
          if (kycController.acountypeValue == null) {
            showSnackBar(context, "Select a account type");
            return;
          }
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
      content: Text(
        'Do you want to add Joint Holders ?',
        style:
            Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 16.sp),
      ),
      // shape: RoundedRectangleBorder(
      //   borderRadius:
      //       BorderRadius.circular(10), // Set your desired borderRadius here
      // ),
      actions: [
        // You can add buttons to the alert dialog
        InkWell(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ScreenJointHolders(),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddingNomineeAndGuadianScreen(),
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

    // Show the AlertDialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
