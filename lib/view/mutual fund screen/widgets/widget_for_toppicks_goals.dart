import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/widgets/overview_in_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WigetForTopPIcksAndGoals extends StatelessWidget {
  final String title;
  final List<String> listname;
  final Widget wigetInTrailing;
  const WigetForTopPIcksAndGoals({
    super.key,
    required this.title,
    required this.listname,
    required this.wigetInTrailing,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Adaptive.w(95),
      // height: Adaptive.h(46),
      child: Card(
        elevation: 6,
        shadowColor: Colors.black.withOpacity(0.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextWidget(
                text: title,
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: Adaptive.h(41),
                minHeight: Adaptive.h(35),
              ),
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.only(left: 15.sp, right: 12.sp),
                    leading: Container(
                      height: 5.h,
                      width: 10.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        color: Color(0xFF0E1330),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.5),
                        child: Image.asset(
                          'assets/images/ffdash.png',
                          color: Colors.white,
                          height: Adaptive.h(4),
                          width: Adaptive.w(4),
                        ),
                      ),
                    ),
                    title: Text(
                      listname[index],
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 15.5.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 3.sp,
                          ),
                    ),
                    trailing: Container(
                      height: Adaptive.h(3),
                      width: Adaptive.w(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.sp),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: CustomTextWidget(
                            text: 'Invest',
                            fontSize: 14.sp,
                            color: const Color(0xFF6C8FF8),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {},
                  );
                },
                separatorBuilder: (context, index) => VerticalSpacer(0),
                itemCount: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
