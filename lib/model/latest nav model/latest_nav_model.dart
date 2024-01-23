class LatestNavModel {
  int? status;
  String? statusMsg;
  String? navDate;
  String? msg;
  List<SchemeDetails>? schemeList;

  LatestNavModel({
    this.status,
    this.statusMsg,
    this.navDate,
    this.msg,
    this.schemeList,
  });

  factory LatestNavModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> schemeListData = json['list'];
    List<SchemeDetails> schemes =
        schemeListData.map((scheme) => SchemeDetails.fromJson(scheme)).toList();

    return LatestNavModel(
      status: json['status'],
      statusMsg: json['status_msg'],
      navDate: json['nav_date'],
      msg: json['msg'],
      schemeList: schemes,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'status_msg': statusMsg,
      'nav_date': navDate,
      'msg': msg,
      'list': schemeList!.map((scheme) => scheme.toJson()).toList(),
    };
  }
}

class SchemeDetails {
  int? id;
  String? mfCompany;
  String? schemeNature;
  String? schemeCode;
  String? schemeName;
  String? isinDivPayoutGrowthNo;
  String? isinDivReinvestmentNo;
  double? netAssetValue;
  String? navDate;
  String? category;
  double? prevNetAssetValue;
  String? prevNavDate;
  double? changePercent;
  String? schemeAmfiShortName;
  String? categoryShortName;
  String? schemeCompanyShortName;
  String? navDateString;
  String? prevNavDateString;
  String? schemePlanType;

  SchemeDetails({
    this.id,
    this.mfCompany,
    this.schemeNature,
    this.schemeCode,
    this.schemeName,
    this.isinDivPayoutGrowthNo,
    this.isinDivReinvestmentNo,
    this.netAssetValue,
    this.navDate,
    this.category,
    this.prevNetAssetValue,
    this.prevNavDate,
    this.changePercent,
    this.schemeAmfiShortName,
    this.categoryShortName,
    this.schemeCompanyShortName,
    this.navDateString,
    this.prevNavDateString,
    this.schemePlanType,
  });

  factory SchemeDetails.fromJson(Map<String, dynamic> json) {
    return SchemeDetails(
      id: json['id'],
      mfCompany: json['mf_company'],
      schemeNature: json['scheme_nature'],
      schemeCode: json['scheme_code'],
      schemeName: json['scheme_name'],
      isinDivPayoutGrowthNo: json['isin_div_payout_growth_no'],
      isinDivReinvestmentNo: json['isin_div_reinvestment_no'],
      netAssetValue: json['net_asset_value'].toDouble(),
      navDate: json['nav_date'],
      category: json['category'],
      prevNetAssetValue: json['prev_net_asset_value'].toDouble(),
      prevNavDate: json['prev_nav_date'],
      changePercent: json['change_percent'].toDouble(),
      schemeAmfiShortName: json['scheme_amfi_short_name'],
      categoryShortName: json['category_short_name'],
      schemeCompanyShortName: json['scheme_company_short_name'],
      navDateString: json['nav_date_string'],
      prevNavDateString: json['prev_nav_date_string'],
      schemePlanType: json['scheme_plan_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'mf_company': mfCompany,
      'scheme_nature': schemeNature,
      'scheme_code': schemeCode,
      'scheme_name': schemeName,
      'isin_div_payout_growth_no': isinDivPayoutGrowthNo,
      'isin_div_reinvestment_no': isinDivReinvestmentNo,
      'net_asset_value': netAssetValue,
      'nav_date': navDate,
      'category': category,
      'prev_net_asset_value': prevNetAssetValue,
      'prev_nav_date': prevNavDate,
      'change_percent': changePercent,
      'scheme_amfi_short_name': schemeAmfiShortName,
      'category_short_name': categoryShortName,
      'scheme_company_short_name': schemeCompanyShortName,
      'nav_date_string': navDateString,
      'prev_nav_date_string': prevNavDateString,
      'scheme_plan_type': schemePlanType,
    };
  }
}
