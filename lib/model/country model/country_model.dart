// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

CountryModel countryModelFromJson(String str) =>
    CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  int? status;
  String? message;
  List<CountryMasterDetail>? masterDetails;

  CountryModel({
    this.status,
    this.message,
    this.masterDetails,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        status: json["status"],
        message: json["message"],
        masterDetails: List<CountryMasterDetail>.from(
            json["masterDetails"].map((x) => CountryMasterDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "masterDetails":
            List<dynamic>.from(masterDetails!.map((x) => x.toJson())),
      };
}

class CountryMasterDetail {
  String? countryCode;
  String? countryName;
  String? lastModifiedDate;

  CountryMasterDetail({
    this.countryCode,
    this.countryName,
    this.lastModifiedDate,
  });

  factory CountryMasterDetail.fromJson(Map<String, dynamic> json) =>
      CountryMasterDetail(
        countryCode: json["COUNTRY_CODE"],
        countryName: json["COUNTRY_NAME"],
        lastModifiedDate: json["LAST_MODIFIED_DATE"],
      );

  Map<String, dynamic> toJson() => {
        "COUNTRY_CODE": countryCode,
        "COUNTRY_NAME": countryName,
        "LAST_MODIFIED_DATE": lastModifiedDate,
      };
}
