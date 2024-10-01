import 'package:finfresh_mobile/controller/bank%20controller/bank_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/add%20additional%20bank/screen_add_additional_bank.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenListingOfBanks extends StatefulWidget {
  const ScreenListingOfBanks({super.key});

  @override
  State<ScreenListingOfBanks> createState() => _ScreenListingOfBanksState();
}

class _ScreenListingOfBanksState extends State<ScreenListingOfBanks> {
  @override
  void initState() {
    super.initState();
    if (Provider.of<BankController>(context, listen: false).isFetched ==
        false) {
      Provider.of<BankController>(context, listen: false).getBankList(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Banks',
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenAddAdditionalBank(),
                  ));
            },
            child: const Icon(Icons.add),
          ),
          HorizontalSpacer(4.w),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(15.sp),
        child: Consumer<BankController>(builder: (context, bankController, _) {
          return bankController.loadingbankList == true
              ? const LoadingWidget()
              : Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount:
                            bankController.bankListingModel!.bank!.length,
                        separatorBuilder: (context, index) =>
                            VerticalSpacer(1.h),
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            elevation: 6,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.sp),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    VerticalSpacer(2.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: Adaptive.w(70),
                                          child: Text(
                                            'Bank Name : ${bankController.bankListingModel?.bank?[index].bankDetails?.bankName ?? ''} ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontSize: 17.5.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                        // HorizontalSpacer(29.w),
                                        // InkWell(
                                        //   onTap: () {
                                        //     Navigator.push(
                                        //       context,
                                        //       MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             ScreenEditBank(
                                        //           banklist: bankController
                                        //               .bankListingModel!
                                        //               .bank![index],
                                        //         ),
                                        //       ),
                                        //     );
                                        //   },
                                        //   child: Icon(
                                        //     Icons.edit,
                                        //     size: 19.sp,
                                        //   ),
                                        // ),
                                        HorizontalSpacer(3.w),
                                        InkWell(
                                          onTap: () {
                                            AlertDialog alert = AlertDialog(
                                              title: Text(
                                                'Are you sure you want to delete this bank?',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge!
                                                    .copyWith(
                                                        fontSize: 17.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                              content: VerticalSpacer(2.h),
                                              actions: [
                                                // You can add buttons to the alert dialog
                                                Container(
                                                  height: 5.h,
                                                  width: 15.w,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.sp),
                                                    color:
                                                        const Color(0xFF4D84BD),
                                                  ),
                                                  child: Center(
                                                    child: TextButton(
                                                      onPressed: () async {
                                                        bool result = await bankController.deletebank(
                                                            context,
                                                            bankController
                                                                    .bankListingModel
                                                                    ?.bank?[
                                                                        index]
                                                                    .accNo ??
                                                                '',
                                                            bankController
                                                                    .bankListingModel
                                                                    ?.bank?[
                                                                        index]
                                                                    .accType ??
                                                                "",
                                                            bankController
                                                                    .bankListingModel
                                                                    ?.bank?[
                                                                        index]
                                                                    .ifscCode ??
                                                                '',
                                                            bankController
                                                                    .bankListingModel
                                                                    ?.bank?[
                                                                        index]
                                                                    .bankName ??
                                                                '',
                                                            bankController
                                                                    .bankListingModel
                                                                    ?.bank?[
                                                                        index]
                                                                    .proofOfAccount ??
                                                                '',
                                                            bankController
                                                                    .bankListingModel
                                                                    ?.bank?[
                                                                        index]
                                                                    .branchName ??
                                                                "");
                                                        if (result == true) {
                                                          // ignore: use_build_context_synchronously
                                                          Navigator.pop(
                                                              context);
                                                          // ignore: use_build_context_synchronously
                                                          bankController
                                                              .getBankList(
                                                                  context);
                                                        }
                                                      },
                                                      child: bankController
                                                                  .loadingBankdelete ==
                                                              true
                                                          ? const CupertinoActivityIndicator(
                                                              color:
                                                                  Colors.white)
                                                          : const Text(
                                                              'YES',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 5.h,
                                                  width: 15.w,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.sp),
                                                    color:
                                                        const Color(0xFF4D84BD),
                                                  ),
                                                  child: Center(
                                                    child: TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text(
                                                        'NO',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );

                                            // Show the AlertDialog
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return alert;
                                              },
                                            );
                                          },
                                          child: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        )
                                      ],
                                    ),
                                    VerticalSpacer(1.h),
                                    Text(
                                      'branch Name : ${bankController.bankListingModel?.bank?[index].branchName ?? ''}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            fontSize: 17.5.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    VerticalSpacer(1.h),
                                    Text(
                                      'Account Number : ${bankController.bankListingModel?.bank?[index].accNo ?? ''}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            fontSize: 17.5.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    VerticalSpacer(1.h),
                                    Text(
                                      'Account Type : ${bankController.bankListingModel?.bank?[index].accType ?? ''}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            fontSize: 17.5.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    VerticalSpacer(1.h),
                                    Visibility(
                                      visible: bankController.bankListingModel
                                                  ?.bank?[index].defaultbank ==
                                              false
                                          ? true
                                          : false,
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: TextButton(
                                          onPressed: () async {
                                            bankController.updateindex(index);
                                            await bankController
                                                .changeBankDefult(
                                                    context, index);
                                          },
                                          child: bankController
                                                          .loadingDefault ==
                                                      true &&
                                                  bankController.currentIndex ==
                                                      index
                                              ? const CupertinoActivityIndicator(
                                                  color: Colors.black)
                                              : const Text(
                                                  'Set As Default',
                                                  style: TextStyle(
                                                    color: Color(0xFF4D84BD),
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ),
                                    VerticalSpacer(2.h),
                                  ]),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
        }),
      ),
    );
  }
}
