// To parse this JSON data, do
//
//     final holdingNatureModel = holdingNatureModelFromJson(jsonString);

import 'dart:convert';

HoldingNatureModel holdingNatureModelFromJson(String str) =>
    HoldingNatureModel.fromJson(json.decode(str));

String holdingNatureModelToJson(HoldingNatureModel data) =>
    json.encode(data.toJson());

class HoldingNatureModel {
  int? status;
  String? message;
  List<MasterDetail>? masterDetails;

  HoldingNatureModel({
    this.status,
    this.message,
    this.masterDetails,
  });

  factory HoldingNatureModel.fromJson(Map<String, dynamic> json) =>
      HoldingNatureModel(
        status: json["status"],
        message: json["message"],
        masterDetails: List<MasterDetail>.from(
            json["masterDetails"].map((x) => MasterDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "masterDetails":
            List<dynamic>.from(masterDetails!.map((x) => x.toJson())),
      };
}

class MasterDetail {
  String? holdNatureCode;
  String? holdNatureDesc;
  String? lastModifiedDate;

  MasterDetail({
    this.holdNatureCode,
    this.holdNatureDesc,
    this.lastModifiedDate,
  });

  factory MasterDetail.fromJson(Map<String, dynamic> json) => MasterDetail(
        holdNatureCode: json["HOLD_NATURE_CODE"],
        holdNatureDesc: json["HOLD_NATURE_DESC"],
        lastModifiedDate: json["LAST_MODIFIED_DATE"],
      );

  Map<String, dynamic> toJson() => {
        "HOLD_NATURE_CODE": holdNatureCode,
        "HOLD_NATURE_DESC": holdNatureDesc,
        "LAST_MODIFIED_DATE": lastModifiedDate,
      };
}
