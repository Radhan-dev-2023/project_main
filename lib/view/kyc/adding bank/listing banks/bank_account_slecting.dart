import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/model/bank%20details%20model/bank_details_model.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/kyc/bank%20account%20number/screen_bank_accont_number.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/log_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenAddingBank extends StatefulWidget {
  const ScreenAddingBank({super.key});

  @override
  State<ScreenAddingBank> createState() => _ScreenAddingBankState();
}

class _ScreenAddingBankState extends State<ScreenAddingBank> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<KycController>(context, listen: false).updatePagenumber('9');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final kyController = Provider.of<KycController>(context);

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
        child: Consumer<KycController>(builder: (context, kycController, _) {
          return Container(
            margin: EdgeInsets.all(15.sp),
            child: Form(
              key: kycController.banknameFormkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LogoWidget(),
                  VerticalSpacer(5.h),
                  Text(
                    'Choose your bank',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 19.sp, fontWeight: FontWeight.w700),
                  ),
                  VerticalSpacer(4.h),
                  DropdownButtonFormField<String>(
                    style: Theme.of(context).textTheme.labelLarge!,
                    value: kycController.banknameController.text,
                    decoration: const InputDecoration(hintText: 'Bank name'),
                    onChanged: (String? newValue) {
                      kycController.banknameController.text = newValue!;
                    },
                    items: kycController.bankDeatilsModel?.bankDetails?.bank
                        ?.map((Bank value) {
                      return DropdownMenuItem<String>(
                        onTap: () {
                          kycController.bankCodeForCustomer =
                              value.bankcode ?? '';
                        },
                        value: value.bankname,
                        child: Text(
                          value.bankname!,
                        ),
                      );
                    }).toList(),
                  ),
                  VerticalSpacer(3.h),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Branch : ',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      TextSpan(
                        text: kycController.branchNameController.text,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ]),
                  ),
                  VerticalSpacer(2.h),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Address : ',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      TextSpan(
                        text: kycController.addressForBank.text,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ]),
                  ),

                  VerticalSpacer(3.h),

                  // TextFormField(
                  //   maxLines: 2,
                  //   readOnly: true,
                  //   autovalidateMode: AutovalidateMode.onUserInteraction,
                  //   controller: kycController.addressForBank,
                  //   style: Theme.of(context).textTheme.labelLarge!,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'field is required';
                  //     }
                  //     if (!RegExp(r'^[a-zA-Z0-9\s\-&.,]+$').hasMatch(value)) {
                  //       return 'Enter valid bank name';
                  //     }
                  //     return null;
                  //   },
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(10)),
                  //     hintText: 'Bank address',
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonWidget(
        onTap: () {
          final kyccontroller = Provider.of<KycController>(context);
          if (kyccontroller.banknameFormkey.currentState!.validate()) {
            kyccontroller.addbankname();
            kyccontroller.updatePagenumber('10');
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
