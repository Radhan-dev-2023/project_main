import 'package:finfresh_mobile/controller/top%20MFs%20controller/top_mfs_controller.dart';
import 'package:finfresh_mobile/model/goal%20model/goal_model.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/stock_detail_screen.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/widgets/overview_in_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenGolas extends StatelessWidget {
  final String heading;
  final String image;
  final List<FundListGoal> listname;
  const ScreenGolas(
      {super.key,
      required this.heading,
      required this.image,
      required this.listname});

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
              //   borderRadius: BorderRadius.only(
              //     bottomLeft: Radius.circular(20.sp),
              //     bottomRight: Radius.circular(20.sp),
              //   ),
              // ),
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
            VerticalSpacer(1.h),
            Expanded(
              child: ListView.separated(
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network(listname[index].image ?? ''),
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
                        listname[index].fundName ?? '',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
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
                                scheme: listname[index].fundName ?? '',
                                isinNumber: listname[index].isin ?? '',
                                category: listname[index].category ?? '',
                              ),
                            ));
                      },
                    );
                  },
                  separatorBuilder: (context, index) => VerticalSpacer(1.h),
                  itemCount: 5),
            )
            //     : const SizedBox(),
            // heading == '0-3 Years'
            //     ? Expanded(
            //         child: ListView.separated(
            //             padding: const EdgeInsets.all(0),
            //             itemBuilder: (context, index) {
            //               return ListTile(
            //                 leading: Image.network(topMfsController
            //                         .goalsModel
            //                         ?.result
            //                         ?.funds?[1]
            //                         .fundList?[index]
            //                         .image ??
            //                     ''),
            //                 // leading: Container(
            //                 //   height: 5.h,
            //                 //   width: 10.w,
            //                 //   decoration: BoxDecoration(
            //                 //     borderRadius: BorderRadius.circular(10.sp),
            //                 //     color: Color(0xFF0E1330),
            //                 //   ),
            //                 //   child: Padding(
            //                 //     padding: const EdgeInsets.all(6.5),
            //                 //     child: Image.asset(
            //                 //       'assets/images/ffdash.png',
            //                 //       color: Colors.white,
            //                 //       height: Adaptive.h(4),
            //                 //       width: Adaptive.w(4),
            //                 //     ),
            //                 //   ),
            //                 // ),
            //                 title: Text(
            //                   topMfsController.goalsModel?.result?.funds?[1]
            //                           .fundList?[index].fundName ??
            //                       '',
            //                   style: Theme.of(context)
            //                       .textTheme
            //                       .labelLarge!
            //                       .copyWith(
            //                         fontSize: 16.sp,
            //                         fontWeight: FontWeight.w400,
            //                         letterSpacing: 3.sp,
            //                       ),
            //                   maxLines: 2,
            //                 ),
            //                 trailing: Container(
            //                   height: Adaptive.h(3),
            //                   width: Adaptive.w(15),
            //                   decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(20.sp),
            //                     color: Colors.grey.withOpacity(0.2),
            //                   ),
            //                   child: Center(
            //                     child: Padding(
            //                       padding: const EdgeInsets.only(bottom: 2),
            //                       child: CustomTextWidget(
            //                         text: 'Invest',
            //                         fontSize: 14.sp,
            //                         color: const Color(0xFF6C8FF8),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //                 onTap: () {
            //                   Navigator.push(
            //                       context,
            //                       MaterialPageRoute(
            //                         builder: (context) => StockDetailsScreen(
            //                           scheme: topMfsController
            //                                   .goalsModel
            //                                   ?.result
            //                                   ?.funds?[1]
            //                                   .fundList?[index]
            //                                   .fundName ??
            //                               '',
            //                           isinNumber: topMfsController
            //                                   .goalsModel
            //                                   ?.result
            //                                   ?.funds?[1]
            //                                   .fundList?[index]
            //                                   .isin ??
            //                               '',
            //                           category: topMfsController
            //                                   .goalsModel
            //                                   ?.result
            //                                   ?.funds?[1]
            //                                   .fundList?[index]
            //                                   .category ??
            //                               '',
            //                         ),
            //                       ));
            //                 },
            //               );
            //             },
            //             separatorBuilder: (context, index) =>
            //                 VerticalSpacer(1.h),
            //             itemCount: 5),
            //       )
            //     : const SizedBox(),
            // heading == '3-5 Years'
            //     ? Expanded(
            //         child: ListView.separated(
            //             padding: const EdgeInsets.all(0),
            //             itemBuilder: (context, index) {
            //               return ListTile(
            //                 leading: Image.network(topMfsController
            //                         .goalsModel
            //                         ?.result
            //                         ?.funds?[2]
            //                         .fundList?[index]
            //                         .image ??
            //                     ''),
            //                 // leading: Container(
            //                 //   height: 5.h,
            //                 //   width: 10.w,
            //                 //   decoration: BoxDecoration(
            //                 //     borderRadius: BorderRadius.circular(10.sp),
            //                 //     color: Color(0xFF0E1330),
            //                 //   ),
            //                 //   child: Padding(
            //                 //     padding: const EdgeInsets.all(6.5),
            //                 //     child: Image.asset(
            //                 //       'assets/images/ffdash.png',
            //                 //       color: Colors.white,
            //                 //       height: Adaptive.h(4),
            //                 //       width: Adaptive.w(4),
            //                 //     ),
            //                 //   ),
            //                 // ),
            //                 title: Text(
            //                   topMfsController.goalsModel?.result?.funds?[2]
            //                           .fundList?[index].fundName ??
            //                       '',
            //                   style: Theme.of(context)
            //                       .textTheme
            //                       .labelLarge!
            //                       .copyWith(
            //                         fontSize: 16.sp,
            //                         fontWeight: FontWeight.w400,
            //                         letterSpacing: 3.sp,
            //                       ),
            //                   maxLines: 2,
            //                 ),
            //                 trailing: Container(
            //                   height: Adaptive.h(3),
            //                   width: Adaptive.w(15),
            //                   decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(20.sp),
            //                     color: Colors.grey.withOpacity(0.2),
            //                   ),
            //                   child: Center(
            //                     child: Padding(
            //                       padding: const EdgeInsets.only(bottom: 2),
            //                       child: CustomTextWidget(
            //                         text: 'Invest',
            //                         fontSize: 14.sp,
            //                         color: const Color(0xFF6C8FF8),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //                 onTap: () {
            //                   Navigator.push(
            //                       context,
            //                       MaterialPageRoute(
            //                         builder: (context) => StockDetailsScreen(
            //                           scheme: topMfsController
            //                                   .goalsModel
            //                                   ?.result
            //                                   ?.funds?[2]
            //                                   .fundList?[index]
            //                                   .fundName ??
            //                               '',
            //                           isinNumber: topMfsController
            //                                   .goalsModel
            //                                   ?.result
            //                                   ?.funds?[2]
            //                                   .fundList?[index]
            //                                   .isin ??
            //                               '',
            //                           category: topMfsController
            //                                   .goalsModel
            //                                   ?.result
            //                                   ?.funds?[2]
            //                                   .fundList?[index]
            //                                   .category ??
            //                               '',
            //                         ),
            //                       ));
            //                 },
            //               );
            //             },
            //             separatorBuilder: (context, index) =>
            //                 VerticalSpacer(1.h),
            //             itemCount: 5),
            //       )
            //     : const SizedBox(),
            // heading == '5+ Years'
            //     ? Expanded(
            //         child: ListView.separated(
            //             padding: const EdgeInsets.all(0),
            //             itemBuilder: (context, index) {
            //               return ListTile(
            //                 leading: Image.network(
            //                   topMfsController.goalsModel?.result?.funds?[3]
            //                           .fundList?[index].image ??
            //                       '',
            //                 ),
            //                 // leading: Container(
            //                 //   height: 5.h,
            //                 //   width: 10.w,
            //                 //   decoration: BoxDecoration(
            //                 //     borderRadius: BorderRadius.circular(10.sp),
            //                 //     color: Color(0xFF0E1330),
            //                 //   ),
            //                 //   child: Padding(
            //                 //     padding: const EdgeInsets.all(6.5),
            //                 //     child: Image.asset(
            //                 //       'assets/images/ffdash.png',
            //                 //       color: Colors.white,
            //                 //       height: Adaptive.h(4),
            //                 //       width: Adaptive.w(4),
            //                 //     ),
            //                 //   ),
            //                 // ),
            //                 title: Text(
            //                   topMfsController.goalsModel?.result?.funds?[3]
            //                           .fundList?[index].fundName ??
            //                       '',
            //                   style: Theme.of(context)
            //                       .textTheme
            //                       .labelLarge!
            //                       .copyWith(
            //                         fontSize: 16.sp,
            //                         fontWeight: FontWeight.w400,
            //                         letterSpacing: 3.sp,
            //                       ),
            //                   maxLines: 2,
            //                 ),
            //                 trailing: Container(
            //                   height: Adaptive.h(3),
            //                   width: Adaptive.w(15),
            //                   decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(20.sp),
            //                     color: Colors.grey.withOpacity(0.2),
            //                   ),
            //                   child: Center(
            //                     child: Padding(
            //                       padding: const EdgeInsets.only(bottom: 2),
            //                       child: CustomTextWidget(
            //                         text: 'Invest',
            //                         fontSize: 14.sp,
            //                         color: const Color(0xFF6C8FF8),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //                 onTap: () {
            //                   Navigator.push(
            //                       context,
            //                       MaterialPageRoute(
            //                         builder: (context) => StockDetailsScreen(
            //                           scheme: topMfsController
            //                                   .goalsModel
            //                                   ?.result
            //                                   ?.funds?[3]
            //                                   .fundList?[index]
            //                                   .fundName ??
            //                               '',
            //                           isinNumber: topMfsController
            //                                   .goalsModel
            //                                   ?.result
            //                                   ?.funds?[3]
            //                                   .fundList?[index]
            //                                   .isin ??
            //                               '',
            //                           category: topMfsController
            //                                   .goalsModel
            //                                   ?.result
            //                                   ?.funds?[3]
            //                                   .fundList?[index]
            //                                   .category ??
            //                               '',
            //                         ),
            //                       ));
            //                 },
            //               );
            //             },
            //             separatorBuilder: (context, index) =>
            //                 VerticalSpacer(1.h),
            //             itemCount: 5),
            //       )
            //     : const SizedBox(),
          ],
        );
      }),
    );
  }
}
