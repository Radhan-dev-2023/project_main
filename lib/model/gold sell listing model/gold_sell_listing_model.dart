class GoldSellListingModel {
  int? status;
  List<Result>? result;

  GoldSellListingModel({
    this.status,
    this.result,
  });

  factory GoldSellListingModel.fromJson(Map<String, dynamic> json) =>
      GoldSellListingModel(
        status: json["status"],
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x)))
            .reversed
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class Result {
  String? id;
  String? iin;
  dynamic currentgoldrate;
  dynamic soldmg;
  dynamic amount;
  String? status;
  String? firstname;
  String? mobileNo;
  dynamic approvedDate;
  DateTime? sellDate;
  int? v;

  Result({
    this.id,
    this.iin,
    this.currentgoldrate,
    this.soldmg,
    this.amount,
    this.status,
    this.firstname,
    this.mobileNo,
    this.approvedDate,
    this.sellDate,
    this.v,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        iin: json["iin"],
        currentgoldrate: json["currentgoldrate"]?.toDouble(),
        soldmg: json["soldmg"]?.toDouble(),
        amount: json["amount"],
        status: json["status"],
        firstname: json["firstname"],
        mobileNo: json["mobile_no"],
        approvedDate: json["approved_date"],
        sellDate: DateTime.parse(json["sell_date"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "iin": iin,
        "currentgoldrate": currentgoldrate,
        "soldmg": soldmg,
        "amount": amount,
        "status": status,
        "firstname": firstname,
        "mobile_no": mobileNo,
        "approved_date": approvedDate,
        "sell_date": sellDate!.toIso8601String(),
        "__v": v,
      };
}
