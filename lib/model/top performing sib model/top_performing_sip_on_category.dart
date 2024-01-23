// To parse this JSON data, do
//
//     final sipBasedOnCategoeryModel = sipBasedOnCategoeryModelFromJson(jsonString);

import 'dart:convert';

SipBasedOnCategoeryModel sipBasedOnCategoeryModelFromJson(String str) =>
    SipBasedOnCategoeryModel.fromJson(json.decode(str));

String sipBasedOnCategoeryModelToJson(SipBasedOnCategoeryModel data) =>
    json.encode(data.toJson());

class SipBasedOnCategoeryModel {
  int? status;
  String? statusMsg;
  String? msg;
  List<ListElement>? list;
  Returns? benchmarkReturns;
  Returns? categoryReturns;

  SipBasedOnCategoeryModel({
    this.status,
    this.statusMsg,
    this.msg,
    this.list,
    this.benchmarkReturns,
    this.categoryReturns,
  });

  factory SipBasedOnCategoeryModel.fromJson(Map<String, dynamic> json) =>
      SipBasedOnCategoeryModel(
        status: json["status"],
        statusMsg: json["status_msg"],
        msg: json["msg"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
        benchmarkReturns: Returns.fromJson(json["benchmark_returns"]),
        categoryReturns: Returns.fromJson(json["category_returns"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "status_msg": statusMsg,
        "msg": msg,
        "list": List<dynamic>.from(list!.map((x) => x.toJson())),
        "benchmark_returns": benchmarkReturns!.toJson(),
        "category_returns": categoryReturns!.toJson(),
      };
}

class Returns {
  String? schemeName;
  String? schemeCategory;
  bool? dividendScheme;
  String? inceptionDate;
  StartDate? startDate;
  Date? endDate;
  int? period;
  int? amount;
  int? currentCost;
  double? currentValue;
  double? returns;
  int? ter;
  int? schemeAssets;
  int? nav;
  int? priceChangeOnday;

  Returns({
    this.schemeName,
    this.schemeCategory,
    this.dividendScheme,
    this.inceptionDate,
    this.startDate,
    this.endDate,
    this.period,
    this.amount,
    this.currentCost,
    this.currentValue,
    this.returns,
    this.ter,
    this.schemeAssets,
    this.nav,
    this.priceChangeOnday,
  });

  factory Returns.fromJson(Map<String, dynamic> json) => Returns(
        schemeName: json["scheme_name"],
        schemeCategory: json["scheme_category"],
        dividendScheme: json["dividend_scheme"],
        inceptionDate: json["inception_date"],
        startDate: startDateValues.map[json["start_date"]]!,
        endDate: dateValues.map[json["end_date"]]!,
        period: json["period"],
        amount: json["amount"],
        currentCost: json["current_cost"],
        currentValue: json["current_value"]?.toDouble(),
        returns: json["returns"]?.toDouble(),
        ter: json["ter"],
        schemeAssets: json["scheme_assets"],
        nav: json["nav"],
        priceChangeOnday: json["price_change_onday"],
      );

  Map<String, dynamic> toJson() => {
        "scheme_name": schemeName,
        "scheme_category": schemeCategory,
        "dividend_scheme": dividendScheme,
        "inception_date": inceptionDate,
        "start_date": startDateValues.reverse[startDate],
        "end_date": dateValues.reverse[endDate],
        "period": period,
        "amount": amount,
        "current_cost": currentCost,
        "current_value": currentValue,
        "returns": returns,
        "ter": ter,
        "scheme_assets": schemeAssets,
        "nav": nav,
        "price_change_onday": priceChangeOnday,
      };
}

enum Date { THE_19012024 }

final dateValues = EnumValues({"19-01-2024": Date.THE_19012024});

enum StartDate { THE_19022021 }

final startDateValues = EnumValues({"19-02-2021": StartDate.THE_19022021});

class ListElement {
  int? id;
  String? schemeName;
  SchemeCategory? schemeCategory;
  String? schemeCompany;
  bool? dividendScheme;
  String? inceptionDate;
  StartDate? startDate;
  Date? endDate;
  int? period;
  int? amount;
  int? currentCost;
  double? currentValue;
  double? returns;
  double? ter;
  DateTime? terDate;
  double? schemeAssets;
  DateTime? schemeAssetDate;
  String? schemeAmfiUrl;
  String? icon;
  String? amcLogo;
  String? schemeCompanyShortName;
  int? rank3Yr;
  int? rank3YrTotalRank;
  Riskometer? riskometer;
  String? fundManager;
  String? schemeAmfiShortName;
  CategoryShortName? categoryShortName;
  double? nav;
  Date? navDate;
  double? priceChangeOnday;
  String? schemeAmfiCode;
  SchemePlanType? schemePlanType;
  String? subCategory;
  String? url;

  ListElement({
    this.id,
    this.schemeName,
    this.schemeCategory,
    this.schemeCompany,
    this.dividendScheme,
    this.inceptionDate,
    this.startDate,
    this.endDate,
    this.period,
    this.amount,
    this.currentCost,
    this.currentValue,
    this.returns,
    this.ter,
    this.terDate,
    this.schemeAssets,
    this.schemeAssetDate,
    this.schemeAmfiUrl,
    this.icon,
    this.amcLogo,
    this.schemeCompanyShortName,
    this.rank3Yr,
    this.rank3YrTotalRank,
    this.riskometer,
    this.fundManager,
    this.schemeAmfiShortName,
    this.categoryShortName,
    this.nav,
    this.navDate,
    this.priceChangeOnday,
    this.schemeAmfiCode,
    this.schemePlanType,
    this.subCategory,
    this.url,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        schemeName: json["scheme_name"],
        schemeCategory: schemeCategoryValues.map[json["scheme_category"]]!,
        schemeCompany: json["scheme_company"],
        dividendScheme: json["dividend_scheme"],
        inceptionDate: json["inception_date"],
        startDate: startDateValues.map[json["start_date"]]!,
        endDate: dateValues.map[json["end_date"]]!,
        period: json["period"],
        amount: json["amount"],
        currentCost: json["current_cost"],
        currentValue: json["current_value"]?.toDouble(),
        returns: json["returns"]?.toDouble(),
        ter: json["ter"]?.toDouble(),
        terDate: DateTime.parse(json["ter_date"]),
        schemeAssets: json["scheme_assets"]?.toDouble(),
        schemeAssetDate: DateTime.parse(json["scheme_asset_date"]),
        schemeAmfiUrl: json["scheme_amfi_url"],
        icon: json["icon"],
        amcLogo: json["amc_logo"],
        schemeCompanyShortName: json["scheme_company_short_name"],
        rank3Yr: json["rank_3_yr"],
        rank3YrTotalRank: json["rank_3_yr_total_rank"],
        riskometer: riskometerValues.map[json["riskometer"]]!,
        fundManager: json["fund_manager"],
        schemeAmfiShortName: json["scheme_amfi_short_name"],
        categoryShortName:
            categoryShortNameValues.map[json["category_short_name"]]!,
        nav: json["nav"]?.toDouble(),
        navDate: dateValues.map[json["nav_date"]]!,
        priceChangeOnday: json["price_change_onday"]?.toDouble(),
        schemeAmfiCode: json["scheme_amfi_code"],
        schemePlanType: schemePlanTypeValues.map[json["scheme_plan_type"]]!,
        subCategory: json["sub_category"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "scheme_name": schemeName,
        "scheme_category": schemeCategoryValues.reverse[schemeCategory],
        "scheme_company": schemeCompany,
        "dividend_scheme": dividendScheme,
        "inception_date": inceptionDate,
        "start_date": startDateValues.reverse[startDate],
        "end_date": dateValues.reverse[endDate],
        "period": period,
        "amount": amount,
        "current_cost": currentCost,
        "current_value": currentValue,
        "returns": returns,
        "ter": ter,
        "ter_date":
            "${terDate?.year.toString().padLeft(4, '0')}-${terDate?.month.toString().padLeft(2, '0')}-${terDate?.day.toString().padLeft(2, '0')}",
        "scheme_assets": schemeAssets,
        "scheme_asset_date":
            "${schemeAssetDate?.year.toString().padLeft(4, '0')}-${schemeAssetDate?.month.toString().padLeft(2, '0')}-${schemeAssetDate?.day.toString().padLeft(2, '0')}",
        "scheme_amfi_url": schemeAmfiUrl,
        "icon": icon,
        "amc_logo": amcLogo,
        "scheme_company_short_name": schemeCompanyShortName,
        "rank_3_yr": rank3Yr,
        "rank_3_yr_total_rank": rank3YrTotalRank,
        "riskometer": riskometerValues.reverse[riskometer],
        "fund_manager": fundManager,
        "scheme_amfi_short_name": schemeAmfiShortName,
        "category_short_name":
            categoryShortNameValues.reverse[categoryShortName],
        "nav": nav,
        "nav_date": dateValues.reverse[navDate],
        "price_change_onday": priceChangeOnday,
        "scheme_amfi_code": schemeAmfiCode,
        "scheme_plan_type": schemePlanTypeValues.reverse[schemePlanType],
        "sub_category": subCategory,
        "url": url,
      };
}

enum CategoryShortName { EQ_MID }

final categoryShortNameValues =
    EnumValues({"EQ-MID": CategoryShortName.EQ_MID});

enum Riskometer { VERY_HIGH }

final riskometerValues = EnumValues({"Very High": Riskometer.VERY_HIGH});

enum SchemeCategory { EQUITY_MID_CAP }

final schemeCategoryValues =
    EnumValues({"Equity: Mid Cap": SchemeCategory.EQUITY_MID_CAP});

enum SchemePlanType { REGULAR }

final schemePlanTypeValues = EnumValues({"Regular": SchemePlanType.REGULAR});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
