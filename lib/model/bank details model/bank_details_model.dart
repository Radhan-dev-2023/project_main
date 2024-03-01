// To parse this JSON data, do
//
//     final bankDeatilsModel = bankDeatilsModelFromJson(jsonString);

import 'dart:convert';

BankDeatilsModel bankDeatilsModelFromJson(String str) => BankDeatilsModel.fromJson(json.decode(str));

String bankDeatilsModelToJson(BankDeatilsModel data) => json.encode(data.toJson());

class BankDeatilsModel {
    int? status;
    String? message;
    BankDetails? bankDetails;

    BankDeatilsModel({
         this.status,
         this.message,
         this.bankDetails,
    });

    factory BankDeatilsModel.fromJson(Map<String, dynamic> json) => BankDeatilsModel(
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
    String? micr;
    String? branch;
    String? address;
    String? state;
    String? contact;
    bool? upi;
    bool? rtgs;
    String? city;
    String? centre;
    String? district;
    bool? neft;
    bool? imps;
    dynamic swift;
    String? iso3166;
    List<Bank>? bank;
    String? ifsc;

    BankDetails({
     this.micr,
     this.branch,
     this.address,
     this.state,
     this.contact,
     this.upi,
     this.rtgs,
     this.city,
     this.centre,
     this.district,
     this.neft,
     this.imps,
     this.swift,
     this.iso3166,
     this.bank,
     this.ifsc,
    });

    factory BankDetails.fromJson(Map<String, dynamic> json) => BankDetails(
        micr: json["MICR"],
        branch: json["BRANCH"],
        address: json["ADDRESS"],
        state: json["STATE"],
        contact: json["CONTACT"],
        upi: json["UPI"],
        rtgs: json["RTGS"],
        city: json["CITY"],
        centre: json["CENTRE"],
        district: json["DISTRICT"],
        neft: json["NEFT"],
        imps: json["IMPS"],
        swift: json["SWIFT"],
        iso3166: json["ISO3166"],
        bank: List<Bank>.from(json["BANK"].map((x) => Bank.fromJson(x))),
        ifsc: json["IFSC"],
    );

    Map<String, dynamic> toJson() => {
        "MICR": micr,
        "BRANCH": branch,
        "ADDRESS": address,
        "STATE": state,
        "CONTACT": contact,
        "UPI": upi,
        "RTGS": rtgs,
        "CITY": city,
        "CENTRE": centre,
        "DISTRICT": district,
        "NEFT": neft,
        "IMPS": imps,
        "SWIFT": swift,
        "ISO3166": iso3166,
        "BANK": List<dynamic>.from(bank!.map((x) => x.toJson())),
        "IFSC": ifsc,
    };
}

class Bank {
    String? bankname;
    String? bankcode;

    Bank({
        required this.bankname,
        required this.bankcode,
    });

    factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        bankname: json["bankname"],
        bankcode: json["bankcode"],
    );

    Map<String, dynamic> toJson() => {
        "bankname": bankname,
        "bankcode": bankcode,
    };
}
