import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:finfresh_mobile/controller/scheme%20details%20controller/scheme_details_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:finfresh_mobile/view/webview/screen_webview.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenPayment extends StatefulWidget {
  const ScreenPayment({super.key});

  @override
  State<ScreenPayment> createState() => _ScreenPaymentState();
}

class _ScreenPaymentState extends State<ScreenPayment> {
  String? selectedItem;
  @override
  void initState() {
    super.initState();
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
    Provider.of<SchemeDetailsController>(context, listen: false).paymentMode =
        'Select a payment mode';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<SchemeDetailsController>(
          builder: (context, schemeController, child) {
        return Container(
            margin: EdgeInsets.all(15.sp),
            child: SizedBox(
              height: 45.h,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: schemeController.accountnumberController,
                        readOnly: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // controller: kycController.banknameController,
                        style: Theme.of(context).textTheme.labelLarge!,
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
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Enter Account Number',
                        ),
                      ),
                      VerticalSpacer(2.h),
                      DropdownButtonFormField<String>(
                        style: Theme.of(context).textTheme.labelLarge!,
                        value: schemeController.paymentMode,
                        decoration:
                            const InputDecoration(hintText: 'Select Item'),
                        onChanged: (String? newValue) {
                          schemeController.updatePaymentMode(newValue);
                        },
                        items: schemeController.paymentList.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                      ),
                      VerticalSpacer(2.h),
                      selectedItem == 'UPI'
                          ? TextFormField(
                              // readOnly: true,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              // controller: kycController.banknameController,
                              style: Theme.of(context).textTheme.labelLarge!,
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
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'Enter Upi Number',
                              ),
                            )
                          : const SizedBox(),
                      VerticalSpacer(2.h),
                      schemeController.loadingTransButton == true
                          ? const LoadingButton()
                          : ButtonWidget(
                              btName: 'PAY NOW',
                              onTap: () async {
                                if (schemeController.paymentMode ==
                                    'Select a payment mode') {
                                  showSnackBar(
                                      context, 'Please select a payment mode');
                                } else if (schemeController
                                    .accountnumberController.text.isEmpty) {
                                  showSnackBar(
                                      context, 'Account number cannot be null');
                                } else {
                                  bool result = await schemeController
                                      .transction(context);
                                  if (result == true) {
                                    // ignore: use_build_context_synchronously
                                    showAlertDialog(context);
                                  }
                                }
                              },
                            )
                    ],
                  ),
                ),
              ),
            ));
      }),
    );
  }

  void showAlertDialog(BuildContext context) {
    String url = Provider.of<SchemeDetailsController>(context, listen: false)
        .transactionService
        .paymentResponseModel
        .result!
        .paymentlink!;

    // String encodedUrl = Uri.encodeFull(url);
    // String url =
    // "https://www.nsenmf.com/Transactions/MFDMakePayment.aspx?jIwetlJvdmuCHfF2aGi1cDMmhu6ih%2ffz66GFrBf3PBlLz72vitR132eTdqneGQyyNmvCREwgt4opcxcrtet%2fDjgkPQxzXnAEAUQzJFw6d8RGJ8HaxA9zJyFW2zXLhL1oldvYA2%2brhP2EbVUdiFUEN0y5%2fP2MVYSHQt%2fr631OM%2ffIOWWDsLOarjZyXyNBo49xGvzqU0caxGk34C3GCqq0fF9hR0S6Ty1lrTCOmsvrwG6%2fzkRPxp7DWyhDzxO4FAEVYZsqzdvk5qLb3SSo6TmnMI5qlhHIOhkWyTA94A8n98Brk6xm6dvxSpcHvq8VTvu7UszM%2bLFqG70N%2btSJm1crCgD0st39eBFpRk6x1HKcLmA%3d'&gt;https://www.nsenmf.com/Transactions/MFDMakePayment.aspx?jIwetlJvdmuCHfF2aGi1cDMmhu6ih%2ffz66GFrBf3PBlLz72vitR132eTdqneGQyyNmvCREwgt4opcxcrtet%2fDjgkPQxzXnAEAUQzJFw6d8RGJ8HaxA9zJyFW2zXLhL1oldvYA2%2brhP2EbVUdiFUEN0y5%2fP2MVYSHQt%2fr631OM%2ffIOWWDsLOarjZyXyNBo49xGvzqU0caxGk34C3GCqq0fF9hR0S6Ty1lrTCOmsvrwG6%2fzkRPxp7DWyhDzxO4FAEVYZsqzdvk5qLb3SSo6TmnMI5qlhHIOhkWyTA94A8n98Brk6xm6dvxSpcHvq8VTvu7UszM%2bLFqG70N%2btSJm1crCgD0st39eBFpRk6x1HKcLmA%3d&lt;/a&gt";
    // Create the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        'Complete your payment process click on the below button',
        style: Theme.of(context)
            .textTheme
            .labelLarge!
            .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w500),
      ),
      content: VerticalSpacer(2.h),
      // shape: RoundedRectangleBorder(
      //   borderRadius:
      //       BorderRadius.circular(10), // Set your desired borderRadius here
      // ),
      actions: [
        // You can add buttons to the alert dialog
        InkWell(
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScreenWebview(url: url),
              ),
            );
            // canLaunchUrl(Uri.parse(url));
          },
          child: Container(
            height: 5.h,
            width: 15.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: const Color(0xFF4D84BD),
            ),
            child: const Center(
              child: Text(
                'YES',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        // InkWell(
        //     onTap: () {
        //       Navigator.pop(context);
        //     },
        //     child: Container(
        //       height: 4.h,
        //       width: 13.w,
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(10.sp),
        //         color: const Color(0xFF4D84BD),
        //       ),
        //       child: const Center(
        //         child: Text(
        //           'NO',
        //           style: TextStyle(color: Colors.white),
        //         ),
        //       ),
        //     ))
      ],
    );

    // Show the AlertDialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
