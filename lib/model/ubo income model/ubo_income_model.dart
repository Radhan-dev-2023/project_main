// To parse this JSON data, do
//
//     final incomeModel = incomeModelFromJson(jsonString);

import 'dart:convert';

IncomeModel incomeModelFromJson(String str) =>
    IncomeModel.fromJson(json.decode(str));

String incomeModelToJson(IncomeModel data) => json.encode(data.toJson());

class IncomeModel {
  int? status;
  String? message;
  List<IncomeModelMaster>? masterDetails;

  IncomeModel({
    this.status,
    this.message,
    this.masterDetails,
  });

  factory IncomeModel.fromJson(Map<String, dynamic> json) => IncomeModel(
        status: json["status"],
        message: json["message"],
        masterDetails: List<IncomeModelMaster>.from(
            json["masterDetails"].map((x) => IncomeModelMaster.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "masterDetails":
            List<dynamic>.from(masterDetails!.map((x) => x.toJson())),
      };
}

class IncomeModelMaster {
  String? appIncomeCode;
  String? appIncomeDesc;

  IncomeModelMaster({
    this.appIncomeCode,
    this.appIncomeDesc,
  });

  factory IncomeModelMaster.fromJson(Map<String, dynamic> json) =>
      IncomeModelMaster(
        appIncomeCode: json["APP_INCOME_CODE"],
        appIncomeDesc: json["APP_INCOME_DESC"],
      );

  Map<String, dynamic> toJson() => {
        "APP_INCOME_CODE": appIncomeCode,
        "APP_INCOME_DESC": appIncomeDesc,
      };
}
