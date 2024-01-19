import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/kyc/bank%20account%20number/screen_bank_accont_number.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenAddingBank extends StatelessWidget {
  const ScreenAddingBank({super.key});

  @override
  Widget build(BuildContext context) {
    final kycController = Provider.of<KycController>(context);
    kycController.updatePagenumber('9');
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15.sp),
          child: Form(
            key: kycController.banknameFormkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpacer(10.h),
                Text(
                  'Choose your bank',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 19.sp, fontWeight: FontWeight.w700),
                ),
                VerticalSpacer(4.h),
                TextFormField(
                  readOnly: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: kycController.banknameController,
                  style: Theme.of(context).textTheme.labelLarge!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'field is required';
                    }
                    if (!RegExp(r'^[a-zA-Z0-9\s\-&.,]+$').hasMatch(value)) {
                      return 'Enter valid bank name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Enter bank name',
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
          if (kycController.banknameFormkey.currentState!.validate()) {
            kycController.addbankname();
            kycController.updatePagenumber('10');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ScreenBankAccountNumber(),
              ),
            );
          }
        },
        btName: 'Continue'.toUpperCase(),
      ),
    );
  }
}
