// To parse this JSON data, do
//
//     final stateModel = stateModelFromJson(jsonString);

import 'dart:convert';

StateModel stateModelFromJson(String str) =>
    StateModel.fromJson(json.decode(str));

String stateModelToJson(StateModel data) => json.encode(data.toJson());

class StateModel {
  int? status;
  String? message;
  List<StateMasterDetail>? masterDetails;

  StateModel({
    this.status,
    this.message,
    this.masterDetails,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        status: json["status"],
        message: json["message"],
        masterDetails: List<StateMasterDetail>.from(
            json["masterDetails"].map((x) => StateMasterDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "masterDetails":
            List<dynamic>.from(masterDetails!.map((x) => x.toJson())),
      };
}

class StateMasterDetail {
  String? stateCode;
  String? stateName;
  String? lastModifiedDate;

  StateMasterDetail({
    this.stateCode,
    this.stateName,
    this.lastModifiedDate,
  });

  factory StateMasterDetail.fromJson(Map<String, dynamic> json) =>
      StateMasterDetail(
        stateCode: json["STATE_CODE"],
        stateName: json["STATE_NAME"],
        lastModifiedDate: json["LAST_MODIFIED_DATE"],
      );

  Map<String, dynamic> toJson() => {
        "STATE_CODE": stateCode,
        "STATE_NAME": stateName,
        "LAST_MODIFIED_DATE": lastModifiedDate,
      };
}
