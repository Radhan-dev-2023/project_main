// To parse this JSON data, do
//
//     final uboModel = uboModelFromJson(jsonString);

import 'dart:convert';

UboModel uboModelFromJson(String str) => UboModel.fromJson(json.decode(str));

String uboModelToJson(UboModel data) => json.encode(data.toJson());

class UboModel {
  int? status;
  String? message;
  List<UboMasterDetail>? masterDetails;

  UboModel({
    this.status,
    this.message,
    this.masterDetails,
  });

  factory UboModel.fromJson(Map<String, dynamic> json) => UboModel(
        status: json["status"],
        message: json["message"],
        masterDetails: List<UboMasterDetail>.from(
            json["masterDetails"].map((x) => UboMasterDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "masterDetails":
            List<dynamic>.from(masterDetails!.map((x) => x.toJson())),
      };
}

class UboMasterDetail {
  String? code;
  String? description;

  UboMasterDetail({
    this.code,
    this.description,
  });

  factory UboMasterDetail.fromJson(Map<String, dynamic> json) =>
      UboMasterDetail(
        code: json["CODE"],
        description: json["DESCRIPTION"],
      );

  Map<String, dynamic> toJson() => {
        "CODE": code,
        "DESCRIPTION": description,
      };
}
