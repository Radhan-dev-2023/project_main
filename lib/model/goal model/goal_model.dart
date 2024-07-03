import 'dart:convert';

GoalsModel goalsModelFromJson(String str) =>
    GoalsModel.fromJson(json.decode(str));

String goalsModelToJson(GoalsModel data) => json.encode(data.toJson());

class GoalsModel {
  Result? result;

  GoalsModel({
    this.result,
  });

  factory GoalsModel.fromJson(Map<String, dynamic> json) => GoalsModel(
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result!.toJson(),
      };
}

class Result {
  int? status;
  List<FundGoal>? funds;

  Result({
    this.status,
    this.funds,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        status: json["status"],
        funds:
            List<FundGoal>.from(json["funds"].map((x) => FundGoal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "funds": List<dynamic>.from(funds!.map((x) => x.toJson())),
      };
}

class FundGoal {
  String? id;
  String? fundCategoryName;
  String? categoryType;
  String? fundCategoryId;
  int? v;
  List<FundListGoal>? fundList;

  FundGoal({
    this.id,
    this.fundCategoryName,
    this.categoryType,
    this.fundCategoryId,
    this.v,
    this.fundList,
  });

  factory FundGoal.fromJson(Map<String, dynamic> json) => FundGoal(
        id: json["_id"],
        fundCategoryName: json["fundCategoryName"],
        categoryType: json["categoryType"],
        fundCategoryId: json["fundCategoryId"],
        v: json["__v"],
        fundList: List<FundListGoal>.from(
            json["fundList"].map((x) => FundListGoal.fromJson(x))),
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

class FundListGoal {
  String? id;
  String? fundName;
  String? isin;
  String? category;
  String? image;
  String? fundCategoryId;

  FundListGoal({
    this.id,
    this.fundName,
    this.isin,
    this.category,
    this.image,
    this.fundCategoryId,
  });

  factory FundListGoal.fromJson(Map<String, dynamic> json) => FundListGoal(
        id: json["_id"],
        fundName: json["fundName"],
        isin: json["isin"],
        category: json["category"],
        image: json["image"],
        fundCategoryId: json["fundCategoryId"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fundName": fundName,
        "isin": isin,
        "category": category,
        "image": image,
        "fundCategoryId": fundCategoryId,
      };
}
