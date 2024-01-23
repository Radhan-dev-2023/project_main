class HistoricalNavModel {
  int? status;
  String? statusMsg;
  String? msg;
  List<NavDetails>? navList;

  HistoricalNavModel({
    this.status,
    this.statusMsg,
    this.msg,
    this.navList,
  });

  factory HistoricalNavModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> navListData = json['list'];
    List<NavDetails> navDetails =
        navListData.map((nav) => NavDetails.fromJson(nav)).toList();

    return HistoricalNavModel(
      status: json['status'],
      statusMsg: json['status_msg'],
      msg: json['msg'],
      navList: navDetails,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'status_msg': statusMsg,
      'msg': msg,
      'list': navList!.map((nav) => nav.toJson()).toList(),
    };
  }
}

class NavDetails {
  String? navDate;
  String? navDateString;
  double? netAssetValue;

  NavDetails({
    this.navDate,
    this.navDateString,
    this.netAssetValue,
  });

  factory NavDetails.fromJson(Map<String, dynamic> json) {
    return NavDetails(
      navDate: json['nav_date'],
      navDateString: json['nav_date_string'],
      netAssetValue: json['net_asset_value'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nav_date': navDate,
      'nav_date_string': navDateString,
      'net_asset_value': netAssetValue,
    };
  }
}
