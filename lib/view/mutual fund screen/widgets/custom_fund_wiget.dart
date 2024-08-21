import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/all%20mutual%20fund/screen_all_mutual_fund.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/widgets/overview_in_tabbar.dart';
import 'package:finfresh_mobile/view/top%20mfs/screen_top_mfs.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomFundWidget extends StatelessWidget {
  final String fundName;
  final String imageurl;
  final String? category;
  final String? appbarname;
  const CustomFundWidget({
    super.key,
    required this.fundName,
    required this.imageurl,
    this.category,
    this.appbarname,
  });

  @override
  Widget build(BuildContext context) {
    Brightness platformBrightness = MediaQuery.of(context).platformBrightness;
    return InkWell(
      onTap: category == null
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenAllMutualFund(),
                ),
              );
            }
          : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TopMfsScreen(
                    category: category ?? '',
                    appbarname: appbarname ?? '',
                  ),
                ),
              );
            },
      child: Column(
        children: [
          Container(
            height: Adaptive.h(10),
            width: Adaptive.w(30),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              shape: BoxShape.circle,
              color: platformBrightness == Brightness.light
                  ? Colors.transparent
                  : Colors.white,
            ),
            child: Center(
              child: Image.asset(
                imageurl,
                height: Adaptive.h(5),
              ),
            ),
          ),
          VerticalSpacer(0.5.h),
          CustomTextWidget(
            text: fundName,
            fontSize: 16.sp,
          )
        ],
      ),
    );
  }
}
