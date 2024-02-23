import 'dart:developer';

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
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StockDetailsScreen extends StatefulWidget {
  const StockDetailsScreen(
      {Key? key, required this.scheme, required this.isinNumber})
      : super(key: key);
  final String scheme;
  final String isinNumber;

  @override
  State<StockDetailsScreen> createState() => _StockDetailsScreenState();
}

class _StockDetailsScreenState extends State<StockDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final int _currentIndex = 0;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    Provider.of<SchemeDetailsController>(context, listen: false)
        .getProductCode(widget.isinNumber);
    debugPrint('infnumbrer=${widget.isinNumber}');
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
      body: Column(
        children: [
          Expanded(child: widgetList[_currentIndex]),
          ButtonWidget(
            btName: 'INVEST',
            onTap: () {
              modalBottomSheetMenu(context);
            },
          )
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: ButtonWidget(
      //   btName: 'INVEST',
      //   onTap: () {
      //     modalBottomSheetMenu(context);
      //   },
      // ),
    );
  }

  void modalBottomSheetMenu(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;

    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Consumer<SchemeDetailsController>(
          builder: (context, schemeController, child) {
            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(15.sp),
                color: Colors.transparent,
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
                              },
                              child: const Icon(Icons.close),
                            ),
                          ],
                        ),
                        VerticalSpacer(2.h),
                        SizedBox(
                          child: Text(
                            schemeController.schemeInfoModel?.schemeName ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
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
                                      controller: schemeController
                                          .installmentController,
                                      // readOnly: true,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      // controller: kycController.banknameController,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!,
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
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(
                                                  width: 45.w,
                                                  child: TextFormField(
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'Please select a date';
                                                      }
                                                      return null;
                                                    },
                                                    controller: schemeController
                                                        .dateController,
                                                    readOnly: true,
                                                    onTap: () async {
                                                      DateTime? picked =
                                                          await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate:
                                                            DateTime.now(),
                                                        lastDate:
                                                            DateTime(2100),
                                                        builder:
                                                            (context, child) {
                                                          return Theme(
                                                            data: Theme.of(
                                                                    context)
                                                                .copyWith(
                                                              primaryTextTheme: TextTheme(
                                                                  bodyMedium:
                                                                      TextStyle(
                                                                          fontSize: 15
                                                                              .sp),
                                                                  bodyLarge: TextStyle(
                                                                      fontSize:
                                                                          15.sp)),
                                                              colorScheme:
                                                                  const ColorScheme
                                                                      .light(
                                                                primary: Color(
                                                                    0xFF4D84BD), // header background color
                                                                onPrimary: Colors
                                                                    .white, // header text color
                                                                onSurface: Colors
                                                                    .black, // body text color
                                                              ),
                                                              textButtonTheme:
                                                                  TextButtonThemeData(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  foregroundColor:
                                                                      const Color(
                                                                          0xFF4D84BD), // button text color
                                                                ),
                                                              ),
                                                            ),
                                                            child: child!,
                                                          );
                                                        },
                                                      );
                                                      if (picked != null) {
                                                        String selectdate =
                                                            DateFormat(
                                                                    'dd-MMM-yyyy')
                                                                .format(picked);
                                                        log('selected date ===$selectdate');
                                                        schemeController
                                                            .dateController
                                                            .text = selectdate;
                                                      }
                                                    },
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelLarge!,
                                                    decoration: InputDecoration(
                                                      helperText: '',
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      hintText: 'Date',
                                                    ),
                                                  )),
                                              HorizontalSpacer(2.w),
                                              SizedBox(
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
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      hintText: 'Select Item'),
                                                  onChanged:
                                                      (String? newValue) {
                                                    schemeController
                                                        .updateDuration(
                                                            newValue);
                                                  },
                                                  items: schemeController
                                                      .duration
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
                                    VerticalSpacer(2.h),
                                    InkWell(
                                      onTap: () {
                                        if (schemeController
                                            .formKeyForbtmSheet.currentState!
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
                                          } else {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const ScreenPayment(),
                                              ),
                                            );
                                          }
                                        } else {}
                                      },
                                      child: Container(
                                        height: 6.h,
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF4D84BD),
                                          borderRadius:
                                              BorderRadius.circular(15.sp),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Invest',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox(),
                        VerticalSpacer(30.h),
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
}
