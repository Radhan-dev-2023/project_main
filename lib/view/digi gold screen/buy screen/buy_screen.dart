import 'dart:convert';
import 'dart:developer';

import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:finfresh_mobile/controller/goldController/gold_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/flushbar.dart';
import 'package:finfresh_mobile/view/digi%20gold%20screen/gold%20buying%20screen/screen_gold_buying_selling.dart';
import 'package:finfresh_mobile/view/payu%20payment/hashservice.dart';
import 'package:flutter/material.dart';
import 'package:payu_checkoutpro_flutter/PayUConstantKeys.dart';
import 'package:payu_checkoutpro_flutter/payu_checkoutpro_flutter.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenBuy extends StatefulWidget {
  const ScreenBuy({super.key});

  @override
  State<ScreenBuy> createState() => _ScreenBuyState();
}

class _ScreenBuyState extends State<ScreenBuy>
    implements PayUCheckoutProProtocol {
  late PayUCheckoutProFlutter _checkoutPro;
  @override
  void initState() {
    super.initState();
    _checkoutPro = PayUCheckoutProFlutter(this);
    Provider.of<GoldController>(context, listen: false)
        .buygoldrateController
        .clear();
  }

  @override
  Widget build(BuildContext context) {
    final dashBordController = Provider.of<DashBoardController>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2D5D5F),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color(0xFF2D5D5F),
      body: SingleChildScrollView(
        child: Consumer<GoldController>(builder: (context, goldController, _) {
          return Form(
            key: goldController.formKey,
            child: Column(
              children: [
                VerticalSpacer(20.h),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Buying from Finfresh \n 99.99% pure 24K gold',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                VerticalSpacer(5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '₹ ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(
                      width: Adaptive.w(30),
                      child: TextFormField(
                        controller: goldController.buygoldrateController,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20.sp,
                            ),

                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return '';
                        //   }
                        //   return null;
                        // },
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'field is required';
                        //   }
                        //   if (!RegExp(r"^[A-Za-z]{4}[a-zA-Z0-9]{7}$").hasMatch(value)) {
                        //     return 'Invalid IFSC code';
                        //   }
                        //   return null;
                        // },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF2D5D5F),
                          border: InputBorder.none,
                          hintText: '0',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 21.sp,
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                VerticalSpacer(5.h),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          goldController.buygoldrateController.text = '201';
                        },
                        child: Container(
                          height: Adaptive.h(5),
                          width: Adaptive.w(26),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.sp),
                              border: Border.all(color: Colors.white)),
                          child: const Center(
                            child: Text(
                              '201',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          goldController.buygoldrateController.text = '501';
                        },
                        child: Container(
                          height: Adaptive.h(5),
                          width: Adaptive.w(26),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.sp),
                              border: Border.all(color: Colors.white)),
                          child: const Center(
                            child: Text(
                              '501',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          goldController.buygoldrateController.text = '1001';
                        },
                        child: Container(
                          height: Adaptive.h(5),
                          width: Adaptive.w(26),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.sp),
                              border: Border.all(color: Colors.white)),
                          child: const Center(
                            child: Text(
                              '1001',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                VerticalSpacer(5.h),
                Text(
                  'Price ₹ ${goldController.goldvalue}/mg (excl 3% GST)',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                VerticalSpacer(15.h),
                InkWell(
                  onTap: () async {
                    if (goldController.buygoldrateController.text.isNotEmpty) {
                      //"TB7WBn",
                      // ijiPG7
                      goldController.generateSSID();
                      goldController.calulateWithGstAmount();
                      _checkoutPro.openCheckoutScreen(payUPaymentParams: {
                        PayUPaymentParamKey.key: "TB7WBn",
                        PayUPaymentParamKey.amount: goldController.totalAmount,
                        PayUPaymentParamKey.productInfo: "Payu",
                        PayUPaymentParamKey.firstName: dashBordController
                                .dashBoardModel?.result?.data?.name ??
                            '',
                        PayUPaymentParamKey.email: dashBordController
                                .dashBoardModel?.result?.data?.email ??
                            "",
                        PayUPaymentParamKey.phone: dashBordController
                                .dashBoardModel?.result?.data?.phoneNumber ??
                            '',
                        PayUPaymentParamKey.environment: "1",
                        // String - "0" for Production and "1" for Test
                        PayUPaymentParamKey.transactionId:
                            goldController.transactionid,
                        // transactionId Cannot be null or empty and should be unique for each transaction. Maximum allowed length is 25 characters. It cannot contain special characters like: -_/
                        PayUPaymentParamKey.userCredential: ":1000",
                        //  Format: <merchantKey>:<userId> ... UserId is any id/email/phone number to uniquely identify the user.
                        PayUPaymentParamKey.android_surl:
                            "https://cbjs.payu.in/sdk/success",
                        PayUPaymentParamKey.android_furl:
                            "https://cbjs.payu.in/sdk/failure",
                        PayUPaymentParamKey.ios_surl:
                            "https://cbjs.payu.in/sdk/success",
                        PayUPaymentParamKey.ios_furl:
                            "https://cbjs.payu.in/sdk/failure",
                      }, payUCheckoutProConfig: {
                        PayUCheckoutProConfigKeys.merchantName: "PayU",
                      });
                    } else {
                      showFlushbar(context, 'Please enter amount');
                    }

                    // PayUPayment();
                  },
                  child: Container(
                    height: Adaptive.h(5),
                    width: Adaptive.w(25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.sp),
                        // color: Color(0xFF2D5D5F),
                        color: const Color(0xFFF7BF05)),
                    child: const Center(
                      child: Text(
                        'Buy',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D5D5F),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  @override
  generateHash(Map response) async {
    // Handle Hash
    log('response in generate hash $response');
    Map hashResponse = HashService.generateHash(response);
    _checkoutPro.hashGenerated(hash: hashResponse);
  }

  @override
  onPaymentSuccess(dynamic response) async {
    log("sucess response $response");
    log('sucess response id${response['payuResponse']}');
    Map<String, dynamic> responseMap = json.decode(response['payuResponse']);
    log(responseMap.toString());
    final goldController = Provider.of<GoldController>(context, listen: false);
    Provider.of<GoldController>(context, listen: false).calculate();
    bool result = await goldController.goldTrasaction(response, context);
    if (result == true) {
      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ScreenGoldBuyingAndSelling(),
        ),
      );
    }
  }

  @override
  onPaymentFailure(dynamic response) {
    log(response.toString());
  }

  @override
  onPaymentCancel(dynamic response) {
    log(response.toString());
  }

  @override
  onError(dynamic response) {
    log(response.toString());
  }
}
