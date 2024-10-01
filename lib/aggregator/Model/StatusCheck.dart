import 'dart:convert';
/// success : true
/// status : {"status":"success","request_id":"115500","txn_status":[{"code":"ReportGenerated","status":"Success","msg":"The report has been successfully generated for the transaction","txn_id":"da10536b","aa_status":{"fi_notification_received":true,"fi_requested":true}}]}

StatusCheck statusCheckFromJson(String str) => StatusCheck.fromJson(json.decode(str));
String statusCheckToJson(StatusCheck data) => json.encode(data.toJson());
class StatusCheck {
  StatusCheck({
      bool? success, 
      Status? status,}){
    _success = success;
    _status = status;
}

  StatusCheck.fromJson(dynamic json) {
    _success = json['success'];
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
  }
  bool? _success;
  Status? _status;
StatusCheck copyWith({  bool? success,
  Status? status,
}) => StatusCheck(  success: success ?? _success,
  status: status ?? _status,
);
  bool? get success => _success;
  Status? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_status != null) {
      map['status'] = _status?.toJson();
    }
    return map;
  }

}

/// status : "success"
/// request_id : "115500"
/// txn_status : [{"code":"ReportGenerated","status":"Success","msg":"The report has been successfully generated for the transaction","txn_id":"da10536b","aa_status":{"fi_notification_received":true,"fi_requested":true}}]

Status statusFromJson(String str) => Status.fromJson(json.decode(str));
String statusToJson(Status data) => json.encode(data.toJson());
class Status {
  Status({
      String? status, 
      String? requestId, 
      List<TxnStatus>? txnStatus,}){
    _status = status;
    _requestId = requestId;
    _txnStatus = txnStatus;
}

  Status.fromJson(dynamic json) {
    _status = json['status'];
    _requestId = json['request_id'];
    if (json['txn_status'] != null) {
      _txnStatus = [];
      json['txn_status'].forEach((v) {
        _txnStatus?.add(TxnStatus.fromJson(v));
      });
    }
  }
  String? _status;
  String? _requestId;
  List<TxnStatus>? _txnStatus;
Status copyWith({  String? status,
  String? requestId,
  List<TxnStatus>? txnStatus,
}) => Status(  status: status ?? _status,
  requestId: requestId ?? _requestId,
  txnStatus: txnStatus ?? _txnStatus,
);
  String? get status => _status;
  String? get requestId => _requestId;
  List<TxnStatus>? get txnStatus => _txnStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['request_id'] = _requestId;
    if (_txnStatus != null) {
      map['txn_status'] = _txnStatus?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// code : "ReportGenerated"
/// status : "Success"
/// msg : "The report has been successfully generated for the transaction"
/// txn_id : "da10536b"
/// aa_status : {"fi_notification_received":true,"fi_requested":true}

TxnStatus txnStatusFromJson(String str) => TxnStatus.fromJson(json.decode(str));
String txnStatusToJson(TxnStatus data) => json.encode(data.toJson());
class TxnStatus {
  TxnStatus({
      String? code, 
      String? status, 
      String? msg, 
      String? txnId, 
      AaStatus? aaStatus,}){
    _code = code;
    _status = status;
    _msg = msg;
    _txnId = txnId;
    _aaStatus = aaStatus;
}

  TxnStatus.fromJson(dynamic json) {
    _code = json['code'];
    _status = json['status'];
    _msg = json['msg'];
    _txnId = json['txn_id'];
    _aaStatus = json['aa_status'] != null ? AaStatus.fromJson(json['aa_status']) : null;
  }
  String? _code;
  String? _status;
  String? _msg;
  String? _txnId;
  AaStatus? _aaStatus;
TxnStatus copyWith({  String? code,
  String? status,
  String? msg,
  String? txnId,
  AaStatus? aaStatus,
}) => TxnStatus(  code: code ?? _code,
  status: status ?? _status,
  msg: msg ?? _msg,
  txnId: txnId ?? _txnId,
  aaStatus: aaStatus ?? _aaStatus,
);
  String? get code => _code;
  String? get status => _status;
  String? get msg => _msg;
  String? get txnId => _txnId;
  AaStatus? get aaStatus => _aaStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['status'] = _status;
    map['msg'] = _msg;
    map['txn_id'] = _txnId;
    if (_aaStatus != null) {
      map['aa_status'] = _aaStatus?.toJson();
    }
    return map;
  }

}

/// fi_notification_received : true
/// fi_requested : true

AaStatus aaStatusFromJson(String str) => AaStatus.fromJson(json.decode(str));
String aaStatusToJson(AaStatus data) => json.encode(data.toJson());
class AaStatus {
  AaStatus({
      bool? fiNotificationReceived, 
      bool? fiRequested,}){
    _fiNotificationReceived = fiNotificationReceived;
    _fiRequested = fiRequested;
}

  AaStatus.fromJson(dynamic json) {
    _fiNotificationReceived = json['fi_notification_received'];
    _fiRequested = json['fi_requested'];
  }
  bool? _fiNotificationReceived;
  bool? _fiRequested;
AaStatus copyWith({  bool? fiNotificationReceived,
  bool? fiRequested,
}) => AaStatus(  fiNotificationReceived: fiNotificationReceived ?? _fiNotificationReceived,
  fiRequested: fiRequested ?? _fiRequested,
);
  bool? get fiNotificationReceived => _fiNotificationReceived;
  bool? get fiRequested => _fiRequested;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fi_notification_received'] = _fiNotificationReceived;
    map['fi_requested'] = _fiRequested;
    return map;
  }

}