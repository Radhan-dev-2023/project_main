// To parse this JSON data, do
//
//     final fliterModel = fliterModelFromJson(jsonString);

import 'dart:convert';

FliterModel fliterModelFromJson(String str) =>
    FliterModel.fromJson(json.decode(str));

String fliterModelToJson(FliterModel data) => json.encode(data.toJson());

class FliterModel {
  int? status;
  List<Result>? result;

  FliterModel({
    this.status,
    this.result,
  });

  factory FliterModel.fromJson(Map<String, dynamic> json) => FliterModel(
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
  String? id;
  String? customerId;
  String? trxnNo;
  double? navValue;
  String? transactionType;
  String? amount;
  String? schemeName;
  String? entryDate;
  String? folioNo;
  String? trxnStatus;

  Result({
    this.id,
    this.customerId,
    this.trxnNo,
    this.navValue,
    this.transactionType,
    this.amount,
    this.schemeName,
    this.entryDate,
    this.folioNo,
    this.trxnStatus,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        customerId: json["CUSTOMER_ID"],
        trxnNo: json["trxn_no"],
        navValue: json["nav_value"]?.toDouble(),
        transactionType: json["transaction_type"],
        amount: json["AMOUNT"],
        schemeName: json["SCHEME_NAME"],
        entryDate: json["ENTRY_DATE"],
        folioNo: json["FOLIO_NO"],
        trxnStatus: json["TRXN_STATUS"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "CUSTOMER_ID": customerId,
        "trxn_no": trxnNo,
        "nav_value": navValue,
        "transaction_type": transactionType,
        "AMOUNT": amount,
        "SCHEME_NAME": schemeName,
        "ENTRY_DATE": entryDate,
        "FOLIO_NO": folioNo,
        "TRXN_STATUS": trxnStatus,
      };
}
