// To parse this JSON data, do
//
//     final taxMaster = taxMasterFromJson(jsonString);

import 'dart:convert';

TaxMaster taxMasterFromJson(String str) => TaxMaster.fromJson(json.decode(str));

String taxMasterToJson(TaxMaster data) => json.encode(data.toJson());

class TaxMaster {
  int? status;
  String? message;
  List<MasterDetail>? masterDetails;

  TaxMaster({
    this.status,
    this.message,
    this.masterDetails,
  });

  factory TaxMaster.fromJson(Map<String, dynamic> json) => TaxMaster(
        status: json["status"],
        message: json["message"],
        masterDetails: List<MasterDetail>.from(
            json["masterDetails"].map((x) => MasterDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "masterDetails":
            List<dynamic>.from(masterDetails!.map((x) => x.toJson())),
      };
}

class MasterDetail {
  String? taxStatusCode;
  String? taxStatusDesc;
  Flag? minorFlag;
  Flag? corporateFlag;
  Flag? nomineeFlag;
  Flag? residentFlag;
  Flag? jointholdersFlag;
  String? lastModifiedDate;

  MasterDetail({
    this.taxStatusCode,
    this.taxStatusDesc,
    this.minorFlag,
    this.corporateFlag,
    this.nomineeFlag,
    this.residentFlag,
    this.jointholdersFlag,
    this.lastModifiedDate,
  });

  factory MasterDetail.fromJson(Map<String, dynamic> json) => MasterDetail(
        taxStatusCode: json["TAX_STATUS_CODE"],
        taxStatusDesc: json["TAX_STATUS_DESC"],
        minorFlag: flagValues.map[json["MINOR_FLAG"]]!,
        corporateFlag: flagValues.map[json["CORPORATE_FLAG"]]!,
        nomineeFlag: flagValues.map[json["NOMINEE_FLAG"]]!,
        residentFlag: flagValues.map[json["RESIDENT_FLAG"]]!,
        jointholdersFlag: flagValues.map[json["JOINTHOLDERS_FLAG"]]!,
        lastModifiedDate: json["LAST_MODIFIED_DATE"],
      );

  Map<String, dynamic> toJson() => {
        "TAX_STATUS_CODE": taxStatusCode,
        "TAX_STATUS_DESC": taxStatusDesc,
        "MINOR_FLAG": flagValues.reverse[minorFlag],
        "CORPORATE_FLAG": flagValues.reverse[corporateFlag],
        "NOMINEE_FLAG": flagValues.reverse[nomineeFlag],
        "RESIDENT_FLAG": flagValues.reverse[residentFlag],
        "JOINTHOLDERS_FLAG": flagValues.reverse[jointholdersFlag],
        "LAST_MODIFIED_DATE": lastModifiedDate,
      };
}

enum Flag { N, Y }

final flagValues = EnumValues({"N": Flag.N, "Y": Flag.Y});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
