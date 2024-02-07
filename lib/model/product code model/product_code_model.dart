// To parse this JSON data, do
//
//     final productCodeModel = productCodeModelFromJson(jsonString);

import 'dart:convert';

ProductCodeModel productCodeModelFromJson(String str) =>
    ProductCodeModel.fromJson(json.decode(str));

String productCodeModelToJson(ProductCodeModel data) =>
    json.encode(data.toJson());

class ProductCodeModel {
  int? status;
  Product? product;

  ProductCodeModel({
    this.status,
    this.product,
  });

  factory ProductCodeModel.fromJson(Map<String, dynamic> json) =>
      ProductCodeModel(
        status: json["status"],
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "product": product!.toJson(),
      };
}

class Product {
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
  dynamic swpDates;
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
  dynamic nfoSipEffectiveDate;
  String? allowFreedomSip;
  String? allowFreedomSwp;
  String? allowDonor;
  String? allowPauseSip;
  dynamic pauseSipMinMonth;
  dynamic pauseSipMaxMonth;
  dynamic pauseSipGapPeriod;
  String? freedomSchemeOption;
  int? v;

  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
