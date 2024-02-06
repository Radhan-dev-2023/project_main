import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/kyc/adding%20bank/listing%20banks/bank_account_slecting.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/log_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenIfcAdding extends StatefulWidget {
  const ScreenIfcAdding({super.key});

  @override
  State<ScreenIfcAdding> createState() => _ScreenIfcAddingState();
}

class _ScreenIfcAddingState extends State<ScreenIfcAdding> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<KycController>(context, listen: false).updatePagenumber('8');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final kycController = Provider.of<KycController>(context);

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            kycController.ifscCodeController.clear();
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15.sp),
          child: Form(
            key: kycController.ifscCodeFormkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LogoWidget(),
                VerticalSpacer(5.h),
                Text(
                  'Enter your IFSC number',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 19.sp, fontWeight: FontWeight.w700),
                ),
                VerticalSpacer(4.h),
                TextFormField(
                  controller: kycController.ifscCodeController,
                  style: Theme.of(context).textTheme.labelLarge!,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: kycController.ifscLoading == true
          ? const LoadingButton()
          : ButtonWidget(
              onTap: () async {
                if (kycController.ifscCodeFormkey.currentState!.validate()) {
                  bool result = await kycController.getbankDetailsWithIfsc(
                      context, kycController.ifscCodeController.text);
                  if (result == true) {
                    kycController.addIfsc();
                    kycController.addingbankname();

                    kycController.updatePagenumber('9');
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScreenAddingBank(),
                      ),
                    );
                  }
                  // Navigator.push
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const ScreenUploadingBankProof(),
                  //   ),
                  // );
                }
              },
              btName: 'Continue'.toUpperCase(),
            ),
    );
  }
}
