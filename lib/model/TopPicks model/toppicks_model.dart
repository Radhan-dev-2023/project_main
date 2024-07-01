import 'dart:convert';

TopPicksModel topPicksModelFromJson(String str) =>
    TopPicksModel.fromJson(json.decode(str));

String topPicksModelToJson(TopPicksModel data) => json.encode(data.toJson());

class TopPicksModel {
  Result? result;

  TopPicksModel({
    this.result,
  });

  factory TopPicksModel.fromJson(Map<String, dynamic> json) => TopPicksModel(
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result!.toJson(),
      };
}

class Result {
  int? status;
  List<Fund>? funds;

  Result({
    this.status,
    this.funds,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        status: json["status"],
        funds: List<Fund>.from(json["funds"].map((x) => Fund.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "funds": List<dynamic>.from(funds!.map((x) => x.toJson())),
      };
}

class Fund {
  String? id;
  String? fundCategoryName;
  String? categoryType;
  String? fundCategoryId;
  int? v;
  List<FundList>? fundList;

  Fund({
    this.id,
    this.fundCategoryName,
    this.categoryType,
    this.fundCategoryId,
    this.v,
    this.fundList,
  });

  factory Fund.fromJson(Map<String, dynamic> json) => Fund(
        id: json["_id"],
        fundCategoryName: json["fundCategoryName"],
        categoryType: json["categoryType"],
        fundCategoryId: json["fundCategoryId"],
        v: json["__v"],
        fundList: List<FundList>.from(
            json["fundList"].map((x) => FundList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fundCategoryName": fundCategoryName,
        "categoryType": categoryType,
        "fundCategoryId": fundCategoryId,
        "__v": v,
        "fundList": List<dynamic>.from(fundList!.map((x) => x.toJson())),
      };
}

class FundList {
  String? id;
  String? fundName;
  String? isin;
  String? category;
  String? image;
  String? fundCategoryId;
  int? v;

  FundList({
    this.id,
    this.fundName,
    this.isin,
    this.category,
    this.image,
    this.fundCategoryId,
    this.v,
  });

  factory FundList.fromJson(Map<String, dynamic> json) => FundList(
        id: json["_id"],
        fundName: json["fundName"],
        isin: json["isin"],
        category: json["category"],
        image: json["image"],
        fundCategoryId: json["fundCategoryId"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fundName": fundName,
        "isin": isin,
        "category": category,
        "image": image,
        "fundCategoryId": fundCategoryId,
        "__v": v,
      };
}
