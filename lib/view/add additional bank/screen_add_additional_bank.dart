import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/controller/settings%20controller/settings_controller.dart';
import 'package:finfresh_mobile/model/account%20type%20model/account_type_model.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenAddAdditionalBank extends StatefulWidget {
  const ScreenAddAdditionalBank({super.key});

  @override
  State<ScreenAddAdditionalBank> createState() =>
      _ScreenAddAdditionalBankState();
}

class _ScreenAddAdditionalBankState extends State<ScreenAddAdditionalBank> {
  @override
  void initState() {
    super.initState();
    Provider.of<KycController>(context, listen: false).getAccountType();
  }

  @override
  Widget build(BuildContext context) {
    final kycController = Provider.of<KycController>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(15.sp),
        child: Consumer<SettingsController>(
            builder: (context, settingsController, _) {
          return Column(
            children: [
              TextFormField(
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
              VerticalSpacer(2.h),
              TextFormField(
                style: Theme.of(context).textTheme.labelLarge!,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'field is required';
                  }
                  if (!RegExp(r"^[A-Za-z]{4}[a-zA-Z0-9]{7}$").hasMatch(value)) {
                    return 'Invalid IFSC code';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Enter IFSC Code ',
                ),
              ),
              VerticalSpacer(2.h),
              DropdownButtonFormField<MasterAccountDetail>(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null) {
                    return 'Please Select Account Type';
                  }
                  return null;
                },
                style: Theme.of(context).textTheme.labelLarge!,
                value: settingsController.accountype,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Select Account Type',
                ),
                onChanged: (newValue) {
                  settingsController.updateAccountType(newValue);
                },
                items: kycController.accountTypeModel?.masterDetails!
                    .map((MasterAccountDetail masterDetail) {
                  return DropdownMenuItem(
                    value: masterDetail,
                    child: Text(
                      masterDetail.description.toString(),
                    ),
                  );
                }).toList(),
              ),
              VerticalSpacer(2.h),
              TextFormField(
                style: Theme.of(context).textTheme.labelLarge!,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: (value) {
                // if (value == null || value.isEmpty) {
                //   return 'field is required';
                // }
                // if (!RegExp(r"^[A-Za-z]{4}[a-zA-Z0-9]{7}$").hasMatch(value)) {
                //   return 'Invalid IFSC code';
                // }
                // return null;
                // },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Enter Bank Name',
                ),
              ),
              VerticalSpacer(5.h),
              ButtonWidget(
                btName: 'Submit',
                onTap: () {},
              )
            ],
          );
        }),
      ),
    );
  }
}
