import 'dart:developer';

import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/kyc/address/address_screen.dart';
import 'package:finfresh_mobile/view/kyc/user%20personal%20details/screen_personal_details.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:finfresh_mobile/view/widgets/log_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenOccupation extends StatefulWidget {
  const ScreenOccupation({super.key});

  @override
  State<ScreenOccupation> createState() => _ScreenOccupationState();
}

class _ScreenOccupationState extends State<ScreenOccupation> {
  @override
  void initState() {
    Provider.of<KycController>(context, listen: false).occupationModel = null;
    Provider.of<KycController>(context, listen: false).updatePagenumber('3');
    // TODO: implement initState
    super.initState();
    Provider.of<KycController>(context, listen: false).getOccupation();
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    return Consumer<KycController>(builder: (context, kycController, child) {
      return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              kycController.selectedIndex = null;
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(18.sp),
            child: kycController.occupationLoading == true
                ? const LoadingWidget()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LogoWidget(),
                      VerticalSpacer(8.h),
                      Text(
                        'Occupation',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                      VerticalSpacer(2.h),
                      Text(
                        'Select one of the option',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: Colors.grey, fontSize: 15.sp),
                      ),
                      VerticalSpacer(5.h),
                      Center(
                        child: Wrap(
                          spacing: 18.0.sp,
                          runSpacing: 10.0,
                          children: List<Widget>.generate(
                            kycController
                                .occupationModel!.masterDetails!.length,
                            (int index) {
                              return ChoiceChip(
                                backgroundColor: brightness == Brightness.dark
                                    ? const Color(0xFF0E1330)
                                    : const Color.fromARGB(255, 240, 233, 233),
                                showCheckmark: false,
                                label: Text(
                                  kycController.occupationModel!
                                      .masterDetails![index].occupationDesc
                                      .toString(),
                                  style: TextStyle(
                                    color: kycController.selectedIndex == index
                                        ? Colors
                                            .white // Set the text color for the selected chip
                                        : brightness == Brightness.dark
                                            ? Colors.white
                                            : Colors
                                                .black, // Set the text color for unselected chips
                                  ),
                                ),
                                selected: kycController.selectedIndex == index,
                                onSelected: (bool selected) {
                                  kycController.selectedIndex =
                                      selected ? index : null;
                                  kycController.setselectedIndex(index);
                                  kycController.selectedValue = kycController
                                      .occupationModel!
                                      .masterDetails![index]
                                      .occupationCode;
                                  log(kycController.occupationModel!
                                      .masterDetails![index].occupationCode
                                      .toString());
                                },
                              );
                            },
                          ).toList(),
                        ),
                      ),
                      VerticalSpacer(15.h),
                    ],
                  ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: ButtonWidget(
          onTap: () {
            kycController.addOcupation();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ScreenAddress(),
              ),
            );
          },
          btName: 'Continue'.toUpperCase(),
        ),
      );
    });
  }
}
