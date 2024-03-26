// To parse this JSON data, do
//
//     final achHistoryModel = achHistoryModelFromJson(jsonString);

import 'dart:convert';

AchHistoryModel achHistoryModelFromJson(String str) =>
    AchHistoryModel.fromJson(json.decode(str));

String achHistoryModelToJson(AchHistoryModel data) =>
    json.encode(data.toJson());

class AchHistoryModel {
  int? status;
  List<Result>? result;

  AchHistoryModel({
    this.status,
    this.result,
  });

  factory AchHistoryModel.fromJson(Map<String, dynamic> json) =>
      AchHistoryModel(
        status: json["status"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class Result {
  String? customerId;
  dynamic investorName;
  String? mandateId;
  String? uniqueRefNo;
  String? fromDate;
  String? toDate;
  String? amount;
  String? achMandateStatus;
  String? expiredDateTime;
  String? processMode;
  String? umrnNumber;

  Result({
    this.customerId,
    this.investorName,
    this.mandateId,
    this.uniqueRefNo,
    this.fromDate,
    this.toDate,
    this.amount,
    this.achMandateStatus,
    this.expiredDateTime,
    this.processMode,
    this.umrnNumber,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        customerId: json["CUSTOMER_ID"],
        investorName: json["INVESTOR_NAME"],
        mandateId: json["MANDATE_ID"],
        uniqueRefNo: json["UNIQUE_REF_NO"],
        fromDate: json["FROM_DATE"],
        toDate: json["TO_DATE"],
        amount: json["AMOUNT"],
        achMandateStatus: json["ACH_MANDATE_STATUS"],
        expiredDateTime: json["EXPIRED_DATE_TIME"],
        processMode: json["PROCESS_MODE"],
        umrnNumber: json["UMRN_NO"],
      );

  Map<String, dynamic> toJson() => {
        "CUSTOMER_ID": customerId,
        "INVESTOR_NAME": investorName,
        "MANDATE_ID": mandateId,
        "UNIQUE_REF_NO": uniqueRefNo,
        "FROM_DATE": fromDate,
        "TO_DATE": toDate,
        "AMOUNT": amount,
        "ACH_MANDATE_STATUS": achMandateStatus,
        "EXPIRED_DATE_TIME": expiredDateTime,
        "PROCESS_MODE": processMode,
        "UMRN_NO": umrnNumber
      };
}

enum AchMandateStatus { PENDING, REJECTED }

final achMandateStatusValues = EnumValues({
  "PENDING": AchMandateStatus.PENDING,
  "REJECTED": AchMandateStatus.REJECTED
});

enum ProcessMode { E_MANDATE }

final processModeValues = EnumValues({"eMandate": ProcessMode.E_MANDATE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
