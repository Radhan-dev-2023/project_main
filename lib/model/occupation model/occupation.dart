// To parse this JSON data, do
//
//     final occupationModel = occupationModelFromJson(jsonString);

import 'dart:convert';

OccupationModel occupationModelFromJson(String str) => OccupationModel.fromJson(json.decode(str));

String occupationModelToJson(OccupationModel data) => json.encode(data.toJson());

class OccupationModel {
    int? status;
    String? message;
    List<OccupationDetail>? masterDetails;

    OccupationModel({
       this.status,
       this.message,
       this.masterDetails,
    });

    factory OccupationModel.fromJson(Map<String, dynamic> json) => OccupationModel(
        status: json["status"],
        message: json["message"],
        masterDetails: List<OccupationDetail>.from(json["masterDetails"].map((x) => OccupationDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "masterDetails": List<dynamic>.from(masterDetails!.map((x) => x.toJson())),
    };
}

class OccupationDetail {
    String occupationCode;
    String occupationDesc;
    LastModifiedDate lastModifiedDate;

   OccupationDetail({
        required this.occupationCode,
        required this.occupationDesc,
        required this.lastModifiedDate,
    });

    factory OccupationDetail.fromJson(Map<String, dynamic> json) => OccupationDetail(
        occupationCode: json["OCCUPATION_CODE"],
        occupationDesc: json["OCCUPATION_DESC"],
        lastModifiedDate: lastModifiedDateValues.map[json["LAST_MODIFIED_DATE"]]!,
    );

    Map<String, dynamic> toJson() => {
        "OCCUPATION_CODE": occupationCode,
        "OCCUPATION_DESC": occupationDesc,
        "LAST_MODIFIED_DATE": lastModifiedDateValues.reverse[lastModifiedDate],
    };
}

enum LastModifiedDate {
    THE_12_DEC_2014
}

final lastModifiedDateValues = EnumValues({
    "12-DEC-2014": LastModifiedDate.THE_12_DEC_2014
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
