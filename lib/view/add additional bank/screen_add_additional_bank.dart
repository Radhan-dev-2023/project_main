import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/controller/bank%20controller/bank_controller.dart';
import 'package:finfresh_mobile/model/account%20type%20model/account_type_model.dart';
import 'package:finfresh_mobile/model/bank%20details%20model/bank_details_model.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/add%20additional%20bank/upload%20proof%20bank/screen_bank_upload.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_button_widget.dart';
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
    Provider.of<BankController>(context, listen: false).hasDetailsBeenFetched =
        false;
    Provider.of<BankController>(context, listen: false).proofvalue = null;
    Provider.of<BankController>(context, listen: false).accountype = null;
    Provider.of<BankController>(context, listen: false).bankName = null;
    Provider.of<BankController>(context, listen: false)
        .accountController
        .clear();
    Provider.of<BankController>(context, listen: false).ifscController.clear();
    Provider.of<BankController>(context, listen: false)
        .branchNameController
        .clear();
    Provider.of<KycController>(context, listen: false).getAccountType();
  }

  @override
  Widget build(BuildContext context) {
    final kycController = Provider.of<KycController>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(15.sp),
        child:
            Consumer<BankController>(builder: (context, settingsController, _) {
          return SingleChildScrollView(
            child: Form(
              key: settingsController.formKeyforAddingBank,
              child: Column(
                children: [
                  TextFormField(
                    controller: settingsController.accountController,
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
                    controller: settingsController.ifscController,
                    style: Theme.of(context).textTheme.labelLarge!,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onTapOutside: (event) {
                      if (!settingsController.hasDetailsBeenFetched &&
                          settingsController.ifscController.text.isNotEmpty) {
                        // Trigger the bank details retrieval
                        settingsController.getbankDetailsWithIfsc(
                          context,
                          settingsController.ifscController.text,
                        );
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'field is required';
                      }
                      if (!RegExp(r"^[A-Za-z]{4}[a-zA-Z0-9]{7}$")
                          .hasMatch(value)) {
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
                  DropdownButtonFormField<String>(
                    validator: (value) {
                      if (value == null) {
                        return 'Please Select The Bank Name';
                      }
                      return null;
                    },
                    style: Theme.of(context).textTheme.labelLarge!,
                    value: settingsController.bankName,
                    decoration: InputDecoration(
                      hintText: 'Bank name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onChanged: (String? newValue) {
                      settingsController.updateBankname(newValue);
                    },
                    items: settingsController
                        .bankDeatilsModel?.bankDetails?.bank
                        ?.map((Bank value) {
                      return DropdownMenuItem<String>(
                        onTap: () {
                          settingsController.bankCodeForCustomer =
                              value.bankcode ?? '';
                        },
                        value: value.bankname,
                        child: Text(
                          value.bankname!,
                        ),
                      );
                    }).toList(),
                  ),
                  VerticalSpacer(2.h),
                  TextFormField(
                    controller: settingsController.branchNameController,
                    style: Theme.of(context).textTheme.labelLarge!,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Branch';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Enter Branch',
                    ),
                  ),
                  VerticalSpacer(2.h),
                  DropdownButtonFormField<String>(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null) {
                        return 'Please Select Poof';
                      }
                      return null;
                    },
                    style: Theme.of(context).textTheme.labelLarge!,
                    value: settingsController.proofvalue,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Select Proof',
                    ),
                    onChanged: (newValue) {
                      settingsController.updateProofValue(newValue ?? '');
                    },
                    items: settingsController.proofAccountDiscription
                        .map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    }).toList(),
                  ),
                  VerticalSpacer(5.h),
                  settingsController.loadingBank == true
                      ? const LoadingButton()
                      : ButtonWidget(
                          btName: 'Submit',
                          onTap: () async {
                            if (settingsController
                                .formKeyforAddingBank.currentState!
                                .validate()) {
                              bool result = await settingsController.bankAdding(
                                context,
                                "I",
                              );
                              if (result == true) {
                                // ignore: use_build_context_synchronously
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ScreenAddBankProofs(),
                                    ));
                                // ignore: use_build_context_synchronously
                                settingsController.getBankList(context);
                              } else {
                                return;
                              }
                            }
                          },
                        )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
