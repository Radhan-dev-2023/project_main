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
        result: json["result"] != null ? Result.fromJson(json["result"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result?.toJson(),
      };
}

class Result {
  String? netInvestment;
  String? netDebtGains;
  String? netEquityGains;
  String? totalAmount;
  dynamic growth;
  String? pendingAmount;
  Gold? gold;
  Silver? silver;

  Result({
    this.netInvestment,
    this.netDebtGains,
    this.netEquityGains,
    this.totalAmount,
    this.growth,
    this.pendingAmount,
    this.gold,
    this.silver,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        netInvestment: json["net_investment"],
        netDebtGains: json["net_debt_gains"],
        netEquityGains: json["net_equity_gains"],
        totalAmount: json["total_amount"],
        growth: json["growth"],
        pendingAmount: json["pending_amount"],
        gold: json["gold"] != null ? Gold.fromJson(json["gold"]) : null,
        silver: json["silver"] != null ? Silver.fromJson(json["silver"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "net_investment": netInvestment,
        "net_debt_gains": netDebtGains,
        "net_equity_gains": netEquityGains,
        "total_amount": totalAmount,
        "growth": growth,
        "pending_amount": pendingAmount,
        "gold": gold?.toJson(),
        "silver": silver?.toJson(),
      };
}

class Gold {
  String? totalInvested;
  String? totalAmount;
  double? totalGain;

  Gold({
    this.totalInvested,
    this.totalAmount,
    this.totalGain,
  });

  factory Gold.fromJson(Map<String, dynamic> json) => Gold(
        totalInvested: json["totalInvested"],
        totalAmount: json["totalAmount"],
        totalGain: json["totalGain"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "totalInvested": totalInvested,
        "totalAmount": totalAmount,
        "totalGain": totalGain,
      };
}

class Silver {
  String? totalInvested;
  String? totalAmount;
  double? totalGain;

  Silver({
    this.totalInvested,
    this.totalAmount,
    this.totalGain,
  });

  factory Silver.fromJson(Map<String, dynamic> json) => Silver(
        totalInvested: json["totalInvested"],
        totalAmount: json["totalAmount"],
        totalGain: json["totalGain"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "totalInvested": totalInvested,
        "totalAmount": totalAmount,
        "totalGain": totalGain,
      };
}
