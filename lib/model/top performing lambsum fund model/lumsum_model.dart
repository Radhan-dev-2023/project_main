class TopLumbSumModel {
  int? status;
  String? statusMsg;
  String? msg;
  String? category;
  String? period;
  String? amount;
  List<InvestmentDetails>? list;

  TopLumbSumModel({
    this.status,
    this.statusMsg,
    this.msg,
    this.category,
    this.period,
    this.amount,
    this.list,
  });

  factory TopLumbSumModel.fromJson(Map<String, dynamic> json) {
    return TopLumbSumModel(
      status: json['status'],
      statusMsg: json['status_msg'],
      msg: json['msg'],
      category: json['category'],
      period: json['period'],
      amount: json['amount'],
      list: List<InvestmentDetails>.from(
          json['list'].map((x) => InvestmentDetails.fromJson(x))),
    );
  }
}

class InvestmentDetails {
  int? id;
  String? schemeName;
  String? schemeAmfiCode;
  String? schemeCategory;
  bool? dividendScheme;
  String? inceptionDate;
  String? startDate;
  String? endDate;
  int? period;
  double? amount;
  double? currentCost;
  double? currentValue;
  double? returns;
  double? ter;
  String? terDate;
  double? schemeAssets;
  String? schemeAssetDate;
  String? schemeCompany;
  String? schemeAmfiUrl;
  String? icon;
  String? amcLogo;
  String? schemeCompanyShortName;
  String? schemeAmfiShortName;
  String? categoryShortName;
  double? nav;
  String? navDate;
  double? priceChangeOnday;
  String? schemePlanType;

  InvestmentDetails({
    this.id,
    this.schemeName,
    this.schemeAmfiCode,
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
    this.terDate,
    this.schemeAssets,
    this.schemeAssetDate,
    this.schemeCompany,
    this.schemeAmfiUrl,
    this.icon,
    this.amcLogo,
    this.schemeCompanyShortName,
    this.schemeAmfiShortName,
    this.categoryShortName,
    this.nav,
    this.navDate,
    this.priceChangeOnday,
    this.schemePlanType,
  });

  factory InvestmentDetails.fromJson(Map<String, dynamic> json) {
    return InvestmentDetails(
      id: json['id'],
      schemeName: json['scheme_name'],
      schemeAmfiCode: json['scheme_amfi_code'],
      schemeCategory: json['scheme_category'],
      dividendScheme: json['dividend_scheme'],
      inceptionDate: json['inception_date'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      period: json['period'],
      amount: json['amount'].toDouble(),
      currentCost: json['current_cost'].toDouble(),
      currentValue: json['current_value'].toDouble(),
      returns: json['returns'].toDouble(),
      ter: json['ter'].toDouble(),
      terDate: json['ter_date'],
      schemeAssets: json['scheme_assets'].toDouble(),
      schemeAssetDate: json['scheme_asset_date'],
      schemeCompany: json['scheme_company'],
      schemeAmfiUrl: json['scheme_amfi_url'],
      icon: json['icon'],
      amcLogo: json['amc_logo'],
      schemeCompanyShortName: json['scheme_company_short_name'],
      schemeAmfiShortName: json['scheme_amfi_short_name'],
      categoryShortName: json['category_short_name'],
      nav: json['nav'].toDouble(),
      navDate: json['nav_date'],
      priceChangeOnday: json['price_change_onday'].toDouble(),
      schemePlanType: json['scheme_plan_type'],
    );
  }
}
