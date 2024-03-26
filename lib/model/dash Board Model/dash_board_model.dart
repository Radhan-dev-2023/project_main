// To parse this JSON data, do
//
//     final dashBoardModel = dashBoardModelFromJson(jsonString);

import 'dart:convert';

DashBoardModel dashBoardModelFromJson(String str) =>
    DashBoardModel.fromJson(json.decode(str));

String dashBoardModelToJson(DashBoardModel data) => json.encode(data.toJson());

class DashBoardModel {
  Result? result;

  DashBoardModel({
    this.result,
  });

  factory DashBoardModel.fromJson(Map<String, dynamic> json) => DashBoardModel(
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result!.toJson(),
      };
}

class Result {
  int? status;
  String? message;
  Data? data;

  Result({
    this.status,
    this.message,
    this.data,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Goals? goals;
  Transaction? transaction;
  Bank? bank;
  ActivationStatus? activationStatus;
  Achmandate? achmandate;
  String? id;
  String? phoneNumber;
  String? email;
  dynamic iin;
  dynamic pan;
  dynamic name;
  dynamic jh1Panno;
  dynamic jh1Name;
  dynamic jh2Panno;
  dynamic jh2Name;
  dynamic taxStatus;
  bool? anyAchUpdates;
  dynamic achReferenceNo;
  bool? ipFormUpload;
  bool? chequeUpload;
  dynamic freshChatId;
  List<dynamic>? topFunds;
  dynamic frequentFunds;
  int? v;

  Data({
    this.goals,
    this.transaction,
    this.bank,
    this.activationStatus,
    this.id,
    this.phoneNumber,
    this.email,
    this.iin,
    this.pan,
    this.name,
    this.jh1Panno,
    this.jh1Name,
    this.jh2Panno,
    this.jh2Name,
    this.taxStatus,
    this.anyAchUpdates,
    this.achReferenceNo,
    this.ipFormUpload,
    this.chequeUpload,
    this.freshChatId,
    this.topFunds,
    this.frequentFunds,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        goals: Goals.fromJson(json["goals"]),
        transaction: Transaction.fromJson(json["transaction"]),
        bank: Bank.fromJson(json["bank"]),
        activationStatus: ActivationStatus.fromJson(json["activationStatus"]),
        id: json["_id"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        iin: json["iin"],
        pan: json["pan"],
        name: json["name"],
        jh1Panno: json["jh1_panno"],
        jh1Name: json["jh1_name"],
        jh2Panno: json["jh2_panno"],
        jh2Name: json["jh2_name"],
        taxStatus: json["tax_status"],
        anyAchUpdates: json["anyACHUpdates"],
        achReferenceNo: json["achReferenceNo"],
        ipFormUpload: json["ipFormUpload"],
        chequeUpload: json["chequeUpload"],
        freshChatId: json["freshChatId"],
        topFunds: List<dynamic>.from(json["topFunds"].map((x) => x)),
        frequentFunds: json["frequentFunds"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "goals": goals!.toJson(),
        "transaction": transaction!.toJson(),
        "bank": bank!.toJson(),
        "activationStatus": activationStatus!.toJson(),
        "_id": id,
        "phoneNumber": phoneNumber,
        "email": email,
        "iin": iin,
        "pan": pan,
        "name": name,
        "jh1_panno": jh1Panno,
        "jh1_name": jh1Name,
        "jh2_panno": jh2Panno,
        "jh2_name": jh2Name,
        "tax_status": taxStatus,
        "anyACHUpdates": anyAchUpdates,
        "achReferenceNo": achReferenceNo,
        "ipFormUpload": ipFormUpload,
        "chequeUpload": chequeUpload,
        "freshChatId": freshChatId,
        "topFunds": List<dynamic>.from(topFunds!.map((x) => x)),
        "frequentFunds": frequentFunds,
        "__v": v,
      };
}

class Achmandate {
  bool? allowAch;
  bool? allowEmandateDebitcard;
  bool? allowEmandateNetbanking;
  String? achCompleted;

  Achmandate({
     this.allowAch,
     this.allowEmandateDebitcard,
     this.allowEmandateNetbanking,
     this.achCompleted,
  });

  factory Achmandate.fromJson(Map<String, dynamic> json) => Achmandate(
        allowAch: json["allow_ach"],
        allowEmandateDebitcard: json["allow_emandate_debitcard"],
        allowEmandateNetbanking: json["allow_emandate_netbanking"],
        achCompleted: json["ach_completed"],
      );

  Map<String, dynamic> toJson() => {
        "allow_ach": allowAch,
        "allow_emandate_debitcard": allowEmandateDebitcard,
        "allow_emandate_netbanking": allowEmandateNetbanking,
        "ach_completed": achCompleted,
      };
}

class ActivationStatus {
  dynamic link;
  String? statusCode;
  String? message;

  ActivationStatus({
    this.link,
    this.statusCode,
    this.message,
  });

  factory ActivationStatus.fromJson(Map<String, dynamic> json) =>
      ActivationStatus(
        link: json["link"],
        statusCode: json["statusCode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "statusCode": statusCode,
        "message": message,
      };
}

class Bank {
  dynamic bankName;
  dynamic ifscCode;
  dynamic accNo;
  dynamic bankCode;

  Bank({
    this.bankName,
    this.ifscCode,
    this.accNo,
    this.bankCode,
  });

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        bankName: json["bank_name"],
        ifscCode: json["ifsc_code"],
        accNo: json["acc_no"],
        bankCode: json["bank_code"],
      );

  Map<String, dynamic> toJson() => {
        "bank_name": bankName,
        "ifsc_code": ifscCode,
        "acc_no": accNo,
        "bank_code": bankCode,
      };
}

class Goals {
  dynamic totalGoals;
  dynamic achievedPercentage;

  Goals({
    this.totalGoals,
    this.achievedPercentage,
  });

  factory Goals.fromJson(Map<String, dynamic> json) => Goals(
        totalGoals: json["totalGoals"],
        achievedPercentage: json["achievedPercentage"],
      );

  Map<String, dynamic> toJson() => {
        "totalGoals": totalGoals,
        "achievedPercentage": achievedPercentage,
      };
}

class Transaction {
  dynamic totalTransactionAmount;

  Transaction({
    required this.totalTransactionAmount,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        totalTransactionAmount: json["totalTransactionAmount"],
      );

  Map<String, dynamic> toJson() => {
        "totalTransactionAmount": totalTransactionAmount,
      };
}
