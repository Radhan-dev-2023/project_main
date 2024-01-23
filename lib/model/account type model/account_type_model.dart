// To parse this JSON data, do
//
//     final accountTypeModel = accountTypeModelFromJson(jsonString);

import 'dart:convert';

AccountTypeModel accountTypeModelFromJson(String str) =>
    AccountTypeModel.fromJson(json.decode(str));

String accountTypeModelToJson(AccountTypeModel data) =>
    json.encode(data.toJson());

class AccountTypeModel {
  int? status;
  String? message;
  List<MasterAccountDetail>? masterDetails;

  AccountTypeModel({
    this.status,
    this.message,
    this.masterDetails,
  });

  factory AccountTypeModel.fromJson(Map<String, dynamic> json) =>
      AccountTypeModel(
        status: json["status"],
        message: json["message"],
        masterDetails: List<MasterAccountDetail>.from(
            json["masterDetails"].map((x) => MasterAccountDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "masterDetails":
            List<dynamic>.from(masterDetails!.map((x) => x.toJson())),
      };
}

class MasterAccountDetail {
  String? accType;
  String? description;

  MasterAccountDetail({
    this.accType,
    this.description,
  });

  factory MasterAccountDetail.fromJson(Map<String, dynamic> json) =>
      MasterAccountDetail(
        accType: json["ACC_TYPE"],
        description: json["DESCRIPTION"],
      );

  Map<String, dynamic> toJson() => {
        "ACC_TYPE": accType,
        "DESCRIPTION": description,
      };
}
