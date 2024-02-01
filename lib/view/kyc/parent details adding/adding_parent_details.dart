import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/kyc/adding%20bank/ifsc%20adding/enter_ifsc_code.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenAddingParentDetails extends StatefulWidget {
  const ScreenAddingParentDetails({super.key});

  @override
  State<ScreenAddingParentDetails> createState() =>
      _ScreenAddingParentDetailsState();
}

class _ScreenAddingParentDetailsState extends State<ScreenAddingParentDetails> {
  @override
  void initState() {
    Provider.of<KycController>(context, listen: false).updatePagenumber('7');
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final kycController = Provider.of<KycController>(context);

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
        child: Container(
          margin: EdgeInsets.all(15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpacer(7.h),
              Text(
                'Enter other details',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 19.sp, fontWeight: FontWeight.w700),
              ),
              VerticalSpacer(4.h),
              TextFormField(
                controller: kycController.motherNameCotroller,
                style: Theme.of(context).textTheme.labelLarge!,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value!)) {
                    return 'Enter valid name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Mother's Name"),
              ),
              VerticalSpacer(3.h),
              TextFormField(
                controller: kycController.fatherNameController,
                style: Theme.of(context).textTheme.labelLarge!,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value!)) {
                    return 'Enter valid name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Father's Name",
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonWidget(
        onTap: () {
          kycController.addParentDetails();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenIfcAdding(),
            ),
          );
        },
        btName: 'Proceed'.toUpperCase(),
      ),
    );
  }
}
