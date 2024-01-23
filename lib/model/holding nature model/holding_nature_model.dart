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
  List<MasterHoldingDetail>? masterDetails;

  HoldingNatureModel({
    this.status,
    this.message,
    this.masterDetails,
  });

  factory HoldingNatureModel.fromJson(Map<String, dynamic> json) =>
      HoldingNatureModel(
        status: json["status"],
        message: json["message"],
        masterDetails: List<MasterHoldingDetail>.from(
            json["masterDetails"].map((x) => MasterHoldingDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "masterDetails":
            List<dynamic>.from(masterDetails!.map((x) => x.toJson())),
      };
}

class MasterHoldingDetail {
  String? holdNatureCode;
  String? holdNatureDesc;
  String? lastModifiedDate;

  MasterHoldingDetail({
    this.holdNatureCode,
    this.holdNatureDesc,
    this.lastModifiedDate,
  });

  factory MasterHoldingDetail.fromJson(Map<String, dynamic> json) =>
      MasterHoldingDetail(
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
