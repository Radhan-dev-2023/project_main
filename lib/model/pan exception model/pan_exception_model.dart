// To parse this JSON data, do
//
//     final panExceptionModel = panExceptionModelFromJson(jsonString);

import 'dart:convert';

PanExceptionModel panExceptionModelFromJson(String str) =>
    PanExceptionModel.fromJson(json.decode(str));

String panExceptionModelToJson(PanExceptionModel data) =>
    json.encode(data.toJson());

class PanExceptionModel {
  int? status;
  String? message;
  List<MasterPanExceptionDetail>? masterDetails;

  PanExceptionModel({
    this.status,
    this.message,
    this.masterDetails,
  });

  factory PanExceptionModel.fromJson(Map<String, dynamic> json) =>
      PanExceptionModel(
        status: json["status"],
        message: json["message"],
        masterDetails: List<MasterPanExceptionDetail>.from(json["masterDetails"]
            .map((x) => MasterPanExceptionDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "masterDetails":
            List<dynamic>.from(masterDetails!.map((x) => x.toJson())),
      };
}

class MasterPanExceptionDetail {
  String? code;
  String? description;

  MasterPanExceptionDetail({
    this.code,
    this.description,
  });

  factory MasterPanExceptionDetail.fromJson(Map<String, dynamic> json) =>
      MasterPanExceptionDetail(
        code: json["CODE"],
        description: json["DESCRIPTION"],
      );

  Map<String, dynamic> toJson() => {
        "CODE": code,
        "DESCRIPTION": description,
      };
}
