// import 'package:flutter/material.dart';
// import 'package:payu_checkoutpro_flutter/payu_checkoutpro_flutter.dart';
// import 'package:payu_checkoutpro_flutter/PayUConstantKeys.dart';

// class PayUPayment extends StatefulWidget {
//   const PayUPayment({super.key});

//   @override
//   State<PayUPayment> createState() => _PayUPaymentState();
// }

// late PayUCheckoutProFlutter _checkoutPro;

// class _PayUPaymentState extends State<PayUPayment> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     _checkoutPro = PayUCheckoutProFlutter(this);
//   }
// var payUPaymentParams = {
//       PayUPaymentParamKey.key: "",
//       PayUPaymentParamKey.amount: "1", //REQUIRED
//       PayUPaymentParamKey.productInfo: "Info", //REQUIRED
//       PayUPaymentParamKey.firstName: "Abc", //REQUIRED
//       PayUPaymentParamKey.email: "test@gmail.com", //REQUIRED
//       PayUPaymentParamKey.phone: "9999999999", //REQUIRED
//       PayUPaymentParamKey.ios_surl: PayUTestCredentials.iosSurl, //REQUIRED
//       PayUPaymentParamKey.ios_furl: PayUTestCredentials.iosFurl, //REQUIRED
//       PayUPaymentParamKey.android_surl:
//           PayUTestCredentials.androidSurl, //REQUIRED
//       PayUPaymentParamKey.android_furl:
//           PayUTestCredentials.androidFurl, //REQUIRED
//       PayUPaymentParamKey.environment: "0", //0 => Production 1 => Test
//       PayUPaymentParamKey.userCredential:
//           null, //Pass user credential to fetch saved cards => A:B - OPTIONAL
//       PayUPaymentParamKey.transactionId: "<ADD TRANSACTION ID>", //REQUIRED
//       PayUPaymentParamKey.additionalParam: additionalParam, // OPTIONAL
//       PayUPaymentParamKey.enableNativeOTP: true, // OPTIONAL
//       PayUPaymentParamKey.userToken:
//           "<Pass a unique token to fetch offers>", // OPTIONAL
//       PayUPaymentParamKey.payUSIParams: siParams, // OPTIONAL
//       PayUPaymentParamKey.splitPaymentDetails: spitPaymentDetails, // OPTIONAL
//     };
//   @override
//   Widget build(BuildContext context) {
//     return _checkoutPro.openCheckoutScreen(
// payUPaymentParams: payUPaymentParams,
// payUCheckoutProConfig: payUConfigParams,

// );
//   }
// }

// class MyClass extends PayUPayment implements PayUCheckoutProProtocol {

//   @override
//   generateHash(Map response) {
//     // TODO: implement generateHash
//     throw UnimplementedError();
//   }

//   @override
//   onError(Map? response) {
//     // TODO: implement onError
//     throw UnimplementedError();
//   }

//   @override
//   onPaymentCancel(Map? response) {
//     // TODO: implement onPaymentCancel
//     throw UnimplementedError();
//   }

//   @override
//   onPaymentFailure(response) {
//     // TODO: implement onPaymentFailure
//     throw UnimplementedError();
//   }

//   @override
//   onPaymentSuccess(response) {
//     // TODO: implement onPaymentSuccess
//     throw UnimplementedError();
//   }

// }
// class PayUTestCredentials {
//   static const merchantKey = "<ADD YOUR MERCHANT KEY>";
//   static const iosSurl = "<ADD YOUR iOS SURL>";
//   static const iosFurl = "<ADD YOUR iOS FURL>";
//   static const androidSurl = "<ADD YOUR ANDROID SURL>";
//   static const androidFurl = "<ADD YOUR ANDROID FURL>";
//   static const merchantAccessKey = "<ADD YOUR MERCHNAT ACCESS KEY>"; // Optional
//   static const sodexoSourceId = "<ADD YOUR SODEXO SOURCE ID>"; // Optional
// }
// var siParams = {
//       PayUSIParamsKeys.isFreeTrial: true,
//       PayUSIParamsKeys.billingAmount: '1', //REQUIRED
//       PayUSIParamsKeys.billingInterval: 1, //REQUIRED
//       PayUSIParamsKeys.paymentStartDate: '2023-04-20', //REQUIRED
//       PayUSIParamsKeys.paymentEndDate: '2023-04-30', //REQUIRED
//       PayUSIParamsKeys.billingCycle:
//           'daily', //REQUIRED //Can be any of 'daily','weekly','yearly','adhoc','once','monthly'
//       PayUSIParamsKeys.remarks: 'Test SI transaction',
//       PayUSIParamsKeys.billingCurrency: 'INR',
//       PayUSIParamsKeys.billingLimit: 'ON', //ON, BEFORE, AFTER
//       PayUSIParamsKeys.billingRule: 'MAX', //MAX, EXACT
//     };
//     var additionalParam = {
//       PayUAdditionalParamKeys.udf1: "udf1",
//       PayUAdditionalParamKeys.udf2: "udf2",
//       PayUAdditionalParamKeys.udf3: "udf3",
//       PayUAdditionalParamKeys.udf4: "udf4",
//       PayUAdditionalParamKeys.udf5: "udf5",
//       PayUAdditionalParamKeys.merchantAccessKey:
//           PayUTestCredentials.merchantAccessKey,
//       PayUAdditionalParamKeys.sourceId: PayUTestCredentials.sodexoSourceId,
//     };
//     var spitPaymentDetails = [
//       {
//         "type": "absolute",
//         "splitInfo": {
//           "imAJ7I": {
//             "aggregatorSubTxnId": "Testchild123",
//             "aggregatorSubAmt": "5"
//           },
//           "qOoYIv": {
//             "aggregatorSubTxnId": "Testchild098",
//             "aggregatorSubAmt": "5"
//           },
//         }
//       }
//     ];
import 'dart:developer';
import 'package:finfresh_mobile/view/payu%20payment/hashservice.dart';
import 'package:flutter/material.dart';
import 'package:payu_checkoutpro_flutter/PayUConstantKeys.dart';
import 'package:payu_checkoutpro_flutter/payu_checkoutpro_flutter.dart';

class PayUPayment extends StatefulWidget {
  const PayUPayment({Key? key}) : super(key: key);
  @override
  State<PayUPayment> createState() => _PayUPaymentState();
}

class _PayUPaymentState extends State<PayUPayment>
    implements PayUCheckoutProProtocol {
  late PayUCheckoutProFlutter _checkoutPro;
  @override
  void initState() {
    super.initState();
    _checkoutPro = PayUCheckoutProFlutter(this);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PayU Checkout Pro'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text("Start Payment"),
            onPressed: () async {
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
            },
          ),
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
