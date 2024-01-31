// To parse this JSON data, do
//
//     final customerResponseModel = customerResponseModelFromJson(jsonString);

import 'dart:convert';

CustomerResponseModel customerResponseModelFromJson(String str) =>
    CustomerResponseModel.fromJson(json.decode(str));

String customerResponseModelToJson(CustomerResponseModel data) =>
    json.encode(data.toJson());

class CustomerResponseModel {
  int? status;
  String? message;
  String? customerId;
  bool? newCustomer;

  CustomerResponseModel({
    this.status,
    this.message,
    this.customerId,
    this.newCustomer,
  });

  factory CustomerResponseModel.fromJson(Map<String, dynamic> json) =>
      CustomerResponseModel(
        status: json["status"],
        message: json["message"],
        customerId: json["customerId"],
        newCustomer: json["newCustomer"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "customerId": customerId,
        "newCustomer": newCustomer,
      };
}
