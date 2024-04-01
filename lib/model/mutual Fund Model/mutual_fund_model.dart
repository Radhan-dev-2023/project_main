import 'dart:convert';

MutualFundModel mutualFundModelFromJson(String str) =>
    MutualFundModel.fromJson(json.decode(str));

String mutualFundModelToJson(MutualFundModel data) =>
    json.encode(data.toJson());

class MutualFundModel {
  int? status;
  String? statusMsg;
  String? msg;
  List<String>? list;

  MutualFundModel({
    this.status,
    this.statusMsg,
    this.msg,
    this.list,
  });

  factory MutualFundModel.fromJson(Map<String, dynamic> json) =>
      MutualFundModel(
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
