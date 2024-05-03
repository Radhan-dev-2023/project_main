import 'dart:ui';

import 'package:finfresh_mobile/controller/scheme%20details%20controller/scheme_details_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OverViewInTabbar extends StatelessWidget {
  const OverViewInTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<SchemeDetailsController>(
          builder: (context, schemeController, child) {
        return Container(
          margin: EdgeInsets.only(left: 15.sp, right: 15.sp),
          child: Column(
            children: [
              // VerticalSpacer(2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: 'Min. Investment',
                    fontSize: 16.sp,
                  ),
                  CustomTextWidget(
                    text:
                        '₹ ${schemeController.schemeInfoModel?.minimumInvestment ?? ''}',
                    fontSize: 16.sp,
                  ),
                ],
              ),
              VerticalSpacer(1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: 'Min. Investment(SIP)',
                    fontSize: 16.sp,
                  ),
                  CustomTextWidget(
                    text:
                        '₹ ${schemeController.schemeInfoModel?.sipMinimumAmount ?? ''}',
                    fontSize: 16.sp,
                  ),
                ],
              ),
              VerticalSpacer(1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: 'Exit Load',
                    fontSize: 16.sp,
                  ),
                  SizedBox(
                    width: 50.w,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CustomTextWidget(
                        text: schemeController.schemeInfoModel?.exitLoad ?? '-',
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ],
              ),
              VerticalSpacer(2.h),

              SizedBox(
                width: double.infinity.sp,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        schemeController.changeButton();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                            text: 'Holdings',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          InkWell(
                            onTap: () {
                              schemeController.changeButton();
                            },
                            child: Icon(
                              schemeController.changebutton == false
                                  ? CupertinoIcons.chevron_down
                                  : CupertinoIcons.chevron_up,
                              size: 18.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    VerticalSpacer(2.h),
                    schemeController.changebutton == true
                        ? SizedBox(
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: schemeController
                                    .schemeInfoModel!
                                    .schemePortfolioList![0]
                                    .schemePortfolioHoldings
                                    .keys
                                    .map((entry) => Column(
                                          children: [
                                            Text(entry),
                                            VerticalSpacer(1
                                                .h), // Adjust the height according to your needs
                                          ],
                                        ))
                                    .toList(),
                              ),
                              Column(
                                children: schemeController
                                    .schemeInfoModel!
                                    .schemePortfolioList![0]
                                    .schemePortfolioHoldings
                                    .values
                                    .map((entry) => Column(
                                          children: [
                                            Text('$entry %'),
                                            VerticalSpacer(1
                                                .h), // Adjust the height according to your needs
                                          ],
                                        ))
                                    .toList(),
                              )
                            ],
                          ))
                        : const SizedBox(),
                  ],
                ),
              ),
              VerticalSpacer(10.h),
            ],
          ),
        );
      }),
    );
  }
}

class CustomTextWidget extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final double? letterSpacing;
  final Color? color;

  const CustomTextWidget(
      {super.key,
      this.text,
      this.fontSize,
      this.fontWeight,
      this.overflow,
      this.letterSpacing,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: fontSize,
          fontWeight: fontWeight,
          overflow: overflow,
          letterSpacing: letterSpacing,
          color: color),
      // overflow: TextOverflow.ellipsis,
    );
  }
}
