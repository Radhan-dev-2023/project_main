import 'package:finfresh_mobile/controller/achController/ach_controller.dart';
import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/fatcha%20registration/fatcha_registeration.dart';
import 'package:finfresh_mobile/view/holding%20screen/screen_holdings.dart';
import 'package:finfresh_mobile/view/homeScreen/widgets/attension_widget.dart';
import 'package:finfresh_mobile/view/homeScreen/widgets/fatch_attension_widget.dart';
import 'package:finfresh_mobile/view/homeScreen/widgets/portfolio_mutual_fund.dart';
import 'package:finfresh_mobile/view/homeScreen/widgets/roundChart.dart';
import 'package:finfresh_mobile/view/homeScreen/widgets/six_mutual_fund_widget.dart';
import 'package:finfresh_mobile/view/kyc/uploading%20proofs/screen_upload_proof.dart';
import 'package:finfresh_mobile/view/kyc/uploading%20proofs/upload%20bank%20proof/upload_bank_proof.dart';
import 'package:finfresh_mobile/view/webview/screen_webview.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  Future<void> function() async {
    await Provider.of<DashBoardController>(context, listen: false)
        .getDashBoardDetails(context);
  }

  @override
  void initState() {
    super.initState();

    Provider.of<DashBoardController>(context, listen: false).getusername();
    function();
  }

  @override
  Widget build(BuildContext context) {
    // Brightness platformBrightness = MediaQuery.of(context).platformBrightness;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      // drawer: const DrawerWidget(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // leading: const SizedBox(),
            pinned: true,
            toolbarHeight: Adaptive.h(6),
            automaticallyImplyLeading: false,
            // backgroundColor: Colors.transparent,
            title: Consumer<DashBoardController>(
              builder: (context, dashBoardController, child) {
                return Text(
                  dashBoardController.dashBoardModel?.result?.data?.name == null
                      ? dashBoardController.username
                      : '${dashBoardController.dashBoardModel?.result?.data?.name}',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w500),
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Consumer<DashBoardController>(
                builder: (context, dashBoardController, child) {
                  if (dashBoardController.loadingDashboard == true) {
                    return const LoadingWidget();
                  }
                  return Container(
                    margin: EdgeInsets.only(
                        left: 15.sp, right: 15.sp, bottom: 18.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // VerticalSpacer(3.h),
                        dashBoardController.dashBoardModel?.result?.data
                                    ?.activationStatus?.statusCode ==
                                'S01'
                            ? const AttensionWidget()
                            : const SizedBox(),

                        dashBoardController.dashBoardModel?.result?.data
                                    ?.activationStatus?.statusCode ==
                                'S02'
                            ? SizedBox(
                                width: double.infinity,
                                child: Card(
                                  elevation: 5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      VerticalSpacer(1.h),
                                      ListTile(
                                        contentPadding: EdgeInsets.only(
                                          left: 9.sp,
                                          right: 15.sp,
                                        ),
                                        leading: const SizedBox(),
                                        title: Text(
                                          'Attention required!',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                fontSize: 17.5.sp,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 3.5.sp,
                                                // color: Color(0xFFACB2BA),
                                              ),
                                        ),
                                        subtitle: Text(
                                          'Upload Your Proof',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                color: Colors.grey,
                                              ),
                                        ),
                                        trailing: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ScreenUploadinProofs(),
                                                ));
                                          },
                                          child: SizedBox(
                                            width: Adaptive.w(23),
                                            height: Adaptive.h(5),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.sp),
                                                color: const Color(0xFF6C8FF8),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Upload',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        dashBoardController.dashBoardModel?.result?.data
                                    ?.activationStatus?.statusCode ==
                                'S03'
                            ? SizedBox(
                                width: double.infinity,
                                child: Card(
                                  elevation: 5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      VerticalSpacer(1.h),
                                      ListTile(
                                        contentPadding: EdgeInsets.only(
                                          left: 9.sp,
                                          right: 15.sp,
                                        ),
                                        leading: const SizedBox(),
                                        title: Text(
                                          'Attention required!',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                fontSize: 17.5.sp,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 3.5.sp,
                                                // color: Color(0xFFACB2BA),
                                              ),
                                        ),
                                        subtitle: Text(
                                          'Upload Your Bank Proof',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                color: Colors.grey,
                                              ),
                                        ),
                                        trailing: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ScreenBankProofs(),
                                                ));
                                          },
                                          child: SizedBox(
                                            width: Adaptive.w(23),
                                            height: Adaptive.h(5),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.sp),
                                                color: const Color(0xFF6C8FF8),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Upload',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      VerticalSpacer(1.h),
                                    ],
                                  ),
                                ),
                              )
                            : const SizedBox(),

                        dashBoardController.dashBoardModel?.result?.data
                                    ?.activationStatus?.statusCode ==
                                'S07'
                            ? SizedBox(
                                height: Adaptive.h(10),
                                width: double.infinity,
                                child: Card(
                                  elevation: 5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ListTile(
                                        title: Text(
                                          '${dashBoardController.dashBoardModel?.result?.data?.activationStatus?.message}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : const SizedBox(),

                        dashBoardController.dashBoardModel?.result?.data
                                    ?.activationStatus?.statusCode ==
                                'S04'
                            ? const FatchaAttension()
                            : const SizedBox(),
                        SizedBox(
                          // height: 15.h,
                          width: double.infinity,
                          child: Consumer<AchController>(
                              builder: (context, achController, _) {
                            return Visibility(
                              visible: dashBoardController
                                          .dashBoardModel
                                          ?.result
                                          ?.data
                                          ?.achmandate
                                          ?.achCompleted ==
                                      "Not completed"
                                  ? true
                                  : false,
                              child: Center(
                                child: Card(
                                  elevation: 5,
                                  child: Column(
                                    children: [
                                      VerticalSpacer(1.h),
                                      ListTile(
                                        contentPadding: EdgeInsets.only(
                                          left: 9.sp,
                                          right: 15.sp,
                                        ),
                                        title: Text(
                                          'Attention required!',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                fontSize: 17.5.sp,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 3.5.sp,
                                                // color: Color(0xFFACB2BA),
                                              ),
                                        ),
                                        subtitle: Text(
                                          'Register ACH Mandate',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                color: Colors.grey,
                                              ),
                                        ),
                                        leading: const SizedBox(),
                                        trailing: InkWell(
                                          onTap: () async {
                                            bool result = await achController
                                                .registerAch(context, false);
                                            if (result == true) {
                                              // ignore: use_build_context_synchronously
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ScreenWebview(
                                                          url: achController
                                                              .result),
                                                ),
                                              );
                                            }
                                          },
                                          child: SizedBox(
                                            width: Adaptive.w(23),
                                            height: Adaptive.h(5),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.sp),
                                                color: const Color(0xFF6C8FF8),
                                              ),
                                              child: Center(
                                                child: achController
                                                            .loadingAch ==
                                                        true
                                                    ? const CupertinoActivityIndicator(
                                                        color: Colors.white)
                                                    : Text(
                                                        'Register',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.sp,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      VerticalSpacer(1.h),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        VerticalSpacer(2.h),
                        dashBoardController.summaryModel?.result == null
                            ? SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Card(
                                  elevation: 5,
                                  // surfaceTintColor:
                                  //     const Color.fromARGB(255, 236, 230, 230),
                                  child: Padding(
                                    padding: EdgeInsets.all(13.sp),
                                    child: Column(
                                      children: [
                                        VerticalSpacer(1.h),
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: Text(
                                            'Mutual Funds Portfolio',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                        VerticalSpacer(2.h),
                                        Text(
                                          'Your portfolio is currently empty!',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        VerticalSpacer(1.h),
                                        const Text(
                                          'After you start investing,your mutual funds/n portfolio will appear here.',
                                          textAlign: TextAlign.center,
                                        ),
                                        VerticalSpacer(2.h),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : const PortfolioWidget(),
                        VerticalSpacer(2.h),
                        Text(
                          'Funds',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                          // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                        ),
                        VerticalSpacer(1.h),
                        const SixMutualFundWidget(),

                        VerticalSpacer(1.h),

                        // dashBoardController.summaryModel?.result == null
                        //     ? SizedBox(
                        //         width: MediaQuery.of(context).size.width,
                        //         child: Card(
                        //           elevation: 5,
                        //           // surfaceTintColor:
                        //           //     const Color.fromARGB(255, 236, 230, 230),
                        //           child: Padding(
                        //             padding: EdgeInsets.all(13.sp),
                        //             child: Column(
                        //               children: [
                        //                 VerticalSpacer(1.h),
                        //                 Align(
                        //                   alignment: Alignment.topLeft,
                        //                   child: Text(
                        //                     'Mutual Funds Portfolio',
                        //                     style: Theme.of(context)
                        //                         .textTheme
                        //                         .bodyMedium!
                        //                         .copyWith(
                        //                           fontSize: 17.sp,
                        //                           fontWeight: FontWeight.bold,
                        //                         ),
                        //                   ),
                        //                 ),
                        //                 VerticalSpacer(3.h),
                        //                 Text(
                        //                   'Your portfolio is currently empty!',
                        //                   style: Theme.of(context)
                        //                       .textTheme
                        //                       .bodyMedium!
                        //                       .copyWith(
                        //                         fontSize: 16.sp,
                        //                         fontWeight: FontWeight.bold,
                        //                       ),
                        //                 ),
                        //                 VerticalSpacer(1.h),
                        //                 const Text(
                        //                   'After you start investing,your mutual funds/n portfolio will appear here.',
                        //                   textAlign: TextAlign.center,
                        //                 ),
                        //                 VerticalSpacer(2.h),
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //       )
                        //: const PortFolioMutualFund(),
                        // VerticalSpacer(2.h),
                        // Text(
                        //   'Invest In Gold',
                        //   style:
                        //       Theme.of(context).textTheme.bodyMedium!.copyWith(
                        //             fontSize: 18.sp,
                        //             fontWeight: FontWeight.bold,
                        //           ),
                        // ),
                        // VerticalSpacer(2.h),
                        // SizedBox(
                        //   height: Adaptive.h(26),
                        //   width: MediaQuery.of(context).size.width,
                        //   child: Card(
                        //     elevation: 9,
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(20.sp),
                        //     ),
                        //     child: Container(
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(20.sp),
                        //         gradient: const LinearGradient(
                        //           begin: Alignment.topLeft,
                        //           end: Alignment.bottomRight,
                        //           colors: [
                        //             Color(0xFF6C8FF8),
                        //             Color(0xFF6C8FF8)
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        // Align(
                        //   alignment: Alignment.center,
                        //   child: SizedBox(
                        //     width: Adaptive.w(42),
                        //     child: ButtonWidget(
                        //       btName: 'Buy Now',
                        //       onTap: () {},
                        //     ),
                        //   ),
                        // ),
                        // VerticalSpacer(1.h),
                        // Text(
                        //   'Create Your Investment Habit',
                        //   style:
                        //       Theme.of(context).textTheme.bodyMedium!.copyWith(
                        //             fontSize: 18.sp,
                        //             fontWeight: FontWeight.bold,
                        //           ),
                        // ),
                        // VerticalSpacer(2.h),
                        // SizedBox(
                        //   child: Column(
                        //     children: [
                        //       Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           SizedBox(
                        //             height: Adaptive.h(12),
                        //             width: Adaptive.w(20),
                        //             child: Card(
                        //               elevation: 6,
                        //               color: const Color(0xFFE1F5EA),
                        //               child: Column(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.center,
                        //                 children: [
                        //                   VerticalSpacer(1.h),
                        //                   InkWell(
                        //                     onTap: () {
                        //                       // Navigator.push(
                        //                       //   context,
                        //                       //   MaterialPageRoute(
                        //                       //     builder: (context) => const TopMfsScreen(
                        //                       //       category: 'Hybrid: Aggressive',
                        //                       //       appbarname: 'Aggressive',
                        //                       //     ),
                        //                       //   ),
                        //                       // );
                        //                     },
                        //                     child: const Collectionwidget(
                        //                       image:
                        //                           'assets/images/graduation-hat_999735.png',
                        //                       color: Color(0xFFA0CFA2),
                        //                     ),
                        //                   ),
                        //                   VerticalSpacer(1.h),
                        //                   // Text(
                        //                   //   'Aggressive',
                        //                   //   style: TextStyle(
                        //                   //     fontSize: 15.5.sp,
                        //                   //     fontWeight: FontWeight.bold,
                        //                   //   ),
                        //                   // ),
                        //                   // VerticalSpacer(1.h),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //           SizedBox(
                        //             height: Adaptive.h(12),
                        //             width: Adaptive.w(20),
                        //             child: Card(
                        //               color: const Color(0xFFFDEAD3),
                        //               elevation: 6,
                        //               child: Column(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.center,
                        //                 children: [
                        //                   VerticalSpacer(1.h),
                        //                   InkWell(
                        //                     onTap: () {
                        //                       // Navigator.push(
                        //                       //   context,
                        //                       //   MaterialPageRoute(
                        //                       //     builder: (context) => const TopMfsScreen(
                        //                       //       category: 'Equity: Flexi Cap',
                        //                       //       appbarname: "Flexi Cap",
                        //                       //     ),
                        //                       //   ),
                        //                       // );
                        //                     },
                        //                     child: const Collectionwidget(
                        //                       image:
                        //                           'assets/images/wedding-ring_6612299.png',
                        //                       color: Color(0xFFF8B39B),
                        //                     ),
                        //                   ),
                        //                   VerticalSpacer(1.h),
                        //                   // VerticalSpacer(3.h),
                        //                   // Text('Flexi Cap',
                        //                   //     style: TextStyle(
                        //                   //       fontSize: 15.5.sp,
                        //                   //       fontWeight: FontWeight.bold,
                        //                   //     )),
                        //                   // VerticalSpacer(1.h),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //           SizedBox(
                        //             height: Adaptive.h(12),
                        //             width: Adaptive.w(20),
                        //             child: Card(
                        //               color: const Color(0xFFF9F5FF),
                        //               elevation: 6,
                        //               child: Column(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.center,
                        //                 children: [
                        //                   VerticalSpacer(1.h),
                        //                   InkWell(
                        //                     onTap: () {
                        //                       // Navigator.push(
                        //                       //   context,
                        //                       //   MaterialPageRoute(
                        //                       //     builder: (context) => const TopMfsScreen(
                        //                       //       category: 'Equity: Multi Cap',
                        //                       //       appbarname: 'Multi Cap',
                        //                       //     ),
                        //                       //   ),
                        //                       // );
                        //                     },
                        //                     child: const Collectionwidget(
                        //                       image:
                        //                           'assets/images/saving_8244497.png',
                        //                       color: Color(0xFF8380B3),
                        //                     ),
                        //                   ),
                        //                   VerticalSpacer(1.h),
                        //                   // Text('Multi Cap',
                        //                   //     style: TextStyle(
                        //                   //       fontSize: 15.5.sp,
                        //                   //       fontWeight: FontWeight.bold,
                        //                   //     )),
                        //                   // VerticalSpacer(1.h),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //           SizedBox(
                        //             height: Adaptive.h(12),
                        //             width: Adaptive.w(20),
                        //             child: Card(
                        //               elevation: 6,
                        //               color: const Color(0xFFE1F5EA),
                        //               child: Column(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.center,
                        //                 children: [
                        //                   VerticalSpacer(1.h),
                        //                   InkWell(
                        //                     onTap: () {
                        //                       // Navigator.push(
                        //                       //   context,
                        //                       //   MaterialPageRoute(
                        //                       //     builder: (context) => const TopMfsScreen(
                        //                       //       category: 'Equity: Large Cap',
                        //                       //       appbarname: 'Large Cap',
                        //                       //     ),
                        //                       //   ),
                        //                       // );
                        //                     },
                        //                     child: const Collectionwidget(
                        //                       image:
                        //                           'assets/images/pension_8381454.png',
                        //                       // image: 'assets/images/bank_8690572.png',
                        //                       color: Color(0xFF71BEE7),
                        //                     ),
                        //                   ),
                        //                   VerticalSpacer(1.h),
                        //                   // Text(
                        //                   //   'Aggressive',
                        //                   //   style: TextStyle(
                        //                   //     fontSize: 15.5.sp,
                        //                   //     fontWeight: FontWeight.bold,
                        //                   //   ),
                        //                   // ),
                        //                   // VerticalSpacer(1.h),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //       VerticalSpacer(1.h),
                        //       Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Text(
                        //             'Education',
                        //             style: TextStyle(
                        //               fontSize: 15.5.sp,
                        //               fontWeight: FontWeight.bold,
                        //             ),
                        //           ),
                        //           // HorizontalSpacer(16.w),
                        //           Text('Marriage',
                        //               style: TextStyle(
                        //                 fontSize: 15.5.sp,
                        //                 fontWeight: FontWeight.bold,
                        //               )),
                        //           // HorizontalSpacer(19.w),
                        //           Text('Savings',
                        //               style: TextStyle(
                        //                 fontSize: 15.5.sp,
                        //                 fontWeight: FontWeight.bold,
                        //               )),
                        //           Text('Retirement',
                        //               style: TextStyle(
                        //                   fontSize: 15.5.sp,
                        //                   fontWeight: FontWeight.bold)),
                        //         ],
                        //       ),
                        //       VerticalSpacer(1.5.h),
                        //       Row(
                        //         children: [
                        //           SizedBox(
                        //             height: Adaptive.h(12),
                        //             width: Adaptive.w(20),
                        //             child: Card(
                        //               color: const Color(0xFFF9FFB5),
                        //               elevation: 6,
                        //               child: Column(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.center,
                        //                 children: [
                        //                   VerticalSpacer(1.h),
                        //                   InkWell(
                        //                     onTap: () {},
                        //                     child: const Collectionwidget(
                        //                       image:
                        //                           'assets/images/car_7264084.png',
                        //                       color: Color.fromARGB(
                        //                           255, 219, 213, 88),
                        //                       // color: Color(0xFFC5714E),
                        //                     ),
                        //                   ),
                        //                   VerticalSpacer(1.h),
                        //                   // Text('Mid Cap',
                        //                   //     style: TextStyle(
                        //                   //       fontSize: 15.5.sp,
                        //                   //       fontWeight: FontWeight.bold,
                        //                   //     )),
                        //                   // VerticalSpacer(1.h),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //           HorizontalSpacer(4.5.w),
                        //           SizedBox(
                        //             height: Adaptive.h(12),
                        //             width: Adaptive.w(20),
                        //             child: Card(
                        //               elevation: 6,
                        //               color: const Color.fromARGB(
                        //                   255, 252, 219, 216),
                        //               child: Column(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.center,
                        //                 children: [
                        //                   VerticalSpacer(1.h),
                        //                   InkWell(
                        //                     onTap: () {},
                        //                     child: const Collectionwidget(
                        //                       image:
                        //                           'assets/images/debt_8891723.png',
                        //                       color: Color.fromARGB(
                        //                           255, 238, 107, 95),
                        //                     ),
                        //                   ),
                        //                   VerticalSpacer(1.h),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //           HorizontalSpacer(4.5.w),
                        //           SizedBox(
                        //             height: Adaptive.h(12),
                        //             width: Adaptive.w(20),
                        //             child: Card(
                        //               elevation: 6,
                        //               color: const Color.fromARGB(
                        //                   255, 239, 223, 253),
                        //               child: Column(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.center,
                        //                 children: [
                        //                   VerticalSpacer(1.h),
                        //                   InkWell(
                        //                     onTap: () {},
                        //                     child: const Collectionwidget(
                        //                       image:
                        //                           'assets/images/mortgage_13384497.png',
                        //                       color: Color(0xFF9D94FF),
                        //                     ),
                        //                   ),
                        //                   VerticalSpacer(1.h),
                        //                   // Text(
                        //                   //   'Aggressive',
                        //                   //   style: TextStyle(
                        //                   //     fontSize: 15.5.sp,
                        //                   //     fontWeight: FontWeight.bold,
                        //                   //   ),
                        //                   // ),
                        //                   // VerticalSpacer(1.h),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //       VerticalSpacer(1.h),
                        //       Row(
                        //         children: [
                        //           Text('New Vehicle',
                        //               style: TextStyle(
                        //                 fontSize: 15.5.sp,
                        //                 fontWeight: FontWeight.bold,
                        //               )),
                        //           HorizontalSpacer(7.w),
                        //           Text('Debt',
                        //               style: TextStyle(
                        //                 fontSize: 15.5.sp,
                        //                 fontWeight: FontWeight.bold,
                        //               )),
                        //           HorizontalSpacer(16.w),
                        //           Text('Home Loan',
                        //               style: TextStyle(
                        //                 fontSize: 15.5.sp,
                        //                 fontWeight: FontWeight.bold,
                        //               )),
                        //         ],
                        //       ),
                        //       VerticalSpacer(1.h),
                        //       SizedBox(
                        //         width: Adaptive.w(50),
                        //         child: ButtonWidget(
                        //           btName: 'Schedule a call',
                        //           onTap: () {},
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),

                        VerticalSpacer(10.h),
                      ],
                    ),
                  );
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
