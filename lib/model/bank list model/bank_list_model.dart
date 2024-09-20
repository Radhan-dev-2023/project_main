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
        bank: json["bank"] == null
            ? []
            : List<BankList>.from(
                json["bank"]!.map((x) => BankList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "bank": bank == null
            ? []
            : List<dynamic>.from(bank!.map((x) => x.toJson())),
      };
}

class BankList {
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
  dynamic status;
  dynamic modeOfActivation;
  dynamic impsStatus;
  dynamic matchStatus;
  dynamic rejectedReason;
  int? v;
  BankDetails? bankDetails;

  BankList({
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
    this.status,
    this.modeOfActivation,
    this.impsStatus,
    this.matchStatus,
    this.rejectedReason,
    this.v,
    this.bankDetails,
  });

  factory BankList.fromJson(Map<String, dynamic> json) => BankList(
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
        status: json["status"],
        modeOfActivation: json["mode_of_activation"],
        impsStatus: json["imps_status"],
        matchStatus: json["match_status"],
        rejectedReason: json["rejected_reason"],
        v: json["__v"],
        bankDetails: json["bankDetails"] == null
            ? null
            : BankDetails.fromJson(json["bankDetails"]),
      );

  Map<String, dynamic> toJson() => {
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
        "status": status,
        "mode_of_activation": modeOfActivation,
        "imps_status": impsStatus,
        "match_status": matchStatus,
        "rejected_reason": rejectedReason,
        "__v": v,
        "bankDetails": bankDetails?.toJson(),
      };
}

class BankDetails {
  String? id;
  String? bankCode;
  String? bankName;
  String? allowAch;
  String? lastModifiedDate;
  String? allowEmandateDebitcard;
  String? allowEmandateNetbanking;

  BankDetails({
    this.id,
    this.bankCode,
    this.bankName,
    this.allowAch,
    this.lastModifiedDate,
    this.allowEmandateDebitcard,
    this.allowEmandateNetbanking,
  });

  factory BankDetails.fromJson(Map<String, dynamic> json) => BankDetails(
        id: json["_id"],
        bankCode: json["BANK_CODE"],
        bankName: json["BANK_NAME"],
        allowAch: json["ALLOW_ACH"],
        lastModifiedDate: json["LAST_MODIFIED_DATE"],
        allowEmandateDebitcard: json["ALLOW_EMANDATE_DEBITCARD"],
        allowEmandateNetbanking: json["ALLOW_EMANDATE_NETBANKING"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "BANK_CODE": bankCode,
        "BANK_NAME": bankName,
        "ALLOW_ACH": allowAch,
        "LAST_MODIFIED_DATE": lastModifiedDate,
        "ALLOW_EMANDATE_DEBITCARD": allowEmandateDebitcard,
        "ALLOW_EMANDATE_NETBANKING": allowEmandateNetbanking,
      };
}
