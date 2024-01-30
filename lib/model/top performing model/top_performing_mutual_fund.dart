// To parse this JSON data, do
//
//     final topPerformingMutualFundModel = topPerformingMutualFundModelFromJson(jsonString);

import 'dart:convert';

TopPerformingMutualFundModel topPerformingMutualFundModelFromJson(String str) =>
    TopPerformingMutualFundModel.fromJson(json.decode(str));

String topPerformingMutualFundModelToJson(TopPerformingMutualFundModel data) =>
    json.encode(data.toJson());

class TopPerformingMutualFundModel {
  int? status;
  String? statusMsg;
  String? msg;
  List<ListElement>? list;
  BenchmarkReturns? benchmarkReturns;
  CategoryReturns? categoryReturns;

  TopPerformingMutualFundModel({
    this.status,
    this.statusMsg,
    this.msg,
    this.list,
    this.benchmarkReturns,
    this.categoryReturns,
  });

  factory TopPerformingMutualFundModel.fromJson(Map<String, dynamic> json) =>
      TopPerformingMutualFundModel(
        status: json["status"],
        statusMsg: json["status_msg"],
        msg: json["msg"],
        list: json["list"] == null
            ? null
            : List<ListElement>.from(
                json["list"].map((x) => ListElement.fromJson(x))),
        benchmarkReturns: json["benchmark_returns"] == null
            ? null
            : BenchmarkReturns.fromJson(json["benchmark_returns"]),
        categoryReturns: json["category_returns"] == null
            ? null
            : CategoryReturns.fromJson(json["category_returns"]),
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

class BenchmarkReturns {
  int? id;
  String? benchmarkName;
  String? citicode;
  String? priceDate;
  double? returnsAbs7Days;
  double? returnsAbs1Month;
  double? returnsAbs3Month;
  double? returnsAbs6Month;
  double? returnsAbsYtd;
  double? returnsAbs1Year;
  double? returnsCmp2Year;
  double? returnsCmp3Year;
  double? returnsCmp4Year;
  double? returnsCmp5Year;
  double? returnsCmp10Year;
  double? returnsCmpInception;
  double? returnsAbs2012;
  double? returnsAbs2013;
  double? returnsAbs2014;
  double? returnsAbs2015;
  double? returnsAbs2016;
  double? returnsCmp8Year;
  double? returnsAbs2007;
  double? returnsAbs2008;
  double? returnsAbs2009;
  double? returnsAbs2010;
  double? returnsAbs2011;

  BenchmarkReturns({
    this.id,
    this.benchmarkName,
    this.citicode,
    this.priceDate,
    this.returnsAbs7Days,
    this.returnsAbs1Month,
    this.returnsAbs3Month,
    this.returnsAbs6Month,
    this.returnsAbsYtd,
    this.returnsAbs1Year,
    this.returnsCmp2Year,
    this.returnsCmp3Year,
    this.returnsCmp4Year,
    this.returnsCmp5Year,
    this.returnsCmp10Year,
    this.returnsCmpInception,
    this.returnsAbs2012,
    this.returnsAbs2013,
    this.returnsAbs2014,
    this.returnsAbs2015,
    this.returnsAbs2016,
    this.returnsCmp8Year,
    this.returnsAbs2007,
    this.returnsAbs2008,
    this.returnsAbs2009,
    this.returnsAbs2010,
    this.returnsAbs2011,
  });

  factory BenchmarkReturns.fromJson(Map<String, dynamic> json) =>
      BenchmarkReturns(
        id: json["id"],
        benchmarkName: json["benchmark_name"],
        citicode: json["citicode"],
        priceDate: json["price_date"],
        returnsAbs7Days: json["returns_abs_7days"]?.toDouble(),
        returnsAbs1Month: json["returns_abs_1month"]?.toDouble(),
        returnsAbs3Month: json["returns_abs_3month"]?.toDouble(),
        returnsAbs6Month: json["returns_abs_6month"]?.toDouble(),
        returnsAbsYtd: json["returns_abs_ytd"]?.toDouble(),
        returnsAbs1Year: json["returns_abs_1year"]?.toDouble(),
        returnsCmp2Year: json["returns_cmp_2year"]?.toDouble(),
        returnsCmp3Year: json["returns_cmp_3year"]?.toDouble(),
        returnsCmp4Year: json["returns_cmp_4year"]?.toDouble(),
        returnsCmp5Year: json["returns_cmp_5year"]?.toDouble(),
        returnsCmp10Year: json["returns_cmp_10year"]?.toDouble(),
        returnsCmpInception: json["returns_cmp_inception"]?.toDouble(),
        returnsAbs2012: json["returns_abs_2012"]?.toDouble(),
        returnsAbs2013: json["returns_abs_2013"]?.toDouble(),
        returnsAbs2014: json["returns_abs_2014"]?.toDouble(),
        returnsAbs2015: json["returns_abs_2015"]?.toDouble(),
        returnsAbs2016: json["returns_abs_2016"]?.toDouble(),
        returnsCmp8Year: json["returns_cmp_8year"]?.toDouble(),
        returnsAbs2007: json["returns_abs_2007"]?.toDouble(),
        returnsAbs2008: json["returns_abs_2008"]?.toDouble(),
        returnsAbs2009: json["returns_abs_2009"]?.toDouble(),
        returnsAbs2010: json["returns_abs_2010"]?.toDouble(),
        returnsAbs2011: json["returns_abs_2011"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "benchmark_name": benchmarkName,
        "citicode": citicode,
        "price_date": priceDate,
        "returns_abs_7days": returnsAbs7Days,
        "returns_abs_1month": returnsAbs1Month,
        "returns_abs_3month": returnsAbs3Month,
        "returns_abs_6month": returnsAbs6Month,
        "returns_abs_ytd": returnsAbsYtd,
        "returns_abs_1year": returnsAbs1Year,
        "returns_cmp_2year": returnsCmp2Year,
        "returns_cmp_3year": returnsCmp3Year,
        "returns_cmp_4year": returnsCmp4Year,
        "returns_cmp_5year": returnsCmp5Year,
        "returns_cmp_10year": returnsCmp10Year,
        "returns_cmp_inception": returnsCmpInception,
        "returns_abs_2012": returnsAbs2012,
        "returns_abs_2013": returnsAbs2013,
        "returns_abs_2014": returnsAbs2014,
        "returns_abs_2015": returnsAbs2015,
        "returns_abs_2016": returnsAbs2016,
        "returns_cmp_8year": returnsCmp8Year,
        "returns_abs_2007": returnsAbs2007,
        "returns_abs_2008": returnsAbs2008,
        "returns_abs_2009": returnsAbs2009,
        "returns_abs_2010": returnsAbs2010,
        "returns_abs_2011": returnsAbs2011,
      };
}

class CategoryReturns {
  int? id;
  String? sector;
  double? returnsAbs7Days;
  double? returnsAbs1Month;
  double? returnsAbs3Month;
  double? returnsAbs6Month;
  double? returnsAbsYtd;
  double? returnsAbs1Year;
  double? returnsCmp2Year;
  double? returnsCmp3Year;
  double? returnsCmp4Year;
  double? returnsCmp5Year;
  dynamic returnsCmp10Year;
  double? returnsCmpInception;
  double? returnsAbs2012;
  double? returnsAbs2013;
  double? returnsAbs2014;
  double? returnsAbs2015;
  double? returnsAbs2016;
  dynamic volatilityCm3Year;
  dynamic sharpratioCm3Year;
  dynamic alphaCm1Year;
  dynamic betaCm1Year;
  dynamic yieldToMaturity;
  dynamic averageMaturity;
  double? returnsAbs2007;
  double? returnsAbs2008;
  double? returnsAbs2009;
  double? returnsAbs2010;
  double? returnsAbs2011;
  String? schemeBroadCategory;

  CategoryReturns({
    this.id,
    this.sector,
    this.returnsAbs7Days,
    this.returnsAbs1Month,
    this.returnsAbs3Month,
    this.returnsAbs6Month,
    this.returnsAbsYtd,
    this.returnsAbs1Year,
    this.returnsCmp2Year,
    this.returnsCmp3Year,
    this.returnsCmp4Year,
    this.returnsCmp5Year,
    this.returnsCmp10Year,
    this.returnsCmpInception,
    this.returnsAbs2012,
    this.returnsAbs2013,
    this.returnsAbs2014,
    this.returnsAbs2015,
    this.returnsAbs2016,
    this.volatilityCm3Year,
    this.sharpratioCm3Year,
    this.alphaCm1Year,
    this.betaCm1Year,
    this.yieldToMaturity,
    this.averageMaturity,
    this.returnsAbs2007,
    this.returnsAbs2008,
    this.returnsAbs2009,
    this.returnsAbs2010,
    this.returnsAbs2011,
    this.schemeBroadCategory,
  });

  factory CategoryReturns.fromJson(Map<String, dynamic> json) =>
      CategoryReturns(
        id: json["id"],
        sector: json["sector"],
        returnsAbs7Days: json["returns_abs_7days"]?.toDouble(),
        returnsAbs1Month: json["returns_abs_1month"]?.toDouble(),
        returnsAbs3Month: json["returns_abs_3month"]?.toDouble(),
        returnsAbs6Month: json["returns_abs_6month"]?.toDouble(),
        returnsAbsYtd: json["returns_abs_ytd"]?.toDouble(),
        returnsAbs1Year: json["returns_abs_1year"]?.toDouble(),
        returnsCmp2Year: json["returns_cmp_2year"]?.toDouble(),
        returnsCmp3Year: json["returns_cmp_3year"]?.toDouble(),
        returnsCmp4Year: json["returns_cmp_4year"]?.toDouble(),
        returnsCmp5Year: json["returns_cmp_5year"]?.toDouble(),
        returnsCmp10Year: json["returns_cmp_10year"],
        returnsCmpInception: json["returns_cmp_inception"]?.toDouble(),
        returnsAbs2012: json["returns_abs_2012"]?.toDouble(),
        returnsAbs2013: json["returns_abs_2013"]?.toDouble(),
        returnsAbs2014: json["returns_abs_2014"]?.toDouble(),
        returnsAbs2015: json["returns_abs_2015"]?.toDouble(),
        returnsAbs2016: json["returns_abs_2016"]?.toDouble(),
        volatilityCm3Year: json["volatility_cm_3year"],
        sharpratioCm3Year: json["sharpratio_cm_3year"],
        alphaCm1Year: json["alpha_cm_1year"],
        betaCm1Year: json["beta_cm_1year"],
        yieldToMaturity: json["yield_to_maturity"],
        averageMaturity: json["average_maturity"],
        returnsAbs2007: json["returns_abs_2007"]?.toDouble(),
        returnsAbs2008: json["returns_abs_2008"]?.toDouble(),
        returnsAbs2009: json["returns_abs_2009"]?.toDouble(),
        returnsAbs2010: json["returns_abs_2010"]?.toDouble(),
        returnsAbs2011: json["returns_abs_2011"]?.toDouble(),
        schemeBroadCategory: json["scheme_broad_category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sector": sector,
        "returns_abs_7days": returnsAbs7Days,
        "returns_abs_1month": returnsAbs1Month,
        "returns_abs_3month": returnsAbs3Month,
        "returns_abs_6month": returnsAbs6Month,
        "returns_abs_ytd": returnsAbsYtd,
        "returns_abs_1year": returnsAbs1Year,
        "returns_cmp_2year": returnsCmp2Year,
        "returns_cmp_3year": returnsCmp3Year,
        "returns_cmp_4year": returnsCmp4Year,
        "returns_cmp_5year": returnsCmp5Year,
        "returns_cmp_10year": returnsCmp10Year,
        "returns_cmp_inception": returnsCmpInception,
        "returns_abs_2012": returnsAbs2012,
        "returns_abs_2013": returnsAbs2013,
        "returns_abs_2014": returnsAbs2014,
        "returns_abs_2015": returnsAbs2015,
        "returns_abs_2016": returnsAbs2016,
        "volatility_cm_3year": volatilityCm3Year,
        "sharpratio_cm_3year": sharpratioCm3Year,
        "alpha_cm_1year": alphaCm1Year,
        "beta_cm_1year": betaCm1Year,
        "yield_to_maturity": yieldToMaturity,
        "average_maturity": averageMaturity,
        "returns_abs_2007": returnsAbs2007,
        "returns_abs_2008": returnsAbs2008,
        "returns_abs_2009": returnsAbs2009,
        "returns_abs_2010": returnsAbs2010,
        "returns_abs_2011": returnsAbs2011,
        "scheme_broad_category": schemeBroadCategory,
      };
}

// enum Sector { CHILDRENS_FUND }

// final sectorValues = EnumValues({"Childrens Fund": Sector.CHILDRENS_FUND});

class ListElement {
  int? id;
  String? inceptionDate;
  PriceDate? priceDate;
  String? schemeAmfi;
  String? schemeAmfiCode;
  String? schemeCategory;
  OpenOrClosed? openOrClosed;
  double? returnsAbs7Days;
  double? returnsAbs1Month;
  double? returnsAbs3Month;
  double? returnsAbs6Month;
  double? returnsAbsYtd;
  double? returnsAbs1Year;
  double? returnsCmp2Year;
  double? returnsCmp3Year;
  double? returnsCmp4Year;
  double? returnsCmp5Year;
  double? returnsCmp10Year;
  double? returnsCmpInception;
  double? returnsAbs2007;
  double? returnsAbs2008;
  double? returnsAbs2009;
  double? returnsAbs2010;
  double? returnsAbs2011;
  double? returnsAbs2012;
  double? returnsAbs2013;
  double? returnsAbs2014;
  double? returnsAbs2015;
  double? returnsAbs2016;
  double? ter;
  TerDate? terDate;
  double? price;
  double? priceChangeOnday;
  double? priceChangePercentOnday;
  String? schemeCompany;
  DateTime? schemeAssetDate;
  double? schemeAssets;
  String? navTable;
  int? etfScheme;
  String? isinNo;
  String? isinDivreinvstNo;
  String? isinSweepNo;
  bool? dividendScheme;
  dynamic returnsAbs7DaysRank;
  dynamic returnsAbs1MonthRank;
  dynamic returnsAbs3MonthRank;
  dynamic returnsAbs6MonthRank;
  dynamic returnsAbsYtdRank;
  dynamic returnsAbs1YearRank;
  dynamic returnsCmp2YearRank;
  dynamic returnsCmp3YearRank;
  dynamic returnsCmp4YearRank;
  dynamic returnsCmp5YearRank;
  dynamic returnsCmp10YearRank;
  dynamic returnsCmpInceptionRank;
  dynamic returnsAbs7DaysTotalrank;
  dynamic returnsAbs1MonthTotalrank;
  dynamic returnsAbs3MonthTotalrank;
  dynamic returnsAbs6MonthTotalrank;
  dynamic returnsAbsYtdTotalrank;
  dynamic returnsAbs1YearTotalrank;
  dynamic returnsCmp2YearTotalrank;
  dynamic returnsCmp3YearTotalrank;
  dynamic returnsCmp4YearTotalrank;
  dynamic returnsCmp5YearTotalrank;
  dynamic returnsCmp10YearTotalrank;
  dynamic returnsCmpInceptionTotalrank;
  String? schemeCompanyShortName;
  String? schemeAmfiCommon;
  SchemeCategoryClass? schemeCategoryClass;
  String? schemeAmfiUrl;
  String? riskometer;
  String? logo;
  String? schemeAmfiShortName;
  CategoryShortName? categoryShortName;
  SchemePlanType? schemePlanType;
  String? schemeSubCategory;
  String? url;

  ListElement({
    this.id,
    this.inceptionDate,
    this.priceDate,
    this.schemeAmfi,
    this.schemeAmfiCode,
    this.schemeCategory,
    this.openOrClosed,
    this.returnsAbs7Days,
    this.returnsAbs1Month,
    this.returnsAbs3Month,
    this.returnsAbs6Month,
    this.returnsAbsYtd,
    this.returnsAbs1Year,
    this.returnsCmp2Year,
    this.returnsCmp3Year,
    this.returnsCmp4Year,
    this.returnsCmp5Year,
    this.returnsCmp10Year,
    this.returnsCmpInception,
    this.returnsAbs2007,
    this.returnsAbs2008,
    this.returnsAbs2009,
    this.returnsAbs2010,
    this.returnsAbs2011,
    this.returnsAbs2012,
    this.returnsAbs2013,
    this.returnsAbs2014,
    this.returnsAbs2015,
    this.returnsAbs2016,
    this.ter,
    this.terDate,
    this.price,
    this.priceChangeOnday,
    this.priceChangePercentOnday,
    this.schemeCompany,
    this.schemeAssetDate,
    this.schemeAssets,
    this.navTable,
    this.etfScheme,
    this.isinNo,
    this.isinDivreinvstNo,
    this.isinSweepNo,
    this.dividendScheme,
    this.returnsAbs7DaysRank,
    this.returnsAbs1MonthRank,
    this.returnsAbs3MonthRank,
    this.returnsAbs6MonthRank,
    this.returnsAbsYtdRank,
    this.returnsAbs1YearRank,
    this.returnsCmp2YearRank,
    this.returnsCmp3YearRank,
    this.returnsCmp4YearRank,
    this.returnsCmp5YearRank,
    this.returnsCmp10YearRank,
    this.returnsCmpInceptionRank,
    this.returnsAbs7DaysTotalrank,
    this.returnsAbs1MonthTotalrank,
    this.returnsAbs3MonthTotalrank,
    this.returnsAbs6MonthTotalrank,
    this.returnsAbsYtdTotalrank,
    this.returnsAbs1YearTotalrank,
    this.returnsCmp2YearTotalrank,
    this.returnsCmp3YearTotalrank,
    this.returnsCmp4YearTotalrank,
    this.returnsCmp5YearTotalrank,
    this.returnsCmp10YearTotalrank,
    this.returnsCmpInceptionTotalrank,
    this.schemeCompanyShortName,
    this.schemeAmfiCommon,
    this.schemeCategoryClass,
    this.schemeAmfiUrl,
    this.riskometer,
    this.logo,
    this.schemeAmfiShortName,
    this.categoryShortName,
    this.schemePlanType,
    this.schemeSubCategory,
    this.url,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        inceptionDate: json["inception_date"],
        priceDate: json["price_date"] == null
            ? null
            : priceDateValues.map[json["price_date"]],
        schemeAmfi: json["scheme_amfi"],
        schemeAmfiCode: json["scheme_amfi_code"],
        schemeCategory: json["scheme_category"],
        openOrClosed: json["open_or_closed"] == null
            ? null
            : openOrClosedValues.map[json["open_or_closed"]],
        returnsAbs7Days: json["returns_abs_7days"]?.toDouble(),
        returnsAbs1Month: json["returns_abs_1month"]?.toDouble(),
        returnsAbs3Month: json["returns_abs_3month"]?.toDouble(),
        returnsAbs6Month: json["returns_abs_6month"]?.toDouble(),
        returnsAbsYtd: json["returns_abs_ytd"]?.toDouble(),
        returnsAbs1Year: json["returns_abs_1year"]?.toDouble(),
        returnsCmp2Year: json["returns_cmp_2year"]?.toDouble(),
        returnsCmp3Year: json["returns_cmp_3year"]?.toDouble(),
        returnsCmp4Year: json["returns_cmp_4year"]?.toDouble(),
        returnsCmp5Year: json["returns_cmp_5year"]?.toDouble(),
        returnsCmp10Year: json["returns_cmp_10year"]?.toDouble(),
        returnsCmpInception: json["returns_cmp_inception"]?.toDouble(),
        returnsAbs2007: json["returns_abs_2007"]?.toDouble(),
        returnsAbs2008: json["returns_abs_2008"]?.toDouble(),
        returnsAbs2009: json["returns_abs_2009"]?.toDouble(),
        returnsAbs2010: json["returns_abs_2010"]?.toDouble(),
        returnsAbs2011: json["returns_abs_2011"]?.toDouble(),
        returnsAbs2012: json["returns_abs_2012"]?.toDouble(),
        returnsAbs2013: json["returns_abs_2013"]?.toDouble(),
        returnsAbs2014: json["returns_abs_2014"]?.toDouble(),
        returnsAbs2015: json["returns_abs_2015"]?.toDouble(),
        returnsAbs2016: json["returns_abs_2016"]?.toDouble(),
        ter: json["ter"]?.toDouble(),
        terDate: json["ter_date"] == null
            ? null
            : terDateValues.map[json["ter_date"]],
        price: json["price"]?.toDouble(),
        priceChangeOnday: json["price_change_onday"]?.toDouble(),
        priceChangePercentOnday: json["price_change_percent_onday"]?.toDouble(),
        schemeCompany: json["scheme_company"],
        schemeAssetDate: json["scheme_asset_date"] == null
            ? null
            : DateTime.parse(json["scheme_asset_date"]),
        schemeAssets: json["scheme_assets"]?.toDouble(),
        navTable: json["nav_table"],
        etfScheme: json["etf_scheme"],
        isinNo: json["isin_no"],
        isinDivreinvstNo: json["isin_divreinvst_no"],
        isinSweepNo: json["isin_sweep_no"],
        dividendScheme: json["dividend_scheme"],
        returnsAbs7DaysRank: json["returns_abs_7days_rank"],
        returnsAbs1MonthRank: json["returns_abs_1month_rank"],
        returnsAbs3MonthRank: json["returns_abs_3month_rank"],
        returnsAbs6MonthRank: json["returns_abs_6month_rank"],
        returnsAbsYtdRank: json["returns_abs_ytd_rank"],
        returnsAbs1YearRank: json["returns_abs_1year_rank"],
        returnsCmp2YearRank: json["returns_cmp_2year_rank"],
        returnsCmp3YearRank: json["returns_cmp_3year_rank"],
        returnsCmp4YearRank: json["returns_cmp_4year_rank"],
        returnsCmp5YearRank: json["returns_cmp_5year_rank"],
        returnsCmp10YearRank: json["returns_cmp_10year_rank"],
        returnsCmpInceptionRank: json["returns_cmp_inception_rank"],
        returnsAbs7DaysTotalrank: json["returns_abs_7days_totalrank"],
        returnsAbs1MonthTotalrank: json["returns_abs_1month_totalrank"],
        returnsAbs3MonthTotalrank: json["returns_abs_3month_totalrank"],
        returnsAbs6MonthTotalrank: json["returns_abs_6month_totalrank"],
        returnsAbsYtdTotalrank: json["returns_abs_ytd_totalrank"],
        returnsAbs1YearTotalrank: json["returns_abs_1year_totalrank"],
        returnsCmp2YearTotalrank: json["returns_cmp_2year_totalrank"],
        returnsCmp3YearTotalrank: json["returns_cmp_3year_totalrank"],
        returnsCmp4YearTotalrank: json["returns_cmp_4year_totalrank"],
        returnsCmp5YearTotalrank: json["returns_cmp_5year_totalrank"],
        returnsCmp10YearTotalrank: json["returns_cmp_10year_totalrank"],
        returnsCmpInceptionTotalrank: json["returns_cmp_inception_totalrank"],
        schemeCompanyShortName: json["scheme_company_short_name"],
        schemeAmfiCommon: json["scheme_amfi_common"],
        schemeCategoryClass: json["scheme_category_class"] == null
            ? null
            : schemeCategoryClassValues.map[json["scheme_category_class"]],
        schemeAmfiUrl: json["scheme_amfi_url"],
        // riskometer: riskometerValues.map[json["riskometer"]]!,
        riskometer: json["riskometer"],
        logo: json["logo"],
        schemeAmfiShortName: json["scheme_amfi_short_name"],
        categoryShortName: json["category_short_name"] == null
            ? null
            : categoryShortNameValues.map[json["category_short_name"]],
        schemePlanType: json["scheme_plan_type"] == null
            ? null
            : schemePlanTypeValues.map[json["scheme_plan_type"]],
        schemeSubCategory: json["scheme_sub_category"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "inception_date": inceptionDate,
        "price_date": priceDateValues.reverse[priceDate],
        "scheme_amfi": schemeAmfi,
        "scheme_amfi_code": schemeAmfiCode,
        "scheme_category": schemeCategory,
        "open_or_closed": openOrClosedValues.reverse[openOrClosed],
        "returns_abs_7days": returnsAbs7Days,
        "returns_abs_1month": returnsAbs1Month,
        "returns_abs_3month": returnsAbs3Month,
        "returns_abs_6month": returnsAbs6Month,
        "returns_abs_ytd": returnsAbsYtd,
        "returns_abs_1year": returnsAbs1Year,
        "returns_cmp_2year": returnsCmp2Year,
        "returns_cmp_3year": returnsCmp3Year,
        "returns_cmp_4year": returnsCmp4Year,
        "returns_cmp_5year": returnsCmp5Year,
        "returns_cmp_10year": returnsCmp10Year,
        "returns_cmp_inception": returnsCmpInception,
        "returns_abs_2007": returnsAbs2007,
        "returns_abs_2008": returnsAbs2008,
        "returns_abs_2009": returnsAbs2009,
        "returns_abs_2010": returnsAbs2010,
        "returns_abs_2011": returnsAbs2011,
        "returns_abs_2012": returnsAbs2012,
        "returns_abs_2013": returnsAbs2013,
        "returns_abs_2014": returnsAbs2014,
        "returns_abs_2015": returnsAbs2015,
        "returns_abs_2016": returnsAbs2016,
        "ter": ter,
        "ter_date": terDateValues.reverse[terDate],
        "price": price,
        "price_change_onday": priceChangeOnday,
        "price_change_percent_onday": priceChangePercentOnday,
        "scheme_company": schemeCompany,
        "scheme_asset_date":
            "${schemeAssetDate?.year.toString().padLeft(4, '0')}-${schemeAssetDate?.month.toString().padLeft(2, '0')}-${schemeAssetDate?.day.toString().padLeft(2, '0')}",
        "scheme_assets": schemeAssets,
        "nav_table": navTable,
        "etf_scheme": etfScheme,
        "isin_no": isinNo,
        "isin_divreinvst_no": isinDivreinvstNo,
        "isin_sweep_no": isinSweepNo,
        "dividend_scheme": dividendScheme,
        "returns_abs_7days_rank": returnsAbs7DaysRank,
        "returns_abs_1month_rank": returnsAbs1MonthRank,
        "returns_abs_3month_rank": returnsAbs3MonthRank,
        "returns_abs_6month_rank": returnsAbs6MonthRank,
        "returns_abs_ytd_rank": returnsAbsYtdRank,
        "returns_abs_1year_rank": returnsAbs1YearRank,
        "returns_cmp_2year_rank": returnsCmp2YearRank,
        "returns_cmp_3year_rank": returnsCmp3YearRank,
        "returns_cmp_4year_rank": returnsCmp4YearRank,
        "returns_cmp_5year_rank": returnsCmp5YearRank,
        "returns_cmp_10year_rank": returnsCmp10YearRank,
        "returns_cmp_inception_rank": returnsCmpInceptionRank,
        "returns_abs_7days_totalrank": returnsAbs7DaysTotalrank,
        "returns_abs_1month_totalrank": returnsAbs1MonthTotalrank,
        "returns_abs_3month_totalrank": returnsAbs3MonthTotalrank,
        "returns_abs_6month_totalrank": returnsAbs6MonthTotalrank,
        "returns_abs_ytd_totalrank": returnsAbsYtdTotalrank,
        "returns_abs_1year_totalrank": returnsAbs1YearTotalrank,
        "returns_cmp_2year_totalrank": returnsCmp2YearTotalrank,
        "returns_cmp_3year_totalrank": returnsCmp3YearTotalrank,
        "returns_cmp_4year_totalrank": returnsCmp4YearTotalrank,
        "returns_cmp_5year_totalrank": returnsCmp5YearTotalrank,
        "returns_cmp_10year_totalrank": returnsCmp10YearTotalrank,
        "returns_cmp_inception_totalrank": returnsCmpInceptionTotalrank,
        "scheme_company_short_name": schemeCompanyShortName,
        "scheme_amfi_common": schemeAmfiCommon,
        "scheme_category_class":
            schemeCategoryClassValues.reverse[schemeCategoryClass],
        "scheme_amfi_url": schemeAmfiUrl,
        "riskometer": riskometerValues.reverse[riskometer],
        "logo": logo,
        "scheme_amfi_short_name": schemeAmfiShortName,
        "category_short_name":
            categoryShortNameValues.reverse[categoryShortName],
        "scheme_plan_type": schemePlanTypeValues.reverse[schemePlanType],
        "scheme_sub_category": schemeSubCategory,
        "url": url,
      };
}

enum CategoryShortName { CHILD }

final categoryShortNameValues = EnumValues({"CHILD": CategoryShortName.CHILD});

enum OpenOrClosed {
  OPEN_ENDED_SCHEMES_HYBRID_SCHEME_AGGRESSIVE_HYBRID_FUND,
  OPEN_ENDED_SCHEMES_SOLUTION_ORIENTED_SCHEME_CHILDREN_S_FUND
}

final openOrClosedValues = EnumValues({
  "Open Ended Schemes(Hybrid Scheme - Aggressive Hybrid Fund)":
      OpenOrClosed.OPEN_ENDED_SCHEMES_HYBRID_SCHEME_AGGRESSIVE_HYBRID_FUND,
  "Open Ended Schemes(Solution Oriented Scheme - Children?s Fund)":
      OpenOrClosed.OPEN_ENDED_SCHEMES_SOLUTION_ORIENTED_SCHEME_CHILDREN_S_FUND
});

enum PriceDate { JAN_252024120000_AM, JAN_292024120000_AM }

final priceDateValues = EnumValues({
  "Jan 25, 2024 12:00:00 AM": PriceDate.JAN_252024120000_AM,
  "Jan 29, 2024 12:00:00 AM": PriceDate.JAN_292024120000_AM
});

enum Riskometer { HIGH, VERY_HIGH }

final riskometerValues =
    EnumValues({"High": Riskometer.HIGH, "Very High": Riskometer.VERY_HIGH});

enum SchemeCategoryClass { BALANCED, EMPTY }

final schemeCategoryClassValues = EnumValues(
    {"Balanced": SchemeCategoryClass.BALANCED, "": SchemeCategoryClass.EMPTY});

enum SchemePlanType { REGULAR }

final schemePlanTypeValues = EnumValues({"Regular": SchemePlanType.REGULAR});

enum TerDate { DEC_312023120000_AM }

final terDateValues =
    EnumValues({"Dec 31, 2023 12:00:00 AM": TerDate.DEC_312023120000_AM});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
