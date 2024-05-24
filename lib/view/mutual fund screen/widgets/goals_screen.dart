import 'package:finfresh_mobile/controller/top%20MFs%20controller/top_mfs_controller.dart';
import 'package:finfresh_mobile/controller/top%20fund%20controller/top_fund_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/stock_detail_screen.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/widgets/overview_in_tabbar.dart';
import 'package:finfresh_mobile/view/top%20mfs/screen_top_mfs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenGolas extends StatelessWidget {
  final String heading;
  final String image;
  const ScreenGolas({super.key, required this.heading, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(heading),
      ),
      body: Consumer<TopMFsController>(builder: (context, topMfsController, _) {
        return Column(
          children: [
            Container(
              height: Adaptive.h(45),
              width: double.infinity,
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage(image),
              //     fit: BoxFit.contain,

              //   ),
              // ),
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
            VerticalSpacer(1.h),
            heading == 'Tax Savings'
                ? Expanded(
                    child: ListView.separated(
                        padding: EdgeInsets.all(0),
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image.network(
                                topMfsController.taxSavingingoalsLogo[index]),
                            // leading: Container(
                            //   height: 5.h,
                            //   width: 10.w,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(10.sp),
                            //     color: Color(0xFF0E1330),
                            //   ),
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(6.5),
                            //     child: Image.asset(
                            //       'assets/images/ffdash.png',
                            //       color: Colors.white,
                            //       height: Adaptive.h(4),
                            //       width: Adaptive.w(4),
                            //     ),
                            //   ),
                            // ),
                            title: Text(
                              topMfsController.taxsavingInGoals[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    fontSize: 16.sp,
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
                                      scheme: topMfsController
                                          .taxsavingInGoals[index],
                                      isinNumber: topMfsController
                                          .taxsavingInGoalsIsin[index],
                                      category: '',
                                    ),
                                  ));
                            },
                          );
                        },
                        separatorBuilder: (context, index) =>
                            VerticalSpacer(1.h),
                        itemCount: 5),
                  )
                : SizedBox(),
            heading == '0-3 Years'
                ? Expanded(
                    child: ListView.separated(
                        padding: EdgeInsets.all(0),
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image.network(
                                topMfsController.threeyearLogo[index]),
                            // leading: Container(
                            //   height: 5.h,
                            //   width: 10.w,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(10.sp),
                            //     color: Color(0xFF0E1330),
                            //   ),
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(6.5),
                            //     child: Image.asset(
                            //       'assets/images/ffdash.png',
                            //       color: Colors.white,
                            //       height: Adaptive.h(4),
                            //       width: Adaptive.w(4),
                            //     ),
                            //   ),
                            // ),
                            title: Text(
                              topMfsController.threeyearList[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    fontSize: 16.sp,
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
                                      scheme:
                                          topMfsController.threeyearList[index],
                                      isinNumber:
                                          topMfsController.threrYearIsin[index],
                                      category: '',
                                    ),
                                  ));
                            },
                          );
                        },
                        separatorBuilder: (context, index) =>
                            VerticalSpacer(1.h),
                        itemCount: 5),
                  )
                : SizedBox(),
            heading == '3-5 Years'
                ? Expanded(
                    child: ListView.separated(
                        padding: EdgeInsets.all(0),
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image.network(
                                topMfsController.threetoFiveyearsLogo[index]),
                            // leading: Container(
                            //   height: 5.h,
                            //   width: 10.w,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(10.sp),
                            //     color: Color(0xFF0E1330),
                            //   ),
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(6.5),
                            //     child: Image.asset(
                            //       'assets/images/ffdash.png',
                            //       color: Colors.white,
                            //       height: Adaptive.h(4),
                            //       width: Adaptive.w(4),
                            //     ),
                            //   ),
                            // ),
                            title: Text(
                              topMfsController.threetofiveyears[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    fontSize: 16.sp,
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
                                      scheme: topMfsController
                                          .threetofiveyears[index],
                                      isinNumber: topMfsController
                                          .threeYeartoFinveisin[index],
                                      category: '',
                                    ),
                                  ));
                            },
                          );
                        },
                        separatorBuilder: (context, index) =>
                            VerticalSpacer(1.h),
                        itemCount: 5),
                  )
                : SizedBox(),
            heading == '5+ Years'
                ? Expanded(
                    child: ListView.separated(
                        padding: EdgeInsets.all(0),
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image.network(
                              topMfsController.fiveYearLogo[index],
                            ),
                            // leading: Container(
                            //   height: 5.h,
                            //   width: 10.w,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(10.sp),
                            //     color: Color(0xFF0E1330),
                            //   ),
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(6.5),
                            //     child: Image.asset(
                            //       'assets/images/ffdash.png',
                            //       color: Colors.white,
                            //       height: Adaptive.h(4),
                            //       width: Adaptive.w(4),
                            //     ),
                            //   ),
                            // ),
                            title: Text(
                              topMfsController.fivePlusYears[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    fontSize: 16.sp,
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
                                      scheme:
                                          topMfsController.fivePlusYears[index],
                                      isinNumber:
                                          topMfsController.fivePlusIsin[index],
                                      category: '',
                                    ),
                                  ));
                            },
                          );
                        },
                        separatorBuilder: (context, index) =>
                            VerticalSpacer(1.h),
                        itemCount: 5),
                  )
                : SizedBox(),
          ],
        );
      }),
    );
  }
}
