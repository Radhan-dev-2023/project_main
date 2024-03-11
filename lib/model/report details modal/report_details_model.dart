// To parse this JSON data, do
//
//     final reportDetailsModel = reportDetailsModelFromJson(jsonString);

import 'dart:convert';

ReportDetailsModel reportDetailsModelFromJson(String str) =>
    ReportDetailsModel.fromJson(json.decode(str));

String reportDetailsModelToJson(ReportDetailsModel data) =>
    json.encode(data.toJson());

class ReportDetailsModel {
  int? status;
  ReportDetailsModelTransaction? transaction;

  ReportDetailsModel({
    this.status,
    this.transaction,
  });

  factory ReportDetailsModel.fromJson(Map<String, dynamic> json) =>
      ReportDetailsModel(
        status: json["status"],
        transaction:
            ReportDetailsModelTransaction.fromJson(json["transaction"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "transaction": transaction!.toJson(),
      };
}

class ReportDetailsModelTransaction {
  String? transactionType;
  double? totalAmount;
  String? purchasedate;
  double? investmentAmount;
  double? gains;
  String? growthAbsolute;
  double? totalUnits;
  double? averageNav;
  double? currentNav;
  String? schemeName;
  List<PurchaseDetail>? purchaseDetails;

  ReportDetailsModelTransaction({
    this.transactionType,
    this.totalAmount,
    this.purchasedate,
    this.investmentAmount,
    this.gains,
    this.growthAbsolute,
    this.totalUnits,
    this.averageNav,
    this.currentNav,
    this.schemeName,
    this.purchaseDetails,
  });

  factory ReportDetailsModelTransaction.fromJson(Map<String, dynamic> json) =>
      ReportDetailsModelTransaction(
        transactionType: json["transaction_type"],
        totalAmount: json["total_amount"]?.toDouble(),
        purchasedate: json["purchasedate"],
        investmentAmount: json["investment_amount"]?.toDouble(),
        gains: json["gains"]?.toDouble(),
        growthAbsolute: json["growth_absolute"],
        totalUnits: json["total_units"]?.toDouble(),
        averageNav: json["average_nav"]?.toDouble(),
        currentNav: json["current_nav"]?.toDouble(),
        schemeName: json["scheme_name"],
        purchaseDetails: List<PurchaseDetail>.from(
            json["purchaseDetails"].map((x) => PurchaseDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "transaction_type": transactionType,
        "total_amount": totalAmount,
        "purchasedate": purchasedate,
        "investment_amount": investmentAmount,
        "gains": gains,
        "growth_absolute": growthAbsolute,
        "total_units": totalUnits,
        "average_nav": averageNav,
        "current_nav": currentNav,
        "scheme_name": schemeName,
        "purchaseDetails":
            List<dynamic>.from(purchaseDetails!.map((x) => x.toJson())),
      };
}

class PurchaseDetail {
  String? folio;
  List<TransactionElement>? transactions;

  PurchaseDetail({
    this.folio,
    this.transactions,
  });

  factory PurchaseDetail.fromJson(Map<String, dynamic> json) => PurchaseDetail(
        folio: json["folio"],
        transactions: List<TransactionElement>.from(
            json["transactions"].map((x) => TransactionElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "folio": folio,
        "transactions":
            List<dynamic>.from(transactions!.map((x) => x.toJson())),
      };
}

class TransactionElement {
  String? transactionType;
  String? nav;
  String? units;
  double? purchasesmount;
  String? transactionDate;

  TransactionElement({
    this.transactionType,
    this.nav,
    this.units,
    this.purchasesmount,
    this.transactionDate,
  });

  factory TransactionElement.fromJson(Map<String, dynamic> json) =>
      TransactionElement(
        transactionType: json["transaction_type"],
        nav: json["nav"],
        units: json["units"],
        purchasesmount: json["purchasesmount"]?.toDouble(),
        transactionDate: json["transaction_date"],
      );

  Map<String, dynamic> toJson() => {
        "transaction_type": transactionType,
        "nav": nav,
        "units": units,
        "purchasesmount": purchasesmount,
        "transaction_date": transactionDate,
      };
}
