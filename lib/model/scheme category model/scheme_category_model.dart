// To parse this JSON data, do
//
//     final schemeCategoryModel = schemeCategoryModelFromJson(jsonString);

import 'dart:convert';

SchemeCategoryModel schemeCategoryModelFromJson(String str) =>
    SchemeCategoryModel.fromJson(json.decode(str));

String schemeCategoryModelToJson(SchemeCategoryModel data) =>
    json.encode(data.toJson());

class SchemeCategoryModel {
  int? status;
  String? statusMsg;
  String? msg;
  List<String>? list;

  SchemeCategoryModel({
    this.status,
    this.statusMsg,
    this.msg,
    this.list,
  });

  factory SchemeCategoryModel.fromJson(Map<String, dynamic> json) =>
      SchemeCategoryModel(
        status: json["status"],
        statusMsg: json["status_msg"],
        msg: json["msg"],
        list: List<String>.from(json["list"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "status_msg": statusMsg,
        "msg": msg,
        "list": List<dynamic>.from(list!.map((x) => x)),
      };
}
