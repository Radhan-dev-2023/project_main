import 'dart:convert';

ProductListModel productListModelFromJson(String str) =>
    ProductListModel.fromJson(json.decode(str));

String productListModelToJson(ProductListModel data) =>
    json.encode(data.toJson());

class ProductListModel {
  int? status;
  List<ProductList>? product;

  ProductListModel({
    this.status,
    this.product,
  });

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      ProductListModel(
        status: json["status"],
        product: json["product"] == null
            ? []
            : List<ProductList>.from(
                json["product"]!.map((x) => ProductList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "product": product == null
            ? []
            : List<dynamic>.from(product!.map((x) => x.toJson())),
      };
}

class ProductList {
  String? id;
  String? amcCode;
  String? amcName;
  String? bannedCountry;
  String? allowPauseCount;
  String? productCode;
  String? productLongName;
  dynamic syestematicFrequencies;
  String? sipDates;
  String? stpDates;
  String? swpDates;
  String? purchaseAllowed;
  String? switchAllowed;
  String? redemptionAllowed;
  String? sipAllowed;
  String? stpAllowed;
  String? swpAllowed;
  String? reinvestTag;
  String? productCategory;
  String? isin;
  String? lastModifiedDate;
  String? activeFlag;
  String? assetClass;
  String? subFundCode;
  String? planType;
  String? insuranceEnabled;
  String? rtaCode;
  String? nfoEnabled;
  String? nfoCloseDate;
  String? nfoSipEffectiveDate;
  String? allowFreedomSip;
  String? allowFreedomSwp;
  String? allowDonor;
  String? allowPauseSip;
  String? pauseSipMinMonth;
  String? pauseSipMaxMonth;
  String? pauseSipGapPeriod;
  String? freedomSchemeOption;
  int? v;

  ProductList({
    this.id,
    this.amcCode,
    this.amcName,
    this.bannedCountry,
    this.allowPauseCount,
    this.productCode,
    this.productLongName,
    this.syestematicFrequencies,
    this.sipDates,
    this.stpDates,
    this.swpDates,
    this.purchaseAllowed,
    this.switchAllowed,
    this.redemptionAllowed,
    this.sipAllowed,
    this.stpAllowed,
    this.swpAllowed,
    this.reinvestTag,
    this.productCategory,
    this.isin,
    this.lastModifiedDate,
    this.activeFlag,
    this.assetClass,
    this.subFundCode,
    this.planType,
    this.insuranceEnabled,
    this.rtaCode,
    this.nfoEnabled,
    this.nfoCloseDate,
    this.nfoSipEffectiveDate,
    this.allowFreedomSip,
    this.allowFreedomSwp,
    this.allowDonor,
    this.allowPauseSip,
    this.pauseSipMinMonth,
    this.pauseSipMaxMonth,
    this.pauseSipGapPeriod,
    this.freedomSchemeOption,
    this.v,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        id: json["_id"],
        amcCode: json["AMC_CODE"],
        amcName: json["AMC_NAME"],
        bannedCountry: json["BANNED_COUNTRY"],
        allowPauseCount: json["ALLOW_PAUSE_COUNT"],
        productCode: json["PRODUCT_CODE"],
        productLongName: json["PRODUCT_LONG_NAME"],
        syestematicFrequencies: json["SYESTEMATIC_FREQUENCIES"],
        sipDates: json["SIP_DATES"],
        stpDates: json["STP_DATES"],
        swpDates: json["SWP_DATES"],
        purchaseAllowed: json["PURCHASE_ALLOWED"],
        switchAllowed: json["SWITCH_ALLOWED"],
        redemptionAllowed: json["REDEMPTION_ALLOWED"],
        sipAllowed: json["SIP_ALLOWED"],
        stpAllowed: json["STP_ALLOWED"],
        swpAllowed: json["SWP_ALLOWED"],
        reinvestTag: json["REINVEST_TAG"],
        productCategory: json["PRODUCT_CATEGORY"],
        isin: json["ISIN"],
        lastModifiedDate: json["LAST_MODIFIED_DATE"],
        activeFlag: json["ACTIVE_FLAG"],
        assetClass: json["ASSET_CLASS"],
        subFundCode: json["SUB_FUND_CODE"],
        planType: json["PLAN_TYPE"],
        insuranceEnabled: json["INSURANCE_ENABLED"],
        rtaCode: json["RTA_CODE"],
        nfoEnabled: json["NFO_ENABLED"],
        nfoCloseDate: json["NFO_CLOSE_DATE"],
        nfoSipEffectiveDate: json["NFO_SIP_EFFECTIVE_DATE"],
        allowFreedomSip: json["ALLOW_FREEDOM_SIP"],
        allowFreedomSwp: json["ALLOW_FREEDOM_SWP"],
        allowDonor: json["ALLOW_DONOR"],
        allowPauseSip: json["ALLOW_PAUSE_SIP"],
        pauseSipMinMonth: json["PAUSE_SIP_MIN_MONTH"],
        pauseSipMaxMonth: json["PAUSE_SIP_MAX_MONTH"],
        pauseSipGapPeriod: json["PAUSE_SIP_GAP_PERIOD"],
        freedomSchemeOption: json["FREEDOM_SCHEME_OPTION"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "AMC_CODE": amcCode,
        "AMC_NAME": amcName,
        "BANNED_COUNTRY": bannedCountry,
        "ALLOW_PAUSE_COUNT": allowPauseCount,
        "PRODUCT_CODE": productCode,
        "PRODUCT_LONG_NAME": productLongName,
        "SYESTEMATIC_FREQUENCIES": syestematicFrequencies,
        "SIP_DATES": sipDates,
        "STP_DATES": stpDates,
        "SWP_DATES": swpDates,
        "PURCHASE_ALLOWED": purchaseAllowed,
        "SWITCH_ALLOWED": switchAllowed,
        "REDEMPTION_ALLOWED": redemptionAllowed,
        "SIP_ALLOWED": sipAllowed,
        "STP_ALLOWED": stpAllowed,
        "SWP_ALLOWED": swpAllowed,
        "REINVEST_TAG": reinvestTag,
        "PRODUCT_CATEGORY": productCategory,
        "ISIN": isin,
        "LAST_MODIFIED_DATE": lastModifiedDate,
        "ACTIVE_FLAG": activeFlag,
        "ASSET_CLASS": assetClass,
        "SUB_FUND_CODE": subFundCode,
        "PLAN_TYPE": planType,
        "INSURANCE_ENABLED": insuranceEnabled,
        "RTA_CODE": rtaCode,
        "NFO_ENABLED": nfoEnabled,
        "NFO_CLOSE_DATE": nfoCloseDate,
        "NFO_SIP_EFFECTIVE_DATE": nfoSipEffectiveDate,
        "ALLOW_FREEDOM_SIP": allowFreedomSip,
        "ALLOW_FREEDOM_SWP": allowFreedomSwp,
        "ALLOW_DONOR": allowDonor,
        "ALLOW_PAUSE_SIP": allowPauseSip,
        "PAUSE_SIP_MIN_MONTH": pauseSipMinMonth,
        "PAUSE_SIP_MAX_MONTH": pauseSipMaxMonth,
        "PAUSE_SIP_GAP_PERIOD": pauseSipGapPeriod,
        "FREEDOM_SCHEME_OPTION": freedomSchemeOption,
        "__v": v,
      };
}

// enum ActiveFlag {
//     B,
//     N,
//     Y
// }

// final activeFlagValues = EnumValues({
//     "B": ActiveFlag.B,
//     "N": ActiveFlag.N,
//     "Y": ActiveFlag.Y
// });

// enum AmcName {
//     ADITYA_BIRLA_SUN_LIFE_MUTUAL_FUND
// }

// final amcNameValues = EnumValues({
//     "Aditya Birla Sun Life Mutual Fund": AmcName.ADITYA_BIRLA_SUN_LIFE_MUTUAL_FUND
// });

// enum AssetClass {
//     CASH,
//     DEBT,
//     EQUITY
// }

// final assetClassValues = EnumValues({
//     "CASH": AssetClass.CASH,
//     "DEBT": AssetClass.DEBT,
//     "EQUITY": AssetClass.EQUITY
// });

// enum BannedCountry {
//     YES
// }

// final bannedCountryValues = EnumValues({
//     "Yes": BannedCountry.YES
// });

// enum FreedomSchemeOption {
//     FREEDOM_SCHEME_OPTION_X,
//     N,
//     X,
//     Y,
//     Z
// }

// final freedomSchemeOptionValues = EnumValues({
//     "x": FreedomSchemeOption.FREEDOM_SCHEME_OPTION_X,
//     "N": FreedomSchemeOption.N,
//     "X": FreedomSchemeOption.X,
//     "Y": FreedomSchemeOption.Y,
//     "Z": FreedomSchemeOption.Z
// });

// enum PlanType {
//     REGULAR
// }

// final planTypeValues = EnumValues({
//     "REGULAR": PlanType.REGULAR
// });

// enum ProductCategory {
//     CE,
//     OE
// }

// final productCategoryValues = EnumValues({
//     "CE": ProductCategory.CE,
//     "OE": ProductCategory.OE
// });

// enum RtaCode {
//     CAMS
// }

// final rtaCodeValues = EnumValues({
//     "CAMS": RtaCode.CAMS
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//             reverseMap = map.map((k, v) => MapEntry(v, k));
//             return reverseMap;
//     }
// }
