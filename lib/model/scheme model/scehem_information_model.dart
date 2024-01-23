// To parse this JSON data, do
//
//     final schemeInfoModel = schemeInfoModelFromJson(jsonString);

import 'dart:convert';

SchemeInfoModel schemeInfoModelFromJson(String str) =>
    SchemeInfoModel.fromJson(json.decode(str));

String schemeInfoModelToJson(SchemeInfoModel data) =>
    json.encode(data.toJson());

class SchemeInfoModel {
  int? status;
  String? statusMsg;
  String? msg;
  String? schemeName;
  String? schemeAmfiCode;
  String? schemeObjective;
  String? schemeManager;
  String? schemeManagerBiography;
  String? schemeCategory;
  String? schemeCompany;
  String? schemeInceptionDate;
  double? expenseRatioPercentage;
  String? expenseRatioDate;
  String? schemeStatus;
  dynamic minimumInvestment;
  dynamic sipMinimumAmount;
  dynamic minimumTopup;
  double? schemeAssets;
  String? schemeAssetDate;
  bool? isDividendScheme;
  String? exitLoad;
  List<SchemePortfolioList>? schemePortfolioList;

  SchemeInfoModel({
    this.status,
    this.statusMsg,
    this.msg,
    this.schemeName,
    this.schemeAmfiCode,
    this.schemeObjective,
    this.schemeManager,
    this.schemeManagerBiography,
    this.schemeCategory,
    this.schemeCompany,
    this.schemeInceptionDate,
    this.expenseRatioPercentage,
    this.expenseRatioDate,
    this.schemeStatus,
    this.minimumInvestment,
    this.sipMinimumAmount,
    this.minimumTopup,
    this.schemeAssets,
    this.schemeAssetDate,
    this.isDividendScheme,
    this.exitLoad,
    this.schemePortfolioList,
  });

  factory SchemeInfoModel.fromJson(Map<String, dynamic> json) =>
      SchemeInfoModel(
        status: json["status"],
        statusMsg: json["status_msg"],
        msg: json["msg"],
        schemeName: json["scheme_name"],
        schemeAmfiCode: json["scheme_amfi_code"],
        schemeObjective: json["scheme_objective"],
        schemeManager: json["scheme_manager"],
        schemeManagerBiography: json["scheme_manager_biography"],
        schemeCategory: json["scheme_category"],
        schemeCompany: json["scheme_company"],
        schemeInceptionDate: json["scheme_inception_date"],
        expenseRatioPercentage: json["expense_ratio_percentage"]?.toDouble(),
        expenseRatioDate: json["expense_ratio_date"],
        schemeStatus: json["scheme_status"],
        minimumInvestment: json["minimum_investment"],
        sipMinimumAmount: json["sip_minimum_amount"],
        minimumTopup: json["minimum_topup"],
        schemeAssets: json["scheme_assets"]?.toDouble(),
        schemeAssetDate: json["scheme_asset_date"],
        isDividendScheme: json["is_dividend_scheme"],
        exitLoad: json["exit_load"],
        schemePortfolioList: List<SchemePortfolioList>.from(
            json["scheme_portfolio_list"]
                .map((x) => SchemePortfolioList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "status_msg": statusMsg,
        "msg": msg,
        "scheme_name": schemeName,
        "scheme_amfi_code": schemeAmfiCode,
        "scheme_objective": schemeObjective,
        "scheme_manager": schemeManager,
        "scheme_manager_biography": schemeManagerBiography,
        "scheme_category": schemeCategory,
        "scheme_company": schemeCompany,
        "scheme_inception_date": schemeInceptionDate,
        "expense_ratio_percentage": expenseRatioPercentage,
        "expense_ratio_date": expenseRatioDate,
        "scheme_status": schemeStatus,
        "minimum_investment": minimumInvestment,
        "sip_minimum_amount": sipMinimumAmount,
        "minimum_topup": minimumTopup,
        "scheme_assets": schemeAssets,
        "scheme_asset_date": schemeAssetDate,
        "is_dividend_scheme": isDividendScheme,
        "exit_load": exitLoad,
        "scheme_portfolio_list":
            List<dynamic>.from(schemePortfolioList!.map((x) => x.toJson())),
      };
}

class SchemePortfolioList {
  Map<String, double> schemePortfolioHoldings;
  SectorAllocation sectorAllocation;

  SchemePortfolioList({
    required this.schemePortfolioHoldings,
    required this.sectorAllocation,
  });

  factory SchemePortfolioList.fromJson(Map<String, dynamic> json) =>
      SchemePortfolioList(
        schemePortfolioHoldings: Map.from(json["schemePortfolioHoldings"])
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        sectorAllocation: SectorAllocation.fromJson(json["sectorAllocation"]),
      );

  Map<String, dynamic> toJson() => {
        "schemePortfolioHoldings": Map.from(schemePortfolioHoldings)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "sectorAllocation": sectorAllocation.toJson(),
      };
}

class SectorAllocation {
  double? financial;
  double? energy;
  double? technology;
  double? consumerStaples;
  double? healthcare;
  double? construction;
  double? materials;
  double? automobile;
  double? communication;
  double? capitalGoods;

  SectorAllocation({
    this.financial,
    this.energy,
    this.technology,
    this.consumerStaples,
    this.healthcare,
    this.construction,
    this.materials,
    this.automobile,
    this.communication,
    this.capitalGoods,
  });

  factory SectorAllocation.fromJson(Map<String, dynamic> json) =>
      SectorAllocation(
        financial: json["Financial"]?.toDouble(),
        energy: json["Energy"]?.toDouble(),
        technology: json["Technology"]?.toDouble(),
        consumerStaples: json["Consumer Staples"]?.toDouble(),
        healthcare: json["Healthcare"]?.toDouble(),
        construction: json["Construction"]?.toDouble(),
        materials: json["Materials"]?.toDouble(),
        automobile: json["Automobile"]?.toDouble(),
        communication: json["Communication"]?.toDouble(),
        capitalGoods: json["Capital Goods"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "Financial": financial,
        "Energy": energy,
        "Technology": technology,
        "Consumer Staples": consumerStaples,
        "Healthcare": healthcare,
        "Construction": construction,
        "Materials": materials,
        "Automobile": automobile,
        "Communication": communication,
        "Capital Goods": capitalGoods,
      };
}
