import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/adding%20bank/listing%20banks/bank_account_slecting.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenAddingParentDetails extends StatelessWidget {
  const ScreenAddingParentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final kycController = Provider.of<KycController>(context);
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpacer(10.h),
              Text(
                'Details required to finish KYC',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 19.sp, fontWeight: FontWeight.w700),
              ),
              VerticalSpacer(4.h),
              TextFormField(
                controller: kycController.motherNameCotroller,
                style: Theme.of(context).textTheme.labelLarge!,
               
                decoration: InputDecoration(
                    
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Mothers's Name"),
              ),
              VerticalSpacer(3.h),
              TextFormField(
                controller: kycController.fatherNameController,
                style: Theme.of(context).textTheme.labelLarge!,
               
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenAddingBank(),
            ),
          );
        },
        btName: 'Proceed'.toUpperCase(),
      ),
    );
  }
}
