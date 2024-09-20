import 'dart:developer';

import 'package:finfresh_mobile/controller/top%20MFs%20controller/top_mfs_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/stock_detail_screen.dart';
import 'package:finfresh_mobile/view/top%20mfs/widget/duration_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenAllMutualFund extends StatefulWidget {
  const ScreenAllMutualFund({super.key});

  @override
  State<ScreenAllMutualFund> createState() => _ScreenAllMutualFundState();
}

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _ScreenAllMutualFundState extends State<ScreenAllMutualFund> {
  @override
  void initState() {
    super.initState();
    log('calling init');
    Provider.of<TopMFsController>(context, listen: false)
        .callinginInit(context, 'All');
    Provider.of<TopMFsController>(context, listen: false)
        .getSchemeAllCategory(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mutual Funds'),
        actions: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Consumer<TopMFsController>(
                      builder: (context, snapshot, _) {
                    return Container(
                      child: Center(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            VerticalSpacer(1.5.h),
                            Text(
                              'Category',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(snapshot.categoryList[index]),
                                    trailing: Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: const Color(0xFF4D84BD),
                                      value: snapshot.currentIndex == index,
                                      onChanged: (bool? value) {
                                        if (value != null) {
                                          snapshot.changeCurrentIndex(index);
                                          snapshot.getTopMfsFRomPeriod(context,
                                              snapshot.categoryList[index]);
                                        } else {
                                          snapshot.changeCurrentIndex(-1);
                                        }
                                        Navigator.pop(context);
                                        // topMfsController
                                        //     .changeCurrentIndex(index);
                                        // if (topMfsController.currentIndex ==
                                        //     index) {
                                        //   log('index ==$index');
                                        //   topMfsController.updateRadioButton(
                                        //       value ?? false);
                                        // }
                                      },
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    VerticalSpacer(0.h),
                                itemCount: snapshot.categoryList.length,
                              ),
                            )
                            // ElevatedButton(
                            //   onPressed: () {
                            //     // Close the bottom sheet when button is pressed
                            //     Navigator.pop(context);
                            //   },
                            //   child: Text('Close'),
                            // ),
                          ],
                        ),
                      ),
                    );
                  });
                },
              );
            },
            child: Icon(Icons.filter_list),
          ),
          HorizontalSpacer(2.w),
        ],
      ),
      body: Consumer<TopMFsController>(
          builder: (context, topMfsController, child) {
        if (topMfsController.loading == true) {
          return const LoadingWidget();
        } else {
          return Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SearchField(),
                Padding(
                  padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
                  child: Container(
                      height: Adaptive.h(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.sp),
                          border: Border.all(
                              color: const Color.fromARGB(255, 192, 191, 191))),
                      child: TextFormField(
                        controller: topMfsController.queryController,
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(fontSize: 16.sp),
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          // helperText: '',
                          prefixIcon: Icon(
                            Icons.search,
                            size: Adaptive.h(2.3),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none, // Focus border color
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12.0.sp),
                          hintText: 'Search',
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            topMfsController.searchItems();
                          }
                        },
                      )),
                ),
                VerticalSpacer(Adaptive.h(2)),
                Padding(
                  padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${topMfsController.filteredListForAllFunds.length ?? 0} SCHEMES',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 15.sp,
                              // fontWeight: FontWeight.w400,
                              letterSpacing: 3.sp,
                            ),
                      ),
                      DurationButton(
                        category: topMfsController
                            .categoryList[topMfsController.currentIndex],
                      ),
                    ],
                  ),
                ),
                VerticalSpacer(2.h),
                Expanded(
                  child: topMfsController.lodingList == true
                      ? const LoadingWidget()
                      : topMfsController.filteredListForAllFunds.isEmpty
                          ? Center(
                              child: Text(
                              'No data found',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ))
                          : ListView.separated(
                              itemBuilder: (context, index) {
                                topMfsController.returnValueallFunds(index);
                                return InkWell(
                                  onTap: () {
                                    log('logo  ${topMfsController.filteredListForAllFunds[index].logo}, ${topMfsController.filteredListForAllFunds[index].isinNo} ,,   ${topMfsController.filteredListForAllFunds[index].schemeCategory},,,${topMfsController.filteredListForAllFunds[index].schemeAmfi}');

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            StockDetailsScreen(
                                          scheme:
                                              '${topMfsController.filteredListForAllFunds[index].schemeAmfi}',
                                          isinNumber: topMfsController
                                                  .filteredListForAllFunds[
                                                      index]
                                                  .isinNo ??
                                              '',
                                          category: topMfsController
                                                  .filteredListForAllFunds[
                                                      index]
                                                  .schemeCategory ??
                                              "",
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(20.sp),
                                      // color: Colors.white,
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //     color: Colors.grey.withOpacity(0.1),
                                      //     spreadRadius: 0,
                                      //     blurRadius: 5,
                                      //     offset: Offset(0, 0),
                                      //   ),
                                      // ],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 15.sp,
                                        right: 15.sp,
                                      ),
                                      child: Card(
                                        shadowColor:
                                            Colors.black.withOpacity(0.2),
                                        elevation: 6,
                                        child: Padding(
                                          padding: EdgeInsets.all(10.sp),
                                          child: Column(
                                            children: [
                                              VerticalSpacer(0.5.h),
                                              Row(
                                                children: [
                                                  HorizontalSpacer(1.w),
                                                  SizedBox(
                                                    height: 5.h,
                                                    width: 10.w,
                                                    child: Image.network(
                                                      topMfsController
                                                              .filteredListForAllFunds[
                                                                  index]
                                                              .logo ??
                                                          '',
                                                      fit: BoxFit.fill,
                                                      errorBuilder: (context,
                                                          error, stackTrace) {
                                                        return const SizedBox();
                                                      },
                                                    ),
                                                  ),
                                                  HorizontalSpacer(1.w),
                                                  Expanded(
                                                    child: Text(
                                                      '${topMfsController.filteredListForAllFunds[index].schemeAmfi}',
                                                      overflow:
                                                          TextOverflow.visible,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                            fontSize: 17.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            letterSpacing: 3.sp,
                                                          ),
                                                    ),
                                                  ),
                                                  HorizontalSpacer(1.w),
                                                ],
                                              ),
                                              VerticalSpacer(2.h),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  HorizontalSpacer(2.w),
                                                  Expanded(
                                                    child: Text(
                                                      topMfsController
                                                              .filteredListForAllFunds[
                                                                  index]
                                                              .schemeCategory ??
                                                          "",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                            fontSize: 16.sp,
                                                            // fontWeight:
                                                            //     FontWeight.w500,
                                                            color: const Color(
                                                                0xFFF7BF05),
                                                          ),
                                                      overflow:
                                                          TextOverflow.visible,
                                                    ),
                                                  ),
                                                  Container(
                                                    height: Adaptive.h(3),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        12.sp,
                                                      ),
                                                      color: Color.fromARGB(255,
                                                              253, 217, 214)
                                                          .withOpacity(0.5),
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                        left: 12.sp,
                                                        right: 12.sp,
                                                        top: 6.sp,
                                                        bottom: 8.sp,
                                                      ),
                                                      child: Text(
                                                        '${topMfsController.filteredListForAllFunds[index].riskometer}',
                                                        style: TextStyle(
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: topMfsController
                                                                          .filteredListForAllFunds[
                                                                              index]
                                                                          .riskometer ==
                                                                      'Very High' ||
                                                                  topMfsController
                                                                          .filteredListForAllFunds[
                                                                              index]
                                                                          .riskometer ==
                                                                      'High'
                                                              ? Colors.red
                                                              : Colors.amber,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  HorizontalSpacer(2.5.w)
                                                ],
                                              ),
                                              VerticalSpacer(1.h),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0, right: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Scheme Asset',
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 15.sp,
                                                          ),
                                                        ),
                                                        VerticalSpacer(0.5.sp),
                                                        Text(
                                                            '₹ ${topMfsController.filteredListForAllFunds[index].schemeAssets}')
                                                      ],
                                                    ),

                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '${topMfsController.returns} Return',
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 15.sp,
                                                          ),
                                                        ),
                                                        VerticalSpacer(0.5.sp),
                                                        Text(
                                                          '${topMfsController.returnPercentageinAllFunds}%',
                                                          style: TextStyle(
                                                            color: const Color(
                                                                0xFF5DBB63),
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    // HorizontalSpacer(2.5.w)
                                                  ],
                                                ),
                                              ),
                                              VerticalSpacer(0.5.h),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  VerticalSpacer(1.h),
                              itemCount: topMfsController
                                      .filteredListForAllFunds.length ??
                                  0,
                            ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
