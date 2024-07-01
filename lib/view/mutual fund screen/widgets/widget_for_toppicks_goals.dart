import 'dart:developer';

import 'package:finfresh_mobile/model/TopPicks%20model/topPicks_model.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/stock_detail_screen.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/widgets/overview_in_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WigetForTopPIcksAndGoals extends StatelessWidget {
  final String title;
  final Fund? listname;
  final Widget wigetInTrailing;
  // final List<String> imageList;
  // final List<String>? isinList;
  // final List<String>? categoryList;

  const WigetForTopPIcksAndGoals({
    super.key,
    required this.title,
    this.listname,
    required this.wigetInTrailing,
    // required this.imageList,
    // this.isinList,
    // this.categoryList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Adaptive.w(89),
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
                maxHeight: Adaptive.h(42),
                minHeight: Adaptive.h(42),
              ),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.only(left: 15.sp, right: 12.sp),
                    leading: listname?.fundList?[index].image == null
                        ? CircleAvatar(
                            radius: 29,
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              'assets/images/ffdash.png',
                              height: Adaptive.h(6),
                              width: Adaptive.w(6),
                            ),
                          )
                        : Image.network(
                            listname?.fundList?[index].image ?? '',
                            errorBuilder: (context, error, stackTrace) {
                              return CircleAvatar(
                                radius: 29,
                                backgroundColor: Colors.white,
                                child: Image.asset(
                                  'assets/images/ffdash.png',
                                  height: Adaptive.h(6),
                                  width: Adaptive.w(6),
                                ),
                              );
                            },
                          ),
                    title: Text(
                      listname?.fundList?[index].fundName ?? '',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 15.5.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 3.sp,
                          ),
                      maxLines: 2,
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StockDetailsScreen(
                              scheme: listname?.fundList?[index].fundName ?? '',
                              isinNumber: listname?.fundList?[index].isin ?? '',
                              category:
                                  listname?.fundList?[index].category ?? '',
                            ),
                          ));
                    },
                  );
                },
                separatorBuilder: (context, index) => VerticalSpacer(1.h),
                itemCount: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
