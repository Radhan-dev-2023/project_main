import 'package:finfresh_mobile/controller/filter%20controller/filter_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreeenTranscations extends StatelessWidget {
  const ScreeenTranscations({super.key});

  @override
  Widget build(BuildContext context) {
    final filterController =
        Provider.of<FilterController>(context, listen: false);

    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   filterController.resetFilter();
    //   await filterController.getfilter(context);
    // });
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: const Text('Transactions'),
      ),
      body: Consumer<FilterController>(builder: (context, filterController, _) {
        return Container(
          margin: EdgeInsets.all(15.sp),
          child: filterController.filterPageLoading == true
              ? const LoadingWidget()
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: Adaptive.h(6),
                          width: Adaptive.w(63),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.sp),
                            border: Border.all(
                              color: const Color.fromARGB(255, 192, 191, 191),
                            ),
                          ),
                          child: TextFormField(
                            controller: filterController.searchController,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(fontSize: 16.sp),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              // helperText: '',
                              prefixIcon: Icon(
                                Icons.search,
                                size: Adaptive.h(2.3),
                              ),
                              suffixIcon: filterController
                                      .searchController.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () {
                                        filterController.searchController
                                            .clear();
                                        filterController.getfilter(context);
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        size: Adaptive.h(2.3),
                                      ))
                                  : const SizedBox(),

                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 12.0.sp),
                              hintText: 'Search',
                            ),
                            onChanged: (value) {
                              filterController.searchItems();
                            },
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Provider.of<FilterController>(context,
                                    listen: false)
                                .changeindex(0);
                            showmodalBottomSheet(context);
                          },
                          child: Stack(
                            children: [
                              Container(
                                height: Adaptive.h(6),
                                width: Adaptive.w(27),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14.sp),
                                  color: const Color(0xFF4D84BD),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.filter_list,
                                      color: Colors.white,
                                    ),
                                    HorizontalSpacer(Adaptive.w(2.5)),
                                    Text(
                                      'Filter',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17.sp,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: filterController.typeList.isNotEmpty ||
                                        filterController.statusList.isNotEmpty
                                    ? true
                                    : false,
                                child: Positioned(
                                  right: 0,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 10.sp,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    VerticalSpacer(3.h),
                    // filterController.fliterModel != null &&
                    //         filterController.fliterModel!.result != null &&
                    //         filterController.fliterModel!.result!.isNotEmpty
                    filterController.filteredList.isNotEmpty
                        ? Expanded(
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return Card(
                                  surfaceTintColor: Colors.transparent,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 18.sp, right: 18.sp),
                                    child: Column(
                                      children: [
                                        VerticalSpacer(2.h),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                '${filterController.filteredList[index].schemeName}',
                                                overflow: TextOverflow.visible,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      letterSpacing: 2.sp,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        VerticalSpacer(1.h),

                                        // VerticalSpacer(2.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // Text(filterController
                                                //         .fliterModel
                                                //         ?.result?[index]
                                                //         .entryDate ??
                                                //     ''),
                                                Text(
                                                  'ID ${filterController.filteredList[index].trxnNo ?? ''}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                ),
                                                VerticalSpacer(1.h),
                                                Text(
                                                  filterController
                                                          .filteredList[index]
                                                          .entryDate ??
                                                      '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                        fontSize: 15.sp,
                                                      ),
                                                ),

                                                // Text(
                                                //     'ID  ${filterController.fliterModel?.result?[index].trxnNo ?? ''}')
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                // Text(filterController
                                                //         .fliterModel
                                                //         ?.result?[index]
                                                //         .transactionType ??
                                                //     ''),
                                                Container(
                                                  height: 3.h,
                                                  decoration: BoxDecoration(
                                                    color: Colors.blue[100]!
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.sp),
                                                  ),
                                                  child: Center(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 13,
                                                        right: 13,
                                                        // top: 5,
                                                        bottom: 5,
                                                      ),
                                                      child: Text(
                                                        filterController
                                                                .filteredList[
                                                                    index]
                                                                .transactionType ??
                                                            '-',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium!
                                                            .copyWith(
                                                              fontSize: 15.sp,
                                                              // fontWeight:
                                                              //     FontWeight
                                                              //         .w500,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                                VerticalSpacer(1.h),
                                                // Text(
                                                //     '₹${filterController.fliterModel?.result?[index].amount}')
                                                Text(
                                                  '₹${filterController.filteredList[index].amount}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        VerticalSpacer(1.h),
                                        const Divider(
                                          thickness: 0.5,
                                          height: 0,
                                          color: Color.fromARGB(
                                              255, 192, 191, 191),
                                        ),
                                        VerticalSpacer(1.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Folio',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                        fontSize: 15.sp,
                                                      ),
                                                ),
                                                VerticalSpacer(1.h),
                                                Text(
                                                  'Status',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                        fontSize: 15.sp,
                                                      ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                // Text(filterController
                                                //         .fliterModel
                                                //         ?.result?[index]
                                                //         .folioNo ??
                                                //     '-'),
                                                Text(filterController
                                                        .filteredList[index]
                                                        .folioNo ??
                                                    '-'),
                                                VerticalSpacer(1.h),
                                                Text(
                                                  // filterController
                                                  //         .fliterModel
                                                  //         ?.result?[index]
                                                  //         .trxnStatus ??
                                                  //     '-',
                                                  filterController
                                                          .filteredList[index]
                                                          .trxnStatus ??
                                                      '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                        fontSize: 15.sp,
                                                        color:
                                                            getColorForStatus(
                                                          filterController
                                                              .fliterModel
                                                              ?.result?[index]
                                                              .trxnStatus,
                                                        ),
                                                      ),
                                                  // style: TextStyle(
                                                  //   color: getColorForStatus(
                                                  //     filterController
                                                  //         .fliterModel
                                                  //         ?.result?[index]
                                                  //         .trxnStatus,
                                                  //   ),
                                                  // ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        VerticalSpacer(2.h),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const VerticalSpacer(0),
                              // itemCount: filterController
                              //         .fliterModel?.result?.length ??
                              //     0,
                              itemCount: filterController.filteredList.length,
                            ),
                          )
                        : SizedBox(
                            child: Column(
                              children: [
                                VerticalSpacer(26.h),
                                Icon(
                                  Icons.filter_list,
                                  size: 25.sp,
                                ),
                                Text(
                                  'No transaction matching the filter',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                SizedBox(
                                    width: Adaptive.w(50),
                                    child: ButtonWidget(
                                      btName: 'Reset Filter',
                                      onTap: () {
                                        filterController.resetFilter();
                                        filterController.getfilter(context);
                                      },
                                    ))
                              ],
                            ),
                          )
                  ],
                ),
        );
      }),
    );
  }

  Color getColorForStatus(String? status) {
    switch (status) {
      case 'Pending':
        return Color(0xFFffb703);
      case 'Processed by RTA':
        return Colors.green;
      case 'Rejected / Reversal':
        return Colors.red;
      default:
        return Colors.black; // Default color if status is unknown
    }
  }

  void showmodalBottomSheet(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Consumer<FilterController>(
            builder: (context, filterController, _) {
          return SizedBox(
            height: 400,
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(left: 20.sp, right: 20.sp, top: 15.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Filter',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      InkWell(
                        onTap: () {
                          filterController.resetFilter();
                          filterController.getfilter(context);
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Reset',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      )
                    ],
                  ),
                ),
                VerticalSpacer(1.h),
                const Divider(
                  color: Colors.grey,
                ),
                VerticalSpacer(2.h),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HorizontalSpacer(4.w),
                    SizedBox(
                      height: Adaptive.h(20),
                      child: Column(
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(13.sp),
                            onTap: () {
                              filterController.changeindex(0);
                            },
                            child: Container(
                              height: Adaptive.h(4),
                              width: Adaptive.w(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13.sp),
                                color: filterController.currentIndex == 0
                                    ? const Color.fromARGB(255, 241, 236, 236)
                                    : Colors.transparent,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10.sp, top: 8.sp, right: 10.sp),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Type',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                            color: filterController
                                                        .currentIndex ==
                                                    0
                                                ? Colors.black
                                                : brightness == Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                          ),
                                    ),
                                    Visibility(
                                      visible:
                                          filterController.typeList.isNotEmpty
                                              ? true
                                              : false,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.red,
                                        radius: 8.sp,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          VerticalSpacer(2.h),
                          InkWell(
                            borderRadius: BorderRadius.circular(13.sp),
                            onTap: () {
                              filterController.changeindex(1);
                            },
                            child: Container(
                              height: Adaptive.h(4),
                              width: Adaptive.w(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13.sp),
                                color: filterController.currentIndex == 1
                                    ? const Color.fromARGB(255, 241, 236, 236)
                                    : Colors.transparent,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10.sp, top: 8.sp, right: 10.sp),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Status',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                            color: filterController
                                                        .currentIndex ==
                                                    1
                                                ? Colors.black
                                                : brightness == Brightness.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                          ),
                                    ),
                                    Visibility(
                                      visible:
                                          filterController.statusList.isNotEmpty
                                              ? true
                                              : false,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.red,
                                        radius: 8.sp,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        filterController.currentIndex == 0
                            ? Align(
                                alignment: Alignment.topCenter,
                                child: SizedBox(
                                  height: Adaptive.h(23),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Checkbox(
                                            checkColor: Colors.white,
                                            activeColor:
                                                const Color(0xFF4D84BD),
                                            value: filterController.sipvalue,
                                            onChanged: (value) {
                                              filterController
                                                  .changesipvalue(value!);
                                            },
                                          ),
                                          const Text('SIP'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          HorizontalSpacer(11.w),
                                          Checkbox(
                                            checkColor: Colors.white,
                                            activeColor:
                                                const Color(0xFF4D84BD),
                                            value:
                                                filterController.lumbsumvalue,
                                            onChanged: (value) {
                                              filterController
                                                  .changelumpsumvalue(value!);
                                            },
                                          ),
                                          const Text('Lumpsum'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        // HorizontalSpacer(10.w),
                        filterController.currentIndex == 1
                            ? Align(
                                alignment: Alignment.topCenter,
                                child: SizedBox(
                                  height: Adaptive.h(23),
                                  width: Adaptive.w(50),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          HorizontalSpacer(6.8.w),
                                          Checkbox(
                                            checkColor: Colors.white,
                                            activeColor:
                                                const Color(0xFF4D84BD),
                                            value:
                                                filterController.compltedvalue,
                                            onChanged: (value) {
                                              filterController
                                                  .changeCompletedvalue(value!);
                                            },
                                          ),
                                          const Text('Completed'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          HorizontalSpacer(6.8.w),
                                          Checkbox(
                                            checkColor: Colors.white,
                                            activeColor:
                                                const Color(0xFF4D84BD),
                                            value:
                                                filterController.pendingvalue,
                                            onChanged: (value) {
                                              filterController
                                                  .changependingvalue(value!);
                                            },
                                          ),
                                          const Text('Pending'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          HorizontalSpacer(7.w),
                                          Checkbox(
                                            checkColor: Colors.white,
                                            activeColor:
                                                const Color(0xFF4D84BD),
                                            value: filterController.failedvalue,
                                            onChanged: (value) {
                                              filterController
                                                  .changeFailedvalue(value!);
                                            },
                                          ),
                                          const Text('Failed'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : const SizedBox()
                      ],
                    )
                  ],
                ),
                VerticalSpacer(Adaptive.h(5)),
                Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: InkWell(
                      onTap: () {
                        filterController.getfilter(context);
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: Adaptive.h(6),
                        width: Adaptive.w(27),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.sp),
                          color: const Color(0xFF4D84BD),
                        ),
                        child: Center(
                          child: Text(
                            'Apply',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 17.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
      },
    );
  }
}
