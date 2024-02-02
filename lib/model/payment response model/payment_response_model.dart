// To parse this JSON data, do
//
//     final paymentResponseModel = paymentResponseModelFromJson(jsonString);

import 'dart:convert';

PaymentResponseModel paymentResponseModelFromJson(String str) =>
    PaymentResponseModel.fromJson(json.decode(str));

String paymentResponseModelToJson(PaymentResponseModel data) =>
    json.encode(data.toJson());

class PaymentResponseModel {
  int? status;
  Result? result;

  PaymentResponseModel({
    this.status,
    this.result,
  });

  factory PaymentResponseModel.fromJson(Map<String, dynamic> json) =>
      PaymentResponseModel(
        status: json["status"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result!.toJson(),
      };
}

class Result {
  String? uniqueNo;
  String? trxnNo;
  String? fund;
  dynamic folio;
  String? schemeName;
  String? paymentstaus;
  String? paymentlink;

  Result({
    this.uniqueNo,
    this.trxnNo,
    this.fund,
    this.folio,
    this.schemeName,
    this.paymentstaus,
    this.paymentlink,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        uniqueNo: json["Unique_No"],
        trxnNo: json["Trxn_No"],
        fund: json["Fund"],
        folio: json["Folio"],
        schemeName: json["Scheme_Name"],
        paymentstaus: json["paymentstaus"],
        paymentlink: json["paymentlink"],
      );

  Map<String, dynamic> toJson() => {
        "Unique_No": uniqueNo,
        "Trxn_No": trxnNo,
        "Fund": fund,
        "Folio": folio,
        "Scheme_Name": schemeName,
        "paymentstaus": paymentstaus,
        "paymentlink": paymentlink,
      };
}
