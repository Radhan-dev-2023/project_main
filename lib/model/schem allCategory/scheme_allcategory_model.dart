// To parse this JSON data, do
//
//     final schemeAllCategoryModel = schemeAllCategoryModelFromJson(jsonString);

import 'dart:convert';

SchemeAllCategoryModel schemeAllCategoryModelFromJson(String str) =>
    SchemeAllCategoryModel.fromJson(json.decode(str));

String schemeAllCategoryModelToJson(SchemeAllCategoryModel data) =>
    json.encode(data.toJson());

class SchemeAllCategoryModel {
  int? status;
  String? statusMsg;
  String? msg;
  List<String>? list;

  SchemeAllCategoryModel({
    this.status,
    this.statusMsg,
    this.msg,
    this.list,
  });

  factory SchemeAllCategoryModel.fromJson(Map<String, dynamic> json) =>
      SchemeAllCategoryModel(
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
