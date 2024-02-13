// To parse this JSON data, do
//
//     final sourceWealthModel = sourceWealthModelFromJson(jsonString);

import 'dart:convert';

SourceWealthModel sourceWealthModelFromJson(String str) =>
    SourceWealthModel.fromJson(json.decode(str));

String sourceWealthModelToJson(SourceWealthModel data) =>
    json.encode(data.toJson());

class SourceWealthModel {
  int? status;
  String? message;
  List<SourceWealth>? masterDetails;

  SourceWealthModel({
    this.status,
    this.message,
    this.masterDetails,
  });

  factory SourceWealthModel.fromJson(Map<String, dynamic> json) =>
      SourceWealthModel(
        status: json["status"],
        message: json["message"],
        masterDetails: List<SourceWealth>.from(
            json["masterDetails"].map((x) => SourceWealth.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "masterDetails":
            List<dynamic>.from(masterDetails!.map((x) => x.toJson())),
      };
}

class SourceWealth {
  String? code;
  String? sourceOfWealth;

  SourceWealth({
    this.code,
    this.sourceOfWealth,
  });

  factory SourceWealth.fromJson(Map<String, dynamic> json) => SourceWealth(
        code: json["CODE"],
        sourceOfWealth: json["SOURCE_OF_WEALTH"],
      );

  Map<String, dynamic> toJson() => {
        "CODE": code,
        "SOURCE_OF_WEALTH": sourceOfWealth,
      };
}
