import 'package:hive/hive.dart';
import 'dart:convert';
part 'report.g.dart';

@HiveType(typeId: 2)
class ReportDataHiveModel {
  @HiveField(1)
  final bool? success;
  @HiveField(2)
  final ReportData? reportData;

  ReportDataHiveModel({
    this.success,
    this.reportData,
  });

  ReportDataHiveModel copyWith({
    bool? success,
    ReportData? reportData,
  }) =>
      ReportDataHiveModel(
        success: success ?? this.success,
        reportData: reportData ?? this.reportData,
      );

  factory ReportDataHiveModel.fromJson(String str) => ReportDataHiveModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReportDataHiveModel.fromMap(Map<String, dynamic> json) => ReportDataHiveModel(
    success: json["success"],
    reportData: json["reportData"] == null ? null : ReportData.fromMap(json["reportData"]),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "reportData": reportData?.toMap(),
  };
}

@HiveType(typeId: 3)
class ReportData {
  @HiveField(1)
  final String? clientRefNum;
  @HiveField(2)
  final int? requestId;
  @HiveField(3)
  final String? txnId;
  @HiveField(4)
  final DateTime? startDate;
  @HiveField(5)
  final DateTime? endDate;
  @HiveField(6)
  final int? durationInMonth;
  @HiveField(7)
  final String? dgReportVersion;
  @HiveField(8)
  final String? reportNum;
  @HiveField(9)
  final DateTime? reportFetchTime;
  @HiveField(10)
  final String? reportFetchType;
  @HiveField(11)
  final String? sourceOfData;
  @HiveField(12)
  final DateTime? statementStartDate;
  @HiveField(13)
  final DateTime? statementEndDate;
  @HiveField(14)
  final String? multipleAccountsFound;
  // @HiveField(15)
  // final String? sourceReport;
  @HiveField(15)
  final List<Bank>? banks;
  // @HiveField(17)
  // final LevelSummaryVar? requestLevelSummaryVar;

  ReportData({
    this.clientRefNum,
    this.requestId,
    this.txnId,
    this.startDate,
    this.endDate,
    this.durationInMonth,
    this.dgReportVersion,
    this.reportNum,
    this.reportFetchTime,
    this.reportFetchType,
    this.sourceOfData,
    this.statementStartDate,
    this.statementEndDate,
    this.multipleAccountsFound,
    //this.sourceReport,
    this.banks,
  //  this.requestLevelSummaryVar,
  });

  ReportData copyWith({
    String? clientRefNum,
    int? requestId,
    String? txnId,
    DateTime? startDate,
    DateTime? endDate,
    int? durationInMonth,
    String? dgReportVersion,
    String? reportNum,
    DateTime? reportFetchTime,
    String? reportFetchType,
    String? sourceOfData,
    DateTime? statementStartDate,
    DateTime? statementEndDate,
    String? multipleAccountsFound,
   // String? sourceReport,
    List<Bank>? banks,
   // LevelSummaryVar? requestLevelSummaryVar,
  }) =>
      ReportData(
        clientRefNum: clientRefNum ?? this.clientRefNum,
        requestId: requestId ?? this.requestId,
        txnId: txnId ?? this.txnId,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        durationInMonth: durationInMonth ?? this.durationInMonth,
        dgReportVersion: dgReportVersion ?? this.dgReportVersion,
        reportNum: reportNum ?? this.reportNum,
        reportFetchTime: reportFetchTime ?? this.reportFetchTime,
        reportFetchType: reportFetchType ?? this.reportFetchType,
        sourceOfData: sourceOfData ?? this.sourceOfData,
        statementStartDate: statementStartDate ?? this.statementStartDate,
        statementEndDate: statementEndDate ?? this.statementEndDate,
        multipleAccountsFound: multipleAccountsFound ?? this.multipleAccountsFound,
       // sourceReport: sourceReport ?? this.sourceReport,
        banks: banks ?? this.banks,
      //  requestLevelSummaryVar: requestLevelSummaryVar ?? this.requestLevelSummaryVar,
      );

  factory ReportData.fromJson(String str) => ReportData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReportData.fromMap(Map<String, dynamic> json) => ReportData(
    clientRefNum: json["client_ref_num"],
    requestId: json["request_id"],
    txnId: json["txn_id"],
    startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
    endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
    durationInMonth: json["duration_in_month"],
    dgReportVersion: json["dg_report_version"],
    reportNum: json["report_num"],
    reportFetchTime: json["report_fetch_time"] == null ? null : DateTime.parse(json["report_fetch_time"]),
    reportFetchType: json["report_fetch_type"],
    sourceOfData: json["source_of_data"],
    statementStartDate: json["statement_start_date"] == null ? null : DateTime.parse(json["statement_start_date"]),
    statementEndDate: json["statement_end_date"] == null ? null : DateTime.parse(json["statement_end_date"]),
    multipleAccountsFound: json["multiple_accounts_found"],
   // sourceReport: json["source_report"],
    banks: json["banks"] == null ? [] : List<Bank>.from(json["banks"]!.map((x) => Bank.fromMap(x))),
   // requestLevelSummaryVar: json["request_level_summary_var"] == null ? null : LevelSummaryVar.fromMap(json["request_level_summary_var"]),
  );

  Map<String, dynamic> toMap() => {
    "client_ref_num": clientRefNum,
    "request_id": requestId,
    "txn_id": txnId,
    "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
    "duration_in_month": durationInMonth,
    "dg_report_version": dgReportVersion,
    "report_num": reportNum,
    "report_fetch_time": reportFetchTime?.toIso8601String(),
    "report_fetch_type": reportFetchType,
    "source_of_data": sourceOfData,
    "statement_start_date": "${statementStartDate!.year.toString().padLeft(4, '0')}-${statementStartDate!.month.toString().padLeft(2, '0')}-${statementStartDate!.day.toString().padLeft(2, '0')}",
    "statement_end_date": "${statementEndDate!.year.toString().padLeft(4, '0')}-${statementEndDate!.month.toString().padLeft(2, '0')}-${statementEndDate!.day.toString().padLeft(2, '0')}",
    "multiple_accounts_found": multipleAccountsFound,
    //"source_report": sourceReport,
    "banks": banks == null ? [] : List<dynamic>.from(banks!.map((x) => x.toMap())),
  //  "request_level_summary_var": requestLevelSummaryVar?.toMap(),
  };
}

@HiveType(typeId: 4)
class Bank {
  @HiveField(1)
  final String? bank;
  @HiveField(2)
  final int? digitapInstitutionId;
  @HiveField(3)
  final String? sourceBankId;
  @HiveField(4)
  final String? multipleAccountsFound;
  @HiveField(5)
  final List<Account>? accounts;
  // @HiveField(6)
  // final LevelSummaryVar? bankLevelSummaryVar;

  Bank({
    this.bank,
    this.digitapInstitutionId,
    this.sourceBankId,
    this.multipleAccountsFound,
    this.accounts,
    //this.bankLevelSummaryVar,
  });

  Bank copyWith({
    String? bank,
    int? digitapInstitutionId,
    String? sourceBankId,
    String? multipleAccountsFound,
    List<Account>? accounts,
    //LevelSummaryVar? bankLevelSummaryVar,
  }) =>
      Bank(
        bank: bank ?? this.bank,
        digitapInstitutionId: digitapInstitutionId ?? this.digitapInstitutionId,
        sourceBankId: sourceBankId ?? this.sourceBankId,
        multipleAccountsFound: multipleAccountsFound ?? this.multipleAccountsFound,
        accounts: accounts ?? this.accounts,
      //  bankLevelSummaryVar: bankLevelSummaryVar ?? this.bankLevelSummaryVar,
      );

  factory Bank.fromJson(String str) => Bank.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Bank.fromMap(Map<String, dynamic> json) => Bank(
    bank: json["bank"],
    digitapInstitutionId: json["digitap_institution_id"],
    sourceBankId: json["source_bank_id"],
    multipleAccountsFound: json["multiple_accounts_found"],
    accounts: json["accounts"] == null ? [] : List<Account>.from(json["accounts"]!.map((x) => Account.fromMap(x))),
   // bankLevelSummaryVar: json["bank_level_summary_var"] == null ? null : LevelSummaryVar.fromMap(json["bank_level_summary_var"]),
  );

  Map<String, dynamic> toMap() => {
    "bank": bank,
    "digitap_institution_id": digitapInstitutionId,
    "source_bank_id": sourceBankId,
    "multiple_accounts_found": multipleAccountsFound,
    "accounts": accounts == null ? [] : List<dynamic>.from(accounts!.map((x) => x.toMap())),
    //"bank_level_summary_var": bankLevelSummaryVar?.toMap(),
  };
}

@HiveType(typeId: 5)
class Account {
  @HiveField(1)
  final CustomerInfo? customerInfo;
  @HiveField(2)
  final String? location;
  @HiveField(3)
  final DateTime? openingDate;
  @HiveField(4)
  final String? currentBalance;
  @HiveField(5)
  final DateTime? balanceDateTime;
  @HiveField(6)
  final String? currentOdLimit;
  @HiveField(7)
  final String? drawingLimit;
  @HiveField(8)
  final String? currency;
  @HiveField(9)
  final String? exchgeRate;
  @HiveField(10)
  final String? accountStatus;
  @HiveField(11)
  final String? facility;
  @HiveField(12)
  final String? accountIfscCode;
  @HiveField(13)
  final String? micrCode;
  @HiveField(14)
  final String? accountNumber;
  @HiveField(15)
  final String? accountType;
  @HiveField(16)
  final String? accountDescription;
  @HiveField(17)
  final DateTime? transactionStartDate;
  @HiveField(18)
  final DateTime? transactionEndDate;
  @HiveField(19)
  final List<AccountTransaction>? transactions;
  @HiveField(20)
  final List<dynamic>? tamperDetectionDetails;
  @HiveField(21)
  final String? ifscCode;
  // @HiveField(23)
  // final AnalysisData? analysisData;
  // @HiveField(23)
  // final List<RawDatum>? rawData;
  // @HiveField(24)
  // final List<DailyOpenCloseBalance>? dailyOpenCloseBalances;
  //@HiveField(25)
  // final RecurrentCr? recurrentCr;
  // @HiveField(26)
  // final RecurrentDr? recurrentDr;
  // @HiveField(25)
  // final List<LoanAnalysis>? loanAnalysis;
  // @HiveField(26)
  // final List<FraudAnalysis>? fraudAnalysis;

  Account({
    this.customerInfo,
    this.location,
    this.openingDate,
    this.currentBalance,
    // this.pending,
    this.balanceDateTime,
    this.currentOdLimit,
    this.drawingLimit,
    this.currency,
    this.exchgeRate,
    this.accountStatus,
    this.facility,
    this.accountIfscCode,
    this.micrCode,
    this.accountNumber,
    this.accountType,
    this.accountDescription,
    this.transactionStartDate,
    this.transactionEndDate,
    this.transactions,
    this.tamperDetectionDetails,
    this.ifscCode,
    //this.analysisData,
    // this.rawData,
    // this.dailyOpenCloseBalances,
    // this.recurrentCr,
    // this.recurrentDr,
    // this.loanAnalysis,
    // this.fraudAnalysis,
  });

  Account copyWith({
    CustomerInfo? customerInfo,
    String? location,
    DateTime? openingDate,
    String? currentBalance,
    //Pending? pending,
    DateTime? balanceDateTime,
    String? currentOdLimit,
    String? drawingLimit,
    String? currency,
    String? exchgeRate,
    String? accountStatus,
    String? facility,
    String? accountIfscCode,
    String? micrCode,
    String? accountNumber,
    String? accountType,
    String? accountDescription,
    DateTime? transactionStartDate,
    DateTime? transactionEndDate,
    List<AccountTransaction>? transactions,
    List<dynamic>? tamperDetectionDetails,
    String? ifscCode,
    // AnalysisData? analysisData,
    // List<RawDatum>? rawData,
    // List<DailyOpenCloseBalance>? dailyOpenCloseBalances,
    // //RecurrentCr? recurrentCr,
    // //RecurrentDr? recurrentDr,
    // List<LoanAnalysis>? loanAnalysis,
    // List<FraudAnalysis>? fraudAnalysis,
  }) =>
      Account(
        customerInfo: customerInfo ?? this.customerInfo,
        location: location ?? this.location,
        openingDate: openingDate ?? this.openingDate,
        currentBalance: currentBalance ?? this.currentBalance,
        //pending: pending ?? this.pending,
        balanceDateTime: balanceDateTime ?? this.balanceDateTime,
        currentOdLimit: currentOdLimit ?? this.currentOdLimit,
        drawingLimit: drawingLimit ?? this.drawingLimit,
        currency: currency ?? this.currency,
        exchgeRate: exchgeRate ?? this.exchgeRate,
        accountStatus: accountStatus ?? this.accountStatus,
        facility: facility ?? this.facility,
        accountIfscCode: accountIfscCode ?? this.accountIfscCode,
        micrCode: micrCode ?? this.micrCode,
        accountNumber: accountNumber ?? this.accountNumber,
        accountType: accountType ?? this.accountType,
        accountDescription: accountDescription ?? this.accountDescription,
        transactionStartDate: transactionStartDate ?? this.transactionStartDate,
        transactionEndDate: transactionEndDate ?? this.transactionEndDate,
        transactions: transactions ?? this.transactions,
        tamperDetectionDetails: tamperDetectionDetails ?? this.tamperDetectionDetails,
        ifscCode: ifscCode ?? this.ifscCode,
        // analysisData: analysisData ?? this.analysisData,
        //rawData: rawData ?? this.rawData,
       // dailyOpenCloseBalances: dailyOpenCloseBalances ?? this.dailyOpenCloseBalances,
        // recurrentCr: recurrentCr ?? this.recurrentCr,
        // //  recurrentDr: recurrentDr ?? this.recurrentDr,
        // loanAnalysis: loanAnalysis ?? this.loanAnalysis,
        // fraudAnalysis: fraudAnalysis ?? this.fraudAnalysis,
      );

  factory Account.fromJson(String str) => Account.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Account.fromMap(Map<String, dynamic> json) => Account(
    customerInfo: json["customer_info"] == null ? null : CustomerInfo.fromMap(json["customer_info"]),
    location: json["location"],
    openingDate: json["opening_date"] == null ? null : DateTime.parse(json["opening_date"]),
    currentBalance: json["current_balance"],
    //pending: json["pending"] == null ? null : Pending.fromMap(json["pending"]),
    balanceDateTime: json["balance_date_time"] == null ? null : DateTime.parse(json["balance_date_time"]),
    currentOdLimit: json["current_od_Limit"],
    drawingLimit: json["drawing_limit"],
    currency: json["currency"],
    exchgeRate: json["exchge_rate"],
    accountStatus: json["account_status"],
    facility: json["facility"],
    accountIfscCode: json["ifsc_code"],
    micrCode: json["micr_code"],
    accountNumber: json["account_number"],
    accountType: json["account_type"],
    accountDescription: json["account_description"],
    transactionStartDate: json["transaction_start_date"] == null ? null : DateTime.parse(json["transaction_start_date"]),
    transactionEndDate: json["transaction_end_date"] == null ? null : DateTime.parse(json["transaction_end_date"]),
    transactions: json["transactions"] == null ? [] : List<AccountTransaction>.from(json["transactions"]!.map((x) => AccountTransaction.fromMap(x))),
    tamperDetectionDetails: json["tamper_detection_details"] == null ? [] : List<dynamic>.from(json["tamper_detection_details"]!.map((x) => x)),
    ifscCode: json["ifscCode"],
    //analysisData: json["analysis_data"] == null ? null : AnalysisData.fromMap(json["analysis_data"]),
    //rawData: json["raw_data"] == null ? [] : List<RawDatum>.from(json["raw_data"]!.map((x) => RawDatum.fromMap(x))),
   // dailyOpenCloseBalances: json["daily_open_close_balances"] == null ? [] : List<DailyOpenCloseBalance>.from(json["daily_open_close_balances"]!.map((x) => DailyOpenCloseBalance.fromMap(x))),
    // recurrentCr: json["recurrent_cr"] == null ? null : RecurrentCr.fromMap(json["recurrent_cr"]),
    // recurrentDr: json["recurrent_dr"] == null ? null : RecurrentDr.fromMap(json["recurrent_dr"]),
   // loanAnalysis: json["loan_analysis"] == null ? [] : List<LoanAnalysis>.from(json["loan_analysis"]!.map((x) => LoanAnalysis.fromMap(x))),
    //fraudAnalysis: json["fraud_analysis"] == null ? [] : List<FraudAnalysis>.from(json["fraud_analysis"]!.map((x) => FraudAnalysis.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "customer_info": customerInfo?.toMap(),
    "location": location,
    "opening_date": "${openingDate!.year.toString().padLeft(4, '0')}-${openingDate!.month.toString().padLeft(2, '0')}-${openingDate!.day.toString().padLeft(2, '0')}",
    "current_balance": currentBalance,
    //"pending": pending?.toMap(),
    "balance_date_time": balanceDateTime?.toIso8601String(),
    "current_od_Limit": currentOdLimit,
    "drawing_limit": drawingLimit,
    "currency": currency,
    "exchge_rate": exchgeRate,
    "account_status": accountStatus,
    "facility": facility,
    "ifsc_code": accountIfscCode,
    "micr_code": micrCode,
    "account_number": accountNumber,
    "account_type": accountType,
    "account_description": accountDescription,
    "transaction_start_date": "${transactionStartDate!.year.toString().padLeft(4, '0')}-${transactionStartDate!.month.toString().padLeft(2, '0')}-${transactionStartDate!.day.toString().padLeft(2, '0')}",
    "transaction_end_date": "${transactionEndDate!.year.toString().padLeft(4, '0')}-${transactionEndDate!.month.toString().padLeft(2, '0')}-${transactionEndDate!.day.toString().padLeft(2, '0')}",
    "transactions": transactions == null ? [] : List<dynamic>.from(transactions!.map((x) => x.toMap())),
    "tamper_detection_details": tamperDetectionDetails == null ? [] : List<dynamic>.from(tamperDetectionDetails!.map((x) => x)),
    "ifscCode": ifscCode,
    //"analysis_data": analysisData?.toMap(),
    //"raw_data": rawData == null ? [] : List<dynamic>.from(rawData!.map((x) => x.toMap())),
    //"daily_open_close_balances": dailyOpenCloseBalances == null ? [] : List<dynamic>.from(dailyOpenCloseBalances!.map((x) => x.toMap())),
    //"recurrent_cr": recurrentCr?.toMap(),
    //"recurrent_dr": recurrentDr?.toMap(),
  //  "loan_analysis": loanAnalysis == null ? [] : List<dynamic>.from(loanAnalysis!.map((x) => x.toMap())),
   // "fraud_analysis": fraudAnalysis == null ? [] : List<dynamic>.from(fraudAnalysis!.map((x) => x.toMap())),
  };
}

@HiveType(typeId: 6)
class CustomerInfo {
  @HiveField(1)
  final String? holdingType;
  @HiveField(2)
  final List<Holder>? holders;

  CustomerInfo({
    this.holdingType,
    this.holders,
  });

  CustomerInfo copyWith({
    String? holdingType,
    List<Holder>? holders,
  }) =>
      CustomerInfo(
        holdingType: holdingType ?? this.holdingType,
        holders: holders ?? this.holders,
      );

  factory CustomerInfo.fromJson(String str) => CustomerInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CustomerInfo.fromMap(Map<String, dynamic> json) => CustomerInfo(
    holdingType: json["holding_type"],
    holders: json["holders"] == null ? [] : List<Holder>.from(json["holders"]!.map((x) => Holder.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "holding_type": holdingType,
    "holders": holders == null ? [] : List<dynamic>.from(holders!.map((x) => x.toMap())),
  };
}

@HiveType(typeId: 7)
class Holder {
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? email;
  @HiveField(3)
  final String? contactNumber;
  @HiveField(4)
  final String? address;
  @HiveField(5)
  final String? pan;
  @HiveField(6)
  final String? ckycCompliance;
  @HiveField(7)
  final DateTime? dob;
  @HiveField(8)
  final String? landline;
  @HiveField(9)
  final String? nominee;

  Holder({
    this.name,
    this.email,
    this.contactNumber,
    this.address,
    this.pan,
    this.ckycCompliance,
    this.dob,
    this.landline,
    this.nominee,
  });

  Holder copyWith({
    String? name,
    String? email,
    String? contactNumber,
    String? address,
    String? pan,
    String? ckycCompliance,
    DateTime? dob,
    String? landline,
    String? nominee,
  }) =>
      Holder(
        name: name ?? this.name,
        email: email ?? this.email,
        contactNumber: contactNumber ?? this.contactNumber,
        address: address ?? this.address,
        pan: pan ?? this.pan,
        ckycCompliance: ckycCompliance ?? this.ckycCompliance,
        dob: dob ?? this.dob,
        landline: landline ?? this.landline,
        nominee: nominee ?? this.nominee,
      );

  factory Holder.fromJson(String str) => Holder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Holder.fromMap(Map<String, dynamic> json) => Holder(
    name: json["name"],
    email: json["email"],
    contactNumber: json["contact_number"],
    address: json["address"],
    pan: json["pan"],
    ckycCompliance: json["ckyc_compliance"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    landline: json["landline"],
    nominee: json["nominee"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "email": email,
    "contact_number": contactNumber,
    "address": address,
    "pan": pan,
    "ckyc_compliance": ckycCompliance,
    "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
    "landline": landline,
    "nominee": nominee,
  };
}

@HiveType(typeId: 8)
class AccountTransaction {
  @HiveField(1)
  final dynamic amount;
  @HiveField(2)
  final String? balance;
  @HiveField(3)
  final String? chequeNum;
  @HiveField(4)
  final DateTime? date;
  @HiveField(5)
  final String? modeFromSource;
  @HiveField(6)
  final String? narration;
  @HiveField(7)
  final String? reference;
  @HiveField(8)
  final String? transactionId;
  @HiveField(9)
  final DateTime? transactionTimestamp;
  @HiveField(10)
  final String? category;
  @HiveField(11)
  final String? subCategory;

  AccountTransaction({
    this.amount,
    this.balance,
    this.chequeNum,
    this.date,
    this.modeFromSource,
    this.narration,
    this.reference,
    this.transactionId,
    this.transactionTimestamp,
    this.category,
    this.subCategory,
  });

  AccountTransaction copyWith({
    dynamic amount,
    String? balance,
    String? chequeNum,
    DateTime? date,
    String? modeFromSource,
    String? narration,
    String? reference,
    String? transactionId,
    DateTime? transactionTimestamp,
    String? category,
    String? subCategory,
  }) =>
      AccountTransaction(
        amount: amount ?? this.amount,
        balance: balance ?? this.balance,
        chequeNum: chequeNum ?? this.chequeNum,
        date: date ?? this.date,
        modeFromSource: modeFromSource ?? this.modeFromSource,
        narration: narration ?? this.narration,
        reference: reference ?? this.reference,
        transactionId: transactionId ?? this.transactionId,
        transactionTimestamp: transactionTimestamp ?? this.transactionTimestamp,
        category: category ?? this.category,
        subCategory: subCategory ?? this.subCategory,
      );

  factory AccountTransaction.fromJson(String str) => AccountTransaction.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AccountTransaction.fromMap(Map<String, dynamic> json) => AccountTransaction(
    amount: json["amount"]?.toDouble(),
    balance: json["balance"],
    chequeNum: json["cheque_num"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    modeFromSource: json["mode_from_source"],
    narration: json["narration"],
    reference: json["reference"],
    transactionId: json["transaction_id"],
    transactionTimestamp: json["transaction_timestamp"] == null ? null : DateTime.parse(json["transaction_timestamp"]),
    category: json["category"],
    subCategory: json["sub_category"],
  );

  Map<String, dynamic> toMap() => {
    "amount": amount,
    "balance": balance,
    "cheque_num": chequeNum,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "mode_from_source": modeFromSource,
    "narration": narration,
    "reference": reference,
    "transaction_id": transactionId,
    "transaction_timestamp": transactionTimestamp?.toIso8601String(),
    "category": category,
    "sub_category": subCategory,
  };
}
