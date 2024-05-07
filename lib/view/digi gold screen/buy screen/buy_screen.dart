import 'dart:developer';

import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/payu%20payment/hashservice.dart';
import 'package:flutter/material.dart';
import 'package:payu_checkoutpro_flutter/PayUConstantKeys.dart';
import 'package:payu_checkoutpro_flutter/payu_checkoutpro_flutter.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2D5D5F),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color(0xFF2D5D5F),
      body: SingleChildScrollView(
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
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.sp,
                        ),
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
                      border: InputBorder.none,
                      hintText: '0',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
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
                  Container(
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
                  Container(
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
                  Container(
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
                ],
              ),
            ),
            VerticalSpacer(5.h),
            const Text(
              'Price ₹ 7.56/mg (excl 3% GST)',
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            VerticalSpacer(15.h),
            InkWell(
              onTap: () async {
                _checkoutPro.openCheckoutScreen(payUPaymentParams: {
                  PayUPaymentParamKey.key: "TB7WBn",
                  PayUPaymentParamKey.amount: "10",
                  PayUPaymentParamKey.productInfo: "Payu",
                  PayUPaymentParamKey.firstName: "Sidhu Patil",
                  PayUPaymentParamKey.email: "abc@gmail.com",
                  PayUPaymentParamKey.phone: "9876543210",
                  PayUPaymentParamKey.environment: "1",
                  // String - "0" for Production and "1" for Test
                  PayUPaymentParamKey.transactionId: "abc1234567982",
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
      ),
    );
  }

  @override
  generateHash(Map response) async {
    // Handle Hash
    Map hashResponse = HashService.generateHash(response);
    _checkoutPro.hashGenerated(hash: hashResponse);
  }

  @override
  onPaymentSuccess(dynamic response) {
    log(response.toString());
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
