import 'dart:developer';

import 'package:finfresh_mobile/controller/achController/ach_controller.dart';
import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:finfresh_mobile/controller/scheme%20details%20controller/scheme_details_controller.dart';
import 'package:finfresh_mobile/services/transaction%20service/transaction_service.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/flushbar.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:finfresh_mobile/view/payment%20Screen/payment_screen.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/widgets/overview_in_tabbar.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/widgets/sliver_list_screen.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StockDetailsScreen extends StatefulWidget {
  const StockDetailsScreen(
      {Key? key,
      required this.scheme,
      required this.isinNumber,
      required this.category})
      : super(key: key);
  final String scheme;
  final String isinNumber;
  final String category;

  @override
  State<StockDetailsScreen> createState() => _StockDetailsScreenState();
}

final GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

class _StockDetailsScreenState extends State<StockDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final int _currentIndex = 0;

  @override
  void initState() {
    log('isinnumber++${widget.isinNumber}');
    log('scheme=====${widget.scheme}');
    _tabController = TabController(length: 4, vsync: this);
    Provider.of<SchemeDetailsController>(context, listen: false)
        .getProductCode(widget.isinNumber);
    Provider.of<SchemeDetailsController>(context, listen: false)
        .getSipDate(widget.isinNumber, context);
    debugPrint('infnumbrer=${widget.isinNumber}');
    Provider.of<AchController>(context, listen: false).getAchHistoy(
      context,
      false,
    );
    Provider.of<SchemeDetailsController>(context, listen: false)
        .accountnumberController
        .text = Provider.of<DashBoardController>(context, listen: false)
            .dashBoardModel
            ?.result
            ?.data
            ?.bank
            ?.accNo ??
        '';
    Provider.of<SchemeDetailsController>(context, listen: false).ifscCodde =
        Provider.of<DashBoardController>(context, listen: false)
                .dashBoardModel
                ?.result
                ?.data
                ?.bank
                ?.ifscCode ??
            '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [
      SliverlistWidget(
          currentIndex: _currentIndex,
          tabController: _tabController,
          scheme: widget.scheme),
      SliverlistWidget(
          currentIndex: _currentIndex,
          tabController: _tabController,
          scheme: widget.scheme),
    ];
    return Scaffold(
      key: scaffoldState,
      body: Column(
        children: [
          Expanded(
            child: widgetList[_currentIndex],
          ),
          widget.isinNumber.isEmpty ||
                  Provider.of<SchemeDetailsController>(context)
                          .productCodeModel
                          ?.product ==
                      null ||
                  Provider.of<SchemeDetailsController>(context)
                          .historicalNavModel ==
                      null
              ? const SizedBox()
              : ButtonWidget(
                  btName: 'INVEST',
                  onTap: () {
                    modalBottomSheetMenu(
                      context,
                      widget.isinNumber,
                      widget.scheme,
                      widget.category,
                    );
                  },
                )
        ],
      ),
    );
  }
}

void modalBottomSheetMenu(
  BuildContext context,
  String isinNumber,
  String schemename,
  String category,
) {
  Brightness brightness = Theme.of(context).brightness;

  scaffoldState.currentState?.showBottomSheet(
    // enableDrag: true,
    // isDismissible: false,
    // useSafeArea: true,
    // isScrollControlled: true,
    // context: context,
    (builder) {
      return Consumer<SchemeDetailsController>(
        builder: (context, schemeController, child) {
          log('schemeController.ischecked ${schemeController.ischecked}');
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.sp),
              // color: Colors.transparent,
            ),
            // height: schemeController.selectedValue == 'Lumpsum' ||
            //         schemeController.selectedValue == 'Investment type'
            //     ? 500
            //     : 580,
            margin: EdgeInsets.all(15.sp),

            child: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                child: Form(
                  key: schemeController.formKeyForbtmSheet,
                  child: Column(
                    children: [
                      VerticalSpacer(2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Invest',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              schemeController.selectedValue =
                                  'Investment type';
                              schemeController.durationValue = '25 Year';
                              schemeController.dateController.clear();
                              schemeController.installmentController.clear();
                              schemeController.datevalue = null;
                              schemeController.mandatevalue = null;
                            },
                            child: const Icon(Icons.close),
                          ),
                        ],
                      ),
                      VerticalSpacer(2.h),
                      SizedBox(
                        child: Text(
                          schemeController.schemeInfoModel?.schemeName ?? '',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      VerticalSpacer(2.h),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: brightness == Brightness.light
                              ? Colors.transparent
                              : const Color(0xFF0E1330),
                        ),
                        height: 60,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton(
                            value: schemeController.selectedValue,
                            isExpanded: true,
                            underline: Container(
                              height: 0,
                            ),
                            items: schemeController.investmentType
                                .map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (value) {
                              Provider.of<SchemeDetailsController>(context,
                                      listen: false)
                                  .updateSelectedValue(value);
                            },
                          ),
                        ),
                      ),
                      VerticalSpacer(2.h),
                      schemeController.selectedValue != 'Investment type'
                          ? SizedBox(
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller:
                                        schemeController.installmentController,
                                    // readOnly: true,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    // controller: kycController.banknameController,
                                    style:
                                        Theme.of(context).textTheme.labelLarge!,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter amount';
                                      }
                                      if (!RegExp(r'^[0-9\s\-&.,]+$')
                                          .hasMatch(value)) {
                                        return 'Please enter a valid amount';
                                      }
                                      return null;
                                    },

                                    decoration: InputDecoration(
                                      prefix: const Text('₹ '),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      hintText: 'Enter the amount',
                                    ),
                                  ),
                                  VerticalSpacer(2.h),
                                  schemeController.selectedValue == 'SIP'
                                      ? Consumer<AchController>(
                                          builder: (context, achController, _) {
                                          return DropdownButtonFormField<
                                              String>(
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            validator: (value) {
                                              if (value == null) {
                                                return 'Please select debit mandate';
                                              }
                                              return null;
                                            },
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge!,
                                            value:
                                                schemeController.mandatevalue,
                                            decoration: InputDecoration(
                                              helperText: '',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              hintText: 'Select Debit Mandate',
                                            ),
                                            onChanged: (String? newValue) {
                                              schemeController
                                                  .cahngeMandate(newValue!);
                                            },
                                            items: achController
                                                .achHistoryModel?.result!
                                                .map((value) {
                                              return DropdownMenuItem<String>(
                                                onTap: () {
                                                  schemeController.umrnNumber =
                                                      value.umrnNumber!;
                                                  log('umnr${value.umrnNumber}');
                                                  schemeController
                                                          .achMandateLAstdate =
                                                      value.toDate ?? '';
                                                },
                                                value: value.toString(),
                                                child: Text(
                                                  "${value.mandateId.toString()} - (Limit : ${value.amount})",
                                                ),
                                              );
                                            }).toList(),
                                          );
                                        })
                                      : const SizedBox(),
                                  // VerticalSpacer(2.h),
                                  schemeController.selectedValue == 'SIP'
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                              // height: Adaptive.h(10.5),
                                              width: 45.w,
                                              child: DropdownButtonFormField<
                                                  String>(
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                validator: (value) {
                                                  if (value == null) {
                                                    return 'Please select a duration';
                                                  }
                                                  return null;
                                                },
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge!,
                                                value:
                                                    schemeController.datevalue,
                                                decoration: InputDecoration(
                                                  helperText: '',
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  hintText: 'Dates',
                                                ),
                                                onChanged: (String? newValue) {
                                                  schemeController
                                                      .updateDatevalue(
                                                          newValue!);
                                                },
                                                items: schemeController
                                                    .sipdateModel!.sipDates!
                                                    .map((int value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value.toString(),
                                                    child: Text(
                                                      value.toString(),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                              // child: TextFormField(
                                              //   onTap: () {
                                              //     showDialog(
                                              //       context: context,
                                              //       builder:
                                              //           (BuildContext context) {
                                              //         return AlertDialog(
                                              //           title: const Text(
                                              //               'Select Date'),
                                              //           content: SizedBox(
                                              //             // width: Adaptive.w(50),
                                              //             child:
                                              //                 DropdownButtonFormField<
                                              //                     String>(
                                              //               autovalidateMode:
                                              //                   AutovalidateMode
                                              //                       .onUserInteraction,
                                              //               validator: (value) {
                                              //                 if (value ==
                                              //                     null) {
                                              //                   return 'Please select a duration';
                                              //                 }
                                              //                 return null;
                                              //               },
                                              //               style: Theme.of(
                                              //                       context)
                                              //                   .textTheme
                                              //                   .labelLarge!,
                                              //               value:
                                              //                   schemeController
                                              //                       .datevalue,
                                              //               decoration:
                                              //                   InputDecoration(
                                              //                 helperText: '',
                                              //                 border: OutlineInputBorder(
                                              //                     borderRadius:
                                              //                         BorderRadius
                                              //                             .circular(
                                              //                                 10)),
                                              //                 hintText: 'Dates',
                                              //               ),
                                              //               onChanged: (String?
                                              //                   newValue) {
                                              //                 schemeController
                                              //                     .updateDatevalue(
                                              //                         newValue!);
                                              //               },
                                              //               items:
                                              //                   schemeController
                                              //                       .sipdateModel!
                                              //                       .sipDates!
                                              //                       .map((int
                                              //                           value) {
                                              //                 return DropdownMenuItem<
                                              //                     String>(
                                              //                   value: value
                                              //                       .toString(),
                                              //                   child: Text(
                                              //                     value
                                              //                         .toString(),
                                              //                   ),
                                              //                 );
                                              //               }).toList(),
                                              //             ),
                                              //           ),
                                              //           actions: <Widget>[
                                              //             TextButton(
                                              //               onPressed: () {
                                              //                 Navigator.of(
                                              //                         context)
                                              //                     .pop();
                                              //               },
                                              //               child: const Text(
                                              //                 'Close',
                                              //                 style: TextStyle(
                                              //                     color: Color(
                                              //                         0xFF4D84BD)),
                                              //               ),
                                              //             ),
                                              //           ],
                                              //         );
                                              //       },
                                              //     );
                                              //   },
                                              //   readOnly: true,
                                              //   autovalidateMode:
                                              //       AutovalidateMode
                                              //           .onUserInteraction,
                                              //   controller: schemeController
                                              //       .dateController,
                                              //   style: Theme.of(context)
                                              //       .textTheme
                                              //       .labelLarge!,
                                              //   validator: (value) {
                                              //     if (value == null ||
                                              //         value.isEmpty) {
                                              //       return 'Please select starting date';
                                              //     }

                                              //     return null;
                                              //   },
                                              //   decoration: InputDecoration(
                                              //     helperText: '',
                                              //     border: OutlineInputBorder(
                                              //         borderRadius:
                                              //             BorderRadius.circular(
                                              //                 10)),
                                              //     hintText: 'Select the date',
                                              //   ),
                                              // ),
                                            ),
                                            HorizontalSpacer(2.w),
                                            SizedBox(
                                              // height: Adaptive.h(10.5),
                                              width: 45.w,
                                              child: DropdownButtonFormField<
                                                  String>(
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                validator: (value) {
                                                  if (value == null) {
                                                    return 'Please select a duration';
                                                  }
                                                  return null;
                                                },
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge!,
                                                value: schemeController
                                                    .durationValue,
                                                decoration: InputDecoration(
                                                    helperText: '',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    hintText: 'Select Item'),
                                                onChanged: (String? newValue) {
                                                  schemeController
                                                      .updateDuration(newValue);
                                                },
                                                items: schemeController.duration
                                                    .map((String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(
                                                      value,
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ],
                                        )
                                      : const SizedBox(),
                                  schemeController.selectedValue == 'SIP'
                                      ? Row(
                                          children: [
                                            Checkbox(
                                              checkColor: Colors.white,
                                              activeColor:
                                                  const Color(0xFF4D84BD),
                                              value: schemeController.ischecked,
                                              onChanged: (newValue) {
                                                schemeController
                                                    .changeChecked(newValue!);
                                              },
                                            ),
                                            const Text(
                                                'Pay first installment today')
                                          ],
                                        )
                                      : const SizedBox(),
                                  VerticalSpacer(1.h),
                                  isinNumber.isEmpty ||
                                          schemeController
                                                  .productCodeModel?.product ==
                                              null
                                      ? const SizedBox()
                                      : InkWell(
                                          onTap: () async {
                                            if (schemeController
                                                .formKeyForbtmSheet
                                                .currentState!
                                                .validate()) {
                                              if (Provider.of<DashBoardController>(
                                                          context,
                                                          listen: false)
                                                      .dashBoardModel
                                                      ?.result
                                                      ?.data
                                                      ?.activationStatus
                                                      ?.statusCode ==
                                                  'S07') {
                                                Navigator.pop(context);
                                                showFlushbar(context,
                                                    'Our customer care will contact you shortly');
                                              } else if (schemeController
                                                          .ischecked ==
                                                      true ||
                                                  schemeController
                                                          .selectedValue ==
                                                      'Lumpsum') {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ScreenPayment(
                                                      isinNumber: isinNumber,
                                                      navProdName: schemename,
                                                      category: category,
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                bool result = await schemeController
                                                    .transction(
                                                        context,
                                                        Provider.of<DashBoardController>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .dashBoardModel
                                                                ?.result
                                                                ?.data
                                                                ?.name ??
                                                            '',
                                                        isinNumber,
                                                        category,
                                                        schemename);
                                                if (result == true) {
                                                  schemeController.ischecked =
                                                      true;
                                                  schemeController
                                                          .selectedValue =
                                                      'Investment type';
                                                  schemeController
                                                          .durationValue =
                                                      '25 Year';
                                                  schemeController
                                                      .dateController
                                                      .clear();
                                                  schemeController
                                                      .installmentController
                                                      .clear();
                                                  schemeController.datevalue =
                                                      null;
                                                  schemeController
                                                      .mandatevalue = null;

                                                  // ignore: use_build_context_synchronously
                                                  Navigator.pop(context);
                                                }
                                              }
                                            } else {}
                                          },
                                          child: schemeController
                                                      .loadingTransButton ==
                                                  true
                                              ? SizedBox(
                                                  height: Adaptive.h(9),
                                                  width: 45.w,
                                                  child: const LoadingButton(),
                                                )
                                              : Container(
                                                  height: 6.h,
                                                  width: 40.w,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFF4D84BD),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.sp),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      'Invest',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                        ),
                                ],
                              ),
                            )
                          : const SizedBox(),
                      // VerticalSpacer(20.h),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
