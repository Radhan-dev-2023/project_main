// To parse this JSON data, do
//
//     final bankDeatilsModel = bankDeatilsModelFromJson(jsonString);

import 'dart:convert';

BankDeatilsModel bankDeatilsModelFromJson(String str) =>
    BankDeatilsModel.fromJson(json.decode(str));

String bankDeatilsModelToJson(BankDeatilsModel data) =>
    json.encode(data.toJson());

class BankDeatilsModel {
  int? status;
  String? message;
  BankDetails? bankDetails;

  BankDeatilsModel({
    this.status,
    this.message,
    this.bankDetails,
  });

  factory BankDeatilsModel.fromJson(Map<String, dynamic> json) =>
      BankDeatilsModel(
        status: json["status"],
        message: json["message"],
        bankDetails: BankDetails.fromJson(json["bankDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "bankDetails": bankDetails!.toJson(),
      };
}

class BankDetails {
  String? district;
  String? city;
  bool? rtgs;
  dynamic swift;
  String? branch;
  bool? imps;
  bool? neft;
  String? state;
  String? contact;
  String? iso3166;
  String? address;
  String? centre;
  bool? upi;
  String? micr;
  List<String>? bank;
  String? bankcode;
  String? ifsc;

  BankDetails({
    this.district,
    this.city,
    this.rtgs,
    this.swift,
    this.branch,
    this.imps,
    this.neft,
    this.state,
    this.contact,
    this.iso3166,
    this.address,
    this.centre,
    this.upi,
    this.micr,
    this.bank,
    this.bankcode,
    this.ifsc,
  });

  factory BankDetails.fromJson(Map<String, dynamic> json) => BankDetails(
        district: json["DISTRICT"],
        city: json["CITY"],
        rtgs: json["RTGS"],
        swift: json["SWIFT"],
        branch: json["BRANCH"],
        imps: json["IMPS"],
        neft: json["NEFT"],
        state: json["STATE"],
        contact: json["CONTACT"],
        iso3166: json["ISO3166"],
        address: json["ADDRESS"],
        centre: json["CENTRE"],
        upi: json["UPI"],
        micr: json["MICR"],
        bank: List<String>.from(json["BANK"].map((x) => x)),
        bankcode: json["BANKCODE"],
        ifsc: json["IFSC"],
      );

  Map<String, dynamic> toJson() => {
        "DISTRICT": district,
        "CITY": city,
        "RTGS": rtgs,
        "SWIFT": swift,
        "BRANCH": branch,
        "IMPS": imps,
        "NEFT": neft,
        "STATE": state,
        "CONTACT": contact,
        "ISO3166": iso3166,
        "ADDRESS": address,
        "CENTRE": centre,
        "UPI": upi,
        "MICR": micr,
        "BANK": List<dynamic>.from(bank!.map((x) => x)),
        "BANKCODE": bankcode,
        "IFSC": ifsc,
      };
}
