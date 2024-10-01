// To parse this JSON data, do
//
//     final golListingModel = golListingModelFromJson(jsonString);

import 'dart:convert';

GolListingModel golListingModelFromJson(String str) =>
    GolListingModel.fromJson(json.decode(str));

String golListingModelToJson(GolListingModel data) =>
    json.encode(data.toJson());

class GolListingModel {
  int? status;
  Res? res;

  GolListingModel({
    this.status,
    this.res,
  });

  factory GolListingModel.fromJson(Map<String, dynamic> json) =>
      GolListingModel(
        status: json["status"],
        res: Res.fromJson(json["res"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "res": res!.toJson(),
      };
}

class Res {
  int? id;
  dynamic total;
  List<Transaction>? transactions;

  Res({
    this.id,
    this.total,
    this.transactions,
  });

  factory Res.fromJson(Map<String, dynamic> json) => Res(
        id: json["_id"],
        total: json["total"],
        transactions: List<Transaction>.from(
                json["transactions"].map((x) => Transaction.fromJson(x)))
            .reversed
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "total": total,
        "transactions":
            List<dynamic>.from(transactions!.map((x) => x.toJson())),
      };
}

class Transaction {
  dynamic iin;
  dynamic goldrate;
  dynamic purchasedGold;
  DateTime? addedon;
  dynamic amount;

  Transaction(
      {this.iin, this.goldrate, this.purchasedGold, this.addedon, this.amount});

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
      iin: json["iin"],
      goldrate: json["goldrate"]?.toDouble(),
      purchasedGold: json["purchasedGold"],
      addedon: DateTime.parse(json["addedon"]),
      amount: json['amount']);

  Map<String, dynamic> toJson() => {
        "iin": iin,
        "goldrate": goldrate,
        "purchasedGold": purchasedGold,
        "addedon": addedon!.toIso8601String(),
        "amount": amount
      };
}
