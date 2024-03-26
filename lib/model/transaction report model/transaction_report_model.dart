// To parse this JSON data, do
//
//     final transactionReport = transactionReportFromJson(jsonString);

import 'dart:convert';

TransactionReport transactionReportFromJson(String str) =>
    TransactionReport.fromJson(json.decode(str));

String transactionReportToJson(TransactionReport data) =>
    json.encode(data.toJson());

class TransactionReport {
  int? status;
  List<ResultReport>? result;

  TransactionReport({
    this.status,
    this.result,
  });

  factory TransactionReport.fromJson(Map<String, dynamic> json) =>
      TransactionReport(
        status: json["status"],
        result: List<ResultReport>.from(
            json["result"].map((x) => ResultReport.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class ResultReport {
  String? productName;
  String? investmentAmount;
  String? gains;
  dynamic growth;
  String? totalAmount;
  String? isin;
  String? userTrxnno;

  ResultReport({
    this.productName,
    this.investmentAmount,
    this.gains,
    this.growth,
    this.totalAmount,
    this.isin,
    this.userTrxnno,
  });

  factory ResultReport.fromJson(Map<String, dynamic> json) => ResultReport(
        productName: json["product_name"],
        investmentAmount: json["investment_amount"],
        gains: json["gains"],
        growth: json["growth"],
        totalAmount: json["total_amount"],
        isin: json["isin"],
        userTrxnno: json["USER_TRXNNO"],
      );

  Map<String, dynamic> toJson() => {
        "product_name": productName,
        "investment_amount": investmentAmount,
        "gains": gains,
        "growth": growth,
        "total_amount": totalAmount,
        "isin": isin,
        "USER_TRXNNO": userTrxnno,
      };
}
