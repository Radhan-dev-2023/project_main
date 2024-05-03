// // To parse this JSON data, do
//
//     final reportDetailsModel = reportDetailsModelFromJson(jsonString);

import 'dart:convert';

ReportDetailsModel reportDetailsModelFromJson(String str) =>
    ReportDetailsModel.fromJson(json.decode(str));

String reportDetailsModelToJson(ReportDetailsModel data) =>
    json.encode(data.toJson());

class ReportDetailsModel {
  int? status;
  Result? result;

  ReportDetailsModel({
    this.status,
    this.result,
  });

  factory ReportDetailsModel.fromJson(Map<String, dynamic> json) =>
      ReportDetailsModel(
        status: json["status"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result!.toJson(),
      };
}

class Result {
  String? schemeName;
  dynamic totalUnits;
  String? investmentAmount;
  String? totalAmount;
  dynamic gains;
  dynamic purchaseDate;
  String? growthAbsolute;
  double? averageNav;
  double? currentNav;
  List<PurchaseDetail>? purchaseDetails;

  Result({
    this.schemeName,
    this.totalUnits,
    this.investmentAmount,
    this.totalAmount,
    this.gains,
    this.purchaseDate,
    this.growthAbsolute,
    this.averageNav,
    this.currentNav,
    this.purchaseDetails,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        schemeName: json["scheme_name"],
        totalUnits: json["total_units"],
        investmentAmount: json["investment_amount"],
        totalAmount: json["Total_amount"],
        gains: json["gains"],
        purchaseDate: json["purchaseDate"],
        growthAbsolute: json["growth_absolute"],
        averageNav: json["avg_nav"]?.toDouble(),
        currentNav: json["current_nav"]?.toDouble(),
        purchaseDetails: List<PurchaseDetail>.from(
            json["purchaseDetails"].map((x) => PurchaseDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "scheme_name": schemeName,
        "total_units": totalUnits,
        "investment_amount": investmentAmount,
        "Total_amount": totalAmount,
        "gains": gains,
        "purchaseDate": purchaseDate,
        "growth_absolute": growthAbsolute,
        "average_nav": averageNav,
        "current_nav": currentNav,
        "purchaseDetails":
            List<dynamic>.from(purchaseDetails!.map((x) => x.toJson())),
      };
}

class PurchaseDetail {
  dynamic folio;
  List<Transaction>? transactions;

  PurchaseDetail({
    this.folio,
    this.transactions,
  });

  factory PurchaseDetail.fromJson(Map<String, dynamic> json) => PurchaseDetail(
        folio: json["folio"],
        transactions: List<Transaction>.from(
            json["transactions"].map((x) => Transaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "folio": folio,
        "transactions":
            List<dynamic>.from(transactions!.map((x) => x.toJson())),
      };
}

class Transaction {
  String? transactionType;
  dynamic nav;
  dynamic units;
  dynamic purchaseAmount;
  dynamic transactionDate;

  Transaction({
    this.transactionType,
    this.nav,
    this.units,
    this.purchaseAmount,
    this.transactionDate,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        transactionType: json["transaction_type"],
        nav: json["nav"],
        units: json["units"],
        purchaseAmount: json["purchase_amount"],
        transactionDate: json["transaction_date"],
      );

  Map<String, dynamic> toJson() => {
        "transaction_type": transactionType,
        "nav": nav,
        "units": units,
        "purchase_amount": purchaseAmount,
        "transaction_date": transactionDate,
      };
}
