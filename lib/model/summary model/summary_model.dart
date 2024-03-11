// To parse this JSON data, do
//
//     final summaryModel = summaryModelFromJson(jsonString);

import 'dart:convert';

SummaryModel summaryModelFromJson(String str) =>
    SummaryModel.fromJson(json.decode(str));

String summaryModelToJson(SummaryModel data) => json.encode(data.toJson());

class SummaryModel {
  int? status;
  Result? result;

  SummaryModel({
    this.status,
    this.result,
  });

  factory SummaryModel.fromJson(Map<String, dynamic> json) => SummaryModel(
        status: json["status"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result!.toJson(),
      };
}

class Result {
  String? netInvestment;
  String? netDebtGains;
  String? netEquityGains;
  String? totalAmount;
  String? growth;
  String? pendingAmount;

  Result({
    this.netInvestment,
    this.netDebtGains,
    this.netEquityGains,
    this.totalAmount,
    this.growth,
    this.pendingAmount,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        netInvestment: json["net_investment"],
        netDebtGains: json["net_debt_gains"],
        netEquityGains: json["net_equity_gains"],
        totalAmount: json["total_amount"],
        growth: json["growth"],
        pendingAmount: json["pending_amount"],
      );

  Map<String, dynamic> toJson() => {
        "net_investment": netInvestment,
        "net_debt_gains": netDebtGains,
        "net_equity_gains": netEquityGains,
        "total_amount": totalAmount,
        "growth": growth,
        "pending_amount": pendingAmount,
      };
}
