import 'dart:developer';

import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:finfresh_mobile/controller/holdingns%20controller/holdings_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/stock_detail_screen.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenMyHoldings extends StatefulWidget {
  final String isinNumber;
  final String trxnumber;
  final String productname;
  const ScreenMyHoldings(
      {super.key,
      required this.isinNumber,
      required this.trxnumber,
      required this.productname});

  @override
  State<ScreenMyHoldings> createState() => _ScreenMyHoldingsState();
}

final GlobalKey<ScaffoldState> scaffoldStateholdings =
    GlobalKey<ScaffoldState>();

class _ScreenMyHoldingsState extends State<ScreenMyHoldings> {
  @override
  void initState() {
    log('widget.isinumber :${widget.isinNumber}');
    super.initState();
    Provider.of<HoldingsController>(context, listen: false)
        .fetchReportDetails(context, widget.isinNumber, widget.trxnumber);
    Provider.of<HoldingsController>(context, listen: false).currentindex = 0;
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    return Scaffold(
      key: scaffoldStateholdings,
      appBar: AppBar(
        title: const Text('My Holdings'),
      ),
      body: Consumer<HoldingsController>(
          builder: (context, holdingController, _) {
        log('avregenav===${holdingController.reportDetailsModel?.result?.averageNav ?? '-'}');
        return Container(
          margin: EdgeInsets.all(18.sp),
          child: holdingController.loading == true
              ? const LoadingWidget()
              : Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        surfaceTintColor: Colors.transparent,
                        child: Padding(
                          padding: EdgeInsets.all(15.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              VerticalSpacer(1.h),
                              Text(
                                holdingController.reportDetailsModel?.result
                                        ?.schemeName ??
                                    '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              VerticalSpacer(1.h),
                              Text(
                                ' ${holdingController.reportDetailsModel?.result?.totalAmount ?? ''}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      VerticalSpacer(2.h),
                                      const Text('Investment'),
                                      VerticalSpacer(1.h),
                                      const Text('Gains'),
                                      VerticalSpacer(1.h),
                                      const Text('Growth(Absolute)'),
                                      VerticalSpacer(1.h),
                                      const Text('Total Units'),
                                      VerticalSpacer(1.h),
                                      const Text('Average NAV'),
                                      VerticalSpacer(1.h),
                                      const Text('Current NAV'),
                                      VerticalSpacer(1.h),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      VerticalSpacer(2.h),
                                      Text(
                                          ' ${holdingController.reportDetailsModel?.result?.investmentAmount ?? '-'}'),
                                      VerticalSpacer(1.h),
                                      Text(
                                        ' ${holdingController.reportDetailsModel?.result?.gains.toString() ?? '-'}',
                                        style: const TextStyle(
                                            color: Colors.green),
                                      ),
                                      VerticalSpacer(1.h),
                                      Text(
                                        holdingController.reportDetailsModel
                                                ?.result?.growthAbsolute ??
                                            '',
                                        style: const TextStyle(
                                            color: Colors.green),
                                      ),
                                      VerticalSpacer(1.h),
                                      Text(holdingController.reportDetailsModel
                                              ?.result?.totalUnits
                                              .toString() ??
                                          '-'),
                                      VerticalSpacer(1.h),
                                      Text(
                                          '${holdingController.reportDetailsModel?.result?.averageNav ?? '-'}'),
                                      VerticalSpacer(1.h),
                                      Text(
                                          '${holdingController.reportDetailsModel?.result?.currentNav ?? '-'}'),
                                      VerticalSpacer(1.h),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    VerticalSpacer(2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            log(
                              holdingController.reportDetailsModel?.result
                                      ?.schemecategory ??
                                  '',
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StockDetailsScreen(
                                    scheme: holdingController.reportDetailsModel
                                            ?.result?.schemeName ??
                                        '',
                                    isinNumber: widget.isinNumber,
                                    category: holdingController
                                            .reportDetailsModel
                                            ?.result
                                            ?.schemecategory ??
                                        '',
                                  ),
                                ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.sp),
                              color: const Color(0xFF4D84BD),
                            ),
                            height: Adaptive.h(6),
                            width: Adaptive.w(40),
                            child: const Center(
                              child: Text(
                                'ADD',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // HorizontalSpacer(Adaptive.w(18)),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            // color: brightness == Brightness.light
                            //     ? Colors.white
                            //     : const Color(0xFF0E1330),
                          ),
                          height: Adaptive.h(5.7),
                          // width: 120,
                          width: 40.w,
                          child: Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: DropdownButton(
                              value: holdingController.redeemValue,
                              isExpanded: true,
                              underline: Container(
                                height: 0,
                              ),
                              items: holdingController.radeemList
                                  .map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                holdingController
                                    .updateRedeemValue(value ?? '');
                                showmodelsheet(value ?? '', widget.productname);
                                // holdingController.sendMailToClinet(
                                //   Provider.of<DashBoardController>(
                                //         context,
                                //         listen: false,
                                //       )
                                //           .dashBoardModel
                                //           ?.result
                                //           ?.data
                                //           ?.phoneNumber ??
                                //       '',
                                //   Provider.of<DashBoardController>(
                                //         context,
                                //         listen: false,
                                //       ).dashBoardModel?.result?.data?.name ??
                                //       '',
                                //   widget.productname,
                                //   value ?? '',
                                //   context,
                                // );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    VerticalSpacer(3.h),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 3.h,
                      child: Row(
                        children: [
                          const Text('Folio'),
                          HorizontalSpacer(3.w),
                          Expanded(
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                holdingController
                                                    .changeindex(index);
                                              },
                                              child: Container(
                                                height: 3.h,
                                                width: 25.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.sp),
                                                  color: holdingController
                                                              .currentindex ==
                                                          index
                                                      ? Colors.purple
                                                      : const Color.fromARGB(
                                                          255, 224, 219, 219),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    holdingController
                                                            .reportDetailsModel
                                                            ?.result
                                                            ?.purchaseDetails?[
                                                                index]
                                                            .folio ??
                                                        '',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: holdingController
                                                                  .currentindex ==
                                                              index
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    HorizontalSpacer(3.w),
                                itemCount: holdingController.reportDetailsModel
                                        ?.result?.purchaseDetails?.length ??
                                    0),
                          ),
                        ],
                      ),
                    ),
                    VerticalSpacer(2.h),
                    const Divider(
                      color: Color.fromARGB(255, 224, 219, 219),
                    ),
                    // VerticalSpacer(1.h),
                    const Text('Transaction'),
                    const Divider(
                      color: Color.fromARGB(255, 224, 219, 219),
                    ),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(holdingController
                                            .reportDetailsModel
                                            ?.result
                                            ?.purchaseDetails?[
                                                holdingController.currentindex]
                                            .transactions?[index]
                                            .transactionType ??
                                        ''),
                                    Text(
                                      ' ${holdingController.reportDetailsModel?.result?.purchaseDetails?[holdingController.currentindex].transactions?[index].purchaseAmount}',
                                      style:
                                          const TextStyle(color: Colors.green),
                                    )
                                  ],
                                ),
                                VerticalSpacer(1.h),
                                Row(
                                  children: [
                                    Text(
                                      holdingController
                                              .reportDetailsModel
                                              ?.result
                                              ?.purchaseDetails?[
                                                  holdingController
                                                      .currentindex]
                                              .transactions?[index]
                                              .transactionDate ??
                                          '',
                                    ),
                                    HorizontalSpacer(19.5.w),
                                    Text(
                                        'NAV: ${holdingController.reportDetailsModel?.result?.purchaseDetails?[holdingController.currentindex].transactions?[index].nav}'),
                                    HorizontalSpacer(2.w),
                                    Expanded(
                                      child: Text(
                                        'Units: ${holdingController.reportDetailsModel?.result?.purchaseDetails?[holdingController.currentindex].transactions?[index].units}',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(
                                color: Color.fromARGB(255, 224, 219, 219),
                              ),
                          itemCount: holdingController
                                  .reportDetailsModel
                                  ?.result
                                  ?.purchaseDetails?[
                                      holdingController.currentindex]
                                  .transactions
                                  ?.length ??
                              0),
                    )
                  ],
                ),
        );
      }),
    );
  }

  void showmodelsheet(String value, String fundname) {
    List<String> listfund = ['a', 'b', 'c'];
    String? selectFund;
    scaffoldStateholdings.currentState?.showBottomSheet(
        // context: context,
        (BuildContext context) {
      return Container(
          height: 550,
          margin: EdgeInsets.all(15.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      value,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                Text(
                  fundname,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 15.sp,
                      ),
                ),
                VerticalSpacer(2.h),
                value == 'Switch'
                    ? DropdownButtonFormField<String>(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null) {
                            return 'Please select To Sheme';
                          }
                          return null;
                        },
                        style: Theme.of(context).textTheme.labelLarge!,
                        value: selectFund,
                        decoration: InputDecoration(
                            helperText: '',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Select To Sheme',
                            labelText: 'Select To Sheme'),
                        onChanged: (String? newValue) {},
                        items: listfund.map((String items) {
                          return DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                      )
                    : const SizedBox(),
                VerticalSpacer(1.h),
                DropdownButtonFormField<String>(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null) {
                      return 'Please select Folio';
                    }
                    return null;
                  },
                  style: Theme.of(context).textTheme.labelLarge!,
                  value: selectFund,
                  decoration: InputDecoration(
                      helperText: '',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Select Folio',
                      labelText: 'Select Folio'),
                  onChanged: (String? newValue) {},
                  items: listfund.map((String items) {
                    return DropdownMenuItem<String>(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                ),
                VerticalSpacer(1.h),
                DropdownButtonFormField<String>(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null) {
                      return 'Please select Redeem By';
                    }
                    return null;
                  },
                  style: Theme.of(context).textTheme.labelLarge!,
                  value: selectFund,
                  decoration: InputDecoration(
                      helperText: '',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Redeem By',
                      labelText: 'Redeem By'),
                  onChanged: (String? newValue) {},
                  items: listfund.map((String items) {
                    return DropdownMenuItem<String>(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                ),
                VerticalSpacer(1.h),
                TextFormField(
                  // controller:
                  //     schemeController.installmentController,
                  // readOnly: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // controller: kycController.banknameController,
                  style: Theme.of(context).textTheme.labelLarge!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter amount';
                    }
                    if (!RegExp(r'^[0-9\s\-&.,]+$').hasMatch(value)) {
                      return 'Please enter a valid amount';
                    }
                    return null;
                  },

                  decoration: InputDecoration(
                    prefix: const Text('₹ '),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Enter the amount',
                    labelText: 'Enter the amount',
                  ),
                ),
                VerticalSpacer(2.h),
                ButtonWidget(
                  btName: 'Submit',
                  onTap: () {},
                )
              ],
            ),
          ));
    });
  }
}
