import 'package:finfresh_mobile/controller/scheme%20details%20controller/scheme_details_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/payment%20Screen/payment_screen.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/widgets/overview_in_tabbar.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/widgets/sliver_list_screen.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StockDetailsScreen extends StatefulWidget {
  const StockDetailsScreen({Key? key}) : super(key: key);

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [
      SliverlistWidget(
          currentIndex: _currentIndex, tabController: _tabController),
      SliverlistWidget(
          currentIndex: _currentIndex, tabController: _tabController),
    ];
    return Scaffold(
      body: widgetList[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonWidget(
        btName: 'INVEST',
        onTap: () {
          modalBottomSheetMenu(context);
        },
      ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [
      //     // Container(
      //     //   height: 6.h,
      //     //   width: 40.w,
      //     //   decoration: BoxDecoration(
      //     //     color: Colors.red,
      //     //     borderRadius: BorderRadius.circular(15.sp),
      //     //   ),
      //     //   child: const Center(
      //     //     child: Text('SELL'),
      //     //   ),
      //     // ),
      //     // Container(
      //     //   height: 6.h,
      //     //   width: 40.w,
      //     //   decoration: BoxDecoration(
      //     //     color: Colors.green,
      //     //     borderRadius: BorderRadius.circular(15.sp),
      //     //   ),
      //     //   child: const Center(
      //     //     child: Text('Buy'),
      //     //   ),
      //     // ),
      //   ],
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
            return Container(
              margin: EdgeInsets.all(15.sp),
              color: Colors.transparent,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                child: Column(
                  children: [
                    VerticalSpacer(2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Invest',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.close),
                        ),
                      ],
                    ),
                    VerticalSpacer(2.h),
                    SizedBox(
                      child: Text(
                        schemeController.schemeInfoModel?.schemeName ?? '',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                                  // readOnly: true,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  // controller: kycController.banknameController,
                                  style:
                                      Theme.of(context).textTheme.labelLarge!,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'field is required';
                                    }
                                    // if (!RegExp(r'^[a-zA-Z0-9\s\-&.,]+$').hasMatch(value)) {
                                    //   return 'Enter valid bank name';
                                    // }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: 'Enter Installment Amount',
                                  ),
                                ),
                                VerticalSpacer(2.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
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
                                      width: 45.w,
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
                                            Provider.of<SchemeDetailsController>(
                                                    context,
                                                    listen: false)
                                                .updateSelectedValue(value);
                                          },
                                        ),
                                      ),
                                    ),
                                    HorizontalSpacer(2.w),
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
                                      width: 45.w,
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
                                            Provider.of<SchemeDetailsController>(
                                                    context,
                                                    listen: false)
                                                .updateSelectedValue(value);
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                VerticalSpacer(2.h),
                                InkWell(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ScreenPayment(),
                                    ),
                                  ),
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
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
