// To parse this JSON data, do
//
//     final sipdateModel = sipdateModelFromJson(jsonString);

import 'dart:convert';

SipdateModel sipdateModelFromJson(String str) =>
    SipdateModel.fromJson(json.decode(str));

String sipdateModelToJson(SipdateModel data) => json.encode(data.toJson());

class SipdateModel {
  int? status;
  List<int>? sipDates;

  SipdateModel({
    this.status,
    this.sipDates,
  });

  factory SipdateModel.fromJson(Map<String, dynamic> json) => SipdateModel(
        status: json["status"],
        sipDates: List<int>.from(json["sipDates"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "sipDates": List<dynamic>.from(sipDates!.map((x) => x)),
      };
}
