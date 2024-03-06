// To parse this JSON data, do
//
//     final bankListingModel = bankListingModelFromJson(jsonString);

import 'dart:convert';

BankListingModel bankListingModelFromJson(String str) =>
    BankListingModel.fromJson(json.decode(str));

String bankListingModelToJson(BankListingModel data) =>
    json.encode(data.toJson());

class BankListingModel {
  int? status;
  List<BankList>? bank;

  BankListingModel({
    this.status,
    this.bank,
  });

  factory BankListingModel.fromJson(Map<String, dynamic> json) =>
      BankListingModel(
        status: json["status"],
        bank:
            List<BankList>.from(json["bank"].map((x) => BankList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "bank": List<dynamic>.from(bank!.map((x) => x.toJson())),
      };
}

class BankList {
  dynamic status;
  dynamic modeOfActivation;
  dynamic impsStatus;
  dynamic matchStatus;
  dynamic rejectedReason;
  String? id;
  String? processFlag;
  String? iin;
  String? accNo;
  String? accType;
  String? ifscCode;
  String? micrNo;
  String? bankName;
  String? branchName;
  String? branchAddress1;
  String? branchAddress2;
  String? branchAddress3;
  String? branchCity;
  String? branchCountry;
  String? branchPincode;
  String? proofOfAccount;
  String? userid;
  bool? defaultbank;
  int? v;

  BankList({
    this.status,
    this.modeOfActivation,
    this.impsStatus,
    this.matchStatus,
    this.rejectedReason,
    this.id,
    this.processFlag,
    this.iin,
    this.accNo,
    this.accType,
    this.ifscCode,
    this.micrNo,
    this.bankName,
    this.branchName,
    this.branchAddress1,
    this.branchAddress2,
    this.branchAddress3,
    this.branchCity,
    this.branchCountry,
    this.branchPincode,
    this.proofOfAccount,
    this.userid,
    this.defaultbank,
    this.v,
  });

  factory BankList.fromJson(Map<String, dynamic> json) => BankList(
        status: json["status"],
        modeOfActivation: json["mode_of_activation"],
        impsStatus: json["imps_status"],
        matchStatus: json["match_status"],
        rejectedReason: json["rejected_reason"],
        id: json["_id"],
        processFlag: json["process_flag"],
        iin: json["iin"],
        accNo: json["acc_no"],
        accType: json["acc_type"],
        ifscCode: json["ifsc_code"],
        micrNo: json["micr_no"],
        bankName: json["bank_name"],
        branchName: json["branch_name"],
        branchAddress1: json["branch_address1"],
        branchAddress2: json["branch_address2"],
        branchAddress3: json["branch_address3"],
        branchCity: json["branch_city"],
        branchCountry: json["branch_country"],
        branchPincode: json["branch_pincode"],
        proofOfAccount: json["proof_of_account"],
        userid: json["userid"],
        defaultbank: json["defaultbank"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "mode_of_activation": modeOfActivation,
        "imps_status": impsStatus,
        "match_status": matchStatus,
        "rejected_reason": rejectedReason,
        "_id": id,
        "process_flag": processFlag,
        "iin": iin,
        "acc_no": accNo,
        "acc_type": accType,
        "ifsc_code": ifscCode,
        "micr_no": micrNo,
        "bank_name": bankName,
        "branch_name": branchName,
        "branch_address1": branchAddress1,
        "branch_address2": branchAddress2,
        "branch_address3": branchAddress3,
        "branch_city": branchCity,
        "branch_country": branchCountry,
        "branch_pincode": branchPincode,
        "proof_of_account": proofOfAccount,
        "userid": userid,
        "defaultbank": defaultbank,
        "__v": v,
      };
}
