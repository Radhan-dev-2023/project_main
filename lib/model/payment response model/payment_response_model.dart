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
  List<Result>? result;

  PaymentResponseModel({
    this.status,
    this.result,
  });

  factory PaymentResponseModel.fromJson(Map<String, dynamic> json) =>
      PaymentResponseModel(
        status: json["status"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class Result {
  String? uniqueNo;
  String? trxnNo;
  String? fund;
  dynamic folio;
  String? scheme;
  String? schemeName;
  String? amt;
  String? inputRefNo;
  dynamic paymentstaus;
  String? link;

  Result({
    this.uniqueNo,
    this.trxnNo,
    this.fund,
    this.folio,
    this.scheme,
    this.schemeName,
    this.amt,
    this.inputRefNo,
    this.paymentstaus,
    this.link,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        uniqueNo: json["Unique_No"],
        trxnNo: json["Trxn_No"],
        fund: json["Fund"],
        folio: json["Folio"],
        scheme: json["Scheme"],
        schemeName: json["Scheme_Name"],
        amt: json["Amt"],
        inputRefNo: json["Input_ref_no"],
        paymentstaus: json["paymentstaus"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "Unique_No": uniqueNo,
        "Trxn_No": trxnNo,
        "Fund": fund,
        "Folio": folio,
        "Scheme": scheme,
        "Scheme_Name": schemeName,
        "Amt": amt,
        "Input_ref_no": inputRefNo,
        "paymentstaus": paymentstaus,
        "link": link,
      };
}
