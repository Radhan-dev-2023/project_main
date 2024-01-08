import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class OverViewInTabbar extends StatelessWidget {
  const OverViewInTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> overviewName = [
      'Experts rating',
      'Fundamental',
      'Financials',
      'About',
      'Shareholding pattern',
      'Similar stocks'
    ];
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            Row(
              children: [
                CustomTextWidget(
                  text: 'Performance',
                  fontSize: 16.sp,
                ),
                HorizontalSpacer(4.w),
                CircleAvatar(
                  radius: 12.sp,
                  backgroundColor: Colors.grey,
                  child: Center(
                    child: Text(
                      '!',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 16.sp, color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
            VerticalSpacer(2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  text: "Today's loss",
                  fontSize: 15.sp,
                ),
                CustomTextWidget(
                  text: "Today's high",
                  fontSize: 15.sp,
                ),
              ],
            ),
            VerticalSpacer(1.h),
            Divider(
              thickness: 8.sp,
              color: Colors.green,
            ),
            VerticalSpacer(2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  text: "52 week low",
                  fontSize: 15.sp,
                ),
                CustomTextWidget(
                  text: "52 week high",
                  fontSize: 15.sp,
                ),
              ],
            ),
            VerticalSpacer(2.h),
            // SfSlider(

            //   // thumbIcon: Icon(Icons.arrow_back_ios),
            //   min: 0.0,
            //   max: 100.0,
            //   value: 50.0, // Initial value
            //   interval: 10.0, // Interval between values
            //   // showLabels: true,
            //   // showTicks: true,
            //   enableTooltip: true,
            //   onChanged: (newValue) {
            //     // Handle value changes here
            //     print('New value: $newValue');
            //   },
            // ),
            Divider(
              thickness: 8.sp,
              color: Colors.green,
            ),
            VerticalSpacer(2.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                children: [
                  const CustomTextWidget(
                    text: 'Open price',
                  ),
                  HorizontalSpacer(10.w),
                  const CustomTextWidget(
                    text: 'Prev.close',
                  ),
                  HorizontalSpacer(10.w),
                  const CustomTextWidget(
                    text: 'Volume',
                  ),
                ],
              ),
            ),
            VerticalSpacer(1.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                children: [
                  const CustomTextWidget(
                    text: '800.50',
                  ),
                  HorizontalSpacer(17.w),
                  const CustomTextWidget(
                    text: '790.60',
                  ),
                  HorizontalSpacer(15.w),
                  const CustomTextWidget(
                    text: '97,74,420',
                  ),
                ],
              ),
            ),
            VerticalSpacer(2.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                children: [
                  const CustomTextWidget(
                    text: 'Lower Circute',
                  ),
                  HorizontalSpacer(5.w),
                  const CustomTextWidget(
                    text: 'Upper circute',
                  ),
                ],
              ),
            ),
            VerticalSpacer(1.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                children: [
                  const CustomTextWidget(
                    text: '711.55',
                  ),
                  HorizontalSpacer(17.w),
                  const CustomTextWidget(
                    text: '899.65',
                  ),
                ],
              ),
            ),
            VerticalSpacer(2.h),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return SizedBox(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpacer(3.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          overviewName[index],
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: 17.sp,
                                  ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16.sp,
                        )
                      ],
                    ),
                    VerticalSpacer(3.h),
                  ],
                ));
              },
              separatorBuilder: (context, index) => const Divider(
                color: Colors.grey,
                thickness: 0.2,
              ),
              itemCount: overviewName.length,
            ),
            VerticalSpacer(10.h),
          ],
        ),
      ),
    );
  }
}

class CustomTextWidget extends StatelessWidget {
  final String? text;
  final double? fontSize;

  const CustomTextWidget({
    super.key,
    this.text,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: fontSize,
          ),
    );
  }
}
