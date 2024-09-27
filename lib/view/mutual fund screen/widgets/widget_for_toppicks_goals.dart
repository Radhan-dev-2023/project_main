import 'package:finfresh_mobile/model/TopPicks%20model/topPicks_model.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/stock_detail_screen.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/widgets/overview_in_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WigetForTopPIcksAndGoals extends StatelessWidget {
  // final String title;
  final List<FundList>? listname;
  final Widget wigetInTrailing;
  // final List<String> imageList;
  // final List<String>? isinList;
  // final List<String>? categoryList;

  const WigetForTopPIcksAndGoals({
    super.key,
    // required this.title,
    this.listname,
    required this.wigetInTrailing,
    // required this.imageList,
    // this.isinList,
    // this.categoryList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: Adaptive.w(89),
      // height: Adaptive.h(46),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: CustomTextWidget(
          //     text: title,
          //     fontSize: 17.sp,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: Adaptive.h(56.5),
              minHeight: Adaptive.h(56.5),
            ),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 7,
                  // shadowColor: Colors.black.withOpacity(0.2),
                  child: SizedBox(
                    height: 10.h,
                    child: Center(
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.only(left: 15.sp, right: 12.sp),
                        leading: listname?[index].image == null
                            ? CircleAvatar(
                                radius: 29,
                                backgroundColor: Colors.white,
                                child: Image.asset(
                                  'assets/images/ffdash.png',
                                  height: Adaptive.h(6),
                                  width: Adaptive.w(6),
                                ),
                              )
                            : SizedBox(
                                height: 6.h,
                                width: 11.w,
                                child: Image.network(
                                  listname?[index].image ?? '',
                                  errorBuilder: (context, error, stackTrace) {
                                    return CircleAvatar(
                                      radius: 29,
                                      backgroundColor: Colors.white,
                                      child: Image.asset(
                                        'assets/images/ffdash.png',
                                        height: Adaptive.h(4),
                                        width: Adaptive.w(5),
                                      ),
                                    );
                                  },
                                ),
                              ),
                        title: Text(
                          listname?[index].fundName ?? '',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontSize: 15.7.sp,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 3.sp,
                                  ),
                          maxLines: 3,
                        ),
                        trailing: Container(
                          height: Adaptive.h(3.5),
                          width: Adaptive.w(18),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.sp),
                            color: const Color(0xFFE8F8FF),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 2),
                              child: CustomTextWidget(
                                text: 'Invest',
                                fontSize: 15.sp,
                                color: const Color(0xFF33BEFB),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StockDetailsScreen(
                                  scheme: listname?[index].fundName ?? '',
                                  isinNumber: listname?[index].isin ?? '',
                                  category: listname?[index].category ?? '',
                                ),
                              ));
                        },
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => VerticalSpacer(0.5.h),
              itemCount: 5,
            ),
          ),
          // VerticalSpacer(
          //   Adaptive.h(2),
          // ),
        ],
      ),
    );
  }
}
