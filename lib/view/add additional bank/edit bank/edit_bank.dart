import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/controller/bank%20controller/bank_controller.dart';
import 'package:finfresh_mobile/model/bank%20details%20model/bank_details_model.dart';
import 'package:finfresh_mobile/model/bank%20list%20model/bank_list_model.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenEditBank extends StatefulWidget {
  final BankList banklist;
  const ScreenEditBank({
    super.key,
    required this.banklist,
  });

  @override
  State<ScreenEditBank> createState() => _ScreenEditBankState();
}

class _ScreenEditBankState extends State<ScreenEditBank> {
  @override
  void initState() {
    super.initState();
    Provider.of<BankController>(context, listen: false)
        .getbankDetailsWithIfsc(context, widget.banklist.ifscCode);
    Provider.of<KycController>(context, listen: false).getAccountType();
    Provider.of<BankController>(context, listen: false).hasDetailsBeenFetched =
        false;
    if (widget.banklist.proofOfAccount == 'Original cancelled cheque') {
      Provider.of<BankController>(context, listen: false).proofvalue =
          "Cancelled cheque";
      Provider.of<BankController>(context, listen: false).proofValueTobackend =
          'Original cancelled cheque';
    } else if (widget.banklist.proofOfAccount ==
        'Attested copy of bank passbook frontpage') {
      Provider.of<BankController>(context, listen: false).proofvalue =
          "Bank passbook";
      Provider.of<BankController>(context, listen: false).proofValueTobackend =
          'Attested copy of bank passbook frontpage';
    } else if (widget.banklist.proofOfAccount ==
        'Attested copy of bank statement') {
      Provider.of<BankController>(context, listen: false).proofvalue =
          "Bank statement";
      Provider.of<BankController>(context, listen: false).proofValueTobackend =
          'Attested copy of bank statement';
    } else if (widget.banklist.proofOfAccount ==
        'Letter from Bank confirming the account') {
      Provider.of<BankController>(context, listen: false).proofvalue =
          "Bank passbook";
      Provider.of<BankController>(context, listen: false).proofValueTobackend =
          'etter from Bank confirming the accoun';
    } else if (widget.banklist.proofOfAccount == 'IMPS') {
      Provider.of<BankController>(context, listen: false).proofvalue =
          "IMPS Document";
      Provider.of<BankController>(context, listen: false).proofValueTobackend =
          'IMPS';
    }
    // Provider.of<BankController>(context, listen: false).accountype?.accType =
    //     widget.banklist.accType;
    if (widget.banklist.accType == 'SB') {
      Provider.of<BankController>(context, listen: false).acctypValue =
          'Savings Account';
    } else if (widget.banklist.accType == "CA") {
      Provider.of<BankController>(context, listen: false).acctypValue =
          'Current Account';
    } else if (widget.banklist.accType == "PSB") {
      Provider.of<BankController>(context, listen: false).acctypValue =
          'Post Office Savings Bank Account';
    } else if (widget.banklist.accType == "OD") {
      Provider.of<BankController>(context, listen: false).acctypValue =
          'Overdraft Account';
    } else if (widget.banklist.accType == "CC") {
      Provider.of<BankController>(context, listen: false).acctypValue =
          'Cash/Credit';
    }
    // Provider.of<BankController>(context, listen: false)
    //     .bankNameController
    //     .text = widget.banklist.bankName ?? '';
    Provider.of<BankController>(context, listen: false).accountController.text =
        widget.banklist.accNo!;

    Provider.of<BankController>(context, listen: false).ifscController.text =
        widget.banklist.ifscCode!;
    Provider.of<BankController>(context, listen: false)
        .branchNameController
        .text = widget.banklist.branchName!;
  }

  @override
  Widget build(BuildContext context) {
    // final kycController = Provider.of<KycController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Bank'),
      ),
      body: Container(
        margin: EdgeInsets.all(15.sp),
        child:
            Consumer<BankController>(builder: (context, settingsController, _) {
          return SingleChildScrollView(
            child: Form(
              key: settingsController.formKeyforAddingBank,
              child: settingsController.ifscLoading == true
                  ? const LoadingWidget()
                  : Column(
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
                                settingsController
                                    .ifscController.text.isNotEmpty) {
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
                        DropdownButtonFormField<String>(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null) {
                              return 'Please Select Account Type';
                            }
                            return null;
                          },
                          style: Theme.of(context).textTheme.labelLarge!,
                          value: settingsController.acctypValue,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Select Account Type',
                          ),
                          onChanged: (newValue) {
                            settingsController
                                .updateAcctypeValue(newValue ?? '');
                          },
                          items: settingsController.listofAccType.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(
                                value.toString(),
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
                                btName: 'Update',
                                onTap: () async {
                                  if (settingsController
                                      .formKeyforAddingBank.currentState!
                                      .validate()) {
                                    bool result =
                                        await settingsController.bankAdding(
                                      context,
                                      "E",
                                    );
                                    if (result == true) {
                                      // ignore: use_build_context_synchronously
                                      Navigator.pop(context);
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
