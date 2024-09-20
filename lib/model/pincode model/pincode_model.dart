// To parse this JSON data, do
//
//     final pincodeModel = pincodeModelFromJson(jsonString);

import 'dart:convert';

PincodeModel pincodeModelFromJson(String str) =>
    PincodeModel.fromJson(json.decode(str));

String pincodeModelToJson(PincodeModel data) => json.encode(data.toJson());

class PincodeModel {
  int? status;
  String? message;
  PincodeMasterDetails? masterDetails;

  PincodeModel({
    this.status,
    this.message,
    this.masterDetails,
  });

  factory PincodeModel.fromJson(Map<String, dynamic> json) => PincodeModel(
        status: json["status"],
        message: json["message"],
        masterDetails: PincodeMasterDetails.fromJson(json["masterDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "masterDetails": masterDetails!.toJson(),
      };
}

class PincodeMasterDetails {
  String? state;
  String? country;
  String? district;
  String? stateCode;

  PincodeMasterDetails({
    this.state,
    this.country,
    this.district,
    this.stateCode,
  });

  factory PincodeMasterDetails.fromJson(Map<String, dynamic> json) =>
      PincodeMasterDetails(
        state: json["state"],
        country: json["country"],
        district: json["district"],
        stateCode: json["stateCode"],
      );

  Map<String, dynamic> toJson() => {
        "state": state,
        "country": country,
        "district": district,
        "stateCode": stateCode,
      };
}
