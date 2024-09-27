// // To parse this JSON data, do
// //
// //     final reportSummaryModel = reportSummaryModelFromJson(jsonString);

// import 'dart:convert';

// ReportSummaryModel reportSummaryModelFromJson(String str) =>
//     ReportSummaryModel.fromJson(json.decode(str));

// String reportSummaryModelToJson(ReportSummaryModel data) =>
//     json.encode(data.toJson());

// class ReportSummaryModel {
//   bool? success;
//   ReportData? reportData;

//   ReportSummaryModel({
//     this.success,
//     this.reportData,
//   });

//   factory ReportSummaryModel.fromJson(Map<String, dynamic> json) =>
//       ReportSummaryModel(
//         success: json["success"],
//         reportData: json["reportData"] == null
//             ? null
//             : ReportData.fromJson(json["reportData"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "reportData": reportData?.toJson(),
//       };
// }

// class ReportData {
//   String? clientRefNum;
//   num? requestId;
//   String? txnId;
//   DateTime? startDate;
//   DateTime? endDate;
//   num? durationInMonth;
//   String? dgReportVersion;
//   num? reportNum;
//   DateTime? reportFetchTime;
//   String? reportFetchType;
//   String? sourceOfData;
//   DateTime? statementStartDate;
//   DateTime? statementEndDate;
//   String? multipleAccountsFound;
//   String? sourceReport;
//   List<Bank>? banks;
//   Map<String, double>? requestLevelSummaryVar;

//   ReportData({
//     this.clientRefNum,
//     this.requestId,
//     this.txnId,
//     this.startDate,
//     this.endDate,
//     this.durationInMonth,
//     this.dgReportVersion,
//     this.reportNum,
//     this.reportFetchTime,
//     this.reportFetchType,
//     this.sourceOfData,
//     this.statementStartDate,
//     this.statementEndDate,
//     this.multipleAccountsFound,
//     this.sourceReport,
//     this.banks,
//     this.requestLevelSummaryVar,
//   });

//   factory ReportData.fromJson(Map<String, dynamic> json) => ReportData(
//         clientRefNum: json["client_ref_num"] ?? '',
//         requestId: json["request_id"] ?? 0,
//         txnId: json["txn_id"] ?? '',
//         startDate: json["start_date"] == null
//             ? null
//             : DateTime.parse(json["start_date"]),
//         endDate:
//             json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
//         durationInMonth: json["duration_in_month"] ?? 0,
//         dgReportVersion: json["dg_report_version"] ?? '',
//         reportNum: json["report_num"] ?? 0,
//         reportFetchTime: json["report_fetch_time"] == null
//             ? null
//             : DateTime.parse(json["report_fetch_time"]),
//         reportFetchType: json["report_fetch_type"] ?? '',
//         sourceOfData: json["source_of_data"] ?? '',
//         statementStartDate: json["statement_start_date"] == null
//             ? null
//             : DateTime.parse(json["statement_start_date"]),
//         statementEndDate: json["statement_end_date"] == null
//             ? null
//             : DateTime.parse(json["statement_end_date"]),
//         multipleAccountsFound: json["multiple_accounts_found"] ?? '',
//         sourceReport: json["source_report"] ?? '',
//         banks: json["banks"] == null
//             ? []
//             : List<Bank>.from(json["banks"]!.map((x) => Bank.fromJson(x))),
//         requestLevelSummaryVar: Map.from(json["request_level_summary_var"])
//             .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
//       );

//   Map<String, dynamic> toJson() => {
//         "client_ref_num": clientRefNum,
//         "request_id": requestId,
//         "txn_id": txnId,
//         "start_date":
//             "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
//         "end_date":
//             "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
//         "duration_in_month": durationInMonth,
//         "dg_report_version": dgReportVersion,
//         "report_num": reportNum,
//         "report_fetch_time": reportFetchTime?.toIso8601String(),
//         "report_fetch_type": reportFetchType,
//         "source_of_data": sourceOfData,
//         "statement_start_date":
//             "${statementStartDate!.year.toString().padLeft(4, '0')}-${statementStartDate!.month.toString().padLeft(2, '0')}-${statementStartDate!.day.toString().padLeft(2, '0')}",
//         "statement_end_date":
//             "${statementEndDate!.year.toString().padLeft(4, '0')}-${statementEndDate!.month.toString().padLeft(2, '0')}-${statementEndDate!.day.toString().padLeft(2, '0')}",
//         "multiple_accounts_found": multipleAccountsFound,
//         "source_report": sourceReport,
//         "banks": banks == null
//             ? []
//             : List<dynamic>.from(banks!.map((x) => x.toJson())),
//         "request_level_summary_var": Map.from(requestLevelSummaryVar ?? {})
//             .map((k, v) => MapEntry<String, dynamic>(k, v)),
//       };
// }

// class Bank {
//   String? bank;
//   num? digitapInstitutionId;
//   String? sourceBankId;
//   String? multipleAccountsFound;
//   List<Account>? accounts;
//   Map<String, double>? bankLevelSummaryVar;

//   Bank({
//     this.bank,
//     this.digitapInstitutionId,
//     this.sourceBankId,
//     this.multipleAccountsFound,
//     this.accounts,
//     this.bankLevelSummaryVar,
//   });

//   factory Bank.fromJson(Map<String, dynamic> json) => Bank(
//         bank: json["bank"] ?? '',
//         digitapInstitutionId: json["digitap_institution_id"] ?? 0,
//         sourceBankId: json["source_bank_id"] ?? '',
//         multipleAccountsFound: json["multiple_accounts_found"] ?? '',
//         accounts: json["accounts"] == null
//             ? []
//             : List<Account>.from(
//                 json["accounts"].map((x) => Account.fromJson(x))),
//         bankLevelSummaryVar: Map.from(json["bank_level_summary_var"])
//             .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
//       );

//   Map<String, dynamic> toJson() => {
//         "bank": bank,
//         "digitap_institution_id": digitapInstitutionId,
//         "source_bank_id": sourceBankId,
//         "multiple_accounts_found": multipleAccountsFound,
//         "accounts": accounts == null
//             ? []
//             : List<dynamic>.from(accounts!.map((x) => x.toJson())),
//         "bank_level_summary_var": Map.from(bankLevelSummaryVar ?? {})
//             .map((k, v) => MapEntry<String, dynamic>(k, v)),
//       };
// }

// class Account {
//   CustomerInfo? customerInfo;
//   String? location;
//   String? openingDate;
//   String? currentBalance;
//   Pending? pending;
//   String? balanceDateTime;
//   String? currentOdLimit;
//   String? drawingLimit;
//   String? currency;
//   String? exchgeRate;
//   String? accountStatus;
//   String? facility;
//   String? accountIfscCode;
//   String? micrCode;
//   String? accountNumber;
//   String? accountType;
//   String? accountDescription;
//   DateTime? transactionStartDate;
//   DateTime? transactionEndDate;
//   List<AccountTransaction>? transactions;
//   List<dynamic>? tamperDetectionDetails;
//   String? ifscCode;
//   AnalysisData? analysisData;
//   List<RawDatum>? rawData;
//   List<DailyOpenCloseBalance>? dailyOpenCloseBalances;
//   RecurrentCr? recurrentCr;
//   RecurrentDr? recurrentDr;
//   List<dynamic>? loanAnalysis;
//   List<FraudAnalysis>? fraudAnalysis;

//   Account({
//     this.customerInfo,
//     this.location,
//     this.openingDate,
//     this.currentBalance,
//     this.pending,
//     this.balanceDateTime,
//     this.currentOdLimit,
//     this.drawingLimit,
//     this.currency,
//     this.exchgeRate,
//     this.accountStatus,
//     this.facility,
//     this.accountIfscCode,
//     this.micrCode,
//     this.accountNumber,
//     this.accountType,
//     this.accountDescription,
//     this.transactionStartDate,
//     this.transactionEndDate,
//     this.transactions,
//     this.tamperDetectionDetails,
//     this.ifscCode,
//     this.analysisData,
//     this.rawData,
//     this.dailyOpenCloseBalances,
//     this.recurrentCr,
//     this.recurrentDr,
//     this.loanAnalysis,
//     this.fraudAnalysis,
//   });

//   factory Account.fromJson(Map<String, dynamic> json) => Account(
//         customerInfo: json["customer_info"] == null
//             ? null
//             : CustomerInfo.fromJson(json["customer_info"]),
//         location: json["location"] ?? "",
//         openingDate: json["opening_date"] ?? '',
//         currentBalance: json["current_balance"] ?? "",
//         pending:
//             json["pending"] == null ? null : Pending.fromJson(json["pending"]),
//         balanceDateTime: json["balance_date_time"] ?? "",
//         currentOdLimit: json["current_od_Limit"] ?? "",
//         drawingLimit: json["drawing_limit"] ?? '',
//         currency: json["currency"] ?? "",
//         exchgeRate: json["exchge_rate"] ?? "",
//         accountStatus: json["account_status"] ?? "",
//         facility: json["facility"] ?? "",
//         accountIfscCode: json["ifsc_code"] ?? "",
//         micrCode: json["micr_code"] ?? "",
//         accountNumber: json["account_number"] ?? "",
//         accountType: json["account_type"] ?? "",
//         accountDescription: json["account_description"] ?? "",
//         transactionStartDate: json["transaction_start_date"] == null
//             ? null
//             : DateTime.parse(json["transaction_start_date"]),
//         transactionEndDate: json["transaction_end_date"] == null
//             ? null
//             : DateTime.parse(json["transaction_end_date"]),
//         transactions: json["transactions"] == null
//             ? []
//             : List<AccountTransaction>.from(json["transactions"]
//                 .map((x) => AccountTransaction.fromJson(x))),
//         tamperDetectionDetails: json["tamper_detection_details"] == null
//             ? []
//             : List<dynamic>.from(
//                 json["tamper_detection_details"].map((x) => x)),
//         ifscCode: json["ifscCode"],
//         analysisData: json["analysis_data"] == null
//             ? null
//             : AnalysisData.fromJson(json["analysis_data"]),
//         rawData: json["raw_data"] == null
//             ? []
//             : List<RawDatum>.from(
//                 json["raw_data"].map((x) => RawDatum.fromJson(x))),
//         dailyOpenCloseBalances: json["daily_open_close_balances"] == null
//             ? []
//             : List<DailyOpenCloseBalance>.from(json["daily_open_close_balances"]
//                 .map((x) => DailyOpenCloseBalance.fromJson(x))),
//         recurrentCr: json["recurrent_cr"] == null
//             ? null
//             : RecurrentCr.fromJson(json["recurrent_cr"]),
//         recurrentDr: json["recurrent_dr"] == null
//             ? null
//             : RecurrentDr.fromJson(json["recurrent_dr"]),
//         loanAnalysis: json["loan_analysis"] == null
//             ? []
//             : List<dynamic>.from(json["loan_analysis"].map((x) => x)),
//         fraudAnalysis: json["fraud_analysis"] == null
//             ? []
//             : List<FraudAnalysis>.from(
//                 json["fraud_analysis"].map((x) => FraudAnalysis.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "customer_info": customerInfo?.toJson(),
//         "location": location,
//         "opening_date": openingDate,
//         "current_balance": currentBalance,
//         "pending": pending?.toJson(),
//         "balance_date_time": balanceDateTime,
//         "current_od_Limit": currentOdLimit,
//         "drawing_limit": drawingLimit,
//         "currency": currency,
//         "exchge_rate": exchgeRate,
//         "account_status": accountStatus,
//         "facility": facility,
//         "ifsc_code": accountIfscCode,
//         "micr_code": micrCode,
//         "account_number": accountNumber,
//         "account_type": accountType,
//         "account_description": accountDescription,
//         "transaction_start_date":
//             "${transactionStartDate!.year.toString().padLeft(4, '0')}-${transactionStartDate!.month.toString().padLeft(2, '0')}-${transactionStartDate!.day.toString().padLeft(2, '0')}",
//         "transaction_end_date":
//             "${transactionEndDate!.year.toString().padLeft(4, '0')}-${transactionEndDate!.month.toString().padLeft(2, '0')}-${transactionEndDate!.day.toString().padLeft(2, '0')}",
//         "transactions": transactions == null
//             ? []
//             : List<dynamic>.from(transactions!.map((x) => x.toJson())),
//         "tamper_detection_details": tamperDetectionDetails == null
//             ? []
//             : List<dynamic>.from(tamperDetectionDetails!.map((x) => x)),
//         "ifscCode": ifscCode,
//         "analysis_data": analysisData?.toJson(),
//         "raw_data": rawData == null
//             ? []
//             : List<dynamic>.from(rawData!.map((x) => x.toJson())),
//         "daily_open_close_balances": dailyOpenCloseBalances == null
//             ? []
//             : List<dynamic>.from(
//                 dailyOpenCloseBalances!.map((x) => x.toJson())),
//         "recurrent_cr": recurrentCr?.toJson(),
//         "recurrent_dr": recurrentDr?.toJson(),
//         "loan_analysis": loanAnalysis == null
//             ? []
//             : List<dynamic>.from(loanAnalysis!.map((x) => x)),
//         "fraud_analysis": fraudAnalysis == null
//             ? []
//             : List<dynamic>.from(fraudAnalysis!.map((x) => x.toJson())),
//       };
// }

// class AnalysisData {
//   April2024? april2024;
//   August2024? may2024;
//   August2024? june2024;
//   August2024? july2024;
//   August2024? august2024;
//   August2024? september2024;
//   Overall? overall;
//   OverallMax? overallMaxSum;
//   OverallMax? overallMaxAverage;

//   AnalysisData({
//     this.april2024,
//     this.may2024,
//     this.june2024,
//     this.july2024,
//     this.august2024,
//     this.september2024,
//     this.overall,
//     this.overallMaxSum,
//     this.overallMaxAverage,
//   });

//   factory AnalysisData.fromJson(Map<String, dynamic> json) => AnalysisData(
//         april2024: json["April 2024*"] == null
//             ? null
//             : April2024.fromJson(json["April 2024*"]),
//         may2024: json["May 2024"] == null
//             ? null
//             : August2024.fromJson(json["May 2024"]),
//         june2024: json["June 2024"] == null
//             ? null
//             : August2024.fromJson(json["June 2024"]),
//         july2024: json["July 2024"] == null
//             ? null
//             : August2024.fromJson(json["July 2024"]),
//         august2024: json["August 2024"] == null
//             ? null
//             : August2024.fromJson(json["August 2024"]),
//         september2024: json["September 2024*"] == null
//             ? null
//             : August2024.fromJson(json["September 2024*"]),
//         overall:
//             json["Overall"] == null ? null : Overall.fromJson(json["Overall"]),
//         overallMaxSum: json["Overall_max_sum"] == null
//             ? null
//             : OverallMax.fromJson(json["Overall_max_sum"]),
//         overallMaxAverage: json["Overall_max_average"] == null
//             ? null
//             : OverallMax.fromJson(json["Overall_max_average"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "April 2024*": april2024?.toJson(),
//         "May 2024": may2024?.toJson(),
//         "June 2024": june2024?.toJson(),
//         "July 2024": july2024?.toJson(),
//         "August 2024": august2024?.toJson(),
//         "September 2024*": september2024?.toJson(),
//         "Overall": overall?.toJson(),
//         "Overall_max_sum": overallMaxSum?.toJson(),
//         "Overall_max_average": overallMaxAverage?.toJson(),
//       };
// }

// class April2024 {
//   num? minOpeningBalance;
//   num? maxOpeningBalance;
//   num? minBalance;
//   String? medianBalance;
//   num? maxBalance;
//   num? firstDayEodBalance;
//   num? lastDayEodBalance;
//   num? opening;
//   num? closingBalance;
//   num? minEodBalance;
//   num? maxEodBalance;
//   num? medianEodBalance;
//   num? totalNoOfSalaryCredits;
//   num? totalAmountOfSalaryCredits;
//   num? totalNoOfCreditTransactions;
//   num? totalAmountOfCreditTransactions;
//   num? totalNoOfBusinessCreditTransactions;
//   num? totalAmountOfBusinessCreditTransactions;
//   num? totalNoOfDebitTransactions;
//   num? totalAmountOfDebitTransactions;
//   num? totalNoOfCashDeposits;
//   num? totalAmountOfCashDeposits;
//   num? totalNoOfCashWithdrawals;
//   num? chqDeposits;
//   num? totalNoOfChequeDeposits;
//   num? chqIssues;
//   num? totalNoOfChequeIssues;
//   num? totalChqDeposits;
//   num? totalAmountOfChequeDeposits;
//   num? totalChqIssues;
//   num? totalAmountOfChequeIssues;
//   num? noOfEmiLoanPayments;
//   num? totalNoOfEmiLoanPayments;
//   num? totalNoOfIWBounced;
//   num? sumOfIWBounced;
//   num? totalAmountOfIWBounced;
//   num? totalNumberOfOutwardChequeBounces;
//   num? noOfTransactionsInBs;
//   num? totalLoanDisbursal;
//   num? totalAmountOfLoanDisbursal;
//   num? loanDisbursal;
//   num? april2024LoanDisbursal;
//   num? totalNoOfLoanDisbursal;
//   num? april2024TotalNoOfIWChqBounced;
//   num? totalNoOfIWChqBounced;
//   num? inwChqBounceNonTechnical;
//   num? totalNoOfIWChequeBounceNonTechnical;
//   num? totalInwChqBounceNonTechnical;
//   num? totalAmountOfIWChequeBounceNonTechnical;
//   num? salaryCount;
//   DateTime? april2024StartDate;
//   DateTime? startDate;
//   String? isCompleteMonthTxn;
//   num? averageEodBalance;
//   String? foir;
//   List<dynamic>? employerName;
//   String? avgBalanceTill10ThOfMonth;
//   String? avgBalanceTill20ThOfMonth;
//   num? avgBalanceTillLastDateOfMonth;
//   double? abbOn114LastDay;
//   double? abbOn1St14Th30ThLastDay;
//   num? totalNoOfNetCreditTransactions;
//   num? totalNetCreditAmount;
//   num? totalNoOfNetDebitTransactions;
//   num? totalNetDebitAmount;
//   num? totalNoOfCreditCardPayment;
//   num? totalNoOfBillsUtilities;
//   num? totalNoOfFood;
//   num? totalNoOfAlcohol;
//   num? totalNoOfTravel;
//   num? totalNoOfEntertainmentLifestyle;
//   num? totalNoOfShoppingPurchase;
//   num? totalNoOfInvestmentExpense;
//   num? totalNoOfGaming;
//   num? totalNoOfPersonalLoan;
//   num? totalNoOfHomeLoan;
//   num? totalNoOfAutoLoan;
//   num? totalNoOfInsurance;
//   num? totalNoOfTaxTransactionDebit;
//   num? totalNoOfTransferToWalletTransaction;
//   num? totalNoOfReversalTransactionDebit;
//   num? totalNoOfMedicalTransaction;
//   num? totalNoOfChargesTransaction;
//   num? totalNoOfBelowMinimumBalanceTransaction;
//   num? totalNoOfSalaryPaidTransaction;
//   num? totalNoOfTransferOutTransaction;
//   num? totalNoOfForeignWalletTransaction;
//   num? totalNoOfOtherCategoryDebitTransaction;
//   num? totalAmountOfBillsUtilities;
//   num? totalAmountOfFood;
//   num? totalAmountOfAlcohol;
//   num? totalAmountOfPersonalLoan;
//   num? totalAmountOfHomeLoan;
//   num? totalAmountOfAutoLoan;
//   num? totalAmountOfTravel;
//   num? totalAmountOfEntertainmentLifestyle;
//   num? totalAmountOfShoppingPurchase;
//   num? totalAmountOfInvestmentExpense;
//   num? totalAmountOfInsurance;
//   num? totalAmountOfTaxTransactionDebit;
//   num? totalAmountOfGaming;
//   num? totalAmountOfTransferToWalletTransaction;
//   num? totalAmountOfReversalTransactionDebit;
//   num? totalAmountOfCreditCardPayment;
//   num? totalAmountOfCashWithdrawals;
//   num? totalAmountOfMedicalTransaction;
//   num? totalAmountOfChargesTransaction;
//   num? totalAmountOfBelowMinimumBalanceTransaction;
//   num? totalAmountOfSalaryPaidTransaction;
//   num? totalAmountOfTransferOutTransaction;
//   num? totalAmountOfForeignWalletTransaction;
//   num? totalAmountOfEmiLoanPayments;
//   num? totalAmountOfOtherCategoryDebitTransaction;
//   String? totalNoOfMutualFunds;
//   String? totalDebitAmountOfMutualFunds;
//   String? totalExpenseOnCryptoCurrency;
//   String? totalExpenseOnShareMarket;
//   String? totalNoOfGasBillPayments;
//   String? totalAmountOfGasBillPayments;
//   String? totalNoOfElectricityBillPayments;
//   String? totalNoOfMobileBroadbandBillPayments;
//   String? totalAmountOfMobileBroadbandBillPayments;
//   String? totalAmountOfElectricityBillPayments;
//   String? totalNoOfDividend;
//   String? totalAmountOfDividend;

//   April2024({
//     this.minOpeningBalance,
//     this.maxOpeningBalance,
//     this.minBalance,
//     this.medianBalance,
//     this.maxBalance,
//     this.firstDayEodBalance,
//     this.lastDayEodBalance,
//     this.opening,
//     this.closingBalance,
//     this.minEodBalance,
//     this.maxEodBalance,
//     this.medianEodBalance,
//     this.totalNoOfSalaryCredits,
//     this.totalAmountOfSalaryCredits,
//     this.totalNoOfCreditTransactions,
//     this.totalAmountOfCreditTransactions,
//     this.totalNoOfBusinessCreditTransactions,
//     this.totalAmountOfBusinessCreditTransactions,
//     this.totalNoOfDebitTransactions,
//     this.totalAmountOfDebitTransactions,
//     this.totalNoOfCashDeposits,
//     this.totalAmountOfCashDeposits,
//     this.totalNoOfCashWithdrawals,
//     this.chqDeposits,
//     this.totalNoOfChequeDeposits,
//     this.chqIssues,
//     this.totalNoOfChequeIssues,
//     this.totalChqDeposits,
//     this.totalAmountOfChequeDeposits,
//     this.totalChqIssues,
//     this.totalAmountOfChequeIssues,
//     this.noOfEmiLoanPayments,
//     this.totalNoOfEmiLoanPayments,
//     this.totalNoOfIWBounced,
//     this.sumOfIWBounced,
//     this.totalAmountOfIWBounced,
//     this.totalNumberOfOutwardChequeBounces,
//     this.noOfTransactionsInBs,
//     this.totalLoanDisbursal,
//     this.totalAmountOfLoanDisbursal,
//     this.loanDisbursal,
//     this.april2024LoanDisbursal,
//     this.totalNoOfLoanDisbursal,
//     this.april2024TotalNoOfIWChqBounced,
//     this.totalNoOfIWChqBounced,
//     this.inwChqBounceNonTechnical,
//     this.totalNoOfIWChequeBounceNonTechnical,
//     this.totalInwChqBounceNonTechnical,
//     this.totalAmountOfIWChequeBounceNonTechnical,
//     this.salaryCount,
//     this.april2024StartDate,
//     this.startDate,
//     this.isCompleteMonthTxn,
//     this.averageEodBalance,
//     this.foir,
//     this.employerName,
//     this.avgBalanceTill10ThOfMonth,
//     this.avgBalanceTill20ThOfMonth,
//     this.avgBalanceTillLastDateOfMonth,
//     this.abbOn114LastDay,
//     this.abbOn1St14Th30ThLastDay,
//     this.totalNoOfNetCreditTransactions,
//     this.totalNetCreditAmount,
//     this.totalNoOfNetDebitTransactions,
//     this.totalNetDebitAmount,
//     this.totalNoOfCreditCardPayment,
//     this.totalNoOfBillsUtilities,
//     this.totalNoOfFood,
//     this.totalNoOfAlcohol,
//     this.totalNoOfTravel,
//     this.totalNoOfEntertainmentLifestyle,
//     this.totalNoOfShoppingPurchase,
//     this.totalNoOfInvestmentExpense,
//     this.totalNoOfGaming,
//     this.totalNoOfPersonalLoan,
//     this.totalNoOfHomeLoan,
//     this.totalNoOfAutoLoan,
//     this.totalNoOfInsurance,
//     this.totalNoOfTaxTransactionDebit,
//     this.totalNoOfTransferToWalletTransaction,
//     this.totalNoOfReversalTransactionDebit,
//     this.totalNoOfMedicalTransaction,
//     this.totalNoOfChargesTransaction,
//     this.totalNoOfBelowMinimumBalanceTransaction,
//     this.totalNoOfSalaryPaidTransaction,
//     this.totalNoOfTransferOutTransaction,
//     this.totalNoOfForeignWalletTransaction,
//     this.totalNoOfOtherCategoryDebitTransaction,
//     this.totalAmountOfBillsUtilities,
//     this.totalAmountOfFood,
//     this.totalAmountOfAlcohol,
//     this.totalAmountOfPersonalLoan,
//     this.totalAmountOfHomeLoan,
//     this.totalAmountOfAutoLoan,
//     this.totalAmountOfTravel,
//     this.totalAmountOfEntertainmentLifestyle,
//     this.totalAmountOfShoppingPurchase,
//     this.totalAmountOfInvestmentExpense,
//     this.totalAmountOfInsurance,
//     this.totalAmountOfTaxTransactionDebit,
//     this.totalAmountOfGaming,
//     this.totalAmountOfTransferToWalletTransaction,
//     this.totalAmountOfReversalTransactionDebit,
//     this.totalAmountOfCreditCardPayment,
//     this.totalAmountOfCashWithdrawals,
//     this.totalAmountOfMedicalTransaction,
//     this.totalAmountOfChargesTransaction,
//     this.totalAmountOfBelowMinimumBalanceTransaction,
//     this.totalAmountOfSalaryPaidTransaction,
//     this.totalAmountOfTransferOutTransaction,
//     this.totalAmountOfForeignWalletTransaction,
//     this.totalAmountOfEmiLoanPayments,
//     this.totalAmountOfOtherCategoryDebitTransaction,
//     this.totalNoOfMutualFunds,
//     this.totalDebitAmountOfMutualFunds,
//     this.totalExpenseOnCryptoCurrency,
//     this.totalExpenseOnShareMarket,
//     this.totalNoOfGasBillPayments,
//     this.totalAmountOfGasBillPayments,
//     this.totalNoOfElectricityBillPayments,
//     this.totalNoOfMobileBroadbandBillPayments,
//     this.totalAmountOfMobileBroadbandBillPayments,
//     this.totalAmountOfElectricityBillPayments,
//     this.totalNoOfDividend,
//     this.totalAmountOfDividend,
//   });
//   factory April2024.fromJson(Map<String, dynamic> json) {
//     return April2024(
//       minOpeningBalance: json['minOpeningBalance'] as num?,
//       maxOpeningBalance: json['maxOpeningBalance'] as num?,
//       minBalance: json['minBalance'] as num?,
//       medianBalance: json['medianBalance'] as String?,
//       maxBalance: json['maxBalance'] as num?,
//       firstDayEodBalance: json['firstDayEodBalance'] as num?,
//       lastDayEodBalance: json['lastDayEodBalance'] as num?,
//       opening: json['opening'] as num?,
//       closingBalance: json['closingBalance'] as num?,
//       minEodBalance: json['minEodBalance'] as num?,
//       maxEodBalance: json['maxEodBalance'] as num?,
//       medianEodBalance: json['medianEodBalance'] as num?,
//       totalNoOfSalaryCredits: json['totalNoOfSalaryCredits'] as num?,
//       totalAmountOfSalaryCredits: json['totalAmountOfSalaryCredits'] as num?,
//       totalNoOfCreditTransactions: json['totalNoOfCreditTransactions'] as num?,
//       totalAmountOfCreditTransactions:
//           json['totalAmountOfCreditTransactions'] as num?,
//       totalNoOfBusinessCreditTransactions:
//           json['totalNoOfBusinessCreditTransactions'] as num?,
//       totalAmountOfBusinessCreditTransactions:
//           json['totalAmountOfBusinessCreditTransactions'] as num?,
//       totalNoOfDebitTransactions: json['totalNoOfDebitTransactions'] as num?,
//       totalAmountOfDebitTransactions:
//           json['totalAmountOfDebitTransactions'] as num?,
//       totalNoOfCashDeposits: json['totalNoOfCashDeposits'] as num?,
//       totalAmountOfCashDeposits: json['totalAmountOfCashDeposits'] as num?,
//       totalNoOfCashWithdrawals: json['totalNoOfCashWithdrawals'] as num?,
//       chqDeposits: json['chqDeposits'] as num?,
//       totalNoOfChequeDeposits: json['totalNoOfChequeDeposits'] as num?,
//       chqIssues: json['chqIssues'] as num?,
//       totalNoOfChequeIssues: json['totalNoOfChequeIssues'] as num?,
//       totalChqDeposits: json['totalChqDeposits'] as num?,
//       totalAmountOfChequeDeposits: json['totalAmountOfChequeDeposits'] as num?,
//       totalChqIssues: json['totalChqIssues'] as num?,
//       totalAmountOfChequeIssues: json['totalAmountOfChequeIssues'] as num?,
//       noOfEmiLoanPayments: json['noOfEmiLoanPayments'] as num?,
//       totalNoOfEmiLoanPayments: json['totalNoOfEmiLoanPayments'] as num?,
//       totalNoOfIWBounced: json['totalNoOfIWBounced'] as num?,
//       sumOfIWBounced: json['sumOfIWBounced'] as num?,
//       totalAmountOfIWBounced: json['totalAmountOfIWBounced'] as num?,
//       totalNumberOfOutwardChequeBounces:
//           json['totalNumberOfOutwardChequeBounces'] as num?,
//       noOfTransactionsInBs: json['noOfTransactionsInBs'] as num?,
//       totalLoanDisbursal: json['totalLoanDisbursal'] as num?,
//       totalAmountOfLoanDisbursal: json['totalAmountOfLoanDisbursal'] as num?,
//       loanDisbursal: json['loanDisbursal'] as num?,
//       april2024LoanDisbursal: json['april2024LoanDisbursal'] as num?,
//       totalNoOfLoanDisbursal: json['totalNoOfLoanDisbursal'] as num?,
//       april2024TotalNoOfIWChqBounced:
//           json['april2024TotalNoOfIWChqBounced'] as num?,
//       totalNoOfIWChqBounced: json['totalNoOfIWChqBounced'] as num?,
//       inwChqBounceNonTechnical: json['inwChqBounceNonTechnical'] as num?,
//       totalNoOfIWChequeBounceNonTechnical:
//           json['totalNoOfIWChequeBounceNonTechnical'] as num?,
//       totalInwChqBounceNonTechnical:
//           json['totalInwChqBounceNonTechnical'] as num?,
//       totalAmountOfIWChequeBounceNonTechnical:
//           json['totalAmountOfIWChequeBounceNonTechnical'] as num?,
//       salaryCount: json['salaryCount'] as num?,
//       april2024StartDate: json['april2024StartDate'] != null
//           ? DateTime.parse(json['april2024StartDate'])
//           : null,
//       startDate:
//           json['startDate'] != null ? DateTime.parse(json['startDate']) : null,
//       isCompleteMonthTxn: json['isCompleteMonthTxn'] as String?,
//       averageEodBalance: json['averageEodBalance'] as num?,
//       foir: json['foir'] as String?,
//       employerName: json["Employer Name"] == null
//           ? []
//           : List<dynamic>.from(json["Employer Name"]!.map((x) => x)),
//       avgBalanceTill10ThOfMonth: json['avgBalanceTill10ThOfMonth'] as String?,
//       avgBalanceTill20ThOfMonth: json['avgBalanceTill20ThOfMonth'] as String?,
//       avgBalanceTillLastDateOfMonth:
//           json['avgBalanceTillLastDateOfMonth'] as num?,
//       abbOn114LastDay: (json['abbOn114LastDay'] as num?)?.toDouble(),
//       abbOn1St14Th30ThLastDay:
//           (json['abbOn1St14Th30ThLastDay'] as num?)?.toDouble(),
//       totalNoOfNetCreditTransactions:
//           json['totalNoOfNetCreditTransactions'] as num?,
//       totalNetCreditAmount: json['totalNetCreditAmount'] as num?,
//       totalNoOfNetDebitTransactions:
//           json['totalNoOfNetDebitTransactions'] as num?,
//       totalNetDebitAmount: json['totalNetDebitAmount'] as num?,
//       totalNoOfCreditCardPayment: json['totalNoOfCreditCardPayment'] as num?,
//       totalNoOfBillsUtilities: json['totalNoOfBillsUtilities'] as num?,
//       totalNoOfFood: json['totalNoOfFood'] as num?,
//       totalNoOfAlcohol: json['totalNoOfAlcohol'] as num?,
//       totalNoOfTravel: json['totalNoOfTravel'] as num?,
//       totalNoOfEntertainmentLifestyle:
//           json['totalNoOfEntertainmentLifestyle'] as num?,
//       totalNoOfShoppingPurchase: json['totalNoOfShoppingPurchase'] as num?,
//       totalNoOfInvestmentExpense: json['totalNoOfInvestmentExpense'] as num?,
//       totalNoOfGaming: json['totalNoOfGaming'] as num?,
//       totalNoOfPersonalLoan: json['totalNoOfPersonalLoan'] as num?,
//       totalNoOfHomeLoan: json['totalNoOfHomeLoan'] as num?,
//       totalNoOfAutoLoan: json['totalNoOfAutoLoan'] as num?,
//       totalNoOfInsurance: json['totalNoOfInsurance'] as num?,
//       totalNoOfTaxTransactionDebit:
//           json['totalNoOfTaxTransactionDebit'] as num?,
//       totalNoOfTransferToWalletTransaction:
//           json['totalNoOfTransferToWalletTransaction'] as num?,
//       totalNoOfReversalTransactionDebit:
//           json['totalNoOfReversalTransactionDebit'] as num?,
//       totalNoOfMedicalTransaction: json['totalNoOfMedicalTransaction'] as num?,
//       totalNoOfChargesTransaction: json['totalNoOfChargesTransaction'] as num?,
//       totalNoOfBelowMinimumBalanceTransaction:
//           json['totalNoOfBelowMinimumBalanceTransaction'] as num?,
//       totalNoOfSalaryPaidTransaction:
//           json['totalNoOfSalaryPaidTransaction'] as num?,
//       totalNoOfTransferOutTransaction:
//           json['totalNoOfTransferOutTransaction'] as num?,
//       totalNoOfForeignWalletTransaction:
//           json['totalNoOfForeignWalletTransaction'] as num?,
//       totalNoOfOtherCategoryDebitTransaction:
//           json['totalNoOfOtherCategoryDebitTransaction'] as num?,
//       totalAmountOfBillsUtilities: json['totalAmountOfBillsUtilities'] as num?,
//       totalAmountOfFood: json['totalAmountOfFood'] as num?,
//       totalAmountOfAlcohol: json['totalAmountOfAlcohol'] as num?,
//       totalAmountOfPersonalLoan: json['totalAmountOfPersonalLoan'] as num?,
//       totalAmountOfHomeLoan: json['totalAmountOfHomeLoan'] as num?,
//       totalAmountOfAutoLoan: json['totalAmountOfAutoLoan'] as num?,
//       totalAmountOfTravel: json['totalAmountOfTravel'] as num?,
//       totalAmountOfEntertainmentLifestyle:
//           json['totalAmountOfEntertainmentLifestyle'] as num?,
//       totalAmountOfShoppingPurchase:
//           json['totalAmountOfShoppingPurchase'] as num?,
//       totalAmountOfInvestmentExpense:
//           json['totalAmountOfInvestmentExpense'] as num?,
//       totalAmountOfInsurance: json['totalAmountOfInsurance'] as num?,
//       totalAmountOfTaxTransactionDebit:
//           json['totalAmountOfTaxTransactionDebit'] as num?,
//       totalAmountOfGaming: json['totalAmountOfGaming'] as num?,
//       totalAmountOfTransferToWalletTransaction:
//           json['totalAmountOfTransferToWalletTransaction'] as num?,
//       totalAmountOfReversalTransactionDebit:
//           json['totalAmountOfReversalTransactionDebit'] as num?,
//       totalAmountOfCreditCardPayment:
//           json['totalAmountOfCreditCardPayment'] as num?,
//       totalAmountOfCashWithdrawals:
//           json['totalAmountOfCashWithdrawals'] as num?,
//       totalAmountOfMedicalTransaction:
//           json['totalAmountOfMedicalTransaction'] as num?,
//       totalAmountOfChargesTransaction:
//           json['totalAmountOfChargesTransaction'] as num?,
//       totalAmountOfBelowMinimumBalanceTransaction:
//           json['totalAmountOfBelowMinimumBalanceTransaction'] as num?,
//       totalAmountOfSalaryPaidTransaction:
//           json['totalAmountOfSalaryPaidTransaction'] as num?,
//       totalAmountOfTransferOutTransaction:
//           json['totalAmountOfTransferOutTransaction'] as num?,
//       totalAmountOfForeignWalletTransaction:
//           json['totalAmountOfForeignWalletTransaction'] as num?,
//       totalAmountOfEmiLoanPayments:
//           json['totalAmountOfEmiLoanPayments'] as num?,
//       totalAmountOfOtherCategoryDebitTransaction:
//           json['totalAmountOfOtherCategoryDebitTransaction'] as num?,
//       totalNoOfMutualFunds: json['totalNoOfMutualFunds'] as String?,
//       totalDebitAmountOfMutualFunds:
//           json['totalDebitAmountOfMutualFunds'] as String?,
//       totalExpenseOnCryptoCurrency:
//           json['totalExpenseOnCryptoCurrency'] as String?,
//       totalExpenseOnShareMarket: json['totalExpenseOnShareMarket'] as String?,
//       totalNoOfGasBillPayments: json['totalNoOfGasBillPayments'] as String?,
//       totalAmountOfGasBillPayments:
//           json['totalAmountOfGasBillPayments'] as String?,
//       totalNoOfElectricityBillPayments:
//           json['totalNoOfElectricityBillPayments'] as String?,
//       totalAmountOfElectricityBillPayments:
//           json['totalAmountOfElectricityBillPayments'] as String?,
//       totalNoOfMobileBroadbandBillPayments:
//           json['totalNoOfMobileBroadbandBillPayments'] as String?,
//       totalAmountOfMobileBroadbandBillPayments:
//           json['totalAmountOfMobileBroadbandBillPayments'] as String?,
//       totalNoOfDividend: json['totalNoOfDividend'] as String?,
//       totalAmountOfDividend: json['totalAmountOfDividend'] as String?,
//     );
//   }
//   // factory April2024.fromJson(Map<String, dynamic> json) => April2024(
//   //       minOpeningBalance: json["Min Opening Balance"]?? 0,
//   //       maxOpeningBalance: json["Max Opening Balance"] ??0,
//   //       minBalance: json["Min Balance"] ??0,
//   //       medianBalance: json["Median Balance"] ??'',
//   //       maxBalance: json["Max Balance"] ??0,
//   //       firstDayEodBalance: json["First Day EOD Balance"]??0,
//   //       lastDayEodBalance: json["Last Day EOD Balance"]??0,
//   //       opening: json["Opening"]??0,
//   //       closingBalance: json["Closing Balance"]??0,
//   //       minEodBalance: json["Min EOD Balance"]??0,
//   //       maxEodBalance: json["Max EOD Balance"]??0,
//   //       medianEodBalance: json["Median EOD Balance"]??0,
//   //       totalNoOfSalaryCredits: json["Total No of Salary Credits"] ??0,
//   //       totalAmountOfSalaryCredits: json["Total Amount of Salary Credits"] ??0,
//   //       totalNoOfCreditTransactions: json["Total No. of Credit Transactions"] ??0,
//   //       totalAmountOfCreditTransactions:
//   //           json["Total Amount of Credit Transactions"]??0,
//   //       totalNoOfBusinessCreditTransactions:
//   //           json["Total No. of Business Credit Transactions"]??0,
//   //       totalAmountOfBusinessCreditTransactions:
//   //           json["Total Amount of Business Credit Transactions"]??0,
//   //       totalNoOfDebitTransactions: json["Total No. of Debit Transactions"]??0,
//   //       totalAmountOfDebitTransactions:
//   //           json["Total Amount of Debit Transactions"]??0,
//   //       totalNoOfCashDeposits: json["Total No. of Cash Deposits"]??0,
//   //       totalAmountOfCashDeposits: json["Total Amount of Cash Deposits"]??0,
//   //       totalNoOfCashWithdrawals: json["Total No. of Cash Withdrawals"]??0,
//   //       chqDeposits: json["chqDeposits"],
//   //       totalNoOfChequeDeposits: json["Total No. of Cheque Deposits"],
//   //       chqIssues: json["chqIssues"],
//   //       totalNoOfChequeIssues: json["Total No. of Cheque Issues"],
//   //       totalChqDeposits: json["totalChqDeposits"],
//   //       totalAmountOfChequeDeposits: json["Total Amount of Cheque Deposits"],
//   //       totalChqIssues: json["totalChqIssues"],
//   //       totalAmountOfChequeIssues: json["Total Amount of Cheque Issues"],
//   //       noOfEmiLoanPayments: json["No. of EMI / loan payments"],
//   //       totalNoOfEmiLoanPayments: json["Total No. of EMI / loan payments"],
//   //       totalNoOfIWBounced: json["Total No.of I / W Bounced"],
//   //       sumOfIWBounced: json["Sum of I/W Bounced"],
//   //       totalAmountOfIWBounced: json["Total amount of I / W Bounced"],
//   //       totalNumberOfOutwardChequeBounces:
//   //           json["Total Number of Outward Cheque Bounces"],
//   //       noOfTransactionsInBs: json["No. of transactions in BS"],
//   //       totalLoanDisbursal: json["totalLoanDisbursal"],
//   //       totalAmountOfLoanDisbursal: json["Total Amount of Loan Disbursal"],
//   //       loanDisbursal: json["Loan Disbursal"],
//   //       april2024LoanDisbursal: json["loanDisbursal"],
//   //       totalNoOfLoanDisbursal: json["Total No. of Loan Disbursal"],
//   //       april2024TotalNoOfIWChqBounced: json["Total No. of I/W Chq Bounced"],
//   //       totalNoOfIWChqBounced: json["Total No. of I / W Chq Bounced"],
//   //       inwChqBounceNonTechnical: json["inw_chq_bounce_nonTechnical"],
//   //       totalNoOfIWChequeBounceNonTechnical:
//   //           json["Total No. of I / W Cheque Bounce Non Technical"],
//   //       totalInwChqBounceNonTechnical:
//   //           json["total_inw_chq_bounce_nonTechnical"],
//   //       totalAmountOfIWChequeBounceNonTechnical:
//   //           json["Total Amount of I / W Cheque Bounce Non Technical"],
//   //       salaryCount: json["salary_count"],
//   //       april2024StartDate: json["startDate"] == null
//   //           ? null
//   //           : DateTime.parse(json["startDate"]),
//   //       startDate: json["Start Date"] == null
//   //           ? null
//   //           : DateTime.parse(json["Start Date"]),
//   //       isCompleteMonthTxn: json["Is Complete Month Txn"],
//   //       averageEodBalance: json["Average EOD Balance"],
//   //       foir: json["FOIR"],
//   //       employerName: json["Employer Name"] == null
//   //           ? []
//   //           : List<dynamic>.from(json["Employer Name"]!.map((x) => x)),
//   //       avgBalanceTill10ThOfMonth: json["Avg balance till 10th of month"],
//   //       avgBalanceTill20ThOfMonth: json["Avg balance till 20th of month"],
//   //       avgBalanceTillLastDateOfMonth:
//   //           json["Avg balance till last date of month"],
//   //       abbOn114LastDay: json["ABB on 1 14 last day"]?.toDouble(),
//   //       abbOn1St14Th30ThLastDay:
//   //           json["ABB on 1st,14th, 30th/Last Day"]?.toDouble(),
//   //       totalNoOfNetCreditTransactions:
//   //           json["Total No. of Net Credit Transactions"],
//   //       totalNetCreditAmount: json["Total Net Credit Amount"],
//   //       totalNoOfNetDebitTransactions:
//   //           json["Total No. of Net Debit Transactions"],
//   //       totalNetDebitAmount: json["Total Net Debit Amount"],
//   //       totalNoOfCreditCardPayment: json["Total No. of CreditCard Payment"],
//   //       totalNoOfBillsUtilities: json["Total No. of Bills & Utilities"],
//   //       totalNoOfFood: json["Total No. of Food"],
//   //       totalNoOfAlcohol: json["Total No. of Alcohol"],
//   //       totalNoOfTravel: json["Total No. of Travel"],
//   //       totalNoOfEntertainmentLifestyle:
//   //           json["Total No. of Entertainment & Lifestyle"],
//   //       totalNoOfShoppingPurchase: json["Total No. of Shopping & Purchase"],
//   //       totalNoOfInvestmentExpense: json["Total No. of Investment Expense"],
//   //       totalNoOfGaming: json["Total No. of Gaming"],
//   //       totalNoOfPersonalLoan: json["Total No. of Personal Loan"],
//   //       totalNoOfHomeLoan: json["Total No. of Home Loan"],
//   //       totalNoOfAutoLoan: json["Total No. of Auto Loan "],
//   //       totalNoOfInsurance: json["Total No. of Insurance"],
//   //       totalNoOfTaxTransactionDebit:
//   //           json["Total No. of Tax Transaction Debit"],
//   //       totalNoOfTransferToWalletTransaction:
//   //           json["Total No. of Transfer to Wallet Transaction"],
//   //       totalNoOfReversalTransactionDebit:
//   //           json["Total No. of Reversal Transaction Debit"],
//   //       totalNoOfMedicalTransaction: json["Total No. of Medical Transaction"],
//   //       totalNoOfChargesTransaction: json["Total No. of Charges Transaction"],
//   //       totalNoOfBelowMinimumBalanceTransaction:
//   //           json["Total No. of Below Minimum Balance Transaction"],
//   //       totalNoOfSalaryPaidTransaction:
//   //           json["Total No. of Salary Paid Transaction"],
//   //       totalNoOfTransferOutTransaction:
//   //           json["Total No. of Transfer Out Transaction"],
//   //       totalNoOfForeignWalletTransaction:
//   //           json["Total No. of Foreign Wallet Transaction"],
//   //       totalNoOfOtherCategoryDebitTransaction:
//   //           json["Total No. of Other Category Debit Transaction"],
//   //       totalAmountOfBillsUtilities: json["Total Amount of Bills & Utilities"],
//   //       totalAmountOfFood: json["Total Amount of Food"],
//   //       totalAmountOfAlcohol: json["Total Amount of Alcohol"],
//   //       totalAmountOfPersonalLoan: json["Total Amount of Personal Loan"],
//   //       totalAmountOfHomeLoan: json["Total Amount of Home Loan"],
//   //       totalAmountOfAutoLoan: json["Total Amount of Auto Loan "],
//   //       totalAmountOfTravel: json["Total Amount of Travel"],
//   //       totalAmountOfEntertainmentLifestyle:
//   //           json["Total Amount of Entertainment & Lifestyle"],
//   //       totalAmountOfShoppingPurchase:
//   //           json["Total Amount of Shopping & Purchase"],
//   //       totalAmountOfInvestmentExpense:
//   //           json["Total Amount of Investment Expense"],
//   //       totalAmountOfInsurance: json["Total Amount of Insurance"],
//   //       totalAmountOfTaxTransactionDebit:
//   //           json["Total Amount of Tax Transaction Debit"],
//   //       totalAmountOfGaming: json["Total Amount of Gaming"],
//   //       totalAmountOfTransferToWalletTransaction:
//   //           json["Total Amount of Transfer to Wallet Transaction"],
//   //       totalAmountOfReversalTransactionDebit:
//   //           json["Total Amount of Reversal Transaction Debit"],
//   //       totalAmountOfCreditCardPayment:
//   //           json["Total Amount of CreditCard Payment"],
//   //       totalAmountOfCashWithdrawals: json["Total Amount of Cash Withdrawals"],
//   //       totalAmountOfMedicalTransaction:
//   //           json["Total Amount of Medical Transaction"],
//   //       totalAmountOfChargesTransaction:
//   //           json["Total Amount of Charges Transaction"],
//   //       totalAmountOfBelowMinimumBalanceTransaction:
//   //           json["Total Amount of Below Minimum Balance Transaction"],
//   //       totalAmountOfSalaryPaidTransaction:
//   //           json["Total Amount of Salary Paid Transaction"],
//   //       totalAmountOfTransferOutTransaction:
//   //           json["Total Amount of Transfer Out Transaction"],
//   //       totalAmountOfForeignWalletTransaction:
//   //           json["Total Amount of Foreign Wallet Transaction"],
//   //       totalAmountOfEmiLoanPayments:
//   //           json["Total Amount of EMI / loan Payments"],
//   //       totalAmountOfOtherCategoryDebitTransaction:
//   //           json["Total Amount of Other Category Debit Transaction"],
//   //       totalNoOfMutualFunds: json["Total No. of Mutual Funds"],
//   //       totalDebitAmountOfMutualFunds:
//   //           json["Total Debit Amount of Mutual Funds"],
//   //       totalExpenseOnCryptoCurrency: json["Total Expense on Crypto Currency"],
//   //       totalExpenseOnShareMarket: json["Total Expense on Share Market"],
//   //       totalNoOfGasBillPayments: json["Total No. of Gas Bill Payments"],
//   //       totalAmountOfGasBillPayments: json["Total Amount of Gas Bill Payments"],
//   //       totalNoOfElectricityBillPayments:
//   //           json["Total No. of Electricity Bill Payments"],
//   //       totalNoOfMobileBroadbandBillPayments:
//   //           json["Total No. of Mobile & Broadband Bill Payments"],
//   //       totalAmountOfMobileBroadbandBillPayments:
//   //           json["Total Amount of Mobile & Broadband Bill Payments"],
//   //       totalAmountOfElectricityBillPayments:
//   //           json["Total Amount of Electricity Bill Payments"],
//   //       totalNoOfDividend: json["Total No. of Dividend"],
//   //       totalAmountOfDividend: json["Total Amount of Dividend"],
//   //     );

//   Map<String, dynamic> toJson() => {
//         "Min Opening Balance": minOpeningBalance,
//         "Max Opening Balance": maxOpeningBalance,
//         "Min Balance": minBalance,
//         "Median Balance": medianBalance,
//         "Max Balance": maxBalance,
//         "First Day EOD Balance": firstDayEodBalance,
//         "Last Day EOD Balance": lastDayEodBalance,
//         "Opening": opening,
//         "Closing Balance": closingBalance,
//         "Min EOD Balance": minEodBalance,
//         "Max EOD Balance": maxEodBalance,
//         "Median EOD Balance": medianEodBalance,
//         "Total No of Salary Credits": totalNoOfSalaryCredits,
//         "Total Amount of Salary Credits": totalAmountOfSalaryCredits,
//         "Total No. of Credit Transactions": totalNoOfCreditTransactions,
//         "Total Amount of Credit Transactions": totalAmountOfCreditTransactions,
//         "Total No. of Business Credit Transactions":
//             totalNoOfBusinessCreditTransactions,
//         "Total Amount of Business Credit Transactions":
//             totalAmountOfBusinessCreditTransactions,
//         "Total No. of Debit Transactions": totalNoOfDebitTransactions,
//         "Total Amount of Debit Transactions": totalAmountOfDebitTransactions,
//         "Total No. of Cash Deposits": totalNoOfCashDeposits,
//         "Total Amount of Cash Deposits": totalAmountOfCashDeposits,
//         "Total No. of Cash Withdrawals": totalNoOfCashWithdrawals,
//         "chqDeposits": chqDeposits,
//         "Total No. of Cheque Deposits": totalNoOfChequeDeposits,
//         "chqIssues": chqIssues,
//         "Total No. of Cheque Issues": totalNoOfChequeIssues,
//         "totalChqDeposits": totalChqDeposits,
//         "Total Amount of Cheque Deposits": totalAmountOfChequeDeposits,
//         "totalChqIssues": totalChqIssues,
//         "Total Amount of Cheque Issues": totalAmountOfChequeIssues,
//         "No. of EMI / loan payments": noOfEmiLoanPayments,
//         "Total No. of EMI / loan payments": totalNoOfEmiLoanPayments,
//         "Total No.of I / W Bounced": totalNoOfIWBounced,
//         "Sum of I/W Bounced": sumOfIWBounced,
//         "Total amount of I / W Bounced": totalAmountOfIWBounced,
//         "Total Number of Outward Cheque Bounces":
//             totalNumberOfOutwardChequeBounces,
//         "No. of transactions in BS": noOfTransactionsInBs,
//         "totalLoanDisbursal": totalLoanDisbursal,
//         "Total Amount of Loan Disbursal": totalAmountOfLoanDisbursal,
//         "Loan Disbursal": loanDisbursal,
//         "loanDisbursal": april2024LoanDisbursal,
//         "Total No. of Loan Disbursal": totalNoOfLoanDisbursal,
//         "Total No. of I/W Chq Bounced": april2024TotalNoOfIWChqBounced,
//         "Total No. of I / W Chq Bounced": totalNoOfIWChqBounced,
//         "inw_chq_bounce_nonTechnical": inwChqBounceNonTechnical,
//         "Total No. of I / W Cheque Bounce Non Technical":
//             totalNoOfIWChequeBounceNonTechnical,
//         "total_inw_chq_bounce_nonTechnical": totalInwChqBounceNonTechnical,
//         "Total Amount of I / W Cheque Bounce Non Technical":
//             totalAmountOfIWChequeBounceNonTechnical,
//         "salary_count": salaryCount,
//         "startDate":
//             "${april2024StartDate!.year.toString().padLeft(4, '0')}-${april2024StartDate!.month.toString().padLeft(2, '0')}-${april2024StartDate!.day.toString().padLeft(2, '0')}",
//         "Start Date":
//             "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
//         "Is Complete Month Txn": isCompleteMonthTxn,
//         "Average EOD Balance": averageEodBalance,
//         "FOIR": foir,
//         "Employer Name": employerName == null
//             ? []
//             : List<dynamic>.from(employerName!.map((x) => x)),
//         "Avg balance till 10th of month": avgBalanceTill10ThOfMonth,
//         "Avg balance till 20th of month": avgBalanceTill20ThOfMonth,
//         "Avg balance till last date of month": avgBalanceTillLastDateOfMonth,
//         "ABB on 1 14 last day": abbOn114LastDay,
//         "ABB on 1st,14th, 30th/Last Day": abbOn1St14Th30ThLastDay,
//         "Total No. of Net Credit Transactions": totalNoOfNetCreditTransactions,
//         "Total Net Credit Amount": totalNetCreditAmount,
//         "Total No. of Net Debit Transactions": totalNoOfNetDebitTransactions,
//         "Total Net Debit Amount": totalNetDebitAmount,
//         "Total No. of CreditCard Payment": totalNoOfCreditCardPayment,
//         "Total No. of Bills & Utilities": totalNoOfBillsUtilities,
//         "Total No. of Food": totalNoOfFood,
//         "Total No. of Alcohol": totalNoOfAlcohol,
//         "Total No. of Travel": totalNoOfTravel,
//         "Total No. of Entertainment & Lifestyle":
//             totalNoOfEntertainmentLifestyle,
//         "Total No. of Shopping & Purchase": totalNoOfShoppingPurchase,
//         "Total No. of Investment Expense": totalNoOfInvestmentExpense,
//         "Total No. of Gaming": totalNoOfGaming,
//         "Total No. of Personal Loan": totalNoOfPersonalLoan,
//         "Total No. of Home Loan": totalNoOfHomeLoan,
//         "Total No. of Auto Loan ": totalNoOfAutoLoan,
//         "Total No. of Insurance": totalNoOfInsurance,
//         "Total No. of Tax Transaction Debit": totalNoOfTaxTransactionDebit,
//         "Total No. of Transfer to Wallet Transaction":
//             totalNoOfTransferToWalletTransaction,
//         "Total No. of Reversal Transaction Debit":
//             totalNoOfReversalTransactionDebit,
//         "Total No. of Medical Transaction": totalNoOfMedicalTransaction,
//         "Total No. of Charges Transaction": totalNoOfChargesTransaction,
//         "Total No. of Below Minimum Balance Transaction":
//             totalNoOfBelowMinimumBalanceTransaction,
//         "Total No. of Salary Paid Transaction": totalNoOfSalaryPaidTransaction,
//         "Total No. of Transfer Out Transaction":
//             totalNoOfTransferOutTransaction,
//         "Total No. of Foreign Wallet Transaction":
//             totalNoOfForeignWalletTransaction,
//         "Total No. of Other Category Debit Transaction":
//             totalNoOfOtherCategoryDebitTransaction,
//         "Total Amount of Bills & Utilities": totalAmountOfBillsUtilities,
//         "Total Amount of Food": totalAmountOfFood,
//         "Total Amount of Alcohol": totalAmountOfAlcohol,
//         "Total Amount of Personal Loan": totalAmountOfPersonalLoan,
//         "Total Amount of Home Loan": totalAmountOfHomeLoan,
//         "Total Amount of Auto Loan ": totalAmountOfAutoLoan,
//         "Total Amount of Travel": totalAmountOfTravel,
//         "Total Amount of Entertainment & Lifestyle":
//             totalAmountOfEntertainmentLifestyle,
//         "Total Amount of Shopping & Purchase": totalAmountOfShoppingPurchase,
//         "Total Amount of Investment Expense": totalAmountOfInvestmentExpense,
//         "Total Amount of Insurance": totalAmountOfInsurance,
//         "Total Amount of Tax Transaction Debit":
//             totalAmountOfTaxTransactionDebit,
//         "Total Amount of Gaming": totalAmountOfGaming,
//         "Total Amount of Transfer to Wallet Transaction":
//             totalAmountOfTransferToWalletTransaction,
//         "Total Amount of Reversal Transaction Debit":
//             totalAmountOfReversalTransactionDebit,
//         "Total Amount of CreditCard Payment": totalAmountOfCreditCardPayment,
//         "Total Amount of Cash Withdrawals": totalAmountOfCashWithdrawals,
//         "Total Amount of Medical Transaction": totalAmountOfMedicalTransaction,
//         "Total Amount of Charges Transaction": totalAmountOfChargesTransaction,
//         "Total Amount of Below Minimum Balance Transaction":
//             totalAmountOfBelowMinimumBalanceTransaction,
//         "Total Amount of Salary Paid Transaction":
//             totalAmountOfSalaryPaidTransaction,
//         "Total Amount of Transfer Out Transaction":
//             totalAmountOfTransferOutTransaction,
//         "Total Amount of Foreign Wallet Transaction":
//             totalAmountOfForeignWalletTransaction,
//         "Total Amount of EMI / loan Payments": totalAmountOfEmiLoanPayments,
//         "Total Amount of Other Category Debit Transaction":
//             totalAmountOfOtherCategoryDebitTransaction,
//         "Total No. of Mutual Funds": totalNoOfMutualFunds,
//         "Total Debit Amount of Mutual Funds": totalDebitAmountOfMutualFunds,
//         "Total Expense on Crypto Currency": totalExpenseOnCryptoCurrency,
//         "Total Expense on Share Market": totalExpenseOnShareMarket,
//         "Total No. of Gas Bill Payments": totalNoOfGasBillPayments,
//         "Total Amount of Gas Bill Payments": totalAmountOfGasBillPayments,
//         "Total No. of Electricity Bill Payments":
//             totalNoOfElectricityBillPayments,
//         "Total No. of Mobile & Broadband Bill Payments":
//             totalNoOfMobileBroadbandBillPayments,
//         "Total Amount of Mobile & Broadband Bill Payments":
//             totalAmountOfMobileBroadbandBillPayments,
//         "Total Amount of Electricity Bill Payments":
//             totalAmountOfElectricityBillPayments,
//         "Total No. of Dividend": totalNoOfDividend,
//         "Total Amount of Dividend": totalAmountOfDividend,
//       };
// }

// class August2024 {
//   double? minOpeningBalance;
//   double? maxOpeningBalance;
//   double? minBalance;
//   String? medianBalance;
//   double? maxBalance;
//   double? firstDayEodBalance;
//   double? lastDayEodBalance;
//   double? opening;
//   double? closingBalance;
//   double? minEodBalance;
//   double? maxEodBalance;
//   double? medianEodBalance;
//   num? totalNoOfSalaryCredits;
//   num? totalAmountOfSalaryCredits;
//   num? totalNoOfCreditTransactions;
//   num? totalAmountOfCreditTransactions;
//   num? totalNoOfBusinessCreditTransactions;
//   num? totalAmountOfBusinessCreditTransactions;
//   num? totalNoOfDebitTransactions;
//   double? totalAmountOfDebitTransactions;
//   num? totalNoOfCashDeposits;
//   num? totalAmountOfCashDeposits;
//   num? totalNoOfCashWithdrawals;
//   num? chqDeposits;
//   num? totalNoOfChequeDeposits;
//   num? chqIssues;
//   num? totalNoOfChequeIssues;
//   num? totalChqDeposits;
//   num? totalAmountOfChequeDeposits;
//   num? totalChqIssues;
//   num? totalAmountOfChequeIssues;
//   num? noOfEmiLoanPayments;
//   num? totalNoOfEmiLoanPayments;
//   num? totalNoOfIWBounced;
//   num? sumOfIWBounced;
//   num? totalAmountOfIWBounced;
//   num? totalNumberOfOutwardChequeBounces;
//   num? noOfTransactionsInBs;
//   num? totalLoanDisbursal;
//   num? totalAmountOfLoanDisbursal;
//   num? loanDisbursal;
//   num? august2024LoanDisbursal;
//   num? totalNoOfLoanDisbursal;
//   num? august2024TotalNoOfIWChqBounced;
//   num? totalNoOfIWChqBounced;
//   num? inwChqBounceNonTechnical;
//   num? totalNoOfIWChequeBounceNonTechnical;
//   num? totalInwChqBounceNonTechnical;
//   num? totalAmountOfIWChequeBounceNonTechnical;
//   num? salaryCount;
//   DateTime? august2024StartDate;
//   DateTime? startDate;
//   String? isCompleteMonthTxn;
//   double? averageEodBalance;
//   String? foir;
//   List<dynamic>? employerName;
//   double? avgBalanceTill10ThOfMonth;
//   double? avgBalanceTill20ThOfMonth;
//   double? avgBalanceTillLastDateOfMonth;
//   double? abbOn114LastDay;
//   double? abbOn1St14Th30ThLastDay;
//   num? totalNoOfNetCreditTransactions;
//   num? totalNetCreditAmount;
//   num? totalNoOfNetDebitTransactions;
//   double? totalNetDebitAmount;
//   num? totalNoOfCreditCardPayment;
//   num? totalNoOfBillsUtilities;
//   num? totalNoOfFood;
//   num? totalNoOfAlcohol;
//   num? totalNoOfTravel;
//   num? totalNoOfEntertainmentLifestyle;
//   num? totalNoOfShoppingPurchase;
//   num? totalNoOfInvestmentExpense;
//   num? totalNoOfGaming;
//   num? totalNoOfPersonalLoan;
//   num? totalNoOfHomeLoan;
//   num? totalNoOfAutoLoan;
//   num? totalNoOfInsurance;
//   num? totalNoOfTaxTransactionDebit;
//   num? totalNoOfTransferToWalletTransaction;
//   num? totalNoOfReversalTransactionDebit;
//   num? totalNoOfMedicalTransaction;
//   num? totalNoOfChargesTransaction;
//   num? totalNoOfBelowMinimumBalanceTransaction;
//   num? totalNoOfSalaryPaidTransaction;
//   num? totalNoOfTransferOutTransaction;
//   num? totalNoOfForeignWalletTransaction;
//   num? totalNoOfOtherCategoryDebitTransaction;
//   num? totalAmountOfBillsUtilities;
//   num? totalAmountOfFood;
//   num? totalAmountOfAlcohol;
//   num? totalAmountOfPersonalLoan;
//   num? totalAmountOfHomeLoan;
//   num? totalAmountOfAutoLoan;
//   num? totalAmountOfTravel;
//   num? totalAmountOfEntertainmentLifestyle;
//   num? totalAmountOfShoppingPurchase;
//   num? totalAmountOfInvestmentExpense;
//   num? totalAmountOfInsurance;
//   num? totalAmountOfTaxTransactionDebit;
//   num? totalAmountOfGaming;
//   num? totalAmountOfTransferToWalletTransaction;
//   num? totalAmountOfReversalTransactionDebit;
//   num? totalAmountOfCreditCardPayment;
//   num? totalAmountOfCashWithdrawals;
//   num? totalAmountOfMedicalTransaction;
//   num? totalAmountOfChargesTransaction;
//   num? totalAmountOfBelowMinimumBalanceTransaction;
//   num? totalAmountOfSalaryPaidTransaction;
//   double? totalAmountOfTransferOutTransaction;
//   num? totalAmountOfForeignWalletTransaction;
//   num? totalAmountOfEmiLoanPayments;
//   num? totalAmountOfOtherCategoryDebitTransaction;
//   String? totalNoOfMutualFunds;
//   String? totalDebitAmountOfMutualFunds;
//   String? totalExpenseOnCryptoCurrency;
//   String? totalExpenseOnShareMarket;
//   String? totalNoOfGasBillPayments;
//   String? totalAmountOfGasBillPayments;
//   String? totalNoOfElectricityBillPayments;
//   String? totalNoOfMobileBroadbandBillPayments;
//   String? totalAmountOfMobileBroadbandBillPayments;
//   String? totalAmountOfElectricityBillPayments;
//   String? totalNoOfDividend;
//   String? totalAmountOfDividend;

//   August2024({
//     this.minOpeningBalance,
//     this.maxOpeningBalance,
//     this.minBalance,
//     this.medianBalance,
//     this.maxBalance,
//     this.firstDayEodBalance,
//     this.lastDayEodBalance,
//     this.opening,
//     this.closingBalance,
//     this.minEodBalance,
//     this.maxEodBalance,
//     this.medianEodBalance,
//     this.totalNoOfSalaryCredits,
//     this.totalAmountOfSalaryCredits,
//     this.totalNoOfCreditTransactions,
//     this.totalAmountOfCreditTransactions,
//     this.totalNoOfBusinessCreditTransactions,
//     this.totalAmountOfBusinessCreditTransactions,
//     this.totalNoOfDebitTransactions,
//     this.totalAmountOfDebitTransactions,
//     this.totalNoOfCashDeposits,
//     this.totalAmountOfCashDeposits,
//     this.totalNoOfCashWithdrawals,
//     this.chqDeposits,
//     this.totalNoOfChequeDeposits,
//     this.chqIssues,
//     this.totalNoOfChequeIssues,
//     this.totalChqDeposits,
//     this.totalAmountOfChequeDeposits,
//     this.totalChqIssues,
//     this.totalAmountOfChequeIssues,
//     this.noOfEmiLoanPayments,
//     this.totalNoOfEmiLoanPayments,
//     this.totalNoOfIWBounced,
//     this.sumOfIWBounced,
//     this.totalAmountOfIWBounced,
//     this.totalNumberOfOutwardChequeBounces,
//     this.noOfTransactionsInBs,
//     this.totalLoanDisbursal,
//     this.totalAmountOfLoanDisbursal,
//     this.loanDisbursal,
//     this.august2024LoanDisbursal,
//     this.totalNoOfLoanDisbursal,
//     this.august2024TotalNoOfIWChqBounced,
//     this.totalNoOfIWChqBounced,
//     this.inwChqBounceNonTechnical,
//     this.totalNoOfIWChequeBounceNonTechnical,
//     this.totalInwChqBounceNonTechnical,
//     this.totalAmountOfIWChequeBounceNonTechnical,
//     this.salaryCount,
//     this.august2024StartDate,
//     this.startDate,
//     this.isCompleteMonthTxn,
//     this.averageEodBalance,
//     this.foir,
//     this.employerName,
//     this.avgBalanceTill10ThOfMonth,
//     this.avgBalanceTill20ThOfMonth,
//     this.avgBalanceTillLastDateOfMonth,
//     this.abbOn114LastDay,
//     this.abbOn1St14Th30ThLastDay,
//     this.totalNoOfNetCreditTransactions,
//     this.totalNetCreditAmount,
//     this.totalNoOfNetDebitTransactions,
//     this.totalNetDebitAmount,
//     this.totalNoOfCreditCardPayment,
//     this.totalNoOfBillsUtilities,
//     this.totalNoOfFood,
//     this.totalNoOfAlcohol,
//     this.totalNoOfTravel,
//     this.totalNoOfEntertainmentLifestyle,
//     this.totalNoOfShoppingPurchase,
//     this.totalNoOfInvestmentExpense,
//     this.totalNoOfGaming,
//     this.totalNoOfPersonalLoan,
//     this.totalNoOfHomeLoan,
//     this.totalNoOfAutoLoan,
//     this.totalNoOfInsurance,
//     this.totalNoOfTaxTransactionDebit,
//     this.totalNoOfTransferToWalletTransaction,
//     this.totalNoOfReversalTransactionDebit,
//     this.totalNoOfMedicalTransaction,
//     this.totalNoOfChargesTransaction,
//     this.totalNoOfBelowMinimumBalanceTransaction,
//     this.totalNoOfSalaryPaidTransaction,
//     this.totalNoOfTransferOutTransaction,
//     this.totalNoOfForeignWalletTransaction,
//     this.totalNoOfOtherCategoryDebitTransaction,
//     this.totalAmountOfBillsUtilities,
//     this.totalAmountOfFood,
//     this.totalAmountOfAlcohol,
//     this.totalAmountOfPersonalLoan,
//     this.totalAmountOfHomeLoan,
//     this.totalAmountOfAutoLoan,
//     this.totalAmountOfTravel,
//     this.totalAmountOfEntertainmentLifestyle,
//     this.totalAmountOfShoppingPurchase,
//     this.totalAmountOfInvestmentExpense,
//     this.totalAmountOfInsurance,
//     this.totalAmountOfTaxTransactionDebit,
//     this.totalAmountOfGaming,
//     this.totalAmountOfTransferToWalletTransaction,
//     this.totalAmountOfReversalTransactionDebit,
//     this.totalAmountOfCreditCardPayment,
//     this.totalAmountOfCashWithdrawals,
//     this.totalAmountOfMedicalTransaction,
//     this.totalAmountOfChargesTransaction,
//     this.totalAmountOfBelowMinimumBalanceTransaction,
//     this.totalAmountOfSalaryPaidTransaction,
//     this.totalAmountOfTransferOutTransaction,
//     this.totalAmountOfForeignWalletTransaction,
//     this.totalAmountOfEmiLoanPayments,
//     this.totalAmountOfOtherCategoryDebitTransaction,
//     this.totalNoOfMutualFunds,
//     this.totalDebitAmountOfMutualFunds,
//     this.totalExpenseOnCryptoCurrency,
//     this.totalExpenseOnShareMarket,
//     this.totalNoOfGasBillPayments,
//     this.totalAmountOfGasBillPayments,
//     this.totalNoOfElectricityBillPayments,
//     this.totalNoOfMobileBroadbandBillPayments,
//     this.totalAmountOfMobileBroadbandBillPayments,
//     this.totalAmountOfElectricityBillPayments,
//     this.totalNoOfDividend,
//     this.totalAmountOfDividend,
//   });

//   factory August2024.fromJson(Map<String, dynamic> json) => August2024(
//         minOpeningBalance: json["Min Opening Balance"]?.toDouble() ?? 0.0,
//         maxOpeningBalance: json["Max Opening Balance"]?.toDouble() ?? 0.0,
//         minBalance: json["Min Balance"]?.toDouble(),
//         medianBalance: json["Median Balance"] ?? '',
//         maxBalance: json["Max Balance"]?.toDouble() ?? 0.0,
//         firstDayEodBalance: json["First Day EOD Balance"]?.toDouble() ?? 0.0,
//         lastDayEodBalance: json["Last Day EOD Balance"]?.toDouble() ?? 0.0,
//         opening: json["Opening"]?.toDouble() ?? 0.0,
//         closingBalance: json["Closing Balance"]?.toDouble() ?? 0.0,
//         minEodBalance: json["Min EOD Balance"]?.toDouble() ?? 0.0,
//         maxEodBalance: json["Max EOD Balance"]?.toDouble() ?? 0.0,
//         medianEodBalance: json["Median EOD Balance"]?.toDouble() ?? 0.0,
//         totalNoOfSalaryCredits: json["Total No of Salary Credits"] ?? 0.0,
//         totalAmountOfSalaryCredits:
//             json["Total Amount of Salary Credits"] ?? 0.0,
//         totalNoOfCreditTransactions:
//             json["Total No. of Credit Transactions"] ?? 0.0,
//         totalAmountOfCreditTransactions:
//             json["Total Amount of Credit Transactions"] ?? 0.0,
//         totalNoOfBusinessCreditTransactions:
//             json["Total No. of Business Credit Transactions"] ?? 0.0,
//         totalAmountOfBusinessCreditTransactions:
//             json["Total Amount of Business Credit Transactions"] ?? 0.0,
//         totalNoOfDebitTransactions:
//             json["Total No. of Debit Transactions"] ?? 0.0,
//         totalAmountOfDebitTransactions:
//             json["Total Amount of Debit Transactions"]?.toDouble() ?? 0.0,
//         totalNoOfCashDeposits: json["Total No. of Cash Deposits"] ?? 0.0,
//         totalAmountOfCashDeposits: json["Total Amount of Cash Deposits"] ?? 0.0,
//         totalNoOfCashWithdrawals: json["Total No. of Cash Withdrawals"] ?? 0.0,
//         chqDeposits: json["chqDeposits"] ?? 0.0,
//         totalNoOfChequeDeposits: json["Total No. of Cheque Deposits"] ?? 0.0,
//         chqIssues: json["chqIssues"] ?? 0.0,
//         totalNoOfChequeIssues: json["Total No. of Cheque Issues"] ?? 0.0,
//         totalChqDeposits: json["totalChqDeposits"] ?? 0.0,
//         totalAmountOfChequeDeposits:
//             json["Total Amount of Cheque Deposits"] ?? 0.0,
//         totalChqIssues: json["totalChqIssues"] ?? 0.0,
//         totalAmountOfChequeIssues: json["Total Amount of Cheque Issues"] ?? 0.0,
//         noOfEmiLoanPayments: json["No. of EMI / loan payments"] ?? 0.0,
//         totalNoOfEmiLoanPayments:
//             json["Total No. of EMI / loan payments"] ?? 0.0,
//         totalNoOfIWBounced: json["Total No.of I / W Bounced"] ?? 0.0,
//         sumOfIWBounced: json["Sum of I/W Bounced"] ?? 0.0,
//         totalAmountOfIWBounced: json["Total amount of I / W Bounced"] ?? 0.0,
//         totalNumberOfOutwardChequeBounces:
//             json["Total Number of Outward Cheque Bounces"] ?? 0.0,
//         noOfTransactionsInBs: json["No. of transactions in BS"] ?? 0.0,
//         totalLoanDisbursal: json["totalLoanDisbursal"] ?? 0.0,
//         totalAmountOfLoanDisbursal:
//             json["Total Amount of Loan Disbursal"] ?? 0.0,
//         loanDisbursal: json["Loan Disbursal"] ?? 0.0,
//         august2024LoanDisbursal: json["loanDisbursal"] ?? 0.0,
//         totalNoOfLoanDisbursal: json["Total No. of Loan Disbursal"] ?? 0.0,
//         august2024TotalNoOfIWChqBounced:
//             json["Total No. of I/W Chq Bounced"] ?? 0.0,
//         totalNoOfIWChqBounced: json["Total No. of I / W Chq Bounced"] ?? 0.0,
//         inwChqBounceNonTechnical: json["inw_chq_bounce_nonTechnical"] ?? 0.0,
//         totalNoOfIWChequeBounceNonTechnical:
//             json["Total No. of I / W Cheque Bounce Non Technical"] ?? 0.0,
//         totalInwChqBounceNonTechnical:
//             json["total_inw_chq_bounce_nonTechnical"] ?? 0.0,
//         totalAmountOfIWChequeBounceNonTechnical:
//             json["Total Amount of I / W Cheque Bounce Non Technical"] ?? 0.0,
//         salaryCount: json["salary_count"] ?? 0.0,
//         august2024StartDate: json["startDate"] == null
//             ? null
//             : DateTime.parse(json["startDate"]),
//         startDate: json["Start Date"] == null
//             ? null
//             : DateTime.parse(json["Start Date"]),
//         isCompleteMonthTxn: json["Is Complete Month Txn"] ?? '',
//         averageEodBalance: json["Average EOD Balance"]?.toDouble() ?? 0.0,
//         foir: json["FOIR"],
//         employerName: json["Employer Name"] == null
//             ? []
//             : List<dynamic>.from(json["Employer Name"]!.map((x) => x)),
//         avgBalanceTill10ThOfMonth:
//             json["Avg balance till 10th of month"]?.toDouble() ?? 0.0,
//         avgBalanceTill20ThOfMonth:
//             json["Avg balance till 20th of month"]?.toDouble() ?? 0.0,
//         avgBalanceTillLastDateOfMonth:
//             json["Avg balance till last date of month"]?.toDouble() ?? 0.0,
//         abbOn114LastDay: json["ABB on 1 14 last day"]?.toDouble() ?? 0.0,
//         abbOn1St14Th30ThLastDay:
//             json["ABB on 1st,14th, 30th/Last Day"]?.toDouble() ?? 0.0,
//         totalNoOfNetCreditTransactions:
//             json["Total No. of Net Credit Transactions"] ?? 0.0,
//         totalNetCreditAmount: json["Total Net Credit Amount"] ?? 0.0,
//         totalNoOfNetDebitTransactions:
//             json["Total No. of Net Debit Transactions"] ?? 0.0,
//         totalNetDebitAmount: json["Total Net Debit Amount"]?.toDouble() ?? 0.0,
//         totalNoOfCreditCardPayment:
//             json["Total No. of CreditCard Payment"] ?? 0.0,
//         totalNoOfBillsUtilities: json["Total No. of Bills & Utilities"] ?? 0.0,
//         totalNoOfFood: json["Total No. of Food"] ?? 0.0,
//         totalNoOfAlcohol: json["Total No. of Alcohol"] ?? 0.0,
//         totalNoOfTravel: json["Total No. of Travel"] ?? 0.0,
//         totalNoOfEntertainmentLifestyle:
//             json["Total No. of Entertainment & Lifestyle"] ?? 0.0,
//         totalNoOfShoppingPurchase:
//             json["Total No. of Shopping & Purchase"] ?? 0.0,
//         totalNoOfInvestmentExpense:
//             json["Total No. of Investment Expense"] ?? 0.0,
//         totalNoOfGaming: json["Total No. of Gaming"],
//         totalNoOfPersonalLoan: json["Total No. of Personal Loan"] ?? 0.0,
//         totalNoOfHomeLoan: json["Total No. of Home Loan"] ?? 0.0,
//         totalNoOfAutoLoan: json["Total No. of Auto Loan "] ?? 0.0,
//         totalNoOfInsurance: json["Total No. of Insurance"] ?? 0.0,
//         totalNoOfTaxTransactionDebit:
//             json["Total No. of Tax Transaction Debit"] ?? 0.0,
//         totalNoOfTransferToWalletTransaction:
//             json["Total No. of Transfer to Wallet Transaction"] ?? 0.0,
//         totalNoOfReversalTransactionDebit:
//             json["Total No. of Reversal Transaction Debit"] ?? 0.0,
//         totalNoOfMedicalTransaction:
//             json["Total No. of Medical Transaction"] ?? 0.0,
//         totalNoOfChargesTransaction:
//             json["Total No. of Charges Transaction"] ?? 0.0,
//         totalNoOfBelowMinimumBalanceTransaction:
//             json["Total No. of Below Minimum Balance Transaction"] ?? 0.0,
//         totalNoOfSalaryPaidTransaction:
//             json["Total No. of Salary Paid Transaction"] ?? 0.0,
//         totalNoOfTransferOutTransaction:
//             json["Total No. of Transfer Out Transaction"] ?? 0.0,
//         totalNoOfForeignWalletTransaction:
//             json["Total No. of Foreign Wallet Transaction"] ?? 0.0,
//         totalNoOfOtherCategoryDebitTransaction:
//             json["Total No. of Other Category Debit Transaction"] ?? 0.0,
//         totalAmountOfBillsUtilities:
//             json["Total Amount of Bills & Utilities"] ?? 0.0,
//         totalAmountOfFood: json["Total Amount of Food"] ?? 0.0,
//         totalAmountOfAlcohol: json["Total Amount of Alcohol"] ?? 0.0,
//         totalAmountOfPersonalLoan: json["Total Amount of Personal Loan"] ?? 0.0,
//         totalAmountOfHomeLoan: json["Total Amount of Home Loan"] ?? 0.0,
//         totalAmountOfAutoLoan: json["Total Amount of Auto Loan "] ?? 0.0,
//         totalAmountOfTravel: json["Total Amount of Travel"] ?? 0.0,
//         totalAmountOfEntertainmentLifestyle:
//             json["Total Amount of Entertainment & Lifestyle"] ?? 0.0,
//         totalAmountOfShoppingPurchase:
//             json["Total Amount of Shopping & Purchase"] ?? 0.0,
//         totalAmountOfInvestmentExpense:
//             json["Total Amount of Investment Expense"] ?? 0.0,
//         totalAmountOfInsurance: json["Total Amount of Insurance"] ?? 0.0,
//         totalAmountOfTaxTransactionDebit:
//             json["Total Amount of Tax Transaction Debit"] ?? 0.0,
//         totalAmountOfGaming: json["Total Amount of Gaming"] ?? 0.0,
//         totalAmountOfTransferToWalletTransaction:
//             json["Total Amount of Transfer to Wallet Transaction"] ?? 0.0,
//         totalAmountOfReversalTransactionDebit:
//             json["Total Amount of Reversal Transaction Debit"] ?? 0.0,
//         totalAmountOfCreditCardPayment:
//             json["Total Amount of CreditCard Payment"] ?? 0.0,
//         totalAmountOfCashWithdrawals:
//             json["Total Amount of Cash Withdrawals"] ?? 0.0,
//         totalAmountOfMedicalTransaction:
//             json["Total Amount of Medical Transaction"] ?? 0.0,
//         totalAmountOfChargesTransaction:
//             json["Total Amount of Charges Transaction"] ?? 0.0,
//         totalAmountOfBelowMinimumBalanceTransaction:
//             json["Total Amount of Below Minimum Balance Transaction"] ?? 0.0,
//         totalAmountOfSalaryPaidTransaction:
//             json["Total Amount of Salary Paid Transaction"] ?? 0.0,
//         totalAmountOfTransferOutTransaction:
//             json["Total Amount of Transfer Out Transaction"]?.toDouble() ?? 0.0,
//         totalAmountOfForeignWalletTransaction:
//             json["Total Amount of Foreign Wallet Transaction"] ?? 0.0,
//         totalAmountOfEmiLoanPayments:
//             json["Total Amount of EMI / loan Payments"] ?? 0.0,
//         totalAmountOfOtherCategoryDebitTransaction:
//             json["Total Amount of Other Category Debit Transaction"] ?? 0.0,
//         totalNoOfMutualFunds: json["Total No. of Mutual Funds"] ?? '',
//         totalDebitAmountOfMutualFunds:
//             json["Total Debit Amount of Mutual Funds"] ?? '',
//         totalExpenseOnCryptoCurrency:
//             json["Total Expense on Crypto Currency"] ?? '',
//         totalExpenseOnShareMarket: json["Total Expense on Share Market"] ?? '',
//         totalNoOfGasBillPayments: json["Total No. of Gas Bill Payments"] ?? '',
//         totalAmountOfGasBillPayments:
//             json["Total Amount of Gas Bill Payments"] ?? '',
//         totalNoOfElectricityBillPayments:
//             json["Total No. of Electricity Bill Payments"] ?? '',
//         totalNoOfMobileBroadbandBillPayments:
//             json["Total No. of Mobile & Broadband Bill Payments"] ?? '',
//         totalAmountOfMobileBroadbandBillPayments:
//             json["Total Amount of Mobile & Broadband Bill Payments"] ?? '',
//         totalAmountOfElectricityBillPayments:
//             json["Total Amount of Electricity Bill Payments"] ?? '',
//         totalNoOfDividend: json["Total No. of Dividend"] ?? '',
//         totalAmountOfDividend: json["Total Amount of Dividend"] ?? '',
//       );

//   Map<String, dynamic> toJson() => {
//         "Min Opening Balance": minOpeningBalance,
//         "Max Opening Balance": maxOpeningBalance,
//         "Min Balance": minBalance,
//         "Median Balance": medianBalance,
//         "Max Balance": maxBalance,
//         "First Day EOD Balance": firstDayEodBalance,
//         "Last Day EOD Balance": lastDayEodBalance,
//         "Opening": opening,
//         "Closing Balance": closingBalance,
//         "Min EOD Balance": minEodBalance,
//         "Max EOD Balance": maxEodBalance,
//         "Median EOD Balance": medianEodBalance,
//         "Total No of Salary Credits": totalNoOfSalaryCredits,
//         "Total Amount of Salary Credits": totalAmountOfSalaryCredits,
//         "Total No. of Credit Transactions": totalNoOfCreditTransactions,
//         "Total Amount of Credit Transactions": totalAmountOfCreditTransactions,
//         "Total No. of Business Credit Transactions":
//             totalNoOfBusinessCreditTransactions,
//         "Total Amount of Business Credit Transactions":
//             totalAmountOfBusinessCreditTransactions,
//         "Total No. of Debit Transactions": totalNoOfDebitTransactions,
//         "Total Amount of Debit Transactions": totalAmountOfDebitTransactions,
//         "Total No. of Cash Deposits": totalNoOfCashDeposits,
//         "Total Amount of Cash Deposits": totalAmountOfCashDeposits,
//         "Total No. of Cash Withdrawals": totalNoOfCashWithdrawals,
//         "chqDeposits": chqDeposits,
//         "Total No. of Cheque Deposits": totalNoOfChequeDeposits,
//         "chqIssues": chqIssues,
//         "Total No. of Cheque Issues": totalNoOfChequeIssues,
//         "totalChqDeposits": totalChqDeposits,
//         "Total Amount of Cheque Deposits": totalAmountOfChequeDeposits,
//         "totalChqIssues": totalChqIssues,
//         "Total Amount of Cheque Issues": totalAmountOfChequeIssues,
//         "No. of EMI / loan payments": noOfEmiLoanPayments,
//         "Total No. of EMI / loan payments": totalNoOfEmiLoanPayments,
//         "Total No.of I / W Bounced": totalNoOfIWBounced,
//         "Sum of I/W Bounced": sumOfIWBounced,
//         "Total amount of I / W Bounced": totalAmountOfIWBounced,
//         "Total Number of Outward Cheque Bounces":
//             totalNumberOfOutwardChequeBounces,
//         "No. of transactions in BS": noOfTransactionsInBs,
//         "totalLoanDisbursal": totalLoanDisbursal,
//         "Total Amount of Loan Disbursal": totalAmountOfLoanDisbursal,
//         "Loan Disbursal": loanDisbursal,
//         "loanDisbursal": august2024LoanDisbursal,
//         "Total No. of Loan Disbursal": totalNoOfLoanDisbursal,
//         "Total No. of I/W Chq Bounced": august2024TotalNoOfIWChqBounced,
//         "Total No. of I / W Chq Bounced": totalNoOfIWChqBounced,
//         "inw_chq_bounce_nonTechnical": inwChqBounceNonTechnical,
//         "Total No. of I / W Cheque Bounce Non Technical":
//             totalNoOfIWChequeBounceNonTechnical,
//         "total_inw_chq_bounce_nonTechnical": totalInwChqBounceNonTechnical,
//         "Total Amount of I / W Cheque Bounce Non Technical":
//             totalAmountOfIWChequeBounceNonTechnical,
//         "salary_count": salaryCount,
//         "startDate":
//             "${august2024StartDate!.year.toString().padLeft(4, '0')}-${august2024StartDate!.month.toString().padLeft(2, '0')}-${august2024StartDate!.day.toString().padLeft(2, '0')}",
//         "Start Date":
//             "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
//         "Is Complete Month Txn": isCompleteMonthTxn,
//         "Average EOD Balance": averageEodBalance,
//         "FOIR": foir,
//         "Employer Name": employerName == null
//             ? []
//             : List<dynamic>.from(employerName!.map((x) => x)),
//         "Avg balance till 10th of month": avgBalanceTill10ThOfMonth,
//         "Avg balance till 20th of month": avgBalanceTill20ThOfMonth,
//         "Avg balance till last date of month": avgBalanceTillLastDateOfMonth,
//         "ABB on 1 14 last day": abbOn114LastDay,
//         "ABB on 1st,14th, 30th/Last Day": abbOn1St14Th30ThLastDay,
//         "Total No. of Net Credit Transactions": totalNoOfNetCreditTransactions,
//         "Total Net Credit Amount": totalNetCreditAmount,
//         "Total No. of Net Debit Transactions": totalNoOfNetDebitTransactions,
//         "Total Net Debit Amount": totalNetDebitAmount,
//         "Total No. of CreditCard Payment": totalNoOfCreditCardPayment,
//         "Total No. of Bills & Utilities": totalNoOfBillsUtilities,
//         "Total No. of Food": totalNoOfFood,
//         "Total No. of Alcohol": totalNoOfAlcohol,
//         "Total No. of Travel": totalNoOfTravel,
//         "Total No. of Entertainment & Lifestyle":
//             totalNoOfEntertainmentLifestyle,
//         "Total No. of Shopping & Purchase": totalNoOfShoppingPurchase,
//         "Total No. of Investment Expense": totalNoOfInvestmentExpense,
//         "Total No. of Gaming": totalNoOfGaming,
//         "Total No. of Personal Loan": totalNoOfPersonalLoan,
//         "Total No. of Home Loan": totalNoOfHomeLoan,
//         "Total No. of Auto Loan ": totalNoOfAutoLoan,
//         "Total No. of Insurance": totalNoOfInsurance,
//         "Total No. of Tax Transaction Debit": totalNoOfTaxTransactionDebit,
//         "Total No. of Transfer to Wallet Transaction":
//             totalNoOfTransferToWalletTransaction,
//         "Total No. of Reversal Transaction Debit":
//             totalNoOfReversalTransactionDebit,
//         "Total No. of Medical Transaction": totalNoOfMedicalTransaction,
//         "Total No. of Charges Transaction": totalNoOfChargesTransaction,
//         "Total No. of Below Minimum Balance Transaction":
//             totalNoOfBelowMinimumBalanceTransaction,
//         "Total No. of Salary Paid Transaction": totalNoOfSalaryPaidTransaction,
//         "Total No. of Transfer Out Transaction":
//             totalNoOfTransferOutTransaction,
//         "Total No. of Foreign Wallet Transaction":
//             totalNoOfForeignWalletTransaction,
//         "Total No. of Other Category Debit Transaction":
//             totalNoOfOtherCategoryDebitTransaction,
//         "Total Amount of Bills & Utilities": totalAmountOfBillsUtilities,
//         "Total Amount of Food": totalAmountOfFood,
//         "Total Amount of Alcohol": totalAmountOfAlcohol,
//         "Total Amount of Personal Loan": totalAmountOfPersonalLoan,
//         "Total Amount of Home Loan": totalAmountOfHomeLoan,
//         "Total Amount of Auto Loan ": totalAmountOfAutoLoan,
//         "Total Amount of Travel": totalAmountOfTravel,
//         "Total Amount of Entertainment & Lifestyle":
//             totalAmountOfEntertainmentLifestyle,
//         "Total Amount of Shopping & Purchase": totalAmountOfShoppingPurchase,
//         "Total Amount of Investment Expense": totalAmountOfInvestmentExpense,
//         "Total Amount of Insurance": totalAmountOfInsurance,
//         "Total Amount of Tax Transaction Debit":
//             totalAmountOfTaxTransactionDebit,
//         "Total Amount of Gaming": totalAmountOfGaming,
//         "Total Amount of Transfer to Wallet Transaction":
//             totalAmountOfTransferToWalletTransaction,
//         "Total Amount of Reversal Transaction Debit":
//             totalAmountOfReversalTransactionDebit,
//         "Total Amount of CreditCard Payment": totalAmountOfCreditCardPayment,
//         "Total Amount of Cash Withdrawals": totalAmountOfCashWithdrawals,
//         "Total Amount of Medical Transaction": totalAmountOfMedicalTransaction,
//         "Total Amount of Charges Transaction": totalAmountOfChargesTransaction,
//         "Total Amount of Below Minimum Balance Transaction":
//             totalAmountOfBelowMinimumBalanceTransaction,
//         "Total Amount of Salary Paid Transaction":
//             totalAmountOfSalaryPaidTransaction,
//         "Total Amount of Transfer Out Transaction":
//             totalAmountOfTransferOutTransaction,
//         "Total Amount of Foreign Wallet Transaction":
//             totalAmountOfForeignWalletTransaction,
//         "Total Amount of EMI / loan Payments": totalAmountOfEmiLoanPayments,
//         "Total Amount of Other Category Debit Transaction":
//             totalAmountOfOtherCategoryDebitTransaction,
//         "Total No. of Mutual Funds": totalNoOfMutualFunds,
//         "Total Debit Amount of Mutual Funds": totalDebitAmountOfMutualFunds,
//         "Total Expense on Crypto Currency": totalExpenseOnCryptoCurrency,
//         "Total Expense on Share Market": totalExpenseOnShareMarket,
//         "Total No. of Gas Bill Payments": totalNoOfGasBillPayments,
//         "Total Amount of Gas Bill Payments": totalAmountOfGasBillPayments,
//         "Total No. of Electricity Bill Payments":
//             totalNoOfElectricityBillPayments,
//         "Total No. of Mobile & Broadband Bill Payments":
//             totalNoOfMobileBroadbandBillPayments,
//         "Total Amount of Mobile & Broadband Bill Payments":
//             totalAmountOfMobileBroadbandBillPayments,
//         "Total Amount of Electricity Bill Payments":
//             totalAmountOfElectricityBillPayments,
//         "Total No. of Dividend": totalNoOfDividend,
//         "Total Amount of Dividend": totalAmountOfDividend,
//       };
// }

// class Overall {
//   num? minOpeningBalance;
//   double? maxOpeningBalance;
//   num? minBalance;
//   double? medianBalance;
//   double? maxBalance;
//   num? firstDayEodBalance;
//   num? lastDayEodBalance;
//   num? opening;
//   num? closingBalance;
//   num? minEodBalance;
//   double? maxEodBalance;
//   double? medianEodBalance;
//   num? totalNoOfSalaryCredits;
//   num? totalAmountOfSalaryCredits;
//   num? totalNoOfCreditTransactions;
//   num? totalAmountOfCreditTransactions;
//   num? totalNoOfBusinessCreditTransactions;
//   num? totalAmountOfBusinessCreditTransactions;
//   num? totalNoOfDebitTransactions;
//   double? totalAmountOfDebitTransactions;
//   num? totalNoOfCashDeposits;
//   num? totalAmountOfCashDeposits;
//   num? totalNoOfCashWithdrawals;
//   num? chqDeposits;
//   num? totalNoOfChequeDeposits;
//   num? chqIssues;
//   num? totalNoOfChequeIssues;
//   num? totalChqDeposits;
//   num? totalAmountOfChequeDeposits;
//   num? totalChqIssues;
//   num? totalAmountOfChequeIssues;
//   num? noOfEmiLoanPayments;
//   num? totalNoOfEmiLoanPayments;
//   num? totalNoOfIWBounced;
//   num? sumOfIWBounced;
//   num? totalAmountOfIWBounced;
//   num? totalNumberOfOutwardChequeBounces;
//   num? noOfTransactionsInBs;
//   num? noOfTransactionsInBsInLast6Months;
//   num? totalAmountOfGamingInLast6Months;
//   num? totalLoanDisbursal;
//   num? totalAmountOfLoanDisbursal;
//   num? loanDisbursal;
//   num? overallLoanDisbursal;
//   num? totalNoOfLoanDisbursal;
//   num? overallTotalNoOfIWChqBounced;
//   num? totalNoOfIWChqBounced;
//   num? inwChqBounceNonTechnical;
//   num? totalNoOfIWChequeBounceNonTechnical;
//   num? totalInwChqBounceNonTechnical;
//   num? totalAmountOfIWChequeBounceNonTechnical;
//   num? salaryCount;
//   num? overallStartDate;
//   num? startDate;
//   double? averageEodBalance;
//   num? totalNoOfSalaryCredits180Days;
//   String? recommendedDateRangeForNach;
//   num? abbOn114LastDay;
//   num? abbOn1St14Th30ThLastDay;
//   num? totalNoOfNetCreditTransactions;
//   num? totalNetCreditAmount;
//   num? totalNoOfNetDebitTransactions;
//   double? totalNetDebitAmount;
//   num? totalNoOfCreditCardPayment;
//   num? totalNoOfBillsUtilities;
//   num? totalNoOfFood;
//   num? totalNoOfAlcohol;
//   num? totalNoOfTravel;
//   num? totalNoOfEntertainmentLifestyle;
//   num? totalNoOfShoppingPurchase;
//   num? totalNoOfInvestmentExpense;
//   num? totalNoOfGaming;
//   num? totalNoOfPersonalLoan;
//   num? totalNoOfHomeLoan;
//   num? totalNoOfAutoLoan;
//   num? totalNoOfInsurance;
//   num? totalNoOfTaxTransactionDebit;
//   num? totalNoOfTransferToWalletTransaction;
//   num? totalNoOfReversalTransactionDebit;
//   num? totalNoOfMedicalTransaction;
//   num? totalNoOfChargesTransaction;
//   num? totalNoOfBelowMinimumBalanceTransaction;
//   num? totalNoOfSalaryPaidTransaction;
//   num? totalNoOfTransferOutTransaction;
//   num? totalNoOfForeignWalletTransaction;
//   num? totalNoOfOtherCategoryDebitTransaction;
//   num? totalAmountOfBillsUtilities;
//   num? totalAmountOfFood;
//   num? totalAmountOfAlcohol;
//   num? totalAmountOfPersonalLoan;
//   num? totalAmountOfHomeLoan;
//   num? totalAmountOfAutoLoan;
//   num? totalAmountOfTravel;
//   num? totalAmountOfEntertainmentLifestyle;
//   num? totalAmountOfShoppingPurchase;
//   num? totalAmountOfInvestmentExpense;
//   num? totalAmountOfInsurance;
//   num? totalAmountOfTaxTransactionDebit;
//   num? totalAmountOfGaming;
//   num? totalAmountOfTransferToWalletTransaction;
//   num? totalAmountOfReversalTransactionDebit;
//   num? totalAmountOfCreditCardPayment;
//   num? totalAmountOfCashWithdrawals;
//   num? totalAmountOfMedicalTransaction;
//   num? totalAmountOfChargesTransaction;
//   num? totalAmountOfBelowMinimumBalanceTransaction;
//   num? totalAmountOfSalaryPaidTransaction;
//   double? totalAmountOfTransferOutTransaction;
//   num? totalAmountOfForeignWalletTransaction;
//   num? totalAmountOfEmiLoanPayments;
//   num? totalAmountOfOtherCategoryDebitTransaction;
//   num? percentOfCashDepositOutOfTotalCreditInAmount;
//   num? percentOfCashDepositOutOfTotalCreditInNumber;
//   num? totalNoOfnumerestReceived;
//   num? totalAmountOfnumerestReceived;
//   num? totalNoOfChequeReturnCharges;
//   num? totalNoOfTechnicalChequeBounces;
//   num? totalNoOfAtmWithdrawalsAbove2000;
//   num? totalEcsNachNumber;
//   num? totalEcsNachAmount;
//   num? totalNoOfDebitnumernalTransfer;
//   num? totalAmountOfDebitnumernalTransfer;
//   num? totalNoOfCreditnumernalTransfer;
//   num? totalAmountOfCreditnumernalTransfer;
//   num? totalNoOfExpenseTransactions;
//   num? totalNoOfHolidayTransactions;
//   double? totalAmountOfHolidayTransactions;
//   num? totalNoOfBouncedOWPayment;
//   num? totalAmountOfBouncedOWPayment;
//   num? totalNoOfPaymentBounceCharges;
//   num? totalAmountOfPaymentBounceCharges;
//   num? totalNoOfnumerestPaid;
//   num? totalAmountOfnumerestPaid;
//   num? totalNoOfDdCancel;
//   num? totalAmountOfDdCancel;
//   num? totalNoOfDdIssue;
//   num? totalAmountOfDdIssue;
//   double? averageCreditAmountLast1Months;
//   double? averageCreditAmountLast2Months;
//   double? averageCreditAmountLast3Months;
//   double? averageCreditAmountLast6Months;
//   String? employmentType;
//   num? salaryFlag;
//   double? avgEodBalanceLast3Months;
//   double? avgEodBalanceInLast6Months;
//   double? avgEodBalanceInLast12Months;
//   num? noOfCreditTransactionsInLast3Months;
//   num? noOfCreditTransactionsInLast6Months;
//   num? noOfCreditTransactionsInLast12Months;
//   num? amountOfCreditTransactionsInLast1Months;
//   num? amountOfCreditTransactionsInLast2Months;
//   num? amountOfCreditTransactionsInLast3Months;
//   num? amountOfCreditTransactionsInLast6Months;
//   num? amountOfCreditTransactionsInLast12Months;
//   num? totalNoOfBusinessCreditTransactionsInLast30Days;
//   num? totalNoOfBusinessCreditTransactionsInLast180Days;
//   num? totalAmountOfBusinessCreditTransactionsInLast30Days;
//   num? totalAmountOfBusinessCreditTransactionsInLast180Days;
//   num? totalNoOfBusinessCreditTransactions0M;
//   num? totalNoOfBusinessCreditTransactions1M;
//   num? totalNoOfBusinessCreditTransactions2M;
//   num? totalNoOfBusinessCreditTransactions3M;
//   num? totalNoOfBusinessCreditTransactions4M;
//   num? totalNoOfBusinessCreditTransactions5M;
//   num? totalNoOfBusinessCreditTransactions6M;
//   num? totalAmountOfBusinessCreditTransactions0M;
//   num? totalAmountOfBusinessCreditTransactions1M;
//   num? totalAmountOfBusinessCreditTransactions2M;
//   num? totalAmountOfBusinessCreditTransactions3M;
//   num? totalAmountOfBusinessCreditTransactions4M;
//   num? totalAmountOfBusinessCreditTransactions5M;
//   num? totalAmountOfBusinessCreditTransactions6M;
//   num? noOfDebitTransactionsInLast3Months;
//   num? noOfDebitTransactionsInLast6Months;
//   num? noOfDebitTransactionsInLast12Months;
//   num? amountOfDebitTransactionsInLast3Months;
//   double? amountOfDebitTransactionsInLast6Months;
//   double? amountOfDebitTransactionsInLast12Months;
//   num? avgSalaryCreditedInLast1Month;
//   num? avgSalaryCreditedInLast3Months;
//   num? avgSalaryCreditedInLast6Months;
//   num? totalLoanCreditedInLast1Month;
//   num? totalLoanCreditedInLast3Months;
//   num? totalLoanCreditedInLast6Months;
//   num? totalLoanCreditedInLast12Months;
//   num? totalNoOfEmiBouncesInLast1Month;
//   num? totalNoOfEmiBouncesInLast2Months;
//   num? totalNoOfEmiBouncesInLast3Months;
//   double? avgEodBalance1M;
//   double? avgEodBalance2M;
//   double? avgEodBalance3M;
//   double? avgEodBalance4M;
//   double? avgEodBalance5M;
//   num? avgEodBalance6M;
//   num? totalSalaryAmount1M;
//   num? totalSalaryAmount2M;
//   num? totalSalaryAmount3M;
//   num? totalSalaryAmount4M;
//   num? totalSalaryAmount5M;
//   num? totalSalaryAmount6M;
//   num? totalNumberOfCashDepositsRange910L;
//   num? totalNumberOfCashDepositsRange1020K;
//   num? totalNumberOfCashDepositsRange4050K;
//   num? totalAmountOfNetCreditTransactions1M;
//   num? totalAmountOfNetCreditTransactions2M;
//   num? totalAmountOfNetCreditTransactions3M;
//   num? totalAmountOfNetCreditTransactions4M;
//   num? totalAmountOfNetCreditTransactions5M;
//   num? totalAmountOfNetCreditTransactions6M;
//   num? totalNoOfNetCreditTransactions1M;
//   num? totalNoOfNetCreditTransactions2M;
//   num? totalNoOfNetCreditTransactions3M;
//   num? totalNoOfNetCreditTransactions4M;
//   num? totalNoOfNetCreditTransactions5M;
//   num? totalNoOfNetCreditTransactions6M;
//   double? avgEodBalanceBelow5001M;
//   double? avgEodBalanceBelow5002M;
//   double? avgEodBalanceBelow5003M;
//   double? avgEodBalanceBelow5004M;
//   double? avgEodBalanceBelow5005M;
//   num? avgEodBalanceBelow5006M;
//   double? avgEodBalanceBelow10001M;
//   double? avgEodBalanceBelow10002M;
//   double? avgEodBalanceBelow10003M;
//   double? avgEodBalanceBelow10004M;
//   double? avgEodBalanceBelow10005M;
//   num? avgEodBalanceBelow10006M;
//   double? avgEodBalanceBelow20001M;
//   double? avgEodBalanceBelow20002M;
//   double? avgEodBalanceBelow20003M;
//   double? avgEodBalanceBelow20004M;
//   double? avgEodBalanceBelow20005M;
//   num? avgEodBalanceBelow20006M;
//   double? avgEodBalanceBelow50001M;
//   double? avgEodBalanceBelow50002M;
//   double? avgEodBalanceBelow50003M;
//   double? avgEodBalanceBelow50004M;
//   double? avgEodBalanceBelow50005M;
//   num? avgEodBalanceBelow50006M;
//   num? totalNoOfEmiBounces;
//   num? totalAmountOfEmiBounces;
//   num? averageCreditLoanAmountInLast3Months;
//   num? averageCreditLoanAmountInLast6Months;
//   num? amountOfInvestmentIncomeLast3Months;
//   num? amountOfInvestmentIncomeLast6Months;
//   num? avgAmountOfInvestmentIncomeLast3Months;
//   num? avgAmountOfInvestmentIncomeLast6Months;
//   num? amountOfSalaryCreditedInLast3Months;
//   num? amountOfSalaryCreditedLast6Months;
//   num? amountOfSalaryCreditedInLast1Month;
//   num? amountOfSalaryCreditedLast12Months;
//   num? totalAmountOfSalaryCreditedInLast3Months;
//   num? noOfSalaryCreditedInLast3Month;
//   num? noOfSalaryCreditedLast6Months;
//   num? noOfSalaryCreditedLast1Month;
//   num? noOfSalaryCreditedLast12Months;
//   double? minimumEodBalanceLast3Months;
//   num? minimumEodBalanceLast6Months;
//   double? maximumEodBalanceLast3Months;
//   double? maximumEodBalanceLast6Months;
//   num? noOfLoanCreditedLast1Month;
//   num? noOfLoanCreditedLast3Months;
//   num? noOfLoanCreditedLast6Months;
//   num? noOfLoanCreditedLast12Months;
//   num? debitAmountOfCreditCardLast1Month;
//   num? debitAmountOfCreditCardLast3Months;
//   num? debitAmountOfCreditCardLast6Months;
//   num? avgDebitAmountOfCreditCardLast3Months;
//   num? avgDebitAmountOfCreditCardLast6Months;
//   num? avgDebitAmountOfCreditCardLast12Months;
//   num? amountOfCashDepositsLast3Months;
//   num? amountOfCashDepositsLast6Months;
//   num? amountOfCashDepositsLast12Months;
//   num? noOfCreditCardPaymentLast1Month;
//   num? noOfCreditCardPaymentLast3Months;
//   num? noOfCreditCardPaymentLast6Months;
//   double? debitCreditRatioForLast1Month;
//   double? debitCreditRatioForLast3Month;
//   double? debitCreditRatioForLast6Month;
//   num? noOfIWChequeBounces1M;
//   num? noOfIWChequeBounces2M;
//   num? noOfIWChequeBounces3M;
//   num? noOfIWChequeBounces4M;
//   num? noOfIWChequeBounces5M;
//   num? noOfIWChequeBounces6M;
//   double? ratioOfAverageBalanceForLast1MTo3M;
//   num? amountOfCashWithdrawalLast3Months;
//   num? amountOfCashWithdrawalLast6Months;
//   num? amountOfCashWithdrawalLast12Months;
//   num? noOfLoanEmiPaymentsLast1Month;
//   num? noOfLoanEmiPaymentsLast3Month;
//   num? amountOfLoanEmiPaymentsLast1Month;
//   num? amountOfLoanEmiPaymentsLast3Month;
//   num? totalNoOfMutualFunds;
//   num? totalDebitAmountOfMutualFunds;
//   num? totalNoOfInvestmentIncomeLast12Months;
//   num? totalAmountOfInvestmentIncomeLast12Months;
//   num? totalExpenseOnCryptoCurrency;
//   num? totalExpenseOnShareMarket;
//   double? standardDeviationOfBalanceLast1Month;
//   double? standardDeviationOfBalanceLast6Months;
//   double? standardDeviationOfBalanceLast3Months;
//   double? coefficientOfVarianceOfBalanceLast1Month;
//   double? coefficientOfVarianceOfBalanceLast3Months;
//   double? coefficientOfVarianceOfBalanceLast6Months;
//   double? standardDeviationOfDebitAmount;
//   double? standardDeviationOfCreditAmount;
//   double? coefficientOfVariationOfDebitAmount;
//   double? coefficientOfVarianceOfCreditAmount;
//   double? medianEodBalanceLast1Month;
//   double? medianEodBalanceLast3Months;
//   double? medianEodBalanceLast6Months;
//   double? minBalanceLast1Month;
//   double? avgMinBalanceLast1Month;
//   double? ratioOfCreditsAmountsIn30DaysTo60Days;
//   num? ratioOfCreditsAmountsIn90DaysTo180Days;
//   double? ratioOfCreditsAmountsIn60DaysTo90Days;
//   num? loanDisbursalAmount1M;
//   num? loanDisbursalAmount2M;
//   num? loanDisbursalAmount3M;
//   num? loanDisbursalAmount4M;
//   num? loanDisbursalAmount5M;
//   num? loanDisbursalAmount6M;
//   num? totalNoOfGasBillPayments;
//   num? totalAmountOfGasBillPayments;
//   num? totalNoOfElectricityBillPayments;
//   num? totalNoOfMobileBroadbandBillPayments;
//   num? totalAmountOfMobileBroadbandBillPayments;
//   num? totalAmountOfElectricityBillPayments;
//   num? totalNoOfDividend;
//   num? totalAmountOfDividend;
//   num? noOfPennyDropTransactions;
//   num? noOfPennyDropTransactionsInLast6Months;
//   num? amountPaidTowardsInsurancePerYear;
//   num? totalVeEventTransactionsInLast1Month;
//   num? totalVeEventTransactionsInLast3Months;
//   num? totalVeEventTransactionsInLast6Months;
//   num? totalAmountOfVeEventTransactionsInLast1Month;
//   num? totalAmountOfVeEventTransactionsInLast3Months;
//   num? totalAmountOfVeEventTransactionsInLast6Months;
//   List<dynamic>? salaryDates;
//   num? amountOfCreditTransactionLast45Days;
//   num? amountOfMoneyPaidTowardsMutualFundPerYear;
//   double? averageVelocity;
//   num? daysSinceLastNegativeDebitEvent;
//   num? amountOfCreditInvestmentTransactionLast12Months;
//   num? businessIncome;
//   num? businessIncomeInLast6Months;
//   num? amountOfNonDiscretionarySpends;
//   num? immediateLoanShareMarketGamingPaymentAfterTakingCreditLine;
//   String? oldestTransactionDate;

//   Overall({
//     this.minOpeningBalance,
//     this.maxOpeningBalance,
//     this.minBalance,
//     this.medianBalance,
//     this.maxBalance,
//     this.firstDayEodBalance,
//     this.lastDayEodBalance,
//     this.opening,
//     this.closingBalance,
//     this.minEodBalance,
//     this.maxEodBalance,
//     this.medianEodBalance,
//     this.totalNoOfSalaryCredits,
//     this.totalAmountOfSalaryCredits,
//     this.totalNoOfCreditTransactions,
//     this.totalAmountOfCreditTransactions,
//     this.totalNoOfBusinessCreditTransactions,
//     this.totalAmountOfBusinessCreditTransactions,
//     this.totalNoOfDebitTransactions,
//     this.totalAmountOfDebitTransactions,
//     this.totalNoOfCashDeposits,
//     this.totalAmountOfCashDeposits,
//     this.totalNoOfCashWithdrawals,
//     this.chqDeposits,
//     this.totalNoOfChequeDeposits,
//     this.chqIssues,
//     this.totalNoOfChequeIssues,
//     this.totalChqDeposits,
//     this.totalAmountOfChequeDeposits,
//     this.totalChqIssues,
//     this.totalAmountOfChequeIssues,
//     this.noOfEmiLoanPayments,
//     this.totalNoOfEmiLoanPayments,
//     this.totalNoOfIWBounced,
//     this.sumOfIWBounced,
//     this.totalAmountOfIWBounced,
//     this.totalNumberOfOutwardChequeBounces,
//     this.noOfTransactionsInBs,
//     this.noOfTransactionsInBsInLast6Months,
//     this.totalAmountOfGamingInLast6Months,
//     this.totalLoanDisbursal,
//     this.totalAmountOfLoanDisbursal,
//     this.loanDisbursal,
//     this.overallLoanDisbursal,
//     this.totalNoOfLoanDisbursal,
//     this.overallTotalNoOfIWChqBounced,
//     this.totalNoOfIWChqBounced,
//     this.inwChqBounceNonTechnical,
//     this.totalNoOfIWChequeBounceNonTechnical,
//     this.totalInwChqBounceNonTechnical,
//     this.totalAmountOfIWChequeBounceNonTechnical,
//     this.salaryCount,
//     this.overallStartDate,
//     this.startDate,
//     this.averageEodBalance,
//     this.totalNoOfSalaryCredits180Days,
//     this.recommendedDateRangeForNach,
//     this.abbOn114LastDay,
//     this.abbOn1St14Th30ThLastDay,
//     this.totalNoOfNetCreditTransactions,
//     this.totalNetCreditAmount,
//     this.totalNoOfNetDebitTransactions,
//     this.totalNetDebitAmount,
//     this.totalNoOfCreditCardPayment,
//     this.totalNoOfBillsUtilities,
//     this.totalNoOfFood,
//     this.totalNoOfAlcohol,
//     this.totalNoOfTravel,
//     this.totalNoOfEntertainmentLifestyle,
//     this.totalNoOfShoppingPurchase,
//     this.totalNoOfInvestmentExpense,
//     this.totalNoOfGaming,
//     this.totalNoOfPersonalLoan,
//     this.totalNoOfHomeLoan,
//     this.totalNoOfAutoLoan,
//     this.totalNoOfInsurance,
//     this.totalNoOfTaxTransactionDebit,
//     this.totalNoOfTransferToWalletTransaction,
//     this.totalNoOfReversalTransactionDebit,
//     this.totalNoOfMedicalTransaction,
//     this.totalNoOfChargesTransaction,
//     this.totalNoOfBelowMinimumBalanceTransaction,
//     this.totalNoOfSalaryPaidTransaction,
//     this.totalNoOfTransferOutTransaction,
//     this.totalNoOfForeignWalletTransaction,
//     this.totalNoOfOtherCategoryDebitTransaction,
//     this.totalAmountOfBillsUtilities,
//     this.totalAmountOfFood,
//     this.totalAmountOfAlcohol,
//     this.totalAmountOfPersonalLoan,
//     this.totalAmountOfHomeLoan,
//     this.totalAmountOfAutoLoan,
//     this.totalAmountOfTravel,
//     this.totalAmountOfEntertainmentLifestyle,
//     this.totalAmountOfShoppingPurchase,
//     this.totalAmountOfInvestmentExpense,
//     this.totalAmountOfInsurance,
//     this.totalAmountOfTaxTransactionDebit,
//     this.totalAmountOfGaming,
//     this.totalAmountOfTransferToWalletTransaction,
//     this.totalAmountOfReversalTransactionDebit,
//     this.totalAmountOfCreditCardPayment,
//     this.totalAmountOfCashWithdrawals,
//     this.totalAmountOfMedicalTransaction,
//     this.totalAmountOfChargesTransaction,
//     this.totalAmountOfBelowMinimumBalanceTransaction,
//     this.totalAmountOfSalaryPaidTransaction,
//     this.totalAmountOfTransferOutTransaction,
//     this.totalAmountOfForeignWalletTransaction,
//     this.totalAmountOfEmiLoanPayments,
//     this.totalAmountOfOtherCategoryDebitTransaction,
//     this.percentOfCashDepositOutOfTotalCreditInAmount,
//     this.percentOfCashDepositOutOfTotalCreditInNumber,
//     this.totalNoOfnumerestReceived,
//     this.totalAmountOfnumerestReceived,
//     this.totalNoOfChequeReturnCharges,
//     this.totalNoOfTechnicalChequeBounces,
//     this.totalNoOfAtmWithdrawalsAbove2000,
//     this.totalEcsNachNumber,
//     this.totalEcsNachAmount,
//     this.totalNoOfDebitnumernalTransfer,
//     this.totalAmountOfDebitnumernalTransfer,
//     this.totalNoOfCreditnumernalTransfer,
//     this.totalAmountOfCreditnumernalTransfer,
//     this.totalNoOfExpenseTransactions,
//     this.totalNoOfHolidayTransactions,
//     this.totalAmountOfHolidayTransactions,
//     this.totalNoOfBouncedOWPayment,
//     this.totalAmountOfBouncedOWPayment,
//     this.totalNoOfPaymentBounceCharges,
//     this.totalAmountOfPaymentBounceCharges,
//     this.totalNoOfnumerestPaid,
//     this.totalAmountOfnumerestPaid,
//     this.totalNoOfDdCancel,
//     this.totalAmountOfDdCancel,
//     this.totalNoOfDdIssue,
//     this.totalAmountOfDdIssue,
//     this.averageCreditAmountLast1Months,
//     this.averageCreditAmountLast2Months,
//     this.averageCreditAmountLast3Months,
//     this.averageCreditAmountLast6Months,
//     this.employmentType,
//     this.salaryFlag,
//     this.avgEodBalanceLast3Months,
//     this.avgEodBalanceInLast6Months,
//     this.avgEodBalanceInLast12Months,
//     this.noOfCreditTransactionsInLast3Months,
//     this.noOfCreditTransactionsInLast6Months,
//     this.noOfCreditTransactionsInLast12Months,
//     this.amountOfCreditTransactionsInLast1Months,
//     this.amountOfCreditTransactionsInLast2Months,
//     this.amountOfCreditTransactionsInLast3Months,
//     this.amountOfCreditTransactionsInLast6Months,
//     this.amountOfCreditTransactionsInLast12Months,
//     this.totalNoOfBusinessCreditTransactionsInLast30Days,
//     this.totalNoOfBusinessCreditTransactionsInLast180Days,
//     this.totalAmountOfBusinessCreditTransactionsInLast30Days,
//     this.totalAmountOfBusinessCreditTransactionsInLast180Days,
//     this.totalNoOfBusinessCreditTransactions0M,
//     this.totalNoOfBusinessCreditTransactions1M,
//     this.totalNoOfBusinessCreditTransactions2M,
//     this.totalNoOfBusinessCreditTransactions3M,
//     this.totalNoOfBusinessCreditTransactions4M,
//     this.totalNoOfBusinessCreditTransactions5M,
//     this.totalNoOfBusinessCreditTransactions6M,
//     this.totalAmountOfBusinessCreditTransactions0M,
//     this.totalAmountOfBusinessCreditTransactions1M,
//     this.totalAmountOfBusinessCreditTransactions2M,
//     this.totalAmountOfBusinessCreditTransactions3M,
//     this.totalAmountOfBusinessCreditTransactions4M,
//     this.totalAmountOfBusinessCreditTransactions5M,
//     this.totalAmountOfBusinessCreditTransactions6M,
//     this.noOfDebitTransactionsInLast3Months,
//     this.noOfDebitTransactionsInLast6Months,
//     this.noOfDebitTransactionsInLast12Months,
//     this.amountOfDebitTransactionsInLast3Months,
//     this.amountOfDebitTransactionsInLast6Months,
//     this.amountOfDebitTransactionsInLast12Months,
//     this.avgSalaryCreditedInLast1Month,
//     this.avgSalaryCreditedInLast3Months,
//     this.avgSalaryCreditedInLast6Months,
//     this.totalLoanCreditedInLast1Month,
//     this.totalLoanCreditedInLast3Months,
//     this.totalLoanCreditedInLast6Months,
//     this.totalLoanCreditedInLast12Months,
//     this.totalNoOfEmiBouncesInLast1Month,
//     this.totalNoOfEmiBouncesInLast2Months,
//     this.totalNoOfEmiBouncesInLast3Months,
//     this.avgEodBalance1M,
//     this.avgEodBalance2M,
//     this.avgEodBalance3M,
//     this.avgEodBalance4M,
//     this.avgEodBalance5M,
//     this.avgEodBalance6M,
//     this.totalSalaryAmount1M,
//     this.totalSalaryAmount2M,
//     this.totalSalaryAmount3M,
//     this.totalSalaryAmount4M,
//     this.totalSalaryAmount5M,
//     this.totalSalaryAmount6M,
//     this.totalNumberOfCashDepositsRange910L,
//     this.totalNumberOfCashDepositsRange1020K,
//     this.totalNumberOfCashDepositsRange4050K,
//     this.totalAmountOfNetCreditTransactions1M,
//     this.totalAmountOfNetCreditTransactions2M,
//     this.totalAmountOfNetCreditTransactions3M,
//     this.totalAmountOfNetCreditTransactions4M,
//     this.totalAmountOfNetCreditTransactions5M,
//     this.totalAmountOfNetCreditTransactions6M,
//     this.totalNoOfNetCreditTransactions1M,
//     this.totalNoOfNetCreditTransactions2M,
//     this.totalNoOfNetCreditTransactions3M,
//     this.totalNoOfNetCreditTransactions4M,
//     this.totalNoOfNetCreditTransactions5M,
//     this.totalNoOfNetCreditTransactions6M,
//     this.avgEodBalanceBelow5001M,
//     this.avgEodBalanceBelow5002M,
//     this.avgEodBalanceBelow5003M,
//     this.avgEodBalanceBelow5004M,
//     this.avgEodBalanceBelow5005M,
//     this.avgEodBalanceBelow5006M,
//     this.avgEodBalanceBelow10001M,
//     this.avgEodBalanceBelow10002M,
//     this.avgEodBalanceBelow10003M,
//     this.avgEodBalanceBelow10004M,
//     this.avgEodBalanceBelow10005M,
//     this.avgEodBalanceBelow10006M,
//     this.avgEodBalanceBelow20001M,
//     this.avgEodBalanceBelow20002M,
//     this.avgEodBalanceBelow20003M,
//     this.avgEodBalanceBelow20004M,
//     this.avgEodBalanceBelow20005M,
//     this.avgEodBalanceBelow20006M,
//     this.avgEodBalanceBelow50001M,
//     this.avgEodBalanceBelow50002M,
//     this.avgEodBalanceBelow50003M,
//     this.avgEodBalanceBelow50004M,
//     this.avgEodBalanceBelow50005M,
//     this.avgEodBalanceBelow50006M,
//     this.totalNoOfEmiBounces,
//     this.totalAmountOfEmiBounces,
//     this.averageCreditLoanAmountInLast3Months,
//     this.averageCreditLoanAmountInLast6Months,
//     this.amountOfInvestmentIncomeLast3Months,
//     this.amountOfInvestmentIncomeLast6Months,
//     this.avgAmountOfInvestmentIncomeLast3Months,
//     this.avgAmountOfInvestmentIncomeLast6Months,
//     this.amountOfSalaryCreditedInLast3Months,
//     this.amountOfSalaryCreditedLast6Months,
//     this.amountOfSalaryCreditedInLast1Month,
//     this.amountOfSalaryCreditedLast12Months,
//     this.totalAmountOfSalaryCreditedInLast3Months,
//     this.noOfSalaryCreditedInLast3Month,
//     this.noOfSalaryCreditedLast6Months,
//     this.noOfSalaryCreditedLast1Month,
//     this.noOfSalaryCreditedLast12Months,
//     this.minimumEodBalanceLast3Months,
//     this.minimumEodBalanceLast6Months,
//     this.maximumEodBalanceLast3Months,
//     this.maximumEodBalanceLast6Months,
//     this.noOfLoanCreditedLast1Month,
//     this.noOfLoanCreditedLast3Months,
//     this.noOfLoanCreditedLast6Months,
//     this.noOfLoanCreditedLast12Months,
//     this.debitAmountOfCreditCardLast1Month,
//     this.debitAmountOfCreditCardLast3Months,
//     this.debitAmountOfCreditCardLast6Months,
//     this.avgDebitAmountOfCreditCardLast3Months,
//     this.avgDebitAmountOfCreditCardLast6Months,
//     this.avgDebitAmountOfCreditCardLast12Months,
//     this.amountOfCashDepositsLast3Months,
//     this.amountOfCashDepositsLast6Months,
//     this.amountOfCashDepositsLast12Months,
//     this.noOfCreditCardPaymentLast1Month,
//     this.noOfCreditCardPaymentLast3Months,
//     this.noOfCreditCardPaymentLast6Months,
//     this.debitCreditRatioForLast1Month,
//     this.debitCreditRatioForLast3Month,
//     this.debitCreditRatioForLast6Month,
//     this.noOfIWChequeBounces1M,
//     this.noOfIWChequeBounces2M,
//     this.noOfIWChequeBounces3M,
//     this.noOfIWChequeBounces4M,
//     this.noOfIWChequeBounces5M,
//     this.noOfIWChequeBounces6M,
//     this.ratioOfAverageBalanceForLast1MTo3M,
//     this.amountOfCashWithdrawalLast3Months,
//     this.amountOfCashWithdrawalLast6Months,
//     this.amountOfCashWithdrawalLast12Months,
//     this.noOfLoanEmiPaymentsLast1Month,
//     this.noOfLoanEmiPaymentsLast3Month,
//     this.amountOfLoanEmiPaymentsLast1Month,
//     this.amountOfLoanEmiPaymentsLast3Month,
//     this.totalNoOfMutualFunds,
//     this.totalDebitAmountOfMutualFunds,
//     this.totalNoOfInvestmentIncomeLast12Months,
//     this.totalAmountOfInvestmentIncomeLast12Months,
//     this.totalExpenseOnCryptoCurrency,
//     this.totalExpenseOnShareMarket,
//     this.standardDeviationOfBalanceLast1Month,
//     this.standardDeviationOfBalanceLast6Months,
//     this.standardDeviationOfBalanceLast3Months,
//     this.coefficientOfVarianceOfBalanceLast1Month,
//     this.coefficientOfVarianceOfBalanceLast3Months,
//     this.coefficientOfVarianceOfBalanceLast6Months,
//     this.standardDeviationOfDebitAmount,
//     this.standardDeviationOfCreditAmount,
//     this.coefficientOfVariationOfDebitAmount,
//     this.coefficientOfVarianceOfCreditAmount,
//     this.medianEodBalanceLast1Month,
//     this.medianEodBalanceLast3Months,
//     this.medianEodBalanceLast6Months,
//     this.minBalanceLast1Month,
//     this.avgMinBalanceLast1Month,
//     this.ratioOfCreditsAmountsIn30DaysTo60Days,
//     this.ratioOfCreditsAmountsIn90DaysTo180Days,
//     this.ratioOfCreditsAmountsIn60DaysTo90Days,
//     this.loanDisbursalAmount1M,
//     this.loanDisbursalAmount2M,
//     this.loanDisbursalAmount3M,
//     this.loanDisbursalAmount4M,
//     this.loanDisbursalAmount5M,
//     this.loanDisbursalAmount6M,
//     this.totalNoOfGasBillPayments,
//     this.totalAmountOfGasBillPayments,
//     this.totalNoOfElectricityBillPayments,
//     this.totalNoOfMobileBroadbandBillPayments,
//     this.totalAmountOfMobileBroadbandBillPayments,
//     this.totalAmountOfElectricityBillPayments,
//     this.totalNoOfDividend,
//     this.totalAmountOfDividend,
//     this.noOfPennyDropTransactions,
//     this.noOfPennyDropTransactionsInLast6Months,
//     this.amountPaidTowardsInsurancePerYear,
//     this.totalVeEventTransactionsInLast1Month,
//     this.totalVeEventTransactionsInLast3Months,
//     this.totalVeEventTransactionsInLast6Months,
//     this.totalAmountOfVeEventTransactionsInLast1Month,
//     this.totalAmountOfVeEventTransactionsInLast3Months,
//     this.totalAmountOfVeEventTransactionsInLast6Months,
//     this.salaryDates,
//     this.amountOfCreditTransactionLast45Days,
//     this.amountOfMoneyPaidTowardsMutualFundPerYear,
//     this.averageVelocity,
//     this.daysSinceLastNegativeDebitEvent,
//     this.amountOfCreditInvestmentTransactionLast12Months,
//     this.businessIncome,
//     this.businessIncomeInLast6Months,
//     this.amountOfNonDiscretionarySpends,
//     this.immediateLoanShareMarketGamingPaymentAfterTakingCreditLine,
//     this.oldestTransactionDate,
//   });

//   factory Overall.fromJson(Map<String, dynamic> json) => Overall(
//         minOpeningBalance: json["Min Opening Balance"] ??0.0,
//         maxOpeningBalance: json["Max Opening Balance"]?.toDouble()??0.0,
//         minBalance: json["Min Balance"]??0.0,
//         medianBalance: json["Median Balance"]?.toDouble()??0.0,
//         maxBalance: json["Max Balance"]?.toDouble()??0.0,
//         firstDayEodBalance: json["First Day EOD Balance"]??0.0,
//         lastDayEodBalance: json["Last Day EOD Balance"]??0.0,
//         opening: json["Opening"]??0.0,
//         closingBalance: json["Closing Balance"]??0.0,
//         minEodBalance: json["Min EOD Balance"]??0.0,
//         maxEodBalance: json["Max EOD Balance"]?.toDouble()??0.0,
//         medianEodBalance: json["Median EOD Balance"]?.toDouble()??0.0,
//         totalNoOfSalaryCredits: json["Total No of Salary Credits"]??0.0,
//         totalAmountOfSalaryCredits: json["Total Amount of Salary Credits"]??0.0,
//         totalNoOfCreditTransactions: json["Total No. of Credit Transactions"]??0.0,
//         totalAmountOfCreditTransactions:
//             json["Total Amount of Credit Transactions"]??0.0,
//         totalNoOfBusinessCreditTransactions:
//             json["Total No. of Business Credit Transactions"]??0.0,
//         totalAmountOfBusinessCreditTransactions:
//             json["Total Amount of Business Credit Transactions"]??0.0,
//         totalNoOfDebitTransactions: json["Total No. of Debit Transactions"]??0.0,
//         totalAmountOfDebitTransactions:
//             json["Total Amount of Debit Transactions"]?.toDouble()??0.0,
//         totalNoOfCashDeposits: json["Total No. of Cash Deposits"]??0.0,
//         totalAmountOfCashDeposits: json["Total Amount of Cash Deposits"]??0.0,
//         totalNoOfCashWithdrawals: json["Total No. of Cash Withdrawals"]??0.0,
//         chqDeposits: json["chqDeposits"]??0.0,
//         totalNoOfChequeDeposits: json["Total No. of Cheque Deposits"]??0.0,
//         chqIssues: json["chqIssues"]??0.0,
//         totalNoOfChequeIssues: json["Total No. of Cheque Issues"]??0.0,
//         totalChqDeposits: json["totalChqDeposits"]??0.0,
//         totalAmountOfChequeDeposits: json["Total Amount of Cheque Deposits"]??0.0,
//         totalChqIssues: json["totalChqIssues"]??0.0,
//         totalAmountOfChequeIssues: json["Total Amount of Cheque Issues"]??0.0,
//         noOfEmiLoanPayments: json["No. of EMI / loan payments"]??0.0,
//         totalNoOfEmiLoanPayments: json["Total No. of EMI / loan payments"]??0.0,
//         totalNoOfIWBounced: json["Total No.of I / W Bounced"]??0.0,
//         sumOfIWBounced: json["Sum of I/W Bounced"]??0.0,
//         totalAmountOfIWBounced: json["Total amount of I / W Bounced"]??0.0,
//         totalNumberOfOutwardChequeBounces:
//             json["Total Number of Outward Cheque Bounces"]??0.0,
//         noOfTransactionsInBs: json["No. of transactions in BS"]??0.0,
//         noOfTransactionsInBsInLast6Months:
//             json["No. of transactions in BS in last 6 months"]??0.0,
//         totalAmountOfGamingInLast6Months:
//             json["Total amount of Gaming in last 6 months"]??0.0,
//         totalLoanDisbursal: json["totalLoanDisbursal"],
//         totalAmountOfLoanDisbursal: json["Total Amount of Loan Disbursal"]??0.0,
//         loanDisbursal: json["Loan Disbursal"]??0.0,
//         overallLoanDisbursal: json["loanDisbursal"]??0.0,
//         totalNoOfLoanDisbursal: json["Total No. of Loan Disbursal"]??0.0,
//         overallTotalNoOfIWChqBounced: json["Total No. of I/W Chq Bounced"]??0.0,
//         totalNoOfIWChqBounced: json["Total No. of I / W Chq Bounced"]??0.0,
//         inwChqBounceNonTechnical: json["inw_chq_bounce_nonTechnical"]??0.0,
//         totalNoOfIWChequeBounceNonTechnical:
//             json["Total No. of I / W Cheque Bounce Non Technical"]??0.0,
//         totalInwChqBounceNonTechnical:
//             json["total_inw_chq_bounce_nonTechnical"]??0.0,
//         totalAmountOfIWChequeBounceNonTechnical:
//             json["Total Amount of I / W Cheque Bounce Non Technical"]??0.0,
//         salaryCount: json["salary_count"]??0.0,
//         overallStartDate: json["startDate"]??0.0,
//         startDate: json["Start Date"]??0.0,
//         averageEodBalance: json["Average EOD Balance"]?.toDouble()??0.0,
//         totalNoOfSalaryCredits180Days:
//             json["Total No of Salary Credits 180 days"]??0.0,
//         recommendedDateRangeForNach: json["Recommended Date Range for NACH"]??'',
//         abbOn114LastDay: json["ABB on 1 14 last day"]??0.0,
//         abbOn1St14Th30ThLastDay: json["ABB on 1st,14th, 30th/Last Day"]??0.0,
//         totalNoOfNetCreditTransactions:
//             json["Total No. of Net Credit Transactions"]??0.0,
//         totalNetCreditAmount: json["Total Net Credit Amount"]??0.0,
//         totalNoOfNetDebitTransactions:
//             json["Total No. of Net Debit Transactions"]??0.0,
//         totalNetDebitAmount: json["Total Net Debit Amount"]?.toDouble()??0.0,
//         totalNoOfCreditCardPayment: json["Total No. of CreditCard Payment"]??0.0,
//         totalNoOfBillsUtilities: json["Total No. of Bills & Utilities"]??0.0,
//         totalNoOfFood: json["Total No. of Food"]??0.0,
//         totalNoOfAlcohol: json["Total No. of Alcohol"]??0.0,
//         totalNoOfTravel: json["Total No. of Travel"]??0.0,
//         totalNoOfEntertainmentLifestyle:
//             json["Total No. of Entertainment & Lifestyle"]??0.0,
//         totalNoOfShoppingPurchase: json["Total No. of Shopping & Purchase"]??0.0,
//         totalNoOfInvestmentExpense: json["Total No. of Investment Expense"]??0.0,
//         totalNoOfGaming: json["Total No. of Gaming"]??0.0,
//         totalNoOfPersonalLoan: json["Total No. of Personal Loan"]??0.0,
//         totalNoOfHomeLoan: json["Total No. of Home Loan"] ??0.0,
//         totalNoOfAutoLoan: json["Total No. of Auto Loan "]??0.0,
//         totalNoOfInsurance: json["Total No. of Insurance"]??0.0,
//         totalNoOfTaxTransactionDebit:
//             json["Total No. of Tax Transaction Debit"]??0.0,
//         totalNoOfTransferToWalletTransaction:
//             json["Total No. of Transfer to Wallet Transaction"]??0.0,
//         totalNoOfReversalTransactionDebit:
//             json["Total No. of Reversal Transaction Debit"]??0.0,
//         totalNoOfMedicalTransaction: json["Total No. of Medical Transaction"]??0.0,
//         totalNoOfChargesTransaction: json["Total No. of Charges Transaction"]??0.0,
//         totalNoOfBelowMinimumBalanceTransaction:
//             json["Total No. of Below Minimum Balance Transaction"]??0.0,
//         totalNoOfSalaryPaidTransaction:
//             json["Total No. of Salary Paid Transaction"]??0.0,
//         totalNoOfTransferOutTransaction:
//             json["Total No. of Transfer Out Transaction"]??0.0,
//         totalNoOfForeignWalletTransaction:
//             json["Total No. of Foreign Wallet Transaction"]??0.0,
//         totalNoOfOtherCategoryDebitTransaction:
//             json["Total No. of Other Category Debit Transaction"]??0.0,
//         totalAmountOfBillsUtilities: json["Total Amount of Bills & Utilities"]??0.0,
//         totalAmountOfFood: json["Total Amount of Food"]??0.0,
//         totalAmountOfAlcohol: json["Total Amount of Alcohol"]??0.0,
//         totalAmountOfPersonalLoan: json["Total Amount of Personal Loan"]??0.0,
//         totalAmountOfHomeLoan: json["Total Amount of Home Loan"]??0.0,
//         totalAmountOfAutoLoan: json["Total Amount of Auto Loan "]??0.0,
//         totalAmountOfTravel: json["Total Amount of Travel"]??0.0,
//         totalAmountOfEntertainmentLifestyle:
//             json["Total Amount of Entertainment & Lifestyle"]??0.0,
//         totalAmountOfShoppingPurchase:
//             json["Total Amount of Shopping & Purchase"]??0.0,
//         totalAmountOfInvestmentExpense:
//             json["Total Amount of Investment Expense"]??0.0,
//         totalAmountOfInsurance: json["Total Amount of Insurance"]??0.0,
//         totalAmountOfTaxTransactionDebit:
//             json["Total Amount of Tax Transaction Debit"]??0.0,
//         totalAmountOfGaming: json["Total Amount of Gaming"]??0.0,
//         totalAmountOfTransferToWalletTransaction:
//             json["Total Amount of Transfer to Wallet Transaction"]??0.0,
//         totalAmountOfReversalTransactionDebit:
//             json["Total Amount of Reversal Transaction Debit"]??0.0,
//         totalAmountOfCreditCardPayment:
//             json["Total Amount of CreditCard Payment"],
//         totalAmountOfCashWithdrawals: json["Total Amount of Cash Withdrawals"]??0.0,
//         totalAmountOfMedicalTransaction:
//             json["Total Amount of Medical Transaction"]??0.0,
//         totalAmountOfChargesTransaction:
//             json["Total Amount of Charges Transaction"]??0.0,
//         totalAmountOfBelowMinimumBalanceTransaction:
//             json["Total Amount of Below Minimum Balance Transaction"]??0.0,
//         totalAmountOfSalaryPaidTransaction:
//             json["Total Amount of Salary Paid Transaction"]??0.0,
//         totalAmountOfTransferOutTransaction:
//             json["Total Amount of Transfer Out Transaction"]?.toDouble()??0.0,
//         totalAmountOfForeignWalletTransaction:
//             json["Total Amount of Foreign Wallet Transaction"]??0.0,
//         totalAmountOfEmiLoanPayments:
//             json["Total Amount of EMI / loan Payments"]??0.0,
//         totalAmountOfOtherCategoryDebitTransaction:
//             json["Total Amount of Other Category Debit Transaction"]??0.0,
//         percentOfCashDepositOutOfTotalCreditInAmount:
//             json["Percent of Cash Deposit out of total Credit in Amount"]??0.0,
//         percentOfCashDepositOutOfTotalCreditInNumber:
//             json["Percent of Cash Deposit out of total Credit in Number"]??0.0,
//         totalNoOfnumerestReceived: json["Total No. of numerest Received"]??0.0,
//         totalAmountOfnumerestReceived:
//             json["Total Amount of numerest Received"]??0.0,
//         totalNoOfChequeReturnCharges:
//             json["Total No. of Cheque Return Charges"]??0.0,
//         totalNoOfTechnicalChequeBounces:
//             json["Total No. of Technical Cheque Bounces"]??0.0,
//         totalNoOfAtmWithdrawalsAbove2000:
//             json["Total No. of ATM Withdrawals above 2000"],
//         totalEcsNachNumber: json["Total ECS Nach Number"],
//         totalEcsNachAmount: json["Total ECS Nach Amount"],
//         totalNoOfDebitnumernalTransfer:
//             json["Total No. of Debit numernal Transfer"],
//         totalAmountOfDebitnumernalTransfer:
//             json["Total Amount of Debit numernal Transfer"],
//         totalNoOfCreditnumernalTransfer:
//             json["Total No. of Credit numernal Transfer"],
//         totalAmountOfCreditnumernalTransfer:
//             json["Total Amount of Credit numernal Transfer"],
//         totalNoOfExpenseTransactions: json["Total no. of expense transactions"],
//         totalNoOfHolidayTransactions: json["Total No. of Holiday Transactions"],
//         totalAmountOfHolidayTransactions:
//             json["Total Amount of Holiday Transactions"]?.toDouble(),
//         totalNoOfBouncedOWPayment: json["Total No of Bounced O/W Payment"],
//         totalAmountOfBouncedOWPayment:
//             json["Total Amount of Bounced O/W Payment"],
//         totalNoOfPaymentBounceCharges:
//             json["Total No of Payment Bounce Charges"],
//         totalAmountOfPaymentBounceCharges:
//             json["Total Amount of Payment Bounce Charges"],
//         totalNoOfnumerestPaid: json["Total No of numerest Paid"],
//         totalAmountOfnumerestPaid: json["Total Amount of numerest Paid"],
//         totalNoOfDdCancel: json["Total No of DD Cancel"],
//         totalAmountOfDdCancel: json["Total Amount of DD Cancel"],
//         totalNoOfDdIssue: json["Total No of DD Issue"],
//         totalAmountOfDdIssue: json["Total Amount of DD Issue"],
//         averageCreditAmountLast1Months:
//             json["Average Credit amount last 1 months"]?.toDouble(),
//         averageCreditAmountLast2Months:
//             json["Average Credit amount last 2 months"]?.toDouble(),
//         averageCreditAmountLast3Months:
//             json["Average Credit amount last 3 months"]?.toDouble(),
//         averageCreditAmountLast6Months:
//             json["Average Credit amount last 6 months"]?.toDouble(),
//         employmentType: json["Employment Type"],
//         salaryFlag: json["Salary Flag"],
//         avgEodBalanceLast3Months:
//             json["Avg EOD Balance last 3 months"]?.toDouble(),
//         avgEodBalanceInLast6Months:
//             json["Avg EOD Balance in last 6 months"]?.toDouble(),
//         avgEodBalanceInLast12Months:
//             json["Avg EOD Balance in last 12 months"]?.toDouble(),
//         noOfCreditTransactionsInLast3Months:
//             json["No. of Credit Transactions in last 3 months"],
//         noOfCreditTransactionsInLast6Months:
//             json["No. of Credit Transactions in last 6 months"],
//         noOfCreditTransactionsInLast12Months:
//             json["No. of Credit Transactions in last 12 months"],
//         amountOfCreditTransactionsInLast1Months:
//             json["Amount of Credit Transactions in last 1 months"],
//         amountOfCreditTransactionsInLast2Months:
//             json["Amount of Credit Transactions in last 2 months"],
//         amountOfCreditTransactionsInLast3Months:
//             json["Amount of Credit Transactions in last 3 months"],
//         amountOfCreditTransactionsInLast6Months:
//             json["Amount of Credit Transactions in last 6 months"],
//         amountOfCreditTransactionsInLast12Months:
//             json["Amount of Credit Transactions in last 12 months"],
//         totalNoOfBusinessCreditTransactionsInLast30Days:
//             json["Total No. of Business Credit Transactions in last 30 days"],
//         totalNoOfBusinessCreditTransactionsInLast180Days:
//             json["Total No. of Business Credit Transactions in last 180 days"],
//         totalAmountOfBusinessCreditTransactionsInLast30Days: json[
//             "Total Amount of Business Credit Transactions in last 30 days"],
//         totalAmountOfBusinessCreditTransactionsInLast180Days: json[
//             "Total Amount of Business Credit Transactions in last 180 days"],
//         totalNoOfBusinessCreditTransactions0M:
//             json["Total No. of Business Credit Transactions 0M"],
//         totalNoOfBusinessCreditTransactions1M:
//             json["Total No. of Business Credit Transactions 1M"],
//         totalNoOfBusinessCreditTransactions2M:
//             json["Total No. of Business Credit Transactions 2M"],
//         totalNoOfBusinessCreditTransactions3M:
//             json["Total No. of Business Credit Transactions 3M"],
//         totalNoOfBusinessCreditTransactions4M:
//             json["Total No. of Business Credit Transactions 4M"],
//         totalNoOfBusinessCreditTransactions5M:
//             json["Total No. of Business Credit Transactions 5M"],
//         totalNoOfBusinessCreditTransactions6M:
//             json["Total No. of Business Credit Transactions 6M"],
//         totalAmountOfBusinessCreditTransactions0M:
//             json["Total Amount of Business Credit Transactions 0M"],
//         totalAmountOfBusinessCreditTransactions1M:
//             json["Total Amount of Business Credit Transactions 1M"],
//         totalAmountOfBusinessCreditTransactions2M:
//             json["Total Amount of Business Credit Transactions 2M"],
//         totalAmountOfBusinessCreditTransactions3M:
//             json["Total Amount of Business Credit Transactions 3M"],
//         totalAmountOfBusinessCreditTransactions4M:
//             json["Total Amount of Business Credit Transactions 4M"],
//         totalAmountOfBusinessCreditTransactions5M:
//             json["Total Amount of Business Credit Transactions 5M"],
//         totalAmountOfBusinessCreditTransactions6M:
//             json["Total Amount of Business Credit Transactions 6M"],
//         noOfDebitTransactionsInLast3Months:
//             json["No. of Debit Transactions in last 3 months"],
//         noOfDebitTransactionsInLast6Months:
//             json["No. of Debit Transactions in last 6 months"],
//         noOfDebitTransactionsInLast12Months:
//             json["No. of Debit Transactions in last 12 months"],
//         amountOfDebitTransactionsInLast3Months:
//             json["Amount of Debit Transactions in last 3 months"],
//         amountOfDebitTransactionsInLast6Months:
//             json["Amount of Debit Transactions in last 6 months"]?.toDouble(),
//         amountOfDebitTransactionsInLast12Months:
//             json["Amount of Debit Transactions in last 12 months"]?.toDouble(),
//         avgSalaryCreditedInLast1Month:
//             json["Avg Salary Credited in last 1 month"],
//         avgSalaryCreditedInLast3Months:
//             json["Avg Salary Credited in last 3 months"],
//         avgSalaryCreditedInLast6Months:
//             json["Avg Salary Credited in last 6 months"],
//         totalLoanCreditedInLast1Month:
//             json["Total Loan Credited in last 1 month"],
//         totalLoanCreditedInLast3Months:
//             json["Total Loan Credited in last 3 months"],
//         totalLoanCreditedInLast6Months:
//             json["Total Loan Credited in last 6 months"],
//         totalLoanCreditedInLast12Months:
//             json["Total Loan Credited in last 12 months"],
//         totalNoOfEmiBouncesInLast1Month:
//             json["Total No. of EMI bounces in last 1 month"],
//         totalNoOfEmiBouncesInLast2Months:
//             json["Total No. of EMI bounces in last 2 months"],
//         totalNoOfEmiBouncesInLast3Months:
//             json["Total No. of EMI bounces in last 3 months"],
//         avgEodBalance1M: json["Avg EOD Balance 1M"]?.toDouble(),
//         avgEodBalance2M: json["Avg EOD Balance 2M"]?.toDouble(),
//         avgEodBalance3M: json["Avg EOD Balance 3M"]?.toDouble(),
//         avgEodBalance4M: json["Avg EOD Balance 4M"]?.toDouble(),
//         avgEodBalance5M: json["Avg EOD Balance 5M"]?.toDouble(),
//         avgEodBalance6M: json["Avg EOD Balance 6M"],
//         totalSalaryAmount1M: json["Total Salary Amount 1M"],
//         totalSalaryAmount2M: json["Total Salary Amount 2M"],
//         totalSalaryAmount3M: json["Total Salary Amount 3M"],
//         totalSalaryAmount4M: json["Total Salary Amount 4M"],
//         totalSalaryAmount5M: json["Total Salary Amount 5M"],
//         totalSalaryAmount6M: json["Total Salary Amount 6M"],
//         totalNumberOfCashDepositsRange910L:
//             json["total number of cash deposits range 9 10l"],
//         totalNumberOfCashDepositsRange1020K:
//             json["total number of cash deposits range 10 20k"],
//         totalNumberOfCashDepositsRange4050K:
//             json["total number of cash deposits range 40 50k"],
//         totalAmountOfNetCreditTransactions1M:
//             json["Total Amount of Net Credit Transactions 1M"],
//         totalAmountOfNetCreditTransactions2M:
//             json["Total Amount of Net Credit Transactions 2M"],
//         totalAmountOfNetCreditTransactions3M:
//             json["Total Amount of Net Credit Transactions 3M"],
//         totalAmountOfNetCreditTransactions4M:
//             json["Total Amount of Net Credit Transactions 4M"],
//         totalAmountOfNetCreditTransactions5M:
//             json["Total Amount of Net Credit Transactions 5M"],
//         totalAmountOfNetCreditTransactions6M:
//             json["Total Amount of Net Credit Transactions 6M"],
//         totalNoOfNetCreditTransactions1M:
//             json["Total No. of Net Credit Transactions 1M"],
//         totalNoOfNetCreditTransactions2M:
//             json["Total No. of Net Credit Transactions 2M"],
//         totalNoOfNetCreditTransactions3M:
//             json["Total No. of Net Credit Transactions 3M"],
//         totalNoOfNetCreditTransactions4M:
//             json["Total No. of Net Credit Transactions 4M"],
//         totalNoOfNetCreditTransactions5M:
//             json["Total No. of Net Credit Transactions 5M"],
//         totalNoOfNetCreditTransactions6M:
//             json["Total No. of Net Credit Transactions 6M"],
//         avgEodBalanceBelow5001M:
//             json["Avg EOD Balance below 500 1M"]?.toDouble(),
//         avgEodBalanceBelow5002M:
//             json["Avg EOD Balance below 500 2M"]?.toDouble(),
//         avgEodBalanceBelow5003M:
//             json["Avg EOD Balance below 500 3M"]?.toDouble(),
//         avgEodBalanceBelow5004M:
//             json["Avg EOD Balance below 500 4M"]?.toDouble(),
//         avgEodBalanceBelow5005M:
//             json["Avg EOD Balance below 500 5M"]?.toDouble(),
//         avgEodBalanceBelow5006M: json["Avg EOD Balance below 500 6M"],
//         avgEodBalanceBelow10001M:
//             json["Avg EOD Balance below 1000 1M"]?.toDouble(),
//         avgEodBalanceBelow10002M:
//             json["Avg EOD Balance below 1000 2M"]?.toDouble(),
//         avgEodBalanceBelow10003M:
//             json["Avg EOD Balance below 1000 3M"]?.toDouble(),
//         avgEodBalanceBelow10004M:
//             json["Avg EOD Balance below 1000 4M"]?.toDouble(),
//         avgEodBalanceBelow10005M:
//             json["Avg EOD Balance below 1000 5M"]?.toDouble(),
//         avgEodBalanceBelow10006M: json["Avg EOD Balance below 1000 6M"],
//         avgEodBalanceBelow20001M:
//             json["Avg EOD Balance below 2000 1M"]?.toDouble(),
//         avgEodBalanceBelow20002M:
//             json["Avg EOD Balance below 2000 2M"]?.toDouble(),
//         avgEodBalanceBelow20003M:
//             json["Avg EOD Balance below 2000 3M"]?.toDouble(),
//         avgEodBalanceBelow20004M:
//             json["Avg EOD Balance below 2000 4M"]?.toDouble(),
//         avgEodBalanceBelow20005M:
//             json["Avg EOD Balance below 2000 5M"]?.toDouble(),
//         avgEodBalanceBelow20006M: json["Avg EOD Balance below 2000 6M"],
//         avgEodBalanceBelow50001M:
//             json["Avg EOD Balance below 5000 1M"]?.toDouble(),
//         avgEodBalanceBelow50002M:
//             json["Avg EOD Balance below 5000 2M"]?.toDouble(),
//         avgEodBalanceBelow50003M:
//             json["Avg EOD Balance below 5000 3M"]?.toDouble(),
//         avgEodBalanceBelow50004M:
//             json["Avg EOD Balance below 5000 4M"]?.toDouble(),
//         avgEodBalanceBelow50005M:
//             json["Avg EOD Balance below 5000 5M"]?.toDouble(),
//         avgEodBalanceBelow50006M: json["Avg EOD Balance below 5000 6M"],
//         totalNoOfEmiBounces: json["Total No. of EMI Bounces"],
//         totalAmountOfEmiBounces: json["Total Amount of EMI Bounces"],
//         averageCreditLoanAmountInLast3Months:
//             json["Average Credit Loan Amount in Last 3 Months"],
//         averageCreditLoanAmountInLast6Months:
//             json["Average Credit Loan Amount in Last 6 Months"],
//         amountOfInvestmentIncomeLast3Months:
//             json["Amount of Investment Income Last 3 Months"],
//         amountOfInvestmentIncomeLast6Months:
//             json["Amount of Investment Income Last 6 Months"],
//         avgAmountOfInvestmentIncomeLast3Months:
//             json["Avg Amount of Investment Income Last 3 Months"],
//         avgAmountOfInvestmentIncomeLast6Months:
//             json["Avg Amount of Investment Income Last 6 Months"],
//         amountOfSalaryCreditedInLast3Months:
//             json["Amount of Salary Credited in last 3 months"],
//         amountOfSalaryCreditedLast6Months:
//             json["Amount of Salary Credited Last 6 Months"],
//         amountOfSalaryCreditedInLast1Month:
//             json["Amount of Salary Credited in last 1 month"],
//         amountOfSalaryCreditedLast12Months:
//             json["Amount of Salary Credited Last 12 Months"],
//         totalAmountOfSalaryCreditedInLast3Months:
//             json["Total Amount of Salary Credited in Last 3 Months"],
//         noOfSalaryCreditedInLast3Month:
//             json["No. of Salary Credited in last 3 month"],
//         noOfSalaryCreditedLast6Months:
//             json["No. of  Salary Credited Last 6 Months"],
//         noOfSalaryCreditedLast1Month:
//             json["No. of  Salary Credited Last 1 Month"],
//         noOfSalaryCreditedLast12Months:
//             json["No. of  Salary Credited Last 12 Months"],
//         minimumEodBalanceLast3Months:
//             json["Minimum EOD Balance Last 3 Months"]?.toDouble(),
//         minimumEodBalanceLast6Months: json["Minimum EOD Balance Last 6 Months"],
//         maximumEodBalanceLast3Months:
//             json["Maximum EOD Balance Last 3 Months"]?.toDouble(),
//         maximumEodBalanceLast6Months:
//             json["Maximum EOD Balance Last 6 Months"]?.toDouble(),
//         noOfLoanCreditedLast1Month: json["No. of Loan Credited Last 1 Month"],
//         noOfLoanCreditedLast3Months: json["No. of Loan Credited Last 3 Months"],
//         noOfLoanCreditedLast6Months: json["No. of Loan Credited Last 6 Months"],
//         noOfLoanCreditedLast12Months:
//             json["No. of Loan Credited Last 12 Months"],
//         debitAmountOfCreditCardLast1Month:
//             json["Debit Amount of Credit Card Last 1 Month"],
//         debitAmountOfCreditCardLast3Months:
//             json["Debit Amount of Credit Card Last 3 Months"],
//         debitAmountOfCreditCardLast6Months:
//             json["Debit Amount of Credit Card Last 6 Months"],
//         avgDebitAmountOfCreditCardLast3Months:
//             json["Avg Debit Amount of Credit Card Last 3 Months"],
//         avgDebitAmountOfCreditCardLast6Months:
//             json["Avg Debit Amount of Credit Card Last 6 Months"],
//         avgDebitAmountOfCreditCardLast12Months:
//             json["Avg Debit Amount of Credit Card Last 12 Months"],
//         amountOfCashDepositsLast3Months:
//             json["Amount of Cash Deposits Last 3 Months"],
//         amountOfCashDepositsLast6Months:
//             json["Amount of Cash Deposits Last 6 Months"],
//         amountOfCashDepositsLast12Months:
//             json["Amount of Cash Deposits Last 12 Months"],
//         noOfCreditCardPaymentLast1Month:
//             json["No. of Credit Card Payment Last 1 Month"],
//         noOfCreditCardPaymentLast3Months:
//             json["No. of Credit Card Payment Last 3 Months"],
//         noOfCreditCardPaymentLast6Months:
//             json["No. of Credit Card Payment Last 6 Months"],
//         debitCreditRatioForLast1Month:
//             json["Debit/Credit Ratio for last 1 Month"]?.toDouble(),
//         debitCreditRatioForLast3Month:
//             json["Debit/Credit Ratio for last 3 Month"]?.toDouble(),
//         debitCreditRatioForLast6Month:
//             json["Debit/Credit Ratio for last 6 Month"]?.toDouble(),
//         noOfIWChequeBounces1M: json["No. of I/W Cheque Bounces 1M"],
//         noOfIWChequeBounces2M: json["No. of I/W Cheque Bounces 2M"],
//         noOfIWChequeBounces3M: json["No. of I/W Cheque Bounces 3M"],
//         noOfIWChequeBounces4M: json["No. of I/W Cheque Bounces 4M"],
//         noOfIWChequeBounces5M: json["No. of I/W Cheque Bounces 5M"],
//         noOfIWChequeBounces6M: json["No. of I/W Cheque Bounces 6M"],
//         ratioOfAverageBalanceForLast1MTo3M:
//             json["Ratio of Average Balance for last 1M to 3M"]?.toDouble(),
//         amountOfCashWithdrawalLast3Months:
//             json["Amount of Cash Withdrawal Last 3 Months"],
//         amountOfCashWithdrawalLast6Months:
//             json["Amount of Cash Withdrawal Last 6 Months"],
//         amountOfCashWithdrawalLast12Months:
//             json["Amount of Cash Withdrawal Last 12 Months"],
//         noOfLoanEmiPaymentsLast1Month:
//             json["No. of Loan(EMI) Payments Last 1 Month"],
//         noOfLoanEmiPaymentsLast3Month:
//             json["No. of Loan(EMI) Payments Last 3 Month"],
//         amountOfLoanEmiPaymentsLast1Month:
//             json["Amount of Loan(EMI) Payments Last 1 Month"],
//         amountOfLoanEmiPaymentsLast3Month:
//             json["Amount of Loan(EMI) Payments Last 3 Month"],
//         totalNoOfMutualFunds: json["Total No. of Mutual Funds"],
//         totalDebitAmountOfMutualFunds:
//             json["Total Debit Amount of Mutual Funds"],
//         totalNoOfInvestmentIncomeLast12Months:
//             json["Total No. of Investment Income last 12 months"],
//         totalAmountOfInvestmentIncomeLast12Months:
//             json["Total Amount of Investment Income last 12 months"],
//         totalExpenseOnCryptoCurrency: json["Total Expense on Crypto Currency"],
//         totalExpenseOnShareMarket: json["Total Expense on Share Market"],
//         standardDeviationOfBalanceLast1Month:
//             json["Standard Deviation of Balance last 1 month"]?.toDouble(),
//         standardDeviationOfBalanceLast6Months:
//             json["Standard Deviation of Balance last 6 months"]?.toDouble(),
//         standardDeviationOfBalanceLast3Months:
//             json["Standard Deviation of Balance last 3 months"]?.toDouble(),
//         coefficientOfVarianceOfBalanceLast1Month:
//             json["Coefficient of Variance of Balance last 1 Month"]?.toDouble(),
//         coefficientOfVarianceOfBalanceLast3Months:
//             json["Coefficient of Variance of Balance last 3 Months"]
//                 ?.toDouble(),
//         coefficientOfVarianceOfBalanceLast6Months:
//             json["Coefficient of Variance of Balance last 6 Months"]
//                 ?.toDouble(),
//         standardDeviationOfDebitAmount:
//             json["Standard Deviation of Debit Amount"]?.toDouble(),
//         standardDeviationOfCreditAmount:
//             json["Standard Deviation of Credit Amount"]?.toDouble(),
//         coefficientOfVariationOfDebitAmount:
//             json["Coefficient of Variation of Debit Amount"]?.toDouble(),
//         coefficientOfVarianceOfCreditAmount:
//             json["Coefficient of Variance of Credit Amount"]?.toDouble(),
//         medianEodBalanceLast1Month:
//             json["Median Eod Balance last 1 month"]?.toDouble(),
//         medianEodBalanceLast3Months:
//             json["Median Eod Balance last 3 months"]?.toDouble(),
//         medianEodBalanceLast6Months:
//             json["Median Eod Balance last 6 months"]?.toDouble(),
//         minBalanceLast1Month: json["Min Balance Last 1 month"]?.toDouble(),
//         avgMinBalanceLast1Month:
//             json["Avg Min Balance Last 1 month"]?.toDouble(),
//         ratioOfCreditsAmountsIn30DaysTo60Days:
//             json["Ratio of credits amounts in 30 days to 60 days"]?.toDouble(),
//         ratioOfCreditsAmountsIn90DaysTo180Days:
//             json["Ratio of credits amounts in 90 days to 180 days"],
//         ratioOfCreditsAmountsIn60DaysTo90Days:
//             json["Ratio of credits amounts in 60 days to 90 days"]?.toDouble(),
//         loanDisbursalAmount1M: json["Loan Disbursal Amount 1M"],
//         loanDisbursalAmount2M: json["Loan Disbursal Amount 2M"],
//         loanDisbursalAmount3M: json["Loan Disbursal Amount 3M"],
//         loanDisbursalAmount4M: json["Loan Disbursal Amount 4M"],
//         loanDisbursalAmount5M: json["Loan Disbursal Amount 5M"],
//         loanDisbursalAmount6M: json["Loan Disbursal Amount 6M"],
//         totalNoOfGasBillPayments: json["Total No. of Gas Bill Payments"],
//         totalAmountOfGasBillPayments: json["Total Amount of Gas Bill Payments"],
//         totalNoOfElectricityBillPayments:
//             json["Total No. of Electricity Bill Payments"],
//         totalNoOfMobileBroadbandBillPayments:
//             json["Total No. of Mobile & Broadband Bill Payments"],
//         totalAmountOfMobileBroadbandBillPayments:
//             json["Total Amount of Mobile & Broadband Bill Payments"],
//         totalAmountOfElectricityBillPayments:
//             json["Total Amount of Electricity Bill Payments"],
//         totalNoOfDividend: json["Total No. of Dividend"],
//         totalAmountOfDividend: json["Total Amount of Dividend"],
//         noOfPennyDropTransactions: json["No. of Penny Drop transactions"],
//         noOfPennyDropTransactionsInLast6Months:
//             json["No. of Penny Drop transactions in last 6 months"],
//         amountPaidTowardsInsurancePerYear:
//             json["Amount Paid Towards Insurance per Year"],
//         totalVeEventTransactionsInLast1Month:
//             json["Total -ve event transactions in last 1 month"],
//         totalVeEventTransactionsInLast3Months:
//             json["Total -ve event transactions in last 3 months"],
//         totalVeEventTransactionsInLast6Months:
//             json["Total -ve event transactions in last 6 months"],
//         totalAmountOfVeEventTransactionsInLast1Month:
//             json["Total Amount of -ve event transactions in last 1 month"],
//         totalAmountOfVeEventTransactionsInLast3Months:
//             json["Total Amount of -ve event transactions in last 3 months"],
//         totalAmountOfVeEventTransactionsInLast6Months:
//             json["Total Amount of -ve event transactions in last 6 months"],
//         salaryDates: json["Salary Dates"] == null
//             ? []
//             : List<dynamic>.from(json["Salary Dates"]!.map((x) => x)),
//         amountOfCreditTransactionLast45Days:
//             json["Amount of Credit Transaction Last 45 Days"],
//         amountOfMoneyPaidTowardsMutualFundPerYear:
//             json["Amount of money paid towards Mutual Fund per year"],
//         averageVelocity: json["Average Velocity"]?.toDouble(),
//         daysSinceLastNegativeDebitEvent:
//             json["Days since last Negative Debit Event"],
//         amountOfCreditInvestmentTransactionLast12Months:
//             json["Amount of Credit Investment Transaction Last 12 Months"],
//         businessIncome: json["Business Income"],
//         businessIncomeInLast6Months: json["Business Income in last 6 months"],
//         amountOfNonDiscretionarySpends:
//             json["Amount of Non-Discretionary Spends"],
//         immediateLoanShareMarketGamingPaymentAfterTakingCreditLine: json[
//             "Immediate loan/share market/gaming payment after taking credit line"],
//         oldestTransactionDate: json["Oldest Transaction Date"],
//       );

//   Map<String, dynamic> toJson() => {
//         "Min Opening Balance": minOpeningBalance,
//         "Max Opening Balance": maxOpeningBalance,
//         "Min Balance": minBalance,
//         "Median Balance": medianBalance,
//         "Max Balance": maxBalance,
//         "First Day EOD Balance": firstDayEodBalance,
//         "Last Day EOD Balance": lastDayEodBalance,
//         "Opening": opening,
//         "Closing Balance": closingBalance,
//         "Min EOD Balance": minEodBalance,
//         "Max EOD Balance": maxEodBalance,
//         "Median EOD Balance": medianEodBalance,
//         "Total No of Salary Credits": totalNoOfSalaryCredits,
//         "Total Amount of Salary Credits": totalAmountOfSalaryCredits,
//         "Total No. of Credit Transactions": totalNoOfCreditTransactions,
//         "Total Amount of Credit Transactions": totalAmountOfCreditTransactions,
//         "Total No. of Business Credit Transactions":
//             totalNoOfBusinessCreditTransactions,
//         "Total Amount of Business Credit Transactions":
//             totalAmountOfBusinessCreditTransactions,
//         "Total No. of Debit Transactions": totalNoOfDebitTransactions,
//         "Total Amount of Debit Transactions": totalAmountOfDebitTransactions,
//         "Total No. of Cash Deposits": totalNoOfCashDeposits,
//         "Total Amount of Cash Deposits": totalAmountOfCashDeposits,
//         "Total No. of Cash Withdrawals": totalNoOfCashWithdrawals,
//         "chqDeposits": chqDeposits,
//         "Total No. of Cheque Deposits": totalNoOfChequeDeposits,
//         "chqIssues": chqIssues,
//         "Total No. of Cheque Issues": totalNoOfChequeIssues,
//         "totalChqDeposits": totalChqDeposits,
//         "Total Amount of Cheque Deposits": totalAmountOfChequeDeposits,
//         "totalChqIssues": totalChqIssues,
//         "Total Amount of Cheque Issues": totalAmountOfChequeIssues,
//         "No. of EMI / loan payments": noOfEmiLoanPayments,
//         "Total No. of EMI / loan payments": totalNoOfEmiLoanPayments,
//         "Total No.of I / W Bounced": totalNoOfIWBounced,
//         "Sum of I/W Bounced": sumOfIWBounced,
//         "Total amount of I / W Bounced": totalAmountOfIWBounced,
//         "Total Number of Outward Cheque Bounces":
//             totalNumberOfOutwardChequeBounces,
//         "No. of transactions in BS": noOfTransactionsInBs,
//         "No. of transactions in BS in last 6 months":
//             noOfTransactionsInBsInLast6Months,
//         "Total amount of Gaming in last 6 months":
//             totalAmountOfGamingInLast6Months,
//         "totalLoanDisbursal": totalLoanDisbursal,
//         "Total Amount of Loan Disbursal": totalAmountOfLoanDisbursal,
//         "Loan Disbursal": loanDisbursal,
//         "loanDisbursal": overallLoanDisbursal,
//         "Total No. of Loan Disbursal": totalNoOfLoanDisbursal,
//         "Total No. of I/W Chq Bounced": overallTotalNoOfIWChqBounced,
//         "Total No. of I / W Chq Bounced": totalNoOfIWChqBounced,
//         "inw_chq_bounce_nonTechnical": inwChqBounceNonTechnical,
//         "Total No. of I / W Cheque Bounce Non Technical":
//             totalNoOfIWChequeBounceNonTechnical,
//         "total_inw_chq_bounce_nonTechnical": totalInwChqBounceNonTechnical,
//         "Total Amount of I / W Cheque Bounce Non Technical":
//             totalAmountOfIWChequeBounceNonTechnical,
//         "salary_count": salaryCount,
//         "startDate": overallStartDate,
//         "Start Date": startDate,
//         "Average EOD Balance": averageEodBalance,
//         "Total No of Salary Credits 180 days": totalNoOfSalaryCredits180Days,
//         "Recommended Date Range for NACH": recommendedDateRangeForNach,
//         "ABB on 1 14 last day": abbOn114LastDay,
//         "ABB on 1st,14th, 30th/Last Day": abbOn1St14Th30ThLastDay,
//         "Total No. of Net Credit Transactions": totalNoOfNetCreditTransactions,
//         "Total Net Credit Amount": totalNetCreditAmount,
//         "Total No. of Net Debit Transactions": totalNoOfNetDebitTransactions,
//         "Total Net Debit Amount": totalNetDebitAmount,
//         "Total No. of CreditCard Payment": totalNoOfCreditCardPayment,
//         "Total No. of Bills & Utilities": totalNoOfBillsUtilities,
//         "Total No. of Food": totalNoOfFood,
//         "Total No. of Alcohol": totalNoOfAlcohol,
//         "Total No. of Travel": totalNoOfTravel,
//         "Total No. of Entertainment & Lifestyle":
//             totalNoOfEntertainmentLifestyle,
//         "Total No. of Shopping & Purchase": totalNoOfShoppingPurchase,
//         "Total No. of Investment Expense": totalNoOfInvestmentExpense,
//         "Total No. of Gaming": totalNoOfGaming,
//         "Total No. of Personal Loan": totalNoOfPersonalLoan,
//         "Total No. of Home Loan": totalNoOfHomeLoan,
//         "Total No. of Auto Loan ": totalNoOfAutoLoan,
//         "Total No. of Insurance": totalNoOfInsurance,
//         "Total No. of Tax Transaction Debit": totalNoOfTaxTransactionDebit,
//         "Total No. of Transfer to Wallet Transaction":
//             totalNoOfTransferToWalletTransaction,
//         "Total No. of Reversal Transaction Debit":
//             totalNoOfReversalTransactionDebit,
//         "Total No. of Medical Transaction": totalNoOfMedicalTransaction,
//         "Total No. of Charges Transaction": totalNoOfChargesTransaction,
//         "Total No. of Below Minimum Balance Transaction":
//             totalNoOfBelowMinimumBalanceTransaction,
//         "Total No. of Salary Paid Transaction": totalNoOfSalaryPaidTransaction,
//         "Total No. of Transfer Out Transaction":
//             totalNoOfTransferOutTransaction,
//         "Total No. of Foreign Wallet Transaction":
//             totalNoOfForeignWalletTransaction,
//         "Total No. of Other Category Debit Transaction":
//             totalNoOfOtherCategoryDebitTransaction,
//         "Total Amount of Bills & Utilities": totalAmountOfBillsUtilities,
//         "Total Amount of Food": totalAmountOfFood,
//         "Total Amount of Alcohol": totalAmountOfAlcohol,
//         "Total Amount of Personal Loan": totalAmountOfPersonalLoan,
//         "Total Amount of Home Loan": totalAmountOfHomeLoan,
//         "Total Amount of Auto Loan ": totalAmountOfAutoLoan,
//         "Total Amount of Travel": totalAmountOfTravel,
//         "Total Amount of Entertainment & Lifestyle":
//             totalAmountOfEntertainmentLifestyle,
//         "Total Amount of Shopping & Purchase": totalAmountOfShoppingPurchase,
//         "Total Amount of Investment Expense": totalAmountOfInvestmentExpense,
//         "Total Amount of Insurance": totalAmountOfInsurance,
//         "Total Amount of Tax Transaction Debit":
//             totalAmountOfTaxTransactionDebit,
//         "Total Amount of Gaming": totalAmountOfGaming,
//         "Total Amount of Transfer to Wallet Transaction":
//             totalAmountOfTransferToWalletTransaction,
//         "Total Amount of Reversal Transaction Debit":
//             totalAmountOfReversalTransactionDebit,
//         "Total Amount of CreditCard Payment": totalAmountOfCreditCardPayment,
//         "Total Amount of Cash Withdrawals": totalAmountOfCashWithdrawals,
//         "Total Amount of Medical Transaction": totalAmountOfMedicalTransaction,
//         "Total Amount of Charges Transaction": totalAmountOfChargesTransaction,
//         "Total Amount of Below Minimum Balance Transaction":
//             totalAmountOfBelowMinimumBalanceTransaction,
//         "Total Amount of Salary Paid Transaction":
//             totalAmountOfSalaryPaidTransaction,
//         "Total Amount of Transfer Out Transaction":
//             totalAmountOfTransferOutTransaction,
//         "Total Amount of Foreign Wallet Transaction":
//             totalAmountOfForeignWalletTransaction,
//         "Total Amount of EMI / loan Payments": totalAmountOfEmiLoanPayments,
//         "Total Amount of Other Category Debit Transaction":
//             totalAmountOfOtherCategoryDebitTransaction,
//         "Percent of Cash Deposit out of total Credit in Amount":
//             percentOfCashDepositOutOfTotalCreditInAmount,
//         "Percent of Cash Deposit out of total Credit in Number":
//             percentOfCashDepositOutOfTotalCreditInNumber,
//         "Total No. of numerest Received": totalNoOfnumerestReceived,
//         "Total Amount of numerest Received": totalAmountOfnumerestReceived,
//         "Total No. of Cheque Return Charges": totalNoOfChequeReturnCharges,
//         "Total No. of Technical Cheque Bounces":
//             totalNoOfTechnicalChequeBounces,
//         "Total No. of ATM Withdrawals above 2000":
//             totalNoOfAtmWithdrawalsAbove2000,
//         "Total ECS Nach Number": totalEcsNachNumber,
//         "Total ECS Nach Amount": totalEcsNachAmount,
//         "Total No. of Debit numernal Transfer": totalNoOfDebitnumernalTransfer,
//         "Total Amount of Debit numernal Transfer":
//             totalAmountOfDebitnumernalTransfer,
//         "Total No. of Credit numernal Transfer":
//             totalNoOfCreditnumernalTransfer,
//         "Total Amount of Credit numernal Transfer":
//             totalAmountOfCreditnumernalTransfer,
//         "Total no. of expense transactions": totalNoOfExpenseTransactions,
//         "Total No. of Holiday Transactions": totalNoOfHolidayTransactions,
//         "Total Amount of Holiday Transactions":
//             totalAmountOfHolidayTransactions,
//         "Total No of Bounced O/W Payment": totalNoOfBouncedOWPayment,
//         "Total Amount of Bounced O/W Payment": totalAmountOfBouncedOWPayment,
//         "Total No of Payment Bounce Charges": totalNoOfPaymentBounceCharges,
//         "Total Amount of Payment Bounce Charges":
//             totalAmountOfPaymentBounceCharges,
//         "Total No of numerest Paid": totalNoOfnumerestPaid,
//         "Total Amount of numerest Paid": totalAmountOfnumerestPaid,
//         "Total No of DD Cancel": totalNoOfDdCancel,
//         "Total Amount of DD Cancel": totalAmountOfDdCancel,
//         "Total No of DD Issue": totalNoOfDdIssue,
//         "Total Amount of DD Issue": totalAmountOfDdIssue,
//         "Average Credit amount last 1 months": averageCreditAmountLast1Months,
//         "Average Credit amount last 2 months": averageCreditAmountLast2Months,
//         "Average Credit amount last 3 months": averageCreditAmountLast3Months,
//         "Average Credit amount last 6 months": averageCreditAmountLast6Months,
//         "Employment Type": employmentType,
//         "Salary Flag": salaryFlag,
//         "Avg EOD Balance last 3 months": avgEodBalanceLast3Months,
//         "Avg EOD Balance in last 6 months": avgEodBalanceInLast6Months,
//         "Avg EOD Balance in last 12 months": avgEodBalanceInLast12Months,
//         "No. of Credit Transactions in last 3 months":
//             noOfCreditTransactionsInLast3Months,
//         "No. of Credit Transactions in last 6 months":
//             noOfCreditTransactionsInLast6Months,
//         "No. of Credit Transactions in last 12 months":
//             noOfCreditTransactionsInLast12Months,
//         "Amount of Credit Transactions in last 1 months":
//             amountOfCreditTransactionsInLast1Months,
//         "Amount of Credit Transactions in last 2 months":
//             amountOfCreditTransactionsInLast2Months,
//         "Amount of Credit Transactions in last 3 months":
//             amountOfCreditTransactionsInLast3Months,
//         "Amount of Credit Transactions in last 6 months":
//             amountOfCreditTransactionsInLast6Months,
//         "Amount of Credit Transactions in last 12 months":
//             amountOfCreditTransactionsInLast12Months,
//         "Total No. of Business Credit Transactions in last 30 days":
//             totalNoOfBusinessCreditTransactionsInLast30Days,
//         "Total No. of Business Credit Transactions in last 180 days":
//             totalNoOfBusinessCreditTransactionsInLast180Days,
//         "Total Amount of Business Credit Transactions in last 30 days":
//             totalAmountOfBusinessCreditTransactionsInLast30Days,
//         "Total Amount of Business Credit Transactions in last 180 days":
//             totalAmountOfBusinessCreditTransactionsInLast180Days,
//         "Total No. of Business Credit Transactions 0M":
//             totalNoOfBusinessCreditTransactions0M,
//         "Total No. of Business Credit Transactions 1M":
//             totalNoOfBusinessCreditTransactions1M,
//         "Total No. of Business Credit Transactions 2M":
//             totalNoOfBusinessCreditTransactions2M,
//         "Total No. of Business Credit Transactions 3M":
//             totalNoOfBusinessCreditTransactions3M,
//         "Total No. of Business Credit Transactions 4M":
//             totalNoOfBusinessCreditTransactions4M,
//         "Total No. of Business Credit Transactions 5M":
//             totalNoOfBusinessCreditTransactions5M,
//         "Total No. of Business Credit Transactions 6M":
//             totalNoOfBusinessCreditTransactions6M,
//         "Total Amount of Business Credit Transactions 0M":
//             totalAmountOfBusinessCreditTransactions0M,
//         "Total Amount of Business Credit Transactions 1M":
//             totalAmountOfBusinessCreditTransactions1M,
//         "Total Amount of Business Credit Transactions 2M":
//             totalAmountOfBusinessCreditTransactions2M,
//         "Total Amount of Business Credit Transactions 3M":
//             totalAmountOfBusinessCreditTransactions3M,
//         "Total Amount of Business Credit Transactions 4M":
//             totalAmountOfBusinessCreditTransactions4M,
//         "Total Amount of Business Credit Transactions 5M":
//             totalAmountOfBusinessCreditTransactions5M,
//         "Total Amount of Business Credit Transactions 6M":
//             totalAmountOfBusinessCreditTransactions6M,
//         "No. of Debit Transactions in last 3 months":
//             noOfDebitTransactionsInLast3Months,
//         "No. of Debit Transactions in last 6 months":
//             noOfDebitTransactionsInLast6Months,
//         "No. of Debit Transactions in last 12 months":
//             noOfDebitTransactionsInLast12Months,
//         "Amount of Debit Transactions in last 3 months":
//             amountOfDebitTransactionsInLast3Months,
//         "Amount of Debit Transactions in last 6 months":
//             amountOfDebitTransactionsInLast6Months,
//         "Amount of Debit Transactions in last 12 months":
//             amountOfDebitTransactionsInLast12Months,
//         "Avg Salary Credited in last 1 month": avgSalaryCreditedInLast1Month,
//         "Avg Salary Credited in last 3 months": avgSalaryCreditedInLast3Months,
//         "Avg Salary Credited in last 6 months": avgSalaryCreditedInLast6Months,
//         "Total Loan Credited in last 1 month": totalLoanCreditedInLast1Month,
//         "Total Loan Credited in last 3 months": totalLoanCreditedInLast3Months,
//         "Total Loan Credited in last 6 months": totalLoanCreditedInLast6Months,
//         "Total Loan Credited in last 12 months":
//             totalLoanCreditedInLast12Months,
//         "Total No. of EMI bounces in last 1 month":
//             totalNoOfEmiBouncesInLast1Month,
//         "Total No. of EMI bounces in last 2 months":
//             totalNoOfEmiBouncesInLast2Months,
//         "Total No. of EMI bounces in last 3 months":
//             totalNoOfEmiBouncesInLast3Months,
//         "Avg EOD Balance 1M": avgEodBalance1M,
//         "Avg EOD Balance 2M": avgEodBalance2M,
//         "Avg EOD Balance 3M": avgEodBalance3M,
//         "Avg EOD Balance 4M": avgEodBalance4M,
//         "Avg EOD Balance 5M": avgEodBalance5M,
//         "Avg EOD Balance 6M": avgEodBalance6M,
//         "Total Salary Amount 1M": totalSalaryAmount1M,
//         "Total Salary Amount 2M": totalSalaryAmount2M,
//         "Total Salary Amount 3M": totalSalaryAmount3M,
//         "Total Salary Amount 4M": totalSalaryAmount4M,
//         "Total Salary Amount 5M": totalSalaryAmount5M,
//         "Total Salary Amount 6M": totalSalaryAmount6M,
//         "total number of cash deposits range 9 10l":
//             totalNumberOfCashDepositsRange910L,
//         "total number of cash deposits range 10 20k":
//             totalNumberOfCashDepositsRange1020K,
//         "total number of cash deposits range 40 50k":
//             totalNumberOfCashDepositsRange4050K,
//         "Total Amount of Net Credit Transactions 1M":
//             totalAmountOfNetCreditTransactions1M,
//         "Total Amount of Net Credit Transactions 2M":
//             totalAmountOfNetCreditTransactions2M,
//         "Total Amount of Net Credit Transactions 3M":
//             totalAmountOfNetCreditTransactions3M,
//         "Total Amount of Net Credit Transactions 4M":
//             totalAmountOfNetCreditTransactions4M,
//         "Total Amount of Net Credit Transactions 5M":
//             totalAmountOfNetCreditTransactions5M,
//         "Total Amount of Net Credit Transactions 6M":
//             totalAmountOfNetCreditTransactions6M,
//         "Total No. of Net Credit Transactions 1M":
//             totalNoOfNetCreditTransactions1M,
//         "Total No. of Net Credit Transactions 2M":
//             totalNoOfNetCreditTransactions2M,
//         "Total No. of Net Credit Transactions 3M":
//             totalNoOfNetCreditTransactions3M,
//         "Total No. of Net Credit Transactions 4M":
//             totalNoOfNetCreditTransactions4M,
//         "Total No. of Net Credit Transactions 5M":
//             totalNoOfNetCreditTransactions5M,
//         "Total No. of Net Credit Transactions 6M":
//             totalNoOfNetCreditTransactions6M,
//         "Avg EOD Balance below 500 1M": avgEodBalanceBelow5001M,
//         "Avg EOD Balance below 500 2M": avgEodBalanceBelow5002M,
//         "Avg EOD Balance below 500 3M": avgEodBalanceBelow5003M,
//         "Avg EOD Balance below 500 4M": avgEodBalanceBelow5004M,
//         "Avg EOD Balance below 500 5M": avgEodBalanceBelow5005M,
//         "Avg EOD Balance below 500 6M": avgEodBalanceBelow5006M,
//         "Avg EOD Balance below 1000 1M": avgEodBalanceBelow10001M,
//         "Avg EOD Balance below 1000 2M": avgEodBalanceBelow10002M,
//         "Avg EOD Balance below 1000 3M": avgEodBalanceBelow10003M,
//         "Avg EOD Balance below 1000 4M": avgEodBalanceBelow10004M,
//         "Avg EOD Balance below 1000 5M": avgEodBalanceBelow10005M,
//         "Avg EOD Balance below 1000 6M": avgEodBalanceBelow10006M,
//         "Avg EOD Balance below 2000 1M": avgEodBalanceBelow20001M,
//         "Avg EOD Balance below 2000 2M": avgEodBalanceBelow20002M,
//         "Avg EOD Balance below 2000 3M": avgEodBalanceBelow20003M,
//         "Avg EOD Balance below 2000 4M": avgEodBalanceBelow20004M,
//         "Avg EOD Balance below 2000 5M": avgEodBalanceBelow20005M,
//         "Avg EOD Balance below 2000 6M": avgEodBalanceBelow20006M,
//         "Avg EOD Balance below 5000 1M": avgEodBalanceBelow50001M,
//         "Avg EOD Balance below 5000 2M": avgEodBalanceBelow50002M,
//         "Avg EOD Balance below 5000 3M": avgEodBalanceBelow50003M,
//         "Avg EOD Balance below 5000 4M": avgEodBalanceBelow50004M,
//         "Avg EOD Balance below 5000 5M": avgEodBalanceBelow50005M,
//         "Avg EOD Balance below 5000 6M": avgEodBalanceBelow50006M,
//         "Total No. of EMI Bounces": totalNoOfEmiBounces,
//         "Total Amount of EMI Bounces": totalAmountOfEmiBounces,
//         "Average Credit Loan Amount in Last 3 Months":
//             averageCreditLoanAmountInLast3Months,
//         "Average Credit Loan Amount in Last 6 Months":
//             averageCreditLoanAmountInLast6Months,
//         "Amount of Investment Income Last 3 Months":
//             amountOfInvestmentIncomeLast3Months,
//         "Amount of Investment Income Last 6 Months":
//             amountOfInvestmentIncomeLast6Months,
//         "Avg Amount of Investment Income Last 3 Months":
//             avgAmountOfInvestmentIncomeLast3Months,
//         "Avg Amount of Investment Income Last 6 Months":
//             avgAmountOfInvestmentIncomeLast6Months,
//         "Amount of Salary Credited in last 3 months":
//             amountOfSalaryCreditedInLast3Months,
//         "Amount of Salary Credited Last 6 Months":
//             amountOfSalaryCreditedLast6Months,
//         "Amount of Salary Credited in last 1 month":
//             amountOfSalaryCreditedInLast1Month,
//         "Amount of Salary Credited Last 12 Months":
//             amountOfSalaryCreditedLast12Months,
//         "Total Amount of Salary Credited in Last 3 Months":
//             totalAmountOfSalaryCreditedInLast3Months,
//         "No. of Salary Credited in last 3 month":
//             noOfSalaryCreditedInLast3Month,
//         "No. of  Salary Credited Last 6 Months": noOfSalaryCreditedLast6Months,
//         "No. of  Salary Credited Last 1 Month": noOfSalaryCreditedLast1Month,
//         "No. of  Salary Credited Last 12 Months":
//             noOfSalaryCreditedLast12Months,
//         "Minimum EOD Balance Last 3 Months": minimumEodBalanceLast3Months,
//         "Minimum EOD Balance Last 6 Months": minimumEodBalanceLast6Months,
//         "Maximum EOD Balance Last 3 Months": maximumEodBalanceLast3Months,
//         "Maximum EOD Balance Last 6 Months": maximumEodBalanceLast6Months,
//         "No. of Loan Credited Last 1 Month": noOfLoanCreditedLast1Month,
//         "No. of Loan Credited Last 3 Months": noOfLoanCreditedLast3Months,
//         "No. of Loan Credited Last 6 Months": noOfLoanCreditedLast6Months,
//         "No. of Loan Credited Last 12 Months": noOfLoanCreditedLast12Months,
//         "Debit Amount of Credit Card Last 1 Month":
//             debitAmountOfCreditCardLast1Month,
//         "Debit Amount of Credit Card Last 3 Months":
//             debitAmountOfCreditCardLast3Months,
//         "Debit Amount of Credit Card Last 6 Months":
//             debitAmountOfCreditCardLast6Months,
//         "Avg Debit Amount of Credit Card Last 3 Months":
//             avgDebitAmountOfCreditCardLast3Months,
//         "Avg Debit Amount of Credit Card Last 6 Months":
//             avgDebitAmountOfCreditCardLast6Months,
//         "Avg Debit Amount of Credit Card Last 12 Months":
//             avgDebitAmountOfCreditCardLast12Months,
//         "Amount of Cash Deposits Last 3 Months":
//             amountOfCashDepositsLast3Months,
//         "Amount of Cash Deposits Last 6 Months":
//             amountOfCashDepositsLast6Months,
//         "Amount of Cash Deposits Last 12 Months":
//             amountOfCashDepositsLast12Months,
//         "No. of Credit Card Payment Last 1 Month":
//             noOfCreditCardPaymentLast1Month,
//         "No. of Credit Card Payment Last 3 Months":
//             noOfCreditCardPaymentLast3Months,
//         "No. of Credit Card Payment Last 6 Months":
//             noOfCreditCardPaymentLast6Months,
//         "Debit/Credit Ratio for last 1 Month": debitCreditRatioForLast1Month,
//         "Debit/Credit Ratio for last 3 Month": debitCreditRatioForLast3Month,
//         "Debit/Credit Ratio for last 6 Month": debitCreditRatioForLast6Month,
//         "No. of I/W Cheque Bounces 1M": noOfIWChequeBounces1M,
//         "No. of I/W Cheque Bounces 2M": noOfIWChequeBounces2M,
//         "No. of I/W Cheque Bounces 3M": noOfIWChequeBounces3M,
//         "No. of I/W Cheque Bounces 4M": noOfIWChequeBounces4M,
//         "No. of I/W Cheque Bounces 5M": noOfIWChequeBounces5M,
//         "No. of I/W Cheque Bounces 6M": noOfIWChequeBounces6M,
//         "Ratio of Average Balance for last 1M to 3M":
//             ratioOfAverageBalanceForLast1MTo3M,
//         "Amount of Cash Withdrawal Last 3 Months":
//             amountOfCashWithdrawalLast3Months,
//         "Amount of Cash Withdrawal Last 6 Months":
//             amountOfCashWithdrawalLast6Months,
//         "Amount of Cash Withdrawal Last 12 Months":
//             amountOfCashWithdrawalLast12Months,
//         "No. of Loan(EMI) Payments Last 1 Month": noOfLoanEmiPaymentsLast1Month,
//         "No. of Loan(EMI) Payments Last 3 Month": noOfLoanEmiPaymentsLast3Month,
//         "Amount of Loan(EMI) Payments Last 1 Month":
//             amountOfLoanEmiPaymentsLast1Month,
//         "Amount of Loan(EMI) Payments Last 3 Month":
//             amountOfLoanEmiPaymentsLast3Month,
//         "Total No. of Mutual Funds": totalNoOfMutualFunds,
//         "Total Debit Amount of Mutual Funds": totalDebitAmountOfMutualFunds,
//         "Total No. of Investment Income last 12 months":
//             totalNoOfInvestmentIncomeLast12Months,
//         "Total Amount of Investment Income last 12 months":
//             totalAmountOfInvestmentIncomeLast12Months,
//         "Total Expense on Crypto Currency": totalExpenseOnCryptoCurrency,
//         "Total Expense on Share Market": totalExpenseOnShareMarket,
//         "Standard Deviation of Balance last 1 month":
//             standardDeviationOfBalanceLast1Month,
//         "Standard Deviation of Balance last 6 months":
//             standardDeviationOfBalanceLast6Months,
//         "Standard Deviation of Balance last 3 months":
//             standardDeviationOfBalanceLast3Months,
//         "Coefficient of Variance of Balance last 1 Month":
//             coefficientOfVarianceOfBalanceLast1Month,
//         "Coefficient of Variance of Balance last 3 Months":
//             coefficientOfVarianceOfBalanceLast3Months,
//         "Coefficient of Variance of Balance last 6 Months":
//             coefficientOfVarianceOfBalanceLast6Months,
//         "Standard Deviation of Debit Amount": standardDeviationOfDebitAmount,
//         "Standard Deviation of Credit Amount": standardDeviationOfCreditAmount,
//         "Coefficient of Variation of Debit Amount":
//             coefficientOfVariationOfDebitAmount,
//         "Coefficient of Variance of Credit Amount":
//             coefficientOfVarianceOfCreditAmount,
//         "Median Eod Balance last 1 month": medianEodBalanceLast1Month,
//         "Median Eod Balance last 3 months": medianEodBalanceLast3Months,
//         "Median Eod Balance last 6 months": medianEodBalanceLast6Months,
//         "Min Balance Last 1 month": minBalanceLast1Month,
//         "Avg Min Balance Last 1 month": avgMinBalanceLast1Month,
//         "Ratio of credits amounts in 30 days to 60 days":
//             ratioOfCreditsAmountsIn30DaysTo60Days,
//         "Ratio of credits amounts in 90 days to 180 days":
//             ratioOfCreditsAmountsIn90DaysTo180Days,
//         "Ratio of credits amounts in 60 days to 90 days":
//             ratioOfCreditsAmountsIn60DaysTo90Days,
//         "Loan Disbursal Amount 1M": loanDisbursalAmount1M,
//         "Loan Disbursal Amount 2M": loanDisbursalAmount2M,
//         "Loan Disbursal Amount 3M": loanDisbursalAmount3M,
//         "Loan Disbursal Amount 4M": loanDisbursalAmount4M,
//         "Loan Disbursal Amount 5M": loanDisbursalAmount5M,
//         "Loan Disbursal Amount 6M": loanDisbursalAmount6M,
//         "Total No. of Gas Bill Payments": totalNoOfGasBillPayments,
//         "Total Amount of Gas Bill Payments": totalAmountOfGasBillPayments,
//         "Total No. of Electricity Bill Payments":
//             totalNoOfElectricityBillPayments,
//         "Total No. of Mobile & Broadband Bill Payments":
//             totalNoOfMobileBroadbandBillPayments,
//         "Total Amount of Mobile & Broadband Bill Payments":
//             totalAmountOfMobileBroadbandBillPayments,
//         "Total Amount of Electricity Bill Payments":
//             totalAmountOfElectricityBillPayments,
//         "Total No. of Dividend": totalNoOfDividend,
//         "Total Amount of Dividend": totalAmountOfDividend,
//         "No. of Penny Drop transactions": noOfPennyDropTransactions,
//         "No. of Penny Drop transactions in last 6 months":
//             noOfPennyDropTransactionsInLast6Months,
//         "Amount Paid Towards Insurance per Year":
//             amountPaidTowardsInsurancePerYear,
//         "Total -ve event transactions in last 1 month":
//             totalVeEventTransactionsInLast1Month,
//         "Total -ve event transactions in last 3 months":
//             totalVeEventTransactionsInLast3Months,
//         "Total -ve event transactions in last 6 months":
//             totalVeEventTransactionsInLast6Months,
//         "Total Amount of -ve event transactions in last 1 month":
//             totalAmountOfVeEventTransactionsInLast1Month,
//         "Total Amount of -ve event transactions in last 3 months":
//             totalAmountOfVeEventTransactionsInLast3Months,
//         "Total Amount of -ve event transactions in last 6 months":
//             totalAmountOfVeEventTransactionsInLast6Months,
//         "Salary Dates": salaryDates == null
//             ? []
//             : List<dynamic>.from(salaryDates!.map((x) => x)),
//         "Amount of Credit Transaction Last 45 Days":
//             amountOfCreditTransactionLast45Days,
//         "Amount of money paid towards Mutual Fund per year":
//             amountOfMoneyPaidTowardsMutualFundPerYear,
//         "Average Velocity": averageVelocity,
//         "Days since last Negative Debit Event": daysSinceLastNegativeDebitEvent,
//         "Amount of Credit Investment Transaction Last 12 Months":
//             amountOfCreditInvestmentTransactionLast12Months,
//         "Business Income": businessIncome,
//         "Business Income in last 6 months": businessIncomeInLast6Months,
//         "Amount of Non-Discretionary Spends": amountOfNonDiscretionarySpends,
//         "Immediate loan/share market/gaming payment after taking credit line":
//             immediateLoanShareMarketGamingPaymentAfterTakingCreditLine,
//         "Oldest Transaction Date": oldestTransactionDate,
//       };
// }

// class OverallMax {
//   double? minOpeningBalance;
//   double? maxOpeningBalance;
//   double? minBalance;
//   String? medianBalance;
//   double? maxBalance;
//   String? firstDayEodBalance;
//   String? lastDayEodBalance;
//   String? opening;
//   String? closingBalance;
//   double? minEodBalance;
//   double? maxEodBalance;
//   double? medianEodBalance;
//   num? totalNoOfSalaryCredits;
//   num? totalAmountOfSalaryCredits;
//   num? totalNoOfCreditTransactions;
//   double? totalAmountOfCreditTransactions;
//   double? totalNoOfBusinessCreditTransactions;
//   double? totalAmountOfBusinessCreditTransactions;
//   double? totalNoOfDebitTransactions;
//   double? totalAmountOfDebitTransactions;
//   num? totalNoOfCashDeposits;
//   num? totalAmountOfCashDeposits;
//   num? totalNoOfCashWithdrawals;
//   num? chqDeposits;
//   num? totalNoOfChequeDeposits;
//   num? chqIssues;
//   num? totalNoOfChequeIssues;
//   num? totalChqDeposits;
//   num? totalAmountOfChequeDeposits;
//   num? totalChqIssues;
//   num? totalAmountOfChequeIssues;
//   num? noOfEmiLoanPayments;
//   num? totalNoOfEmiLoanPayments;
//   num? totalNoOfIWBounced;
//   num? sumOfIWBounced;
//   num? totalAmountOfIWBounced;
//   num? totalNumberOfOutwardChequeBounces;
//   double? noOfTransactionsInBs;
//   num? totalLoanDisbursal;
//   num? totalAmountOfLoanDisbursal;
//   num? loanDisbursal;
//   num? overallMaxLoanDisbursal;
//   num? totalNoOfLoanDisbursal;
//   num? overallMaxTotalNoOfIWChqBounced;
//   num? totalNoOfIWChqBounced;
//   num? inwChqBounceNonTechnical;
//   num? totalNoOfIWChequeBounceNonTechnical;
//   num? totalInwChqBounceNonTechnical;
//   num? totalAmountOfIWChequeBounceNonTechnical;
//   num? salaryCount;
//   String? overallMaxStartDate;
//   String? startDate;
//   double? averageEodBalance;
//   String? abbOn114LastDay;
//   String? abbOn1St14Th30ThLastDay;
//   num? totalNoOfNetCreditTransactions;
//   double? totalNetCreditAmount;
//   double? totalNoOfNetDebitTransactions;
//   double? totalNetDebitAmount;
//   num? totalNoOfCreditCardPayment;
//   num? totalNoOfBillsUtilities;
//   num? totalNoOfFood;
//   num? totalNoOfAlcohol;
//   num? totalNoOfTravel;
//   num? totalNoOfEntertainmentLifestyle;
//   num? totalNoOfShoppingPurchase;
//   num? totalNoOfInvestmentExpense;
//   num? totalNoOfGaming;
//   num? totalNoOfPersonalLoan;
//   num? totalNoOfHomeLoan;
//   num? totalNoOfAutoLoan;
//   num? totalNoOfInsurance;
//   num? totalNoOfTaxTransactionDebit;
//   num? totalNoOfTransferToWalletTransaction;
//   num? totalNoOfReversalTransactionDebit;
//   num? totalNoOfMedicalTransaction;
//   num? totalNoOfChargesTransaction;
//   num? totalNoOfBelowMinimumBalanceTransaction;
//   num? totalNoOfSalaryPaidTransaction;
//   double? totalNoOfTransferOutTransaction;
//   num? totalNoOfForeignWalletTransaction;
//   num? totalNoOfOtherCategoryDebitTransaction;
//   num? totalAmountOfBillsUtilities;
//   num? totalAmountOfFood;
//   num? totalAmountOfAlcohol;
//   num? totalAmountOfPersonalLoan;
//   num? totalAmountOfHomeLoan;
//   num? totalAmountOfAutoLoan;
//   num? totalAmountOfTravel;
//   num? totalAmountOfEntertainmentLifestyle;
//   num? totalAmountOfShoppingPurchase;
//   num? totalAmountOfInvestmentExpense;
//   num? totalAmountOfInsurance;
//   num? totalAmountOfTaxTransactionDebit;
//   num? totalAmountOfGaming;
//   num? totalAmountOfTransferToWalletTransaction;
//   num? totalAmountOfReversalTransactionDebit;
//   num? totalAmountOfCreditCardPayment;
//   num? totalAmountOfCashWithdrawals;
//   num? totalAmountOfMedicalTransaction;
//   num? totalAmountOfChargesTransaction;
//   num? totalAmountOfBelowMinimumBalanceTransaction;
//   num? totalAmountOfSalaryPaidTransaction;
//   double? totalAmountOfTransferOutTransaction;
//   num? totalAmountOfForeignWalletTransaction;
//   num? totalAmountOfEmiLoanPayments;
//   num? totalAmountOfOtherCategoryDebitTransaction;
//   String? totalNoOfMutualFunds;
//   String? totalDebitAmountOfMutualFunds;
//   String? totalExpenseOnCryptoCurrency;
//   String? totalExpenseOnShareMarket;
//   String? totalNoOfGasBillPayments;
//   String? totalAmountOfGasBillPayments;
//   String? totalNoOfElectricityBillPayments;
//   String? totalNoOfMobileBroadbandBillPayments;
//   String? totalAmountOfMobileBroadbandBillPayments;
//   String? totalAmountOfElectricityBillPayments;
//   String? totalNoOfDividend;
//   String? totalAmountOfDividend;

//   OverallMax({
//     this.minOpeningBalance,
//     this.maxOpeningBalance,
//     this.minBalance,
//     this.medianBalance,
//     this.maxBalance,
//     this.firstDayEodBalance,
//     this.lastDayEodBalance,
//     this.opening,
//     this.closingBalance,
//     this.minEodBalance,
//     this.maxEodBalance,
//     this.medianEodBalance,
//     this.totalNoOfSalaryCredits,
//     this.totalAmountOfSalaryCredits,
//     this.totalNoOfCreditTransactions,
//     this.totalAmountOfCreditTransactions,
//     this.totalNoOfBusinessCreditTransactions,
//     this.totalAmountOfBusinessCreditTransactions,
//     this.totalNoOfDebitTransactions,
//     this.totalAmountOfDebitTransactions,
//     this.totalNoOfCashDeposits,
//     this.totalAmountOfCashDeposits,
//     this.totalNoOfCashWithdrawals,
//     this.chqDeposits,
//     this.totalNoOfChequeDeposits,
//     this.chqIssues,
//     this.totalNoOfChequeIssues,
//     this.totalChqDeposits,
//     this.totalAmountOfChequeDeposits,
//     this.totalChqIssues,
//     this.totalAmountOfChequeIssues,
//     this.noOfEmiLoanPayments,
//     this.totalNoOfEmiLoanPayments,
//     this.totalNoOfIWBounced,
//     this.sumOfIWBounced,
//     this.totalAmountOfIWBounced,
//     this.totalNumberOfOutwardChequeBounces,
//     this.noOfTransactionsInBs,
//     this.totalLoanDisbursal,
//     this.totalAmountOfLoanDisbursal,
//     this.loanDisbursal,
//     this.overallMaxLoanDisbursal,
//     this.totalNoOfLoanDisbursal,
//     this.overallMaxTotalNoOfIWChqBounced,
//     this.totalNoOfIWChqBounced,
//     this.inwChqBounceNonTechnical,
//     this.totalNoOfIWChequeBounceNonTechnical,
//     this.totalInwChqBounceNonTechnical,
//     this.totalAmountOfIWChequeBounceNonTechnical,
//     this.salaryCount,
//     this.overallMaxStartDate,
//     this.startDate,
//     this.averageEodBalance,
//     this.abbOn114LastDay,
//     this.abbOn1St14Th30ThLastDay,
//     this.totalNoOfNetCreditTransactions,
//     this.totalNetCreditAmount,
//     this.totalNoOfNetDebitTransactions,
//     this.totalNetDebitAmount,
//     this.totalNoOfCreditCardPayment,
//     this.totalNoOfBillsUtilities,
//     this.totalNoOfFood,
//     this.totalNoOfAlcohol,
//     this.totalNoOfTravel,
//     this.totalNoOfEntertainmentLifestyle,
//     this.totalNoOfShoppingPurchase,
//     this.totalNoOfInvestmentExpense,
//     this.totalNoOfGaming,
//     this.totalNoOfPersonalLoan,
//     this.totalNoOfHomeLoan,
//     this.totalNoOfAutoLoan,
//     this.totalNoOfInsurance,
//     this.totalNoOfTaxTransactionDebit,
//     this.totalNoOfTransferToWalletTransaction,
//     this.totalNoOfReversalTransactionDebit,
//     this.totalNoOfMedicalTransaction,
//     this.totalNoOfChargesTransaction,
//     this.totalNoOfBelowMinimumBalanceTransaction,
//     this.totalNoOfSalaryPaidTransaction,
//     this.totalNoOfTransferOutTransaction,
//     this.totalNoOfForeignWalletTransaction,
//     this.totalNoOfOtherCategoryDebitTransaction,
//     this.totalAmountOfBillsUtilities,
//     this.totalAmountOfFood,
//     this.totalAmountOfAlcohol,
//     this.totalAmountOfPersonalLoan,
//     this.totalAmountOfHomeLoan,
//     this.totalAmountOfAutoLoan,
//     this.totalAmountOfTravel,
//     this.totalAmountOfEntertainmentLifestyle,
//     this.totalAmountOfShoppingPurchase,
//     this.totalAmountOfInvestmentExpense,
//     this.totalAmountOfInsurance,
//     this.totalAmountOfTaxTransactionDebit,
//     this.totalAmountOfGaming,
//     this.totalAmountOfTransferToWalletTransaction,
//     this.totalAmountOfReversalTransactionDebit,
//     this.totalAmountOfCreditCardPayment,
//     this.totalAmountOfCashWithdrawals,
//     this.totalAmountOfMedicalTransaction,
//     this.totalAmountOfChargesTransaction,
//     this.totalAmountOfBelowMinimumBalanceTransaction,
//     this.totalAmountOfSalaryPaidTransaction,
//     this.totalAmountOfTransferOutTransaction,
//     this.totalAmountOfForeignWalletTransaction,
//     this.totalAmountOfEmiLoanPayments,
//     this.totalAmountOfOtherCategoryDebitTransaction,
//     this.totalNoOfMutualFunds,
//     this.totalDebitAmountOfMutualFunds,
//     this.totalExpenseOnCryptoCurrency,
//     this.totalExpenseOnShareMarket,
//     this.totalNoOfGasBillPayments,
//     this.totalAmountOfGasBillPayments,
//     this.totalNoOfElectricityBillPayments,
//     this.totalNoOfMobileBroadbandBillPayments,
//     this.totalAmountOfMobileBroadbandBillPayments,
//     this.totalAmountOfElectricityBillPayments,
//     this.totalNoOfDividend,
//     this.totalAmountOfDividend,
//   });

//   factory OverallMax.fromJson(Map<String, dynamic> json) => OverallMax(
//         minOpeningBalance: json["Min Opening Balance"]?.toDouble(),
//         maxOpeningBalance: json["Max Opening Balance"]?.toDouble(),
//         minBalance: json["Min Balance"]?.toDouble(),
//         medianBalance: json["Median Balance"],
//         maxBalance: json["Max Balance"]?.toDouble(),
//         firstDayEodBalance: json["First Day EOD Balance"],
//         lastDayEodBalance: json["Last Day EOD Balance"],
//         opening: json["Opening"],
//         closingBalance: json["Closing Balance"],
//         minEodBalance: json["Min EOD Balance"]?.toDouble(),
//         maxEodBalance: json["Max EOD Balance"]?.toDouble(),
//         medianEodBalance: json["Median EOD Balance"]?.toDouble(),
//         totalNoOfSalaryCredits: json["Total No of Salary Credits"],
//         totalAmountOfSalaryCredits: json["Total Amount of Salary Credits"],
//         totalNoOfCreditTransactions: json["Total No. of Credit Transactions"],
//         totalAmountOfCreditTransactions:
//             json["Total Amount of Credit Transactions"]?.toDouble(),
//         totalNoOfBusinessCreditTransactions:
//             json["Total No. of Business Credit Transactions"]?.toDouble(),
//         totalAmountOfBusinessCreditTransactions:
//             json["Total Amount of Business Credit Transactions"]?.toDouble(),
//         totalNoOfDebitTransactions:
//             json["Total No. of Debit Transactions"]?.toDouble(),
//         totalAmountOfDebitTransactions:
//             json["Total Amount of Debit Transactions"]?.toDouble(),
//         totalNoOfCashDeposits: json["Total No. of Cash Deposits"],
//         totalAmountOfCashDeposits: json["Total Amount of Cash Deposits"],
//         totalNoOfCashWithdrawals: json["Total No. of Cash Withdrawals"],
//         chqDeposits: json["chqDeposits"],
//         totalNoOfChequeDeposits: json["Total No. of Cheque Deposits"],
//         chqIssues: json["chqIssues"],
//         totalNoOfChequeIssues: json["Total No. of Cheque Issues"],
//         totalChqDeposits: json["totalChqDeposits"],
//         totalAmountOfChequeDeposits: json["Total Amount of Cheque Deposits"],
//         totalChqIssues: json["totalChqIssues"],
//         totalAmountOfChequeIssues: json["Total Amount of Cheque Issues"]??0.0,
//         noOfEmiLoanPayments: json["No. of EMI / loan payments"]??0.0,
//         totalNoOfEmiLoanPayments: json["Total No. of EMI / loan payments"]??0.0,
//         totalNoOfIWBounced: json["Total No.of I / W Bounced"]??0.0,
//         sumOfIWBounced: json["Sum of I/W Bounced"]??0.0,
//         totalAmountOfIWBounced: json["Total amount of I / W Bounced"]??0.0,
//         totalNumberOfOutwardChequeBounces:
//             json["Total Number of Outward Cheque Bounces"]??0.0,
//         noOfTransactionsInBs: json["No. of transactions in BS"]?.toDouble()??0.0,
//         totalLoanDisbursal: json["totalLoanDisbursal"],
//         totalAmountOfLoanDisbursal: json["Total Amount of Loan Disbursal"]??0.0,
//         loanDisbursal: json["Loan Disbursal"]??0.0,
//         overallMaxLoanDisbursal: json["loanDisbursal"]??0.0,
//         totalNoOfLoanDisbursal: json["Total No. of Loan Disbursal"]??0.0,
//         overallMaxTotalNoOfIWChqBounced: json["Total No. of I/W Chq Bounced"]??0.0,
//         totalNoOfIWChqBounced: json["Total No. of I / W Chq Bounced"]??0.0,
//         inwChqBounceNonTechnical: json["inw_chq_bounce_nonTechnical"]??0.0,
//         totalNoOfIWChequeBounceNonTechnical:
//             json["Total No. of I / W Cheque Bounce Non Technical"]??0.0,
//         totalInwChqBounceNonTechnical:
//             json["total_inw_chq_bounce_nonTechnical"]??0.0,
//         totalAmountOfIWChequeBounceNonTechnical:
//             json["Total Amount of I / W Cheque Bounce Non Technical"]??0.0,
//         salaryCount: json["salary_count"]??0.0,
//         overallMaxStartDate: json["startDate"]??0.0,
//         startDate: json["Start Date"]??0.0,
//         averageEodBalance: json["Average EOD Balance"]?.toDouble()??0.0,
//         abbOn114LastDay: json["ABB on 1 14 last day"]??0.0,
//         abbOn1St14Th30ThLastDay: json["ABB on 1st,14th, 30th/Last Day"]??0.0,
//         totalNoOfNetCreditTransactions:
//             json["Total No. of Net Credit Transactions"]??0.0,
//         totalNetCreditAmount: json["Total Net Credit Amount"]?.toDouble()??0.0,
//         totalNoOfNetDebitTransactions:
//             json["Total No. of Net Debit Transactions"]?.toDouble()??0.0,
//         totalNetDebitAmount: json["Total Net Debit Amount"]?.toDouble()??0.0,
//         totalNoOfCreditCardPayment: json["Total No. of CreditCard Payment"]??0.0,
//         totalNoOfBillsUtilities: json["Total No. of Bills & Utilities"]??0.0,
//         totalNoOfFood: json["Total No. of Food"]??0.0,
//         totalNoOfAlcohol: json["Total No. of Alcohol"]??0.0,
//         totalNoOfTravel: json["Total No. of Travel"]??0.0,
//         totalNoOfEntertainmentLifestyle:
//             json["Total No. of Entertainment & Lifestyle"]??0.0,
//         totalNoOfShoppingPurchase: json["Total No. of Shopping & Purchase"]??0.0,
//         totalNoOfInvestmentExpense: json["Total No. of Investment Expense"]??0.0,
//         totalNoOfGaming: json["Total No. of Gaming"]??0.0,
//         totalNoOfPersonalLoan: json["Total No. of Personal Loan"]??0.0,
//         totalNoOfHomeLoan: json["Total No. of Home Loan"]??0.0,
//         totalNoOfAutoLoan: json["Total No. of Auto Loan "]??0.0,
//         totalNoOfInsurance: json["Total No. of Insurance"]??0.0,
//         totalNoOfTaxTransactionDebit:
//             json["Total No. of Tax Transaction Debit"]??0.0,
//         totalNoOfTransferToWalletTransaction:
//             json["Total No. of Transfer to Wallet Transaction"]??0.0,
//         totalNoOfReversalTransactionDebit:
//             json["Total No. of Reversal Transaction Debit"]??0.0,
//         totalNoOfMedicalTransaction: json["Total No. of Medical Transaction"]??0.0,
//         totalNoOfChargesTransaction: json["Total No. of Charges Transaction"]??0.0,
//         totalNoOfBelowMinimumBalanceTransaction:
//             json["Total No. of Below Minimum Balance Transaction"]??0.0,
//         totalNoOfSalaryPaidTransaction:
//             json["Total No. of Salary Paid Transaction"]??0.0,
//         totalNoOfTransferOutTransaction:
//             json["Total No. of Transfer Out Transaction"]?.toDouble()??0.0,
//         totalNoOfForeignWalletTransaction:
//             json["Total No. of Foreign Wallet Transaction"]??0.0,
//         totalNoOfOtherCategoryDebitTransaction:
//             json["Total No. of Other Category Debit Transaction"]??0.0,
//         totalAmountOfBillsUtilities: json["Total Amount of Bills & Utilities"]??0.0,
//         totalAmountOfFood: json["Total Amount of Food"]??0.0,
//         totalAmountOfAlcohol: json["Total Amount of Alcohol"]??0.0,
//         totalAmountOfPersonalLoan: json["Total Amount of Personal Loan"]??0.0,
//         totalAmountOfHomeLoan: json["Total Amount of Home Loan"]??0.0,
//         totalAmountOfAutoLoan: json["Total Amount of Auto Loan "]??0.0,
//         totalAmountOfTravel: json["Total Amount of Travel"]??0.0,
//         totalAmountOfEntertainmentLifestyle:
//             json["Total Amount of Entertainment & Lifestyle"]??0.0,
//         totalAmountOfShoppingPurchase:
//             json["Total Amount of Shopping & Purchase"]??0.0,
//         totalAmountOfInvestmentExpense:
//             json["Total Amount of Investment Expense"]??0.0,
//         totalAmountOfInsurance: json["Total Amount of Insurance"]??0.0,
//         totalAmountOfTaxTransactionDebit:
//             json["Total Amount of Tax Transaction Debit"]??0.0,
//         totalAmountOfGaming: json["Total Amount of Gaming"]??0.0,
//         totalAmountOfTransferToWalletTransaction:
//             json["Total Amount of Transfer to Wallet Transaction"]??0.0,
//         totalAmountOfReversalTransactionDebit:
//             json["Total Amount of Reversal Transaction Debit"]??0.0,
//         totalAmountOfCreditCardPayment:
//             json["Total Amount of CreditCard Payment"]??0.0,
//         totalAmountOfCashWithdrawals: json["Total Amount of Cash Withdrawals"]??0.0,
//         totalAmountOfMedicalTransaction:
//             json["Total Amount of Medical Transaction"]??0.0,
//         totalAmountOfChargesTransaction:
//             json["Total Amount of Charges Transaction"]??0.0,
//         totalAmountOfBelowMinimumBalanceTransaction:
//             json["Total Amount of Below Minimum Balance Transaction"]??0.0,
//         totalAmountOfSalaryPaidTransaction:
//             json["Total Amount of Salary Paid Transaction"]??0.0,
//         totalAmountOfTransferOutTransaction:
//             json["Total Amount of Transfer Out Transaction"]?.toDouble()??0.0,
//         totalAmountOfForeignWalletTransaction:
//             json["Total Amount of Foreign Wallet Transaction"] ??'',
//         totalAmountOfEmiLoanPayments:
//             json["Total Amount of EMI / loan Payments"] ??'',
//         totalAmountOfOtherCategoryDebitTransaction:
//             json["Total Amount of Other Category Debit Transaction"] ??'',
//         totalNoOfMutualFunds: json["Total No. of Mutual Funds"] ??'',
//         totalDebitAmountOfMutualFunds:
//             json["Total Debit Amount of Mutual Funds"] ??'',
//         totalExpenseOnCryptoCurrency: json["Total Expense on Crypto Currency"] ??'',
//         totalExpenseOnShareMarket: json["Total Expense on Share Market"] ??'',
//         totalNoOfGasBillPayments: json["Total No. of Gas Bill Payments"] ??'',
//         totalAmountOfGasBillPayments: json["Total Amount of Gas Bill Payments"] ??'',
//         totalNoOfElectricityBillPayments:
//             json["Total No. of Electricity Bill Payments"] ??'',
//         totalNoOfMobileBroadbandBillPayments:
//             json["Total No. of Mobile & Broadband Bill Payments"] ??'',
//         totalAmountOfMobileBroadbandBillPayments:
//             json["Total Amount of Mobile & Broadband Bill Payments"] ??'',
//         totalAmountOfElectricityBillPayments:
//             json["Total Amount of Electricity Bill Payments"] ??'',
//         totalNoOfDividend: json["Total No. of Dividend"] ??'',
//         totalAmountOfDividend: json["Total Amount of Dividend"] ??'',
//       );

//   Map<String, dynamic> toJson() => {
//         "Min Opening Balance": minOpeningBalance,
//         "Max Opening Balance": maxOpeningBalance,
//         "Min Balance": minBalance,
//         "Median Balance": medianBalance,
//         "Max Balance": maxBalance,
//         "First Day EOD Balance": firstDayEodBalance,
//         "Last Day EOD Balance": lastDayEodBalance,
//         "Opening": opening,
//         "Closing Balance": closingBalance,
//         "Min EOD Balance": minEodBalance,
//         "Max EOD Balance": maxEodBalance,
//         "Median EOD Balance": medianEodBalance,
//         "Total No of Salary Credits": totalNoOfSalaryCredits,
//         "Total Amount of Salary Credits": totalAmountOfSalaryCredits,
//         "Total No. of Credit Transactions": totalNoOfCreditTransactions,
//         "Total Amount of Credit Transactions": totalAmountOfCreditTransactions,
//         "Total No. of Business Credit Transactions":
//             totalNoOfBusinessCreditTransactions,
//         "Total Amount of Business Credit Transactions":
//             totalAmountOfBusinessCreditTransactions,
//         "Total No. of Debit Transactions": totalNoOfDebitTransactions,
//         "Total Amount of Debit Transactions": totalAmountOfDebitTransactions,
//         "Total No. of Cash Deposits": totalNoOfCashDeposits,
//         "Total Amount of Cash Deposits": totalAmountOfCashDeposits,
//         "Total No. of Cash Withdrawals": totalNoOfCashWithdrawals,
//         "chqDeposits": chqDeposits,
//         "Total No. of Cheque Deposits": totalNoOfChequeDeposits,
//         "chqIssues": chqIssues,
//         "Total No. of Cheque Issues": totalNoOfChequeIssues,
//         "totalChqDeposits": totalChqDeposits,
//         "Total Amount of Cheque Deposits": totalAmountOfChequeDeposits,
//         "totalChqIssues": totalChqIssues,
//         "Total Amount of Cheque Issues": totalAmountOfChequeIssues,
//         "No. of EMI / loan payments": noOfEmiLoanPayments,
//         "Total No. of EMI / loan payments": totalNoOfEmiLoanPayments,
//         "Total No.of I / W Bounced": totalNoOfIWBounced,
//         "Sum of I/W Bounced": sumOfIWBounced,
//         "Total amount of I / W Bounced": totalAmountOfIWBounced,
//         "Total Number of Outward Cheque Bounces":
//             totalNumberOfOutwardChequeBounces,
//         "No. of transactions in BS": noOfTransactionsInBs,
//         "totalLoanDisbursal": totalLoanDisbursal,
//         "Total Amount of Loan Disbursal": totalAmountOfLoanDisbursal,
//         "Loan Disbursal": loanDisbursal,
//         "loanDisbursal": overallMaxLoanDisbursal,
//         "Total No. of Loan Disbursal": totalNoOfLoanDisbursal,
//         "Total No. of I/W Chq Bounced": overallMaxTotalNoOfIWChqBounced,
//         "Total No. of I / W Chq Bounced": totalNoOfIWChqBounced,
//         "inw_chq_bounce_nonTechnical": inwChqBounceNonTechnical,
//         "Total No. of I / W Cheque Bounce Non Technical":
//             totalNoOfIWChequeBounceNonTechnical,
//         "total_inw_chq_bounce_nonTechnical": totalInwChqBounceNonTechnical,
//         "Total Amount of I / W Cheque Bounce Non Technical":
//             totalAmountOfIWChequeBounceNonTechnical,
//         "salary_count": salaryCount,
//         "startDate": overallMaxStartDate,
//         "Start Date": startDate,
//         "Average EOD Balance": averageEodBalance,
//         "ABB on 1 14 last day": abbOn114LastDay,
//         "ABB on 1st,14th, 30th/Last Day": abbOn1St14Th30ThLastDay,
//         "Total No. of Net Credit Transactions": totalNoOfNetCreditTransactions,
//         "Total Net Credit Amount": totalNetCreditAmount,
//         "Total No. of Net Debit Transactions": totalNoOfNetDebitTransactions,
//         "Total Net Debit Amount": totalNetDebitAmount,
//         "Total No. of CreditCard Payment": totalNoOfCreditCardPayment,
//         "Total No. of Bills & Utilities": totalNoOfBillsUtilities,
//         "Total No. of Food": totalNoOfFood,
//         "Total No. of Alcohol": totalNoOfAlcohol,
//         "Total No. of Travel": totalNoOfTravel,
//         "Total No. of Entertainment & Lifestyle":
//             totalNoOfEntertainmentLifestyle,
//         "Total No. of Shopping & Purchase": totalNoOfShoppingPurchase,
//         "Total No. of Investment Expense": totalNoOfInvestmentExpense,
//         "Total No. of Gaming": totalNoOfGaming,
//         "Total No. of Personal Loan": totalNoOfPersonalLoan,
//         "Total No. of Home Loan": totalNoOfHomeLoan,
//         "Total No. of Auto Loan ": totalNoOfAutoLoan,
//         "Total No. of Insurance": totalNoOfInsurance,
//         "Total No. of Tax Transaction Debit": totalNoOfTaxTransactionDebit,
//         "Total No. of Transfer to Wallet Transaction":
//             totalNoOfTransferToWalletTransaction,
//         "Total No. of Reversal Transaction Debit":
//             totalNoOfReversalTransactionDebit,
//         "Total No. of Medical Transaction": totalNoOfMedicalTransaction,
//         "Total No. of Charges Transaction": totalNoOfChargesTransaction,
//         "Total No. of Below Minimum Balance Transaction":
//             totalNoOfBelowMinimumBalanceTransaction,
//         "Total No. of Salary Paid Transaction": totalNoOfSalaryPaidTransaction,
//         "Total No. of Transfer Out Transaction":
//             totalNoOfTransferOutTransaction,
//         "Total No. of Foreign Wallet Transaction":
//             totalNoOfForeignWalletTransaction,
//         "Total No. of Other Category Debit Transaction":
//             totalNoOfOtherCategoryDebitTransaction,
//         "Total Amount of Bills & Utilities": totalAmountOfBillsUtilities,
//         "Total Amount of Food": totalAmountOfFood,
//         "Total Amount of Alcohol": totalAmountOfAlcohol,
//         "Total Amount of Personal Loan": totalAmountOfPersonalLoan,
//         "Total Amount of Home Loan": totalAmountOfHomeLoan,
//         "Total Amount of Auto Loan ": totalAmountOfAutoLoan,
//         "Total Amount of Travel": totalAmountOfTravel,
//         "Total Amount of Entertainment & Lifestyle":
//             totalAmountOfEntertainmentLifestyle,
//         "Total Amount of Shopping & Purchase": totalAmountOfShoppingPurchase,
//         "Total Amount of Investment Expense": totalAmountOfInvestmentExpense,
//         "Total Amount of Insurance": totalAmountOfInsurance,
//         "Total Amount of Tax Transaction Debit":
//             totalAmountOfTaxTransactionDebit,
//         "Total Amount of Gaming": totalAmountOfGaming,
//         "Total Amount of Transfer to Wallet Transaction":
//             totalAmountOfTransferToWalletTransaction,
//         "Total Amount of Reversal Transaction Debit":
//             totalAmountOfReversalTransactionDebit,
//         "Total Amount of CreditCard Payment": totalAmountOfCreditCardPayment,
//         "Total Amount of Cash Withdrawals": totalAmountOfCashWithdrawals,
//         "Total Amount of Medical Transaction": totalAmountOfMedicalTransaction,
//         "Total Amount of Charges Transaction": totalAmountOfChargesTransaction,
//         "Total Amount of Below Minimum Balance Transaction":
//             totalAmountOfBelowMinimumBalanceTransaction,
//         "Total Amount of Salary Paid Transaction":
//             totalAmountOfSalaryPaidTransaction,
//         "Total Amount of Transfer Out Transaction":
//             totalAmountOfTransferOutTransaction,
//         "Total Amount of Foreign Wallet Transaction":
//             totalAmountOfForeignWalletTransaction,
//         "Total Amount of EMI / loan Payments": totalAmountOfEmiLoanPayments,
//         "Total Amount of Other Category Debit Transaction":
//             totalAmountOfOtherCategoryDebitTransaction,
//         "Total No. of Mutual Funds": totalNoOfMutualFunds,
//         "Total Debit Amount of Mutual Funds": totalDebitAmountOfMutualFunds,
//         "Total Expense on Crypto Currency": totalExpenseOnCryptoCurrency,
//         "Total Expense on Share Market": totalExpenseOnShareMarket,
//         "Total No. of Gas Bill Payments": totalNoOfGasBillPayments,
//         "Total Amount of Gas Bill Payments": totalAmountOfGasBillPayments,
//         "Total No. of Electricity Bill Payments":
//             totalNoOfElectricityBillPayments,
//         "Total No. of Mobile & Broadband Bill Payments":
//             totalNoOfMobileBroadbandBillPayments,
//         "Total Amount of Mobile & Broadband Bill Payments":
//             totalAmountOfMobileBroadbandBillPayments,
//         "Total Amount of Electricity Bill Payments":
//             totalAmountOfElectricityBillPayments,
//         "Total No. of Dividend": totalNoOfDividend,
//         "Total Amount of Dividend": totalAmountOfDividend,
//       };
// }

// class CustomerInfo {
//   String? holdingType;
//   List<Holder>? holders;

//   CustomerInfo({
//     this.holdingType,
//     this.holders,
//   });

//   factory CustomerInfo.fromJson(Map<String, dynamic> json) => CustomerInfo(
//         holdingType: json["holding_type"] ??'',
//         holders: json["holders"] == null
//             ? []
//             : List<Holder>.from(
//                 json["holders"]!.map((x) => Holder.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "holding_type": holdingType,
//         "holders": holders == null
//             ? []
//             : List<dynamic>.from(holders!.map((x) => x.toJson())),
//       };
// }

// class Holder {
//   String? name;
//   String? email;
//   String? contactNumber;
//   String? address;
//   String? pan;
//   String? ckycCompliance;
//   DateTime? dob;
//   String? landline;
//   String? nominee;

//   Holder({
//     this.name,
//     this.email,
//     this.contactNumber,
//     this.address,
//     this.pan,
//     this.ckycCompliance,
//     this.dob,
//     this.landline,
//     this.nominee,
//   });

//   factory Holder.fromJson(Map<String, dynamic> json) => Holder(
//         name: json["name"] ??'',
//         email: json["email"] ??'',
//         contactNumber: json["contact_number"] ??'',
//         address: json["address"] ??'',
//         pan: json["pan"] ??'',
//         ckycCompliance: json["ckyc_compliance"],
//         dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
//         landline: json["landline"] ??'',
//         nominee: json["nominee"] ??'',
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "email": email,
//         "contact_number": contactNumber,
//         "address": address,
//         "pan": pan,
//         "ckyc_compliance": ckycCompliance,
//         "dob":
//             "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
//         "landline": landline,
//         "nominee": nominee,
//       };
// }

// class DailyOpenCloseBalance {
//   String? month;
//   List<DailyBalance>? dailyBalance;

//   DailyOpenCloseBalance({
//     this.month,
//     this.dailyBalance,
//   });

//   factory DailyOpenCloseBalance.fromJson(Map<String, dynamic> json) =>
//       DailyOpenCloseBalance(
//         month: json["month"],
//         dailyBalance: json["dailyBalance"] == null
//             ? []
//             : List<DailyBalance>.from(
//                 json["dailyBalance"]!.map((x) => DailyBalance.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "month": month,
//         "dailyBalance": dailyBalance == null
//             ? []
//             : List<dynamic>.from(dailyBalance!.map((x) => x.toJson())),
//       };
// }

// class DailyBalance {
//   num? timestamp;
//   DateTime? transactionDate;
//   double? openingBalance;
//   double? closingBalance;

//   DailyBalance({
//     this.timestamp,
//     this.transactionDate,
//     this.openingBalance,
//     this.closingBalance,
//   });

//   factory DailyBalance.fromJson(Map<String, dynamic> json) => DailyBalance(
//         timestamp: json["timestamp"],
//         transactionDate: json["transaction_date"] == null
//             ? null
//             : DateTime.parse(json["transaction_date"]),
//         openingBalance: json["opening_balance"]?.toDouble() ??0.0,
//         closingBalance: json["closing_balance"]?.toDouble() ??0.0,
//       );

//   Map<String, dynamic> toJson() => {
//         "timestamp": timestamp,
//         "transaction_date":
//             "${transactionDate!.year.toString().padLeft(4, '0')}-${transactionDate!.month.toString().padLeft(2, '0')}-${transactionDate!.day.toString().padLeft(2, '0')}",
//         "opening_balance": openingBalance,
//         "closing_balance": closingBalance,
//       };
// }

// class FraudAnalysis {
//   String? type;
//   String? dgBdtinCode;
//   String? result;
//   List<FraudAnalysisTransaction>? transactions;

//   FraudAnalysis({
//     this.type,
//     this.dgBdtinCode,
//     this.result,
//     this.transactions,
//   });

//   factory FraudAnalysis.fromJson(Map<String, dynamic> json) => FraudAnalysis(
//         type: json["type"] ??'',
//         dgBdtinCode: json["dg_bdtin_code"] ??'',
//         result: json["result"] ??'',
//         transactions: json["transactions"] == null
//             ? []
//             : List<FraudAnalysisTransaction>.from(json["transactions"]!
//                 .map((x) => FraudAnalysisTransaction.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "type": type,
//         "dg_bdtin_code": dgBdtinCode,
//         "result": resultValues.reverse[result],
//         "transactions": transactions == null
//             ? []
//             : List<dynamic>.from(transactions!.map((x) => x.toJson())),
//       };
// }

// enum Result { APPLICABLE, NOT_APPLICABLE }

// final resultValues = EnumValues(
//     {"applicable": Result.APPLICABLE, "not_applicable": Result.NOT_APPLICABLE});

// class FraudAnalysisTransaction {
//   num? amount;
//   double? balance;
//   String? chequeNum;
//   DateTime? transactionDate;
//   String? narration;
//   String? category;

//   FraudAnalysisTransaction({
//     this.amount,
//     this.balance,
//     this.chequeNum,
//     this.transactionDate,
//     this.narration,
//     this.category,
//   });

//   factory FraudAnalysisTransaction.fromJson(Map<String, dynamic> json) =>
//       FraudAnalysisTransaction(
//         amount: json["amount"],
//         balance: json["balance"]?.toDouble(),
//         chequeNum: json["cheque_num"],
//         transactionDate: json["transaction_date"] == null
//             ? null
//             : DateTime.parse(json["transaction_date"]),
//         narration: json["narration"] ??'',
//         category: json["category"] ?? '',
//       );

//   Map<String, dynamic> toJson() => {
//         "amount": amount,
//         "balance": balance,
//         "cheque_num": chequeNum,
//         "transaction_date":
//             "${transactionDate!.year.toString().padLeft(4, '0')}-${transactionDate!.month.toString().padLeft(2, '0')}-${transactionDate!.day.toString().padLeft(2, '0')}",
//         "narration": tionValues.reverse[narration],
//         "category": categoryValues.reverse[category],
//       };
// }

// enum Category { numEREST, OPENING_BALANCE, TRANSFER_IN, TRANSFER_OUT }

// final categoryValues = EnumValues({
//   "numerest": Category.numEREST,
//   "Opening Balance": Category.OPENING_BALANCE,
//   "Transfer in": Category.TRANSFER_IN,
//   "Transfer out": Category.TRANSFER_OUT
// });

// enum Tion {
//   BY_DEBIT_CARD,
//   BY_TRANSFER,
//   CREDIT_numEREST,
//   OPENING_BALANCE,
//   TO_TRANSFER
// }

// final tionValues = EnumValues({
//   "by debit card": Tion.BY_DEBIT_CARD,
//   "BY TRANSFER": Tion.BY_TRANSFER,
//   "CREDIT numEREST": Tion.CREDIT_numEREST,
//   "OPENING BALANCE": Tion.OPENING_BALANCE,
//   "TO TRANSFER": Tion.TO_TRANSFER
// });

// class Pending {
//   String? amount;
//   String? transactionType;

//   Pending({
//     this.amount,
//     this.transactionType,
//   });

//   factory Pending.fromJson(Map<String, dynamic> json) => Pending(
//         amount: json["amount"],
//         transactionType: json["transaction_type"],
//       );

//   Map<String, dynamic> toJson() => {
//         "amount": amount,
//         "transaction_type": transactionType,
//       };
// }

// class RawDatum {
//   num? sn;
//   String? date;
//   String? description;
//   String? category;
//   dynamic debit;
//   dynamic credit;
//   double? balance;

//   RawDatum({
//     this.sn,
//     this.date,
//     this.description,
//     this.category,
//     this.debit,
//     this.credit,
//     this.balance,
//   });

//   factory RawDatum.fromJson(Map<String, dynamic> json) => RawDatum(
//         sn: json["SN"],
//         date: json["Date"],
//         description:json["Description"] ??'',
//         category: json["Category"]??'',
//         debit: json["Debit"],
//         credit: json["Credit"],
//         balance: json["Balance"]?.toDouble(),
//       );

//   Map<String, dynamic> toJson() => {
//         "SN": sn,
//         "Date": date,
//         "Description": tionValues.reverse[description],
//         "Category": categoryValues.reverse[category],
//         "Debit": debit,
//         "Credit": credit,
//         "Balance": balance,
//       };
// }

// class RecurrentCr {
//   RecurrentCrRecurrentNarration? recurrentNarration;
//   List<RecurrentCrRecurrentTransaction>? recurrentTransaction;

//   RecurrentCr({
//     this.recurrentNarration,
//     this.recurrentTransaction,
//   });

//   factory RecurrentCr.fromJson(Map<String, dynamic> json) => RecurrentCr(
//         recurrentNarration: json["recurrent_narration"] == null
//             ? null
//             : RecurrentCrRecurrentNarration.fromJson(
//                 json["recurrent_narration"]),
//         recurrentTransaction: json["recurrent_transaction"] == null
//             ? []
//             : List<RecurrentCrRecurrentTransaction>.from(
//                 json["recurrent_transaction"]!
//                     .map((x) => RecurrentCrRecurrentTransaction.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "recurrent_narration": recurrentNarration?.toJson(),
//         "recurrent_transaction": recurrentTransaction == null
//             ? []
//             : List<dynamic>.from(recurrentTransaction!.map((x) => x.toJson())),
//       };
// }

// class RecurrentCrRecurrentNarration {
//   ByTransfer? byTransfer;

//   RecurrentCrRecurrentNarration({
//     this.byTransfer,
//   });

//   factory RecurrentCrRecurrentNarration.fromJson(Map<String, dynamic> json) =>
//       RecurrentCrRecurrentNarration(
//         byTransfer: json["BY TRANSFER"] == null
//             ? null
//             : ByTransfer.fromJson(json["BY TRANSFER"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "BY TRANSFER": byTransfer?.toJson(),
//       };
// }

// class ByTransfer {
//   String? totalRecurrentCrSum;
//   String? totalMonthRecurrentCrCount;
//   String? individualMonth;

//   ByTransfer({
//     this.totalRecurrentCrSum,
//     this.totalMonthRecurrentCrCount,
//     this.individualMonth,
//   });

//   factory ByTransfer.fromJson(Map<String, dynamic> json) => ByTransfer(
//       totalRecurrentCrSum: json["total_recurrent_cr_sum"],
//       totalMonthRecurrentCrCount: json["total_month_recurrent_cr_count"],
//       individualMonth: json["individual_month"] ?? '');

//   Map<String, dynamic> toJson() => {
//         "total_recurrent_cr_sum": totalRecurrentCrSum,
//         "total_month_recurrent_cr_count": totalMonthRecurrentCrCount,
//         "individual_month": individualMonth,
//       };
// }

// // class IndividualMonth {
// //   The2024? april2024;
// //   The2024? may2024;
// //   The2024? june2024;
// //   The2024? july2024;
// //   The2024? august2024;
// //   The2024? september2024;

// //   IndividualMonth({
// //     this.april2024,
// //     this.may2024,
// //     this.june2024,
// //     this.july2024,
// //     this.august2024,
// //     this.september2024,
// //   });

// //   factory IndividualMonth.fromJson(Map<String, dynamic> json) =>
// //       IndividualMonth(
// //         april2024: json["April 2024"] == null
// //             ? null
// //             : The2024.fromJson(json["April 2024"]),
// //         may2024: json["May 2024"] == null
// //             ? null
// //             : The2024.fromJson(json["May 2024"]),
// //         june2024: json["June 2024"] == null
// //             ? null
// //             : The2024.fromJson(json["June 2024"]),
// //         july2024: json["July 2024"] == null
// //             ? null
// //             : The2024.fromJson(json["July 2024"]),
// //         august2024: json["August 2024"] == null
// //             ? null
// //             : The2024.fromJson(json["August 2024"]),
// //         september2024: json["September 2024"] == null
// //             ? null
// //             : The2024.fromJson(json["September 2024"]),
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "April 2024": april2024?.toJson(),
// //         "May 2024": may2024?.toJson(),
// //         "June 2024": june2024?.toJson(),
// //         "July 2024": july2024?.toJson(),
// //         "August 2024": august2024?.toJson(),
// //         "September 2024": september2024?.toJson(),
// //       };
// // }

// class The2024 {
//   String? individualMonthRecurrentCrSum;
//   String? individualMonthRecurrentCrCount;

//   The2024({
//     this.individualMonthRecurrentCrSum,
//     this.individualMonthRecurrentCrCount,
//   });

//   factory The2024.fromJson(Map<String, dynamic> json) => The2024(
//         individualMonthRecurrentCrSum:
//             json["individual_month_recurrent_cr_sum"],
//         individualMonthRecurrentCrCount:
//             json["individual_month_recurrent_cr_count"],
//       );

//   Map<String, dynamic> toJson() => {
//         "individual_month_recurrent_cr_sum": individualMonthRecurrentCrSum,
//         "individual_month_recurrent_cr_count": individualMonthRecurrentCrCount,
//       };
// }

// class RecurrentCrRecurrentTransaction {
//   DateTime? date;
//   Tion? description;
//   Category? category;
//   num? amount;

//   RecurrentCrRecurrentTransaction({
//     this.date,
//     this.description,
//     this.category,
//     this.amount,
//   });

//   factory RecurrentCrRecurrentTransaction.fromJson(Map<String, dynamic> json) =>
//       RecurrentCrRecurrentTransaction(
//         date: json["Date"] == null ? null : DateTime.parse(json["Date"]),
//         description: tionValues.map[json["Description"]],
//         category: categoryValues.map[json["Category"]],
//         amount: json["Amount"],
//       );

//   Map<String, dynamic> toJson() => {
//         "Date":
//             "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
//         "Description": tionValues.reverse[description],
//         "Category": categoryValues.reverse[category],
//         "Amount": amount,
//       };
// }

// class RecurrentDr {
//   RecurrentDrRecurrentNarration? recurrentNarration;
//   List<RecurrentDrRecurrentTransaction>? recurrentTransaction;

//   RecurrentDr({
//     this.recurrentNarration,
//     this.recurrentTransaction,
//   });

//   factory RecurrentDr.fromJson(Map<String, dynamic> json) => RecurrentDr(
//         recurrentNarration: json["recurrent_narration"] == null
//             ? null
//             : RecurrentDrRecurrentNarration.fromJson(
//                 json["recurrent_narration"]),
//         recurrentTransaction: json["recurrent_transaction"] == null
//             ? []
//             : List<RecurrentDrRecurrentTransaction>.from(
//                 json["recurrent_transaction"]
//                     .map((x) => RecurrentDrRecurrentTransaction.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "recurrent_narration": recurrentNarration?.toJson(),
//         "recurrent_transaction": recurrentTransaction == null
//             ? []
//             : List<dynamic>.from(recurrentTransaction!.map((x) => x.toJson())),
//       };
// }

// class RecurrentDrRecurrentNarration {
//   ByTransfer? toTransfer;
//   ByTransfer? byDebitCard;

//   RecurrentDrRecurrentNarration({
//     this.toTransfer,
//     this.byDebitCard,
//   });

//   factory RecurrentDrRecurrentNarration.fromJson(Map<String, dynamic> json) =>
//       RecurrentDrRecurrentNarration(
//         toTransfer: json["TO TRANSFER"] == null
//             ? null
//             : ByTransfer.fromJson(json["TO TRANSFER"]),
//         byDebitCard: json["by debit card"] == null
//             ? null
//             : ByTransfer.fromJson(json["by debit card"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "TO TRANSFER": toTransfer?.toJson(),
//         "by debit card": byDebitCard?.toJson(),
//       };
// }

// class RecurrentDrRecurrentTransaction {
//   DateTime? date;
//   Tion? description;
//   Category? category;
//   double? amount;
//   double? balance;
//   String? chqno;

//   RecurrentDrRecurrentTransaction({
//     this.date,
//     this.description,
//     this.category,
//     this.amount,
//     this.balance,
//     this.chqno,
//   });

//   factory RecurrentDrRecurrentTransaction.fromJson(Map<String, dynamic> json) =>
//       RecurrentDrRecurrentTransaction(
//         date: json["Date"] == null ? null : DateTime.parse(json["Date"]),
//         description: tionValues.map[json["Description"]],
//         category: categoryValues.map[json["Category"]],
//         amount: json["Amount"]?.toDouble() ?? 0.0,
//         balance: json["balance"]?.toDouble() ?? 0.0,
//         chqno: json["chqno"] ?? '',
//       );

//   Map<String, dynamic> toJson() => {
//         "Date":
//             "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
//         "Description": tionValues.reverse[description],
//         "Category": categoryValues.reverse[category],
//         "Amount": amount,
//         "balance": balance,
//         "chqno": chqno,
//       };
// }

// class AccountTransaction {
//   double? amount;
//   String? balance;
//   String? chequeNum;
//   DateTime? date;
//   String? modeFromSource;
//   String? narration;
//   String? reference;
//   String? transactionId;
//   DateTime? transactionTimestamp;
//   String? category;
//   String? subCategory;

//   AccountTransaction({
//     this.amount,
//     this.balance,
//     this.chequeNum,
//     this.date,
//     this.modeFromSource,
//     this.narration,
//     this.reference,
//     this.transactionId,
//     this.transactionTimestamp,
//     this.category,
//     this.subCategory,
//   });

//   factory AccountTransaction.fromJson(Map<String, dynamic> json) =>
//       AccountTransaction(
//         amount: json["amount"]?.toDouble() ?? 0.0,
//         balance: json["balance"] ?? '',
//         chequeNum: json["cheque_num"] ?? '',
//         date: json["date"] == null ? null : DateTime.parse(json["date"]),
//         modeFromSource: json["mode_from_source"] ?? "",
//         narration: json["narration"] ?? '',
//         reference: json["reference"] ?? '',
//         transactionId: json["transaction_id"] ?? '',
//         transactionTimestamp: json["transaction_timestamp"] == null
//             ? null
//             : DateTime.parse(json["transaction_timestamp"]),
//         category: json["category"] ?? '',
//         subCategory: json["sub_category"] ?? '',
//       );

//   Map<String, dynamic> toJson() => {
//         "amount": amount,
//         "balance": balance,
//         "cheque_num": chequeNum,
//         "date":
//             "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
//         "mode_from_source": modeFromSourceValues.reverse[modeFromSource],
//         "narration": tionValues.reverse[narration],
//         "reference": reference,
//         "transaction_id": transactionId,
//         "transaction_timestamp": transactionTimestamp?.toIso8601String(),
//         "category": categoryValues.reverse[category],
//         "sub_category": subCategory,
//       };
// }

// enum ModeFromSource { CARD, FT, OTHERS }

// final modeFromSourceValues = EnumValues({
//   "CARD": ModeFromSource.CARD,
//   "FT": ModeFromSource.FT,
//   "OTHERS": ModeFromSource.OTHERS
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
import 'dart:convert';

class ReportSummaryModel {
  bool? success;
  ReportData? reportData;

  ReportSummaryModel({
    this.success,
    this.reportData,
  });

  factory ReportSummaryModel.fromRawJson(String str) =>
      ReportSummaryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReportSummaryModel.fromJson(Map<String, dynamic> json) =>
      ReportSummaryModel(
        success: json["success"],
        reportData: json["reportData"] == null
            ? null
            : ReportData.fromJson(json["reportData"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "reportData": reportData?.toJson(),
      };
}

class ReportData {
  String? clientRefNum;
  num? requestId;
  String? txnId;
  DateTime? startDate;
  DateTime? endDate;
  num? durationInMonth;
  String? dgReportVersion;
  num? reportNum;
  DateTime? reportFetchTime;
  String? reportFetchType;
  String? sourceOfData;
  DateTime? statementStartDate;
  DateTime? statementEndDate;
  String? multipleAccountsFound;
  String? sourceReport;
  List<Bank>? banks;
  Map<String, double>? requestLevelSummaryVar;

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
    this.sourceReport,
    this.banks,
    this.requestLevelSummaryVar,
  });

  factory ReportData.fromRawJson(String str) =>
      ReportData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReportData.fromJson(Map<String, dynamic> json) => ReportData(
        clientRefNum: json["client_ref_num"],
        requestId: json["request_id"],
        txnId: json["txn_id"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        durationInMonth: json["duration_in_month"],
        dgReportVersion: json["dg_report_version"],
        reportNum: json["report_num"],
        reportFetchTime: json["report_fetch_time"] == null
            ? null
            : DateTime.parse(json["report_fetch_time"]),
        reportFetchType: json["report_fetch_type"],
        sourceOfData: json["source_of_data"],
        statementStartDate: json["statement_start_date"] == null
            ? null
            : DateTime.parse(json["statement_start_date"]),
        statementEndDate: json["statement_end_date"] == null
            ? null
            : DateTime.parse(json["statement_end_date"]),
        multipleAccountsFound: json["multiple_accounts_found"],
        sourceReport: json["source_report"],
        banks: json["banks"] == null
            ? []
            : List<Bank>.from(json["banks"].map((x) => Bank.fromJson(x))),
        requestLevelSummaryVar: Map.from(json["request_level_summary_var"]!)
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "client_ref_num": clientRefNum,
        "request_id": requestId,
        "txn_id": txnId,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "duration_in_month": durationInMonth,
        "dg_report_version": dgReportVersion,
        "report_num": reportNum,
        "report_fetch_time": reportFetchTime?.toIso8601String(),
        "report_fetch_type": reportFetchType,
        "source_of_data": sourceOfData,
        "statement_start_date":
            "${statementStartDate!.year.toString().padLeft(4, '0')}-${statementStartDate!.month.toString().padLeft(2, '0')}-${statementStartDate!.day.toString().padLeft(2, '0')}",
        "statement_end_date":
            "${statementEndDate!.year.toString().padLeft(4, '0')}-${statementEndDate!.month.toString().padLeft(2, '0')}-${statementEndDate!.day.toString().padLeft(2, '0')}",
        "multiple_accounts_found": multipleAccountsFound,
        "source_report": sourceReport,
        "banks": banks == null
            ? []
            : List<dynamic>.from(banks!.map((x) => x.toJson())),
        "request_level_summary_var": Map.from(requestLevelSummaryVar!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class Bank {
  String? bank;
  num? digitapInstitutionId;
  String? sourceBankId;
  String? multipleAccountsFound;
  List<Account>? accounts;
  Map<String, double>? bankLevelSummaryVar;

  Bank({
    this.bank,
    this.digitapInstitutionId,
    this.sourceBankId,
    this.multipleAccountsFound,
    this.accounts,
    this.bankLevelSummaryVar,
  });

  factory Bank.fromRawJson(String str) => Bank.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        bank: json["bank"],
        digitapInstitutionId: json["digitap_institution_id"],
        sourceBankId: json["source_bank_id"],
        multipleAccountsFound: json["multiple_accounts_found"],
        accounts: json["accounts"] == null
            ? []
            : List<Account>.from(
                json["accounts"].map((x) => Account.fromJson(x))),
        bankLevelSummaryVar: Map.from(json["bank_level_summary_var"] ?? {})
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "bank": bank,
        "digitap_institution_id": digitapInstitutionId,
        "source_bank_id": sourceBankId,
        "multiple_accounts_found": multipleAccountsFound,
        "accounts": accounts == null
            ? []
            : List<dynamic>.from(accounts!.map((x) => x.toJson())),
        "bank_level_summary_var": Map.from(bankLevelSummaryVar ?? {})
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class Account {
  CustomerInfo? customerInfo;
  String? location;
  String? openingDate;
  String? currentBalance;
  Pending? pending;
  DateTime? balanceDateTime;
  String? currentOdLimit;
  String? drawingLimit;
  String? currency;
  String? exchgeRate;
  String? accountStatus;
  String? facility;
  String? accountIfscCode;
  String? micrCode;
  String? accountNumber;
  String? accountType;
  String? accountDescription;
  DateTime? transactionStartDate;
  DateTime? transactionEndDate;
  List<AccountTransaction>? transactions;
  List<dynamic>? tamperDetectionDetails;
  String? ifscCode;
  AnalysisData? analysisData;
  List<RawDatum>? rawData;
  List<DailyOpenCloseBalance>? dailyOpenCloseBalances;
  RecurrentCr? recurrentCr;
  RecurrentDr? recurrentDr;
  List<dynamic>? loanAnalysis;
  List<FraudAnalysis>? fraudAnalysis;

  Account({
    this.customerInfo,
    this.location,
    this.openingDate,
    this.currentBalance,
    this.pending,
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
    this.analysisData,
    this.rawData,
    this.dailyOpenCloseBalances,
    this.recurrentCr,
    this.recurrentDr,
    this.loanAnalysis,
    this.fraudAnalysis,
  });

  factory Account.fromRawJson(String str) => Account.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        customerInfo: json["customer_info"] == null
            ? null
            : CustomerInfo.fromJson(json["customer_info"]),
        location: json["location"],
        openingDate: json["opening_date"],
        currentBalance: json["current_balance"],
        pending:
            json["pending"] == null ? null : Pending.fromJson(json["pending"]),
        balanceDateTime: json["balance_date_time"] == null
            ? null
            : DateTime.parse(json["balance_date_time"]),
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
        transactionStartDate: json["transaction_start_date"] == null
            ? null
            : DateTime.parse(json["transaction_start_date"]),
        transactionEndDate: json["transaction_end_date"] == null
            ? null
            : DateTime.parse(json["transaction_end_date"]),
        transactions: json["transactions"] == null
            ? []
            : List<AccountTransaction>.from(json["transactions"]
                .map((x) => AccountTransaction.fromJson(x))),
        tamperDetectionDetails: json["tamper_detection_details"] == null
            ? []
            : List<dynamic>.from(
                json["tamper_detection_details"].map((x) => x)),
        ifscCode: json["ifscCode"],
        analysisData: json["analysis_data"] == null
            ? null
            : AnalysisData.fromJson(json["analysis_data"]),
        rawData: json["raw_data"] == null
            ? []
            : List<RawDatum>.from(
                json["raw_data"].map((x) => RawDatum.fromJson(x))),
        dailyOpenCloseBalances: json["daily_open_close_balances"] == null
            ? []
            : List<DailyOpenCloseBalance>.from(json["daily_open_close_balances"]
                .map((x) => DailyOpenCloseBalance.fromJson(x))),
        recurrentCr: json["recurrent_cr"] == null
            ? null
            : RecurrentCr.fromJson(json["recurrent_cr"]),
        recurrentDr: json["recurrent_dr"] == null
            ? null
            : RecurrentDr.fromJson(json["recurrent_dr"]),
        loanAnalysis: json["loan_analysis"] == null
            ? []
            : List<dynamic>.from(json["loan_analysis"].map((x) => x)),
        fraudAnalysis: json["fraud_analysis"] == null
            ? []
            : List<FraudAnalysis>.from(
                json["fraud_analysis"].map((x) => FraudAnalysis.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "customer_info": customerInfo?.toJson(),
        "location": location,
        "opening_date": openingDate,
        "current_balance": currentBalance,
        "pending": pending?.toJson(),
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
        "transaction_start_date":
            "${transactionStartDate!.year.toString().padLeft(4, '0')}-${transactionStartDate!.month.toString().padLeft(2, '0')}-${transactionStartDate!.day.toString().padLeft(2, '0')}",
        "transaction_end_date":
            "${transactionEndDate!.year.toString().padLeft(4, '0')}-${transactionEndDate!.month.toString().padLeft(2, '0')}-${transactionEndDate!.day.toString().padLeft(2, '0')}",
        "transactions": transactions == null
            ? []
            : List<dynamic>.from(transactions!.map((x) => x.toJson())),
        "tamper_detection_details": tamperDetectionDetails == null
            ? []
            : List<dynamic>.from(tamperDetectionDetails!.map((x) => x)),
        "ifscCode": ifscCode,
        "analysis_data": analysisData?.toJson(),
        "raw_data": rawData == null
            ? []
            : List<dynamic>.from(rawData!.map((x) => x.toJson())),
        "daily_open_close_balances": dailyOpenCloseBalances == null
            ? []
            : List<dynamic>.from(
                dailyOpenCloseBalances!.map((x) => x.toJson())),
        "recurrent_cr": recurrentCr?.toJson(),
        "recurrent_dr": recurrentDr?.toJson(),
        "loan_analysis": loanAnalysis == null
            ? []
            : List<dynamic>.from(loanAnalysis!.map((x) => x)),
        "fraud_analysis": fraudAnalysis == null
            ? []
            : List<dynamic>.from(fraudAnalysis!.map((x) => x.toJson())),
      };
}

class AnalysisData {
  April2024? april2024;
  August2024? may2024;
  August2024? june2024;
  August2024? july2024;
  August2024? august2024;
  August2024? september2024;
  Overall? overall;
  OverallMax? overallMaxSum;
  OverallMax? overallMaxAverage;

  AnalysisData({
    this.april2024,
    this.may2024,
    this.june2024,
    this.july2024,
    this.august2024,
    this.september2024,
    this.overall,
    this.overallMaxSum,
    this.overallMaxAverage,
  });

  factory AnalysisData.fromRawJson(String str) =>
      AnalysisData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalysisData.fromJson(Map<String, dynamic> json) => AnalysisData(
        april2024: json["April 2024*"] == null
            ? null
            : April2024.fromJson(json["April 2024*"]),
        may2024: json["May 2024"] == null
            ? null
            : August2024.fromJson(json["May 2024"]),
        june2024: json["June 2024"] == null
            ? null
            : August2024.fromJson(json["June 2024"]),
        july2024: json["July 2024"] == null
            ? null
            : August2024.fromJson(json["July 2024"]),
        august2024: json["August 2024"] == null
            ? null
            : August2024.fromJson(json["August 2024"]),
        september2024: json["September 2024*"] == null
            ? null
            : August2024.fromJson(json["September 2024*"]),
        overall:
            json["Overall"] == null ? null : Overall.fromJson(json["Overall"]),
        overallMaxSum: json["Overall_max_sum"] == null
            ? null
            : OverallMax.fromJson(json["Overall_max_sum"]),
        overallMaxAverage: json["Overall_max_average"] == null
            ? null
            : OverallMax.fromJson(json["Overall_max_average"]),
      );

  Map<String, dynamic> toJson() => {
        "April 2024*": april2024?.toJson(),
        "May 2024": may2024?.toJson(),
        "June 2024": june2024?.toJson(),
        "July 2024": july2024?.toJson(),
        "August 2024": august2024?.toJson(),
        "September 2024*": september2024?.toJson(),
        "Overall": overall?.toJson(),
        "Overall_max_sum": overallMaxSum?.toJson(),
        "Overall_max_average": overallMaxAverage?.toJson(),
      };
}

class April2024 {
  num? minOpeningBalance;
  num? maxOpeningBalance;
  num? minBalance;
  String? medianBalance;
  num? maxBalance;
  num? firstDayEodBalance;
  num? lastDayEodBalance;
  num? opening;
  num? closingBalance;
  num? minEodBalance;
  num? maxEodBalance;
  num? medianEodBalance;
  num? totalNoOfSalaryCredits;
  num? totalAmountOfSalaryCredits;
  num? totalNoOfCreditTransactions;
  num? totalAmountOfCreditTransactions;
  num? totalNoOfBusinessCreditTransactions;
  num? totalAmountOfBusinessCreditTransactions;
  num? totalNoOfDebitTransactions;
  num? totalAmountOfDebitTransactions;
  num? totalNoOfCashDeposits;
  num? totalAmountOfCashDeposits;
  num? totalNoOfCashWithdrawals;
  num? chqDeposits;
  num? totalNoOfChequeDeposits;
  num? chqIssues;
  num? totalNoOfChequeIssues;
  num? totalChqDeposits;
  num? totalAmountOfChequeDeposits;
  num? totalChqIssues;
  num? totalAmountOfChequeIssues;
  num? noOfEmiLoanPayments;
  num? totalNoOfEmiLoanPayments;
  num? totalNoOfIWBounced;
  num? sumOfIWBounced;
  num? totalAmountOfIWBounced;
  num? totalNumberOfOutwardChequeBounces;
  num? noOfTransactionsInBs;
  num? totalLoanDisbursal;
  num? totalAmountOfLoanDisbursal;
  num? loanDisbursal;
  num? april2024LoanDisbursal;
  num? totalNoOfLoanDisbursal;
  num? april2024TotalNoOfIWChqBounced;
  num? totalNoOfIWChqBounced;
  num? inwChqBounceNonTechnical;
  num? totalNoOfIWChequeBounceNonTechnical;
  num? totalInwChqBounceNonTechnical;
  num? totalAmountOfIWChequeBounceNonTechnical;
  num? salaryCount;
  DateTime? april2024StartDate;
  DateTime? startDate;
  String? isCompleteMonthTxn;
  num? averageEodBalance;
  String? foir;
  List<dynamic>? employerName;
  String? avgBalanceTill10ThOfMonth;
  String? avgBalanceTill20ThOfMonth;
  num? avgBalanceTillLastDateOfMonth;
  double? abbOn114LastDay;
  double? abbOn1St14Th30ThLastDay;
  num? totalNoOfNetCreditTransactions;
  num? totalNetCreditAmount;
  num? totalNoOfNetDebitTransactions;
  num? totalNetDebitAmount;
  num? totalNoOfCreditCardPayment;
  num? totalNoOfBillsUtilities;
  num? totalNoOfFood;
  num? totalNoOfAlcohol;
  num? totalNoOfTravel;
  num? totalNoOfEntertainmentLifestyle;
  num? totalNoOfShoppingPurchase;
  num? totalNoOfInvestmentExpense;
  num? totalNoOfGaming;
  num? totalNoOfPersonalLoan;
  num? totalNoOfHomeLoan;
  num? totalNoOfAutoLoan;
  num? totalNoOfInsurance;
  num? totalNoOfTaxTransactionDebit;
  num? totalNoOfTransferToWalletTransaction;
  num? totalNoOfReversalTransactionDebit;
  num? totalNoOfMedicalTransaction;
  num? totalNoOfChargesTransaction;
  num? totalNoOfBelowMinimumBalanceTransaction;
  num? totalNoOfSalaryPaidTransaction;
  num? totalNoOfTransferOutTransaction;
  num? totalNoOfForeignWalletTransaction;
  num? totalNoOfOtherCategoryDebitTransaction;
  num? totalAmountOfBillsUtilities;
  num? totalAmountOfFood;
  num? totalAmountOfAlcohol;
  num? totalAmountOfPersonalLoan;
  num? totalAmountOfHomeLoan;
  num? totalAmountOfAutoLoan;
  num? totalAmountOfTravel;
  num? totalAmountOfEntertainmentLifestyle;
  num? totalAmountOfShoppingPurchase;
  num? totalAmountOfInvestmentExpense;
  num? totalAmountOfInsurance;
  num? totalAmountOfTaxTransactionDebit;
  num? totalAmountOfGaming;
  num? totalAmountOfTransferToWalletTransaction;
  num? totalAmountOfReversalTransactionDebit;
  num? totalAmountOfCreditCardPayment;
  num? totalAmountOfCashWithdrawals;
  num? totalAmountOfMedicalTransaction;
  num? totalAmountOfChargesTransaction;
  num? totalAmountOfBelowMinimumBalanceTransaction;
  num? totalAmountOfSalaryPaidTransaction;
  num? totalAmountOfTransferOutTransaction;
  num? totalAmountOfForeignWalletTransaction;
  num? totalAmountOfEmiLoanPayments;
  num? totalAmountOfOtherCategoryDebitTransaction;
  String? totalNoOfMutualFunds;
  String? totalDebitAmountOfMutualFunds;
  String? totalExpenseOnCryptoCurrency;
  String? totalExpenseOnShareMarket;
  String? totalNoOfGasBillPayments;
  String? totalAmountOfGasBillPayments;
  String? totalNoOfElectricityBillPayments;
  String? totalNoOfMobileBroadbandBillPayments;
  String? totalAmountOfMobileBroadbandBillPayments;
  String? totalAmountOfElectricityBillPayments;
  String? totalNoOfDividend;
  String? totalAmountOfDividend;

  April2024({
    this.minOpeningBalance,
    this.maxOpeningBalance,
    this.minBalance,
    this.medianBalance,
    this.maxBalance,
    this.firstDayEodBalance,
    this.lastDayEodBalance,
    this.opening,
    this.closingBalance,
    this.minEodBalance,
    this.maxEodBalance,
    this.medianEodBalance,
    this.totalNoOfSalaryCredits,
    this.totalAmountOfSalaryCredits,
    this.totalNoOfCreditTransactions,
    this.totalAmountOfCreditTransactions,
    this.totalNoOfBusinessCreditTransactions,
    this.totalAmountOfBusinessCreditTransactions,
    this.totalNoOfDebitTransactions,
    this.totalAmountOfDebitTransactions,
    this.totalNoOfCashDeposits,
    this.totalAmountOfCashDeposits,
    this.totalNoOfCashWithdrawals,
    this.chqDeposits,
    this.totalNoOfChequeDeposits,
    this.chqIssues,
    this.totalNoOfChequeIssues,
    this.totalChqDeposits,
    this.totalAmountOfChequeDeposits,
    this.totalChqIssues,
    this.totalAmountOfChequeIssues,
    this.noOfEmiLoanPayments,
    this.totalNoOfEmiLoanPayments,
    this.totalNoOfIWBounced,
    this.sumOfIWBounced,
    this.totalAmountOfIWBounced,
    this.totalNumberOfOutwardChequeBounces,
    this.noOfTransactionsInBs,
    this.totalLoanDisbursal,
    this.totalAmountOfLoanDisbursal,
    this.loanDisbursal,
    this.april2024LoanDisbursal,
    this.totalNoOfLoanDisbursal,
    this.april2024TotalNoOfIWChqBounced,
    this.totalNoOfIWChqBounced,
    this.inwChqBounceNonTechnical,
    this.totalNoOfIWChequeBounceNonTechnical,
    this.totalInwChqBounceNonTechnical,
    this.totalAmountOfIWChequeBounceNonTechnical,
    this.salaryCount,
    this.april2024StartDate,
    this.startDate,
    this.isCompleteMonthTxn,
    this.averageEodBalance,
    this.foir,
    this.employerName,
    this.avgBalanceTill10ThOfMonth,
    this.avgBalanceTill20ThOfMonth,
    this.avgBalanceTillLastDateOfMonth,
    this.abbOn114LastDay,
    this.abbOn1St14Th30ThLastDay,
    this.totalNoOfNetCreditTransactions,
    this.totalNetCreditAmount,
    this.totalNoOfNetDebitTransactions,
    this.totalNetDebitAmount,
    this.totalNoOfCreditCardPayment,
    this.totalNoOfBillsUtilities,
    this.totalNoOfFood,
    this.totalNoOfAlcohol,
    this.totalNoOfTravel,
    this.totalNoOfEntertainmentLifestyle,
    this.totalNoOfShoppingPurchase,
    this.totalNoOfInvestmentExpense,
    this.totalNoOfGaming,
    this.totalNoOfPersonalLoan,
    this.totalNoOfHomeLoan,
    this.totalNoOfAutoLoan,
    this.totalNoOfInsurance,
    this.totalNoOfTaxTransactionDebit,
    this.totalNoOfTransferToWalletTransaction,
    this.totalNoOfReversalTransactionDebit,
    this.totalNoOfMedicalTransaction,
    this.totalNoOfChargesTransaction,
    this.totalNoOfBelowMinimumBalanceTransaction,
    this.totalNoOfSalaryPaidTransaction,
    this.totalNoOfTransferOutTransaction,
    this.totalNoOfForeignWalletTransaction,
    this.totalNoOfOtherCategoryDebitTransaction,
    this.totalAmountOfBillsUtilities,
    this.totalAmountOfFood,
    this.totalAmountOfAlcohol,
    this.totalAmountOfPersonalLoan,
    this.totalAmountOfHomeLoan,
    this.totalAmountOfAutoLoan,
    this.totalAmountOfTravel,
    this.totalAmountOfEntertainmentLifestyle,
    this.totalAmountOfShoppingPurchase,
    this.totalAmountOfInvestmentExpense,
    this.totalAmountOfInsurance,
    this.totalAmountOfTaxTransactionDebit,
    this.totalAmountOfGaming,
    this.totalAmountOfTransferToWalletTransaction,
    this.totalAmountOfReversalTransactionDebit,
    this.totalAmountOfCreditCardPayment,
    this.totalAmountOfCashWithdrawals,
    this.totalAmountOfMedicalTransaction,
    this.totalAmountOfChargesTransaction,
    this.totalAmountOfBelowMinimumBalanceTransaction,
    this.totalAmountOfSalaryPaidTransaction,
    this.totalAmountOfTransferOutTransaction,
    this.totalAmountOfForeignWalletTransaction,
    this.totalAmountOfEmiLoanPayments,
    this.totalAmountOfOtherCategoryDebitTransaction,
    this.totalNoOfMutualFunds,
    this.totalDebitAmountOfMutualFunds,
    this.totalExpenseOnCryptoCurrency,
    this.totalExpenseOnShareMarket,
    this.totalNoOfGasBillPayments,
    this.totalAmountOfGasBillPayments,
    this.totalNoOfElectricityBillPayments,
    this.totalNoOfMobileBroadbandBillPayments,
    this.totalAmountOfMobileBroadbandBillPayments,
    this.totalAmountOfElectricityBillPayments,
    this.totalNoOfDividend,
    this.totalAmountOfDividend,
  });

  factory April2024.fromRawJson(String str) =>
      April2024.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory April2024.fromJson(Map<String, dynamic> json) => April2024(
        minOpeningBalance: json["Min Opening Balance"],
        maxOpeningBalance: json["Max Opening Balance"],
        minBalance: json["Min Balance"],
        medianBalance: json["Median Balance"],
        maxBalance: json["Max Balance"],
        firstDayEodBalance: json["First Day EOD Balance"],
        lastDayEodBalance: json["Last Day EOD Balance"],
        opening: json["Opening"],
        closingBalance: json["Closing Balance"],
        minEodBalance: json["Min EOD Balance"],
        maxEodBalance: json["Max EOD Balance"],
        medianEodBalance: json["Median EOD Balance"],
        totalNoOfSalaryCredits: json["Total No of Salary Credits"],
        totalAmountOfSalaryCredits: json["Total Amount of Salary Credits"],
        totalNoOfCreditTransactions: json["Total No. of Credit Transactions"],
        totalAmountOfCreditTransactions:
            json["Total Amount of Credit Transactions"],
        totalNoOfBusinessCreditTransactions:
            json["Total No. of Business Credit Transactions"],
        totalAmountOfBusinessCreditTransactions:
            json["Total Amount of Business Credit Transactions"],
        totalNoOfDebitTransactions: json["Total No. of Debit Transactions"],
        totalAmountOfDebitTransactions:
            json["Total Amount of Debit Transactions"],
        totalNoOfCashDeposits: json["Total No. of Cash Deposits"],
        totalAmountOfCashDeposits: json["Total Amount of Cash Deposits"],
        totalNoOfCashWithdrawals: json["Total No. of Cash Withdrawals"],
        chqDeposits: json["chqDeposits"],
        totalNoOfChequeDeposits: json["Total No. of Cheque Deposits"],
        chqIssues: json["chqIssues"],
        totalNoOfChequeIssues: json["Total No. of Cheque Issues"],
        totalChqDeposits: json["totalChqDeposits"],
        totalAmountOfChequeDeposits: json["Total Amount of Cheque Deposits"],
        totalChqIssues: json["totalChqIssues"],
        totalAmountOfChequeIssues: json["Total Amount of Cheque Issues"],
        noOfEmiLoanPayments: json["No. of EMI / loan payments"],
        totalNoOfEmiLoanPayments: json["Total No. of EMI / loan payments"],
        totalNoOfIWBounced: json["Total No.of I / W Bounced"],
        sumOfIWBounced: json["Sum of I/W Bounced"],
        totalAmountOfIWBounced: json["Total amount of I / W Bounced"],
        totalNumberOfOutwardChequeBounces:
            json["Total Number of Outward Cheque Bounces"],
        noOfTransactionsInBs: json["No. of transactions in BS"],
        totalLoanDisbursal: json["totalLoanDisbursal"],
        totalAmountOfLoanDisbursal: json["Total Amount of Loan Disbursal"],
        loanDisbursal: json["Loan Disbursal"],
        april2024LoanDisbursal: json["loanDisbursal"],
        totalNoOfLoanDisbursal: json["Total No. of Loan Disbursal"],
        april2024TotalNoOfIWChqBounced: json["Total No. of I/W Chq Bounced"],
        totalNoOfIWChqBounced: json["Total No. of I / W Chq Bounced"],
        inwChqBounceNonTechnical: json["inw_chq_bounce_nonTechnical"],
        totalNoOfIWChequeBounceNonTechnical:
            json["Total No. of I / W Cheque Bounce Non Technical"],
        totalInwChqBounceNonTechnical:
            json["total_inw_chq_bounce_nonTechnical"],
        totalAmountOfIWChequeBounceNonTechnical:
            json["Total Amount of I / W Cheque Bounce Non Technical"],
        salaryCount: json["salary_count"],
        april2024StartDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        startDate: json["Start Date"] == null
            ? null
            : DateTime.parse(json["Start Date"]),
        isCompleteMonthTxn: json["Is Complete Month Txn"],
        averageEodBalance: json["Average EOD Balance"],
        foir: json["FOIR"],
        employerName: json["Employer Name"] == null
            ? []
            : List<dynamic>.from(json["Employer Name"].map((x) => x)),
        avgBalanceTill10ThOfMonth: json["Avg balance till 10th of month"],
        avgBalanceTill20ThOfMonth: json["Avg balance till 20th of month"],
        avgBalanceTillLastDateOfMonth:
            json["Avg balance till last date of month"],
        abbOn114LastDay: json["ABB on 1 14 last day"]?.toDouble(),
        abbOn1St14Th30ThLastDay:
            json["ABB on 1st,14th, 30th/Last Day"]?.toDouble(),
        totalNoOfNetCreditTransactions:
            json["Total No. of Net Credit Transactions"],
        totalNetCreditAmount: json["Total Net Credit Amount"],
        totalNoOfNetDebitTransactions:
            json["Total No. of Net Debit Transactions"],
        totalNetDebitAmount: json["Total Net Debit Amount"],
        totalNoOfCreditCardPayment: json["Total No. of CreditCard Payment"],
        totalNoOfBillsUtilities: json["Total No. of Bills & Utilities"],
        totalNoOfFood: json["Total No. of Food"],
        totalNoOfAlcohol: json["Total No. of Alcohol"],
        totalNoOfTravel: json["Total No. of Travel"],
        totalNoOfEntertainmentLifestyle:
            json["Total No. of Entertainment & Lifestyle"],
        totalNoOfShoppingPurchase: json["Total No. of Shopping & Purchase"],
        totalNoOfInvestmentExpense: json["Total No. of Investment Expense"],
        totalNoOfGaming: json["Total No. of Gaming"],
        totalNoOfPersonalLoan: json["Total No. of Personal Loan"],
        totalNoOfHomeLoan: json["Total No. of Home Loan"],
        totalNoOfAutoLoan: json["Total No. of Auto Loan "],
        totalNoOfInsurance: json["Total No. of Insurance"],
        totalNoOfTaxTransactionDebit:
            json["Total No. of Tax Transaction Debit"],
        totalNoOfTransferToWalletTransaction:
            json["Total No. of Transfer to Wallet Transaction"],
        totalNoOfReversalTransactionDebit:
            json["Total No. of Reversal Transaction Debit"],
        totalNoOfMedicalTransaction: json["Total No. of Medical Transaction"],
        totalNoOfChargesTransaction: json["Total No. of Charges Transaction"],
        totalNoOfBelowMinimumBalanceTransaction:
            json["Total No. of Below Minimum Balance Transaction"],
        totalNoOfSalaryPaidTransaction:
            json["Total No. of Salary Paid Transaction"],
        totalNoOfTransferOutTransaction:
            json["Total No. of Transfer Out Transaction"],
        totalNoOfForeignWalletTransaction:
            json["Total No. of Foreign Wallet Transaction"],
        totalNoOfOtherCategoryDebitTransaction:
            json["Total No. of Other Category Debit Transaction"],
        totalAmountOfBillsUtilities: json["Total Amount of Bills & Utilities"],
        totalAmountOfFood: json["Total Amount of Food"],
        totalAmountOfAlcohol: json["Total Amount of Alcohol"],
        totalAmountOfPersonalLoan: json["Total Amount of Personal Loan"],
        totalAmountOfHomeLoan: json["Total Amount of Home Loan"],
        totalAmountOfAutoLoan: json["Total Amount of Auto Loan "],
        totalAmountOfTravel: json["Total Amount of Travel"],
        totalAmountOfEntertainmentLifestyle:
            json["Total Amount of Entertainment & Lifestyle"],
        totalAmountOfShoppingPurchase:
            json["Total Amount of Shopping & Purchase"],
        totalAmountOfInvestmentExpense:
            json["Total Amount of Investment Expense"],
        totalAmountOfInsurance: json["Total Amount of Insurance"],
        totalAmountOfTaxTransactionDebit:
            json["Total Amount of Tax Transaction Debit"],
        totalAmountOfGaming: json["Total Amount of Gaming"],
        totalAmountOfTransferToWalletTransaction:
            json["Total Amount of Transfer to Wallet Transaction"],
        totalAmountOfReversalTransactionDebit:
            json["Total Amount of Reversal Transaction Debit"],
        totalAmountOfCreditCardPayment:
            json["Total Amount of CreditCard Payment"],
        totalAmountOfCashWithdrawals: json["Total Amount of Cash Withdrawals"],
        totalAmountOfMedicalTransaction:
            json["Total Amount of Medical Transaction"],
        totalAmountOfChargesTransaction:
            json["Total Amount of Charges Transaction"],
        totalAmountOfBelowMinimumBalanceTransaction:
            json["Total Amount of Below Minimum Balance Transaction"],
        totalAmountOfSalaryPaidTransaction:
            json["Total Amount of Salary Paid Transaction"],
        totalAmountOfTransferOutTransaction:
            json["Total Amount of Transfer Out Transaction"],
        totalAmountOfForeignWalletTransaction:
            json["Total Amount of Foreign Wallet Transaction"],
        totalAmountOfEmiLoanPayments:
            json["Total Amount of EMI / loan Payments"],
        totalAmountOfOtherCategoryDebitTransaction:
            json["Total Amount of Other Category Debit Transaction"],
        totalNoOfMutualFunds: json["Total No. of Mutual Funds"],
        totalDebitAmountOfMutualFunds:
            json["Total Debit Amount of Mutual Funds"],
        totalExpenseOnCryptoCurrency: json["Total Expense on Crypto Currency"],
        totalExpenseOnShareMarket: json["Total Expense on Share Market"],
        totalNoOfGasBillPayments: json["Total No. of Gas Bill Payments"],
        totalAmountOfGasBillPayments: json["Total Amount of Gas Bill Payments"],
        totalNoOfElectricityBillPayments:
            json["Total No. of Electricity Bill Payments"],
        totalNoOfMobileBroadbandBillPayments:
            json["Total No. of Mobile & Broadband Bill Payments"],
        totalAmountOfMobileBroadbandBillPayments:
            json["Total Amount of Mobile & Broadband Bill Payments"],
        totalAmountOfElectricityBillPayments:
            json["Total Amount of Electricity Bill Payments"],
        totalNoOfDividend: json["Total No. of Dividend"],
        totalAmountOfDividend: json["Total Amount of Dividend"],
      );

  Map<String, dynamic> toJson() => {
        "Min Opening Balance": minOpeningBalance,
        "Max Opening Balance": maxOpeningBalance,
        "Min Balance": minBalance,
        "Median Balance": medianBalance,
        "Max Balance": maxBalance,
        "First Day EOD Balance": firstDayEodBalance,
        "Last Day EOD Balance": lastDayEodBalance,
        "Opening": opening,
        "Closing Balance": closingBalance,
        "Min EOD Balance": minEodBalance,
        "Max EOD Balance": maxEodBalance,
        "Median EOD Balance": medianEodBalance,
        "Total No of Salary Credits": totalNoOfSalaryCredits,
        "Total Amount of Salary Credits": totalAmountOfSalaryCredits,
        "Total No. of Credit Transactions": totalNoOfCreditTransactions,
        "Total Amount of Credit Transactions": totalAmountOfCreditTransactions,
        "Total No. of Business Credit Transactions":
            totalNoOfBusinessCreditTransactions,
        "Total Amount of Business Credit Transactions":
            totalAmountOfBusinessCreditTransactions,
        "Total No. of Debit Transactions": totalNoOfDebitTransactions,
        "Total Amount of Debit Transactions": totalAmountOfDebitTransactions,
        "Total No. of Cash Deposits": totalNoOfCashDeposits,
        "Total Amount of Cash Deposits": totalAmountOfCashDeposits,
        "Total No. of Cash Withdrawals": totalNoOfCashWithdrawals,
        "chqDeposits": chqDeposits,
        "Total No. of Cheque Deposits": totalNoOfChequeDeposits,
        "chqIssues": chqIssues,
        "Total No. of Cheque Issues": totalNoOfChequeIssues,
        "totalChqDeposits": totalChqDeposits,
        "Total Amount of Cheque Deposits": totalAmountOfChequeDeposits,
        "totalChqIssues": totalChqIssues,
        "Total Amount of Cheque Issues": totalAmountOfChequeIssues,
        "No. of EMI / loan payments": noOfEmiLoanPayments,
        "Total No. of EMI / loan payments": totalNoOfEmiLoanPayments,
        "Total No.of I / W Bounced": totalNoOfIWBounced,
        "Sum of I/W Bounced": sumOfIWBounced,
        "Total amount of I / W Bounced": totalAmountOfIWBounced,
        "Total Number of Outward Cheque Bounces":
            totalNumberOfOutwardChequeBounces,
        "No. of transactions in BS": noOfTransactionsInBs,
        "totalLoanDisbursal": totalLoanDisbursal,
        "Total Amount of Loan Disbursal": totalAmountOfLoanDisbursal,
        "Loan Disbursal": loanDisbursal,
        "loanDisbursal": april2024LoanDisbursal,
        "Total No. of Loan Disbursal": totalNoOfLoanDisbursal,
        "Total No. of I/W Chq Bounced": april2024TotalNoOfIWChqBounced,
        "Total No. of I / W Chq Bounced": totalNoOfIWChqBounced,
        "inw_chq_bounce_nonTechnical": inwChqBounceNonTechnical,
        "Total No. of I / W Cheque Bounce Non Technical":
            totalNoOfIWChequeBounceNonTechnical,
        "total_inw_chq_bounce_nonTechnical": totalInwChqBounceNonTechnical,
        "Total Amount of I / W Cheque Bounce Non Technical":
            totalAmountOfIWChequeBounceNonTechnical,
        "salary_count": salaryCount,
        "startDate":
            "${april2024StartDate!.year.toString().padLeft(4, '0')}-${april2024StartDate!.month.toString().padLeft(2, '0')}-${april2024StartDate!.day.toString().padLeft(2, '0')}",
        "Start Date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "Is Complete Month Txn": isCompleteMonthTxn,
        "Average EOD Balance": averageEodBalance,
        "FOIR": foir,
        "Employer Name": employerName == null
            ? []
            : List<dynamic>.from(employerName!.map((x) => x)),
        "Avg balance till 10th of month": avgBalanceTill10ThOfMonth,
        "Avg balance till 20th of month": avgBalanceTill20ThOfMonth,
        "Avg balance till last date of month": avgBalanceTillLastDateOfMonth,
        "ABB on 1 14 last day": abbOn114LastDay,
        "ABB on 1st,14th, 30th/Last Day": abbOn1St14Th30ThLastDay,
        "Total No. of Net Credit Transactions": totalNoOfNetCreditTransactions,
        "Total Net Credit Amount": totalNetCreditAmount,
        "Total No. of Net Debit Transactions": totalNoOfNetDebitTransactions,
        "Total Net Debit Amount": totalNetDebitAmount,
        "Total No. of CreditCard Payment": totalNoOfCreditCardPayment,
        "Total No. of Bills & Utilities": totalNoOfBillsUtilities,
        "Total No. of Food": totalNoOfFood,
        "Total No. of Alcohol": totalNoOfAlcohol,
        "Total No. of Travel": totalNoOfTravel,
        "Total No. of Entertainment & Lifestyle":
            totalNoOfEntertainmentLifestyle,
        "Total No. of Shopping & Purchase": totalNoOfShoppingPurchase,
        "Total No. of Investment Expense": totalNoOfInvestmentExpense,
        "Total No. of Gaming": totalNoOfGaming,
        "Total No. of Personal Loan": totalNoOfPersonalLoan,
        "Total No. of Home Loan": totalNoOfHomeLoan,
        "Total No. of Auto Loan ": totalNoOfAutoLoan,
        "Total No. of Insurance": totalNoOfInsurance,
        "Total No. of Tax Transaction Debit": totalNoOfTaxTransactionDebit,
        "Total No. of Transfer to Wallet Transaction":
            totalNoOfTransferToWalletTransaction,
        "Total No. of Reversal Transaction Debit":
            totalNoOfReversalTransactionDebit,
        "Total No. of Medical Transaction": totalNoOfMedicalTransaction,
        "Total No. of Charges Transaction": totalNoOfChargesTransaction,
        "Total No. of Below Minimum Balance Transaction":
            totalNoOfBelowMinimumBalanceTransaction,
        "Total No. of Salary Paid Transaction": totalNoOfSalaryPaidTransaction,
        "Total No. of Transfer Out Transaction":
            totalNoOfTransferOutTransaction,
        "Total No. of Foreign Wallet Transaction":
            totalNoOfForeignWalletTransaction,
        "Total No. of Other Category Debit Transaction":
            totalNoOfOtherCategoryDebitTransaction,
        "Total Amount of Bills & Utilities": totalAmountOfBillsUtilities,
        "Total Amount of Food": totalAmountOfFood,
        "Total Amount of Alcohol": totalAmountOfAlcohol,
        "Total Amount of Personal Loan": totalAmountOfPersonalLoan,
        "Total Amount of Home Loan": totalAmountOfHomeLoan,
        "Total Amount of Auto Loan ": totalAmountOfAutoLoan,
        "Total Amount of Travel": totalAmountOfTravel,
        "Total Amount of Entertainment & Lifestyle":
            totalAmountOfEntertainmentLifestyle,
        "Total Amount of Shopping & Purchase": totalAmountOfShoppingPurchase,
        "Total Amount of Investment Expense": totalAmountOfInvestmentExpense,
        "Total Amount of Insurance": totalAmountOfInsurance,
        "Total Amount of Tax Transaction Debit":
            totalAmountOfTaxTransactionDebit,
        "Total Amount of Gaming": totalAmountOfGaming,
        "Total Amount of Transfer to Wallet Transaction":
            totalAmountOfTransferToWalletTransaction,
        "Total Amount of Reversal Transaction Debit":
            totalAmountOfReversalTransactionDebit,
        "Total Amount of CreditCard Payment": totalAmountOfCreditCardPayment,
        "Total Amount of Cash Withdrawals": totalAmountOfCashWithdrawals,
        "Total Amount of Medical Transaction": totalAmountOfMedicalTransaction,
        "Total Amount of Charges Transaction": totalAmountOfChargesTransaction,
        "Total Amount of Below Minimum Balance Transaction":
            totalAmountOfBelowMinimumBalanceTransaction,
        "Total Amount of Salary Paid Transaction":
            totalAmountOfSalaryPaidTransaction,
        "Total Amount of Transfer Out Transaction":
            totalAmountOfTransferOutTransaction,
        "Total Amount of Foreign Wallet Transaction":
            totalAmountOfForeignWalletTransaction,
        "Total Amount of EMI / loan Payments": totalAmountOfEmiLoanPayments,
        "Total Amount of Other Category Debit Transaction":
            totalAmountOfOtherCategoryDebitTransaction,
        "Total No. of Mutual Funds": totalNoOfMutualFunds,
        "Total Debit Amount of Mutual Funds": totalDebitAmountOfMutualFunds,
        "Total Expense on Crypto Currency": totalExpenseOnCryptoCurrency,
        "Total Expense on Share Market": totalExpenseOnShareMarket,
        "Total No. of Gas Bill Payments": totalNoOfGasBillPayments,
        "Total Amount of Gas Bill Payments": totalAmountOfGasBillPayments,
        "Total No. of Electricity Bill Payments":
            totalNoOfElectricityBillPayments,
        "Total No. of Mobile & Broadband Bill Payments":
            totalNoOfMobileBroadbandBillPayments,
        "Total Amount of Mobile & Broadband Bill Payments":
            totalAmountOfMobileBroadbandBillPayments,
        "Total Amount of Electricity Bill Payments":
            totalAmountOfElectricityBillPayments,
        "Total No. of Dividend": totalNoOfDividend,
        "Total Amount of Dividend": totalAmountOfDividend,
      };
}

class August2024 {
  double? minOpeningBalance;
  double? maxOpeningBalance;
  double? minBalance;
  String? medianBalance;
  double? maxBalance;
  double? firstDayEodBalance;
  double? lastDayEodBalance;
  double? opening;
  double? closingBalance;
  double? minEodBalance;
  double? maxEodBalance;
  double? medianEodBalance;
  num? totalNoOfSalaryCredits;
  num? totalAmountOfSalaryCredits;
  num? totalNoOfCreditTransactions;
  num? totalAmountOfCreditTransactions;
  num? totalNoOfBusinessCreditTransactions;
  num? totalAmountOfBusinessCreditTransactions;
  num? totalNoOfDebitTransactions;
  double? totalAmountOfDebitTransactions;
  num? totalNoOfCashDeposits;
  num? totalAmountOfCashDeposits;
  num? totalNoOfCashWithdrawals;
  num? chqDeposits;
  num? totalNoOfChequeDeposits;
  num? chqIssues;
  num? totalNoOfChequeIssues;
  num? totalChqDeposits;
  num? totalAmountOfChequeDeposits;
  num? totalChqIssues;
  num? totalAmountOfChequeIssues;
  num? noOfEmiLoanPayments;
  num? totalNoOfEmiLoanPayments;
  num? totalNoOfIWBounced;
  num? sumOfIWBounced;
  num? totalAmountOfIWBounced;
  num? totalNumberOfOutwardChequeBounces;
  num? noOfTransactionsInBs;
  num? totalLoanDisbursal;
  num? totalAmountOfLoanDisbursal;
  num? loanDisbursal;
  num? august2024LoanDisbursal;
  num? totalNoOfLoanDisbursal;
  num? august2024TotalNoOfIWChqBounced;
  num? totalNoOfIWChqBounced;
  num? inwChqBounceNonTechnical;
  num? totalNoOfIWChequeBounceNonTechnical;
  num? totalInwChqBounceNonTechnical;
  num? totalAmountOfIWChequeBounceNonTechnical;
  num? salaryCount;
  DateTime? august2024StartDate;
  DateTime? startDate;
  String? isCompleteMonthTxn;
  double? averageEodBalance;
  String? foir;
  List<dynamic>? employerName;
  double? avgBalanceTill10ThOfMonth;
  double? avgBalanceTill20ThOfMonth;
  double? avgBalanceTillLastDateOfMonth;
  double? abbOn114LastDay;
  double? abbOn1St14Th30ThLastDay;
  num? totalNoOfNetCreditTransactions;
  num? totalNetCreditAmount;
  num? totalNoOfNetDebitTransactions;
  double? totalNetDebitAmount;
  num? totalNoOfCreditCardPayment;
  num? totalNoOfBillsUtilities;
  num? totalNoOfFood;
  num? totalNoOfAlcohol;
  num? totalNoOfTravel;
  num? totalNoOfEntertainmentLifestyle;
  num? totalNoOfShoppingPurchase;
  num? totalNoOfInvestmentExpense;
  num? totalNoOfGaming;
  num? totalNoOfPersonalLoan;
  num? totalNoOfHomeLoan;
  num? totalNoOfAutoLoan;
  num? totalNoOfInsurance;
  num? totalNoOfTaxTransactionDebit;
  num? totalNoOfTransferToWalletTransaction;
  num? totalNoOfReversalTransactionDebit;
  num? totalNoOfMedicalTransaction;
  num? totalNoOfChargesTransaction;
  num? totalNoOfBelowMinimumBalanceTransaction;
  num? totalNoOfSalaryPaidTransaction;
  num? totalNoOfTransferOutTransaction;
  num? totalNoOfForeignWalletTransaction;
  num? totalNoOfOtherCategoryDebitTransaction;
  num? totalAmountOfBillsUtilities;
  num? totalAmountOfFood;
  num? totalAmountOfAlcohol;
  num? totalAmountOfPersonalLoan;
  num? totalAmountOfHomeLoan;
  num? totalAmountOfAutoLoan;
  num? totalAmountOfTravel;
  num? totalAmountOfEntertainmentLifestyle;
  num? totalAmountOfShoppingPurchase;
  num? totalAmountOfInvestmentExpense;
  num? totalAmountOfInsurance;
  num? totalAmountOfTaxTransactionDebit;
  num? totalAmountOfGaming;
  num? totalAmountOfTransferToWalletTransaction;
  num? totalAmountOfReversalTransactionDebit;
  num? totalAmountOfCreditCardPayment;
  num? totalAmountOfCashWithdrawals;
  num? totalAmountOfMedicalTransaction;
  num? totalAmountOfChargesTransaction;
  num? totalAmountOfBelowMinimumBalanceTransaction;
  num? totalAmountOfSalaryPaidTransaction;
  double? totalAmountOfTransferOutTransaction;
  num? totalAmountOfForeignWalletTransaction;
  num? totalAmountOfEmiLoanPayments;
  num? totalAmountOfOtherCategoryDebitTransaction;
  String? totalNoOfMutualFunds;
  String? totalDebitAmountOfMutualFunds;
  String? totalExpenseOnCryptoCurrency;
  String? totalExpenseOnShareMarket;
  String? totalNoOfGasBillPayments;
  String? totalAmountOfGasBillPayments;
  String? totalNoOfElectricityBillPayments;
  String? totalNoOfMobileBroadbandBillPayments;
  String? totalAmountOfMobileBroadbandBillPayments;
  String? totalAmountOfElectricityBillPayments;
  String? totalNoOfDividend;
  String? totalAmountOfDividend;

  August2024({
    this.minOpeningBalance,
    this.maxOpeningBalance,
    this.minBalance,
    this.medianBalance,
    this.maxBalance,
    this.firstDayEodBalance,
    this.lastDayEodBalance,
    this.opening,
    this.closingBalance,
    this.minEodBalance,
    this.maxEodBalance,
    this.medianEodBalance,
    this.totalNoOfSalaryCredits,
    this.totalAmountOfSalaryCredits,
    this.totalNoOfCreditTransactions,
    this.totalAmountOfCreditTransactions,
    this.totalNoOfBusinessCreditTransactions,
    this.totalAmountOfBusinessCreditTransactions,
    this.totalNoOfDebitTransactions,
    this.totalAmountOfDebitTransactions,
    this.totalNoOfCashDeposits,
    this.totalAmountOfCashDeposits,
    this.totalNoOfCashWithdrawals,
    this.chqDeposits,
    this.totalNoOfChequeDeposits,
    this.chqIssues,
    this.totalNoOfChequeIssues,
    this.totalChqDeposits,
    this.totalAmountOfChequeDeposits,
    this.totalChqIssues,
    this.totalAmountOfChequeIssues,
    this.noOfEmiLoanPayments,
    this.totalNoOfEmiLoanPayments,
    this.totalNoOfIWBounced,
    this.sumOfIWBounced,
    this.totalAmountOfIWBounced,
    this.totalNumberOfOutwardChequeBounces,
    this.noOfTransactionsInBs,
    this.totalLoanDisbursal,
    this.totalAmountOfLoanDisbursal,
    this.loanDisbursal,
    this.august2024LoanDisbursal,
    this.totalNoOfLoanDisbursal,
    this.august2024TotalNoOfIWChqBounced,
    this.totalNoOfIWChqBounced,
    this.inwChqBounceNonTechnical,
    this.totalNoOfIWChequeBounceNonTechnical,
    this.totalInwChqBounceNonTechnical,
    this.totalAmountOfIWChequeBounceNonTechnical,
    this.salaryCount,
    this.august2024StartDate,
    this.startDate,
    this.isCompleteMonthTxn,
    this.averageEodBalance,
    this.foir,
    this.employerName,
    this.avgBalanceTill10ThOfMonth,
    this.avgBalanceTill20ThOfMonth,
    this.avgBalanceTillLastDateOfMonth,
    this.abbOn114LastDay,
    this.abbOn1St14Th30ThLastDay,
    this.totalNoOfNetCreditTransactions,
    this.totalNetCreditAmount,
    this.totalNoOfNetDebitTransactions,
    this.totalNetDebitAmount,
    this.totalNoOfCreditCardPayment,
    this.totalNoOfBillsUtilities,
    this.totalNoOfFood,
    this.totalNoOfAlcohol,
    this.totalNoOfTravel,
    this.totalNoOfEntertainmentLifestyle,
    this.totalNoOfShoppingPurchase,
    this.totalNoOfInvestmentExpense,
    this.totalNoOfGaming,
    this.totalNoOfPersonalLoan,
    this.totalNoOfHomeLoan,
    this.totalNoOfAutoLoan,
    this.totalNoOfInsurance,
    this.totalNoOfTaxTransactionDebit,
    this.totalNoOfTransferToWalletTransaction,
    this.totalNoOfReversalTransactionDebit,
    this.totalNoOfMedicalTransaction,
    this.totalNoOfChargesTransaction,
    this.totalNoOfBelowMinimumBalanceTransaction,
    this.totalNoOfSalaryPaidTransaction,
    this.totalNoOfTransferOutTransaction,
    this.totalNoOfForeignWalletTransaction,
    this.totalNoOfOtherCategoryDebitTransaction,
    this.totalAmountOfBillsUtilities,
    this.totalAmountOfFood,
    this.totalAmountOfAlcohol,
    this.totalAmountOfPersonalLoan,
    this.totalAmountOfHomeLoan,
    this.totalAmountOfAutoLoan,
    this.totalAmountOfTravel,
    this.totalAmountOfEntertainmentLifestyle,
    this.totalAmountOfShoppingPurchase,
    this.totalAmountOfInvestmentExpense,
    this.totalAmountOfInsurance,
    this.totalAmountOfTaxTransactionDebit,
    this.totalAmountOfGaming,
    this.totalAmountOfTransferToWalletTransaction,
    this.totalAmountOfReversalTransactionDebit,
    this.totalAmountOfCreditCardPayment,
    this.totalAmountOfCashWithdrawals,
    this.totalAmountOfMedicalTransaction,
    this.totalAmountOfChargesTransaction,
    this.totalAmountOfBelowMinimumBalanceTransaction,
    this.totalAmountOfSalaryPaidTransaction,
    this.totalAmountOfTransferOutTransaction,
    this.totalAmountOfForeignWalletTransaction,
    this.totalAmountOfEmiLoanPayments,
    this.totalAmountOfOtherCategoryDebitTransaction,
    this.totalNoOfMutualFunds,
    this.totalDebitAmountOfMutualFunds,
    this.totalExpenseOnCryptoCurrency,
    this.totalExpenseOnShareMarket,
    this.totalNoOfGasBillPayments,
    this.totalAmountOfGasBillPayments,
    this.totalNoOfElectricityBillPayments,
    this.totalNoOfMobileBroadbandBillPayments,
    this.totalAmountOfMobileBroadbandBillPayments,
    this.totalAmountOfElectricityBillPayments,
    this.totalNoOfDividend,
    this.totalAmountOfDividend,
  });

  factory August2024.fromRawJson(String str) =>
      August2024.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory August2024.fromJson(Map<String, dynamic> json) => August2024(
        minOpeningBalance: json["Min Opening Balance"]?.toDouble(),
        maxOpeningBalance: json["Max Opening Balance"]?.toDouble(),
        minBalance: json["Min Balance"]?.toDouble(),
        medianBalance: json["Median Balance"],
        maxBalance: json["Max Balance"]?.toDouble(),
        firstDayEodBalance: json["First Day EOD Balance"]?.toDouble(),
        lastDayEodBalance: json["Last Day EOD Balance"]?.toDouble(),
        opening: json["Opening"]?.toDouble(),
        closingBalance: json["Closing Balance"]?.toDouble(),
        minEodBalance: json["Min EOD Balance"]?.toDouble(),
        maxEodBalance: json["Max EOD Balance"]?.toDouble(),
        medianEodBalance: json["Median EOD Balance"]?.toDouble(),
        totalNoOfSalaryCredits: json["Total No of Salary Credits"],
        totalAmountOfSalaryCredits: json["Total Amount of Salary Credits"],
        totalNoOfCreditTransactions: json["Total No. of Credit Transactions"],
        totalAmountOfCreditTransactions:
            json["Total Amount of Credit Transactions"],
        totalNoOfBusinessCreditTransactions:
            json["Total No. of Business Credit Transactions"],
        totalAmountOfBusinessCreditTransactions:
            json["Total Amount of Business Credit Transactions"],
        totalNoOfDebitTransactions: json["Total No. of Debit Transactions"],
        totalAmountOfDebitTransactions:
            json["Total Amount of Debit Transactions"]?.toDouble(),
        totalNoOfCashDeposits: json["Total No. of Cash Deposits"],
        totalAmountOfCashDeposits: json["Total Amount of Cash Deposits"],
        totalNoOfCashWithdrawals: json["Total No. of Cash Withdrawals"],
        chqDeposits: json["chqDeposits"],
        totalNoOfChequeDeposits: json["Total No. of Cheque Deposits"],
        chqIssues: json["chqIssues"],
        totalNoOfChequeIssues: json["Total No. of Cheque Issues"],
        totalChqDeposits: json["totalChqDeposits"],
        totalAmountOfChequeDeposits: json["Total Amount of Cheque Deposits"],
        totalChqIssues: json["totalChqIssues"],
        totalAmountOfChequeIssues: json["Total Amount of Cheque Issues"],
        noOfEmiLoanPayments: json["No. of EMI / loan payments"],
        totalNoOfEmiLoanPayments: json["Total No. of EMI / loan payments"],
        totalNoOfIWBounced: json["Total No.of I / W Bounced"],
        sumOfIWBounced: json["Sum of I/W Bounced"],
        totalAmountOfIWBounced: json["Total amount of I / W Bounced"],
        totalNumberOfOutwardChequeBounces:
            json["Total Number of Outward Cheque Bounces"],
        noOfTransactionsInBs: json["No. of transactions in BS"],
        totalLoanDisbursal: json["totalLoanDisbursal"],
        totalAmountOfLoanDisbursal: json["Total Amount of Loan Disbursal"],
        loanDisbursal: json["Loan Disbursal"],
        august2024LoanDisbursal: json["loanDisbursal"],
        totalNoOfLoanDisbursal: json["Total No. of Loan Disbursal"],
        august2024TotalNoOfIWChqBounced: json["Total No. of I/W Chq Bounced"],
        totalNoOfIWChqBounced: json["Total No. of I / W Chq Bounced"],
        inwChqBounceNonTechnical: json["inw_chq_bounce_nonTechnical"],
        totalNoOfIWChequeBounceNonTechnical:
            json["Total No. of I / W Cheque Bounce Non Technical"],
        totalInwChqBounceNonTechnical:
            json["total_inw_chq_bounce_nonTechnical"],
        totalAmountOfIWChequeBounceNonTechnical:
            json["Total Amount of I / W Cheque Bounce Non Technical"],
        salaryCount: json["salary_count"],
        august2024StartDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        startDate: json["Start Date"] == null
            ? null
            : DateTime.parse(json["Start Date"]),
        isCompleteMonthTxn: json["Is Complete Month Txn"],
        averageEodBalance: json["Average EOD Balance"]?.toDouble(),
        foir: json["FOIR"],
        employerName: json["Employer Name"] == null
            ? []
            : List<dynamic>.from(json["Employer Name"].map((x) => x)),
        avgBalanceTill10ThOfMonth:
            json["Avg balance till 10th of month"]?.toDouble(),
        avgBalanceTill20ThOfMonth:
            json["Avg balance till 20th of month"]?.toDouble(),
        avgBalanceTillLastDateOfMonth:
            json["Avg balance till last date of month"]?.toDouble(),
        abbOn114LastDay: json["ABB on 1 14 last day"]?.toDouble(),
        abbOn1St14Th30ThLastDay:
            json["ABB on 1st,14th, 30th/Last Day"]?.toDouble(),
        totalNoOfNetCreditTransactions:
            json["Total No. of Net Credit Transactions"],
        totalNetCreditAmount: json["Total Net Credit Amount"],
        totalNoOfNetDebitTransactions:
            json["Total No. of Net Debit Transactions"],
        totalNetDebitAmount: json["Total Net Debit Amount"]?.toDouble(),
        totalNoOfCreditCardPayment: json["Total No. of CreditCard Payment"],
        totalNoOfBillsUtilities: json["Total No. of Bills & Utilities"],
        totalNoOfFood: json["Total No. of Food"],
        totalNoOfAlcohol: json["Total No. of Alcohol"],
        totalNoOfTravel: json["Total No. of Travel"],
        totalNoOfEntertainmentLifestyle:
            json["Total No. of Entertainment & Lifestyle"],
        totalNoOfShoppingPurchase: json["Total No. of Shopping & Purchase"],
        totalNoOfInvestmentExpense: json["Total No. of Investment Expense"],
        totalNoOfGaming: json["Total No. of Gaming"],
        totalNoOfPersonalLoan: json["Total No. of Personal Loan"],
        totalNoOfHomeLoan: json["Total No. of Home Loan"],
        totalNoOfAutoLoan: json["Total No. of Auto Loan "],
        totalNoOfInsurance: json["Total No. of Insurance"],
        totalNoOfTaxTransactionDebit:
            json["Total No. of Tax Transaction Debit"],
        totalNoOfTransferToWalletTransaction:
            json["Total No. of Transfer to Wallet Transaction"],
        totalNoOfReversalTransactionDebit:
            json["Total No. of Reversal Transaction Debit"],
        totalNoOfMedicalTransaction: json["Total No. of Medical Transaction"],
        totalNoOfChargesTransaction: json["Total No. of Charges Transaction"],
        totalNoOfBelowMinimumBalanceTransaction:
            json["Total No. of Below Minimum Balance Transaction"],
        totalNoOfSalaryPaidTransaction:
            json["Total No. of Salary Paid Transaction"],
        totalNoOfTransferOutTransaction:
            json["Total No. of Transfer Out Transaction"],
        totalNoOfForeignWalletTransaction:
            json["Total No. of Foreign Wallet Transaction"],
        totalNoOfOtherCategoryDebitTransaction:
            json["Total No. of Other Category Debit Transaction"],
        totalAmountOfBillsUtilities: json["Total Amount of Bills & Utilities"],
        totalAmountOfFood: json["Total Amount of Food"],
        totalAmountOfAlcohol: json["Total Amount of Alcohol"],
        totalAmountOfPersonalLoan: json["Total Amount of Personal Loan"],
        totalAmountOfHomeLoan: json["Total Amount of Home Loan"],
        totalAmountOfAutoLoan: json["Total Amount of Auto Loan "],
        totalAmountOfTravel: json["Total Amount of Travel"],
        totalAmountOfEntertainmentLifestyle:
            json["Total Amount of Entertainment & Lifestyle"],
        totalAmountOfShoppingPurchase:
            json["Total Amount of Shopping & Purchase"],
        totalAmountOfInvestmentExpense:
            json["Total Amount of Investment Expense"],
        totalAmountOfInsurance: json["Total Amount of Insurance"],
        totalAmountOfTaxTransactionDebit:
            json["Total Amount of Tax Transaction Debit"],
        totalAmountOfGaming: json["Total Amount of Gaming"],
        totalAmountOfTransferToWalletTransaction:
            json["Total Amount of Transfer to Wallet Transaction"],
        totalAmountOfReversalTransactionDebit:
            json["Total Amount of Reversal Transaction Debit"],
        totalAmountOfCreditCardPayment:
            json["Total Amount of CreditCard Payment"],
        totalAmountOfCashWithdrawals: json["Total Amount of Cash Withdrawals"],
        totalAmountOfMedicalTransaction:
            json["Total Amount of Medical Transaction"],
        totalAmountOfChargesTransaction:
            json["Total Amount of Charges Transaction"],
        totalAmountOfBelowMinimumBalanceTransaction:
            json["Total Amount of Below Minimum Balance Transaction"],
        totalAmountOfSalaryPaidTransaction:
            json["Total Amount of Salary Paid Transaction"],
        totalAmountOfTransferOutTransaction:
            json["Total Amount of Transfer Out Transaction"]?.toDouble(),
        totalAmountOfForeignWalletTransaction:
            json["Total Amount of Foreign Wallet Transaction"],
        totalAmountOfEmiLoanPayments:
            json["Total Amount of EMI / loan Payments"],
        totalAmountOfOtherCategoryDebitTransaction:
            json["Total Amount of Other Category Debit Transaction"],
        totalNoOfMutualFunds: json["Total No. of Mutual Funds"],
        totalDebitAmountOfMutualFunds:
            json["Total Debit Amount of Mutual Funds"],
        totalExpenseOnCryptoCurrency: json["Total Expense on Crypto Currency"],
        totalExpenseOnShareMarket: json["Total Expense on Share Market"],
        totalNoOfGasBillPayments: json["Total No. of Gas Bill Payments"],
        totalAmountOfGasBillPayments: json["Total Amount of Gas Bill Payments"],
        totalNoOfElectricityBillPayments:
            json["Total No. of Electricity Bill Payments"],
        totalNoOfMobileBroadbandBillPayments:
            json["Total No. of Mobile & Broadband Bill Payments"],
        totalAmountOfMobileBroadbandBillPayments:
            json["Total Amount of Mobile & Broadband Bill Payments"],
        totalAmountOfElectricityBillPayments:
            json["Total Amount of Electricity Bill Payments"],
        totalNoOfDividend: json["Total No. of Dividend"],
        totalAmountOfDividend: json["Total Amount of Dividend"],
      );

  Map<String, dynamic> toJson() => {
        "Min Opening Balance": minOpeningBalance,
        "Max Opening Balance": maxOpeningBalance,
        "Min Balance": minBalance,
        "Median Balance": medianBalance,
        "Max Balance": maxBalance,
        "First Day EOD Balance": firstDayEodBalance,
        "Last Day EOD Balance": lastDayEodBalance,
        "Opening": opening,
        "Closing Balance": closingBalance,
        "Min EOD Balance": minEodBalance,
        "Max EOD Balance": maxEodBalance,
        "Median EOD Balance": medianEodBalance,
        "Total No of Salary Credits": totalNoOfSalaryCredits,
        "Total Amount of Salary Credits": totalAmountOfSalaryCredits,
        "Total No. of Credit Transactions": totalNoOfCreditTransactions,
        "Total Amount of Credit Transactions": totalAmountOfCreditTransactions,
        "Total No. of Business Credit Transactions":
            totalNoOfBusinessCreditTransactions,
        "Total Amount of Business Credit Transactions":
            totalAmountOfBusinessCreditTransactions,
        "Total No. of Debit Transactions": totalNoOfDebitTransactions,
        "Total Amount of Debit Transactions": totalAmountOfDebitTransactions,
        "Total No. of Cash Deposits": totalNoOfCashDeposits,
        "Total Amount of Cash Deposits": totalAmountOfCashDeposits,
        "Total No. of Cash Withdrawals": totalNoOfCashWithdrawals,
        "chqDeposits": chqDeposits,
        "Total No. of Cheque Deposits": totalNoOfChequeDeposits,
        "chqIssues": chqIssues,
        "Total No. of Cheque Issues": totalNoOfChequeIssues,
        "totalChqDeposits": totalChqDeposits,
        "Total Amount of Cheque Deposits": totalAmountOfChequeDeposits,
        "totalChqIssues": totalChqIssues,
        "Total Amount of Cheque Issues": totalAmountOfChequeIssues,
        "No. of EMI / loan payments": noOfEmiLoanPayments,
        "Total No. of EMI / loan payments": totalNoOfEmiLoanPayments,
        "Total No.of I / W Bounced": totalNoOfIWBounced,
        "Sum of I/W Bounced": sumOfIWBounced,
        "Total amount of I / W Bounced": totalAmountOfIWBounced,
        "Total Number of Outward Cheque Bounces":
            totalNumberOfOutwardChequeBounces,
        "No. of transactions in BS": noOfTransactionsInBs,
        "totalLoanDisbursal": totalLoanDisbursal,
        "Total Amount of Loan Disbursal": totalAmountOfLoanDisbursal,
        "Loan Disbursal": loanDisbursal,
        "loanDisbursal": august2024LoanDisbursal,
        "Total No. of Loan Disbursal": totalNoOfLoanDisbursal,
        "Total No. of I/W Chq Bounced": august2024TotalNoOfIWChqBounced,
        "Total No. of I / W Chq Bounced": totalNoOfIWChqBounced,
        "inw_chq_bounce_nonTechnical": inwChqBounceNonTechnical,
        "Total No. of I / W Cheque Bounce Non Technical":
            totalNoOfIWChequeBounceNonTechnical,
        "total_inw_chq_bounce_nonTechnical": totalInwChqBounceNonTechnical,
        "Total Amount of I / W Cheque Bounce Non Technical":
            totalAmountOfIWChequeBounceNonTechnical,
        "salary_count": salaryCount,
        "startDate":
            "${august2024StartDate!.year.toString().padLeft(4, '0')}-${august2024StartDate!.month.toString().padLeft(2, '0')}-${august2024StartDate!.day.toString().padLeft(2, '0')}",
        "Start Date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "Is Complete Month Txn": isCompleteMonthTxn,
        "Average EOD Balance": averageEodBalance,
        "FOIR": foir,
        "Employer Name": employerName == null
            ? []
            : List<dynamic>.from(employerName!.map((x) => x)),
        "Avg balance till 10th of month": avgBalanceTill10ThOfMonth,
        "Avg balance till 20th of month": avgBalanceTill20ThOfMonth,
        "Avg balance till last date of month": avgBalanceTillLastDateOfMonth,
        "ABB on 1 14 last day": abbOn114LastDay,
        "ABB on 1st,14th, 30th/Last Day": abbOn1St14Th30ThLastDay,
        "Total No. of Net Credit Transactions": totalNoOfNetCreditTransactions,
        "Total Net Credit Amount": totalNetCreditAmount,
        "Total No. of Net Debit Transactions": totalNoOfNetDebitTransactions,
        "Total Net Debit Amount": totalNetDebitAmount,
        "Total No. of CreditCard Payment": totalNoOfCreditCardPayment,
        "Total No. of Bills & Utilities": totalNoOfBillsUtilities,
        "Total No. of Food": totalNoOfFood,
        "Total No. of Alcohol": totalNoOfAlcohol,
        "Total No. of Travel": totalNoOfTravel,
        "Total No. of Entertainment & Lifestyle":
            totalNoOfEntertainmentLifestyle,
        "Total No. of Shopping & Purchase": totalNoOfShoppingPurchase,
        "Total No. of Investment Expense": totalNoOfInvestmentExpense,
        "Total No. of Gaming": totalNoOfGaming,
        "Total No. of Personal Loan": totalNoOfPersonalLoan,
        "Total No. of Home Loan": totalNoOfHomeLoan,
        "Total No. of Auto Loan ": totalNoOfAutoLoan,
        "Total No. of Insurance": totalNoOfInsurance,
        "Total No. of Tax Transaction Debit": totalNoOfTaxTransactionDebit,
        "Total No. of Transfer to Wallet Transaction":
            totalNoOfTransferToWalletTransaction,
        "Total No. of Reversal Transaction Debit":
            totalNoOfReversalTransactionDebit,
        "Total No. of Medical Transaction": totalNoOfMedicalTransaction,
        "Total No. of Charges Transaction": totalNoOfChargesTransaction,
        "Total No. of Below Minimum Balance Transaction":
            totalNoOfBelowMinimumBalanceTransaction,
        "Total No. of Salary Paid Transaction": totalNoOfSalaryPaidTransaction,
        "Total No. of Transfer Out Transaction":
            totalNoOfTransferOutTransaction,
        "Total No. of Foreign Wallet Transaction":
            totalNoOfForeignWalletTransaction,
        "Total No. of Other Category Debit Transaction":
            totalNoOfOtherCategoryDebitTransaction,
        "Total Amount of Bills & Utilities": totalAmountOfBillsUtilities,
        "Total Amount of Food": totalAmountOfFood,
        "Total Amount of Alcohol": totalAmountOfAlcohol,
        "Total Amount of Personal Loan": totalAmountOfPersonalLoan,
        "Total Amount of Home Loan": totalAmountOfHomeLoan,
        "Total Amount of Auto Loan ": totalAmountOfAutoLoan,
        "Total Amount of Travel": totalAmountOfTravel,
        "Total Amount of Entertainment & Lifestyle":
            totalAmountOfEntertainmentLifestyle,
        "Total Amount of Shopping & Purchase": totalAmountOfShoppingPurchase,
        "Total Amount of Investment Expense": totalAmountOfInvestmentExpense,
        "Total Amount of Insurance": totalAmountOfInsurance,
        "Total Amount of Tax Transaction Debit":
            totalAmountOfTaxTransactionDebit,
        "Total Amount of Gaming": totalAmountOfGaming,
        "Total Amount of Transfer to Wallet Transaction":
            totalAmountOfTransferToWalletTransaction,
        "Total Amount of Reversal Transaction Debit":
            totalAmountOfReversalTransactionDebit,
        "Total Amount of CreditCard Payment": totalAmountOfCreditCardPayment,
        "Total Amount of Cash Withdrawals": totalAmountOfCashWithdrawals,
        "Total Amount of Medical Transaction": totalAmountOfMedicalTransaction,
        "Total Amount of Charges Transaction": totalAmountOfChargesTransaction,
        "Total Amount of Below Minimum Balance Transaction":
            totalAmountOfBelowMinimumBalanceTransaction,
        "Total Amount of Salary Paid Transaction":
            totalAmountOfSalaryPaidTransaction,
        "Total Amount of Transfer Out Transaction":
            totalAmountOfTransferOutTransaction,
        "Total Amount of Foreign Wallet Transaction":
            totalAmountOfForeignWalletTransaction,
        "Total Amount of EMI / loan Payments": totalAmountOfEmiLoanPayments,
        "Total Amount of Other Category Debit Transaction":
            totalAmountOfOtherCategoryDebitTransaction,
        "Total No. of Mutual Funds": totalNoOfMutualFunds,
        "Total Debit Amount of Mutual Funds": totalDebitAmountOfMutualFunds,
        "Total Expense on Crypto Currency": totalExpenseOnCryptoCurrency,
        "Total Expense on Share Market": totalExpenseOnShareMarket,
        "Total No. of Gas Bill Payments": totalNoOfGasBillPayments,
        "Total Amount of Gas Bill Payments": totalAmountOfGasBillPayments,
        "Total No. of Electricity Bill Payments":
            totalNoOfElectricityBillPayments,
        "Total No. of Mobile & Broadband Bill Payments":
            totalNoOfMobileBroadbandBillPayments,
        "Total Amount of Mobile & Broadband Bill Payments":
            totalAmountOfMobileBroadbandBillPayments,
        "Total Amount of Electricity Bill Payments":
            totalAmountOfElectricityBillPayments,
        "Total No. of Dividend": totalNoOfDividend,
        "Total Amount of Dividend": totalAmountOfDividend,
      };
}

class Overall {
  num? minOpeningBalance;
  double? maxOpeningBalance;
  num? minBalance;
  double? medianBalance;
  double? maxBalance;
  num? firstDayEodBalance;
  num? lastDayEodBalance;
  num? opening;
  num? closingBalance;
  num? minEodBalance;
  double? maxEodBalance;
  double? medianEodBalance;
  num? totalNoOfSalaryCredits;
  num? totalAmountOfSalaryCredits;
  num? totalNoOfCreditTransactions;
  num? totalAmountOfCreditTransactions;
  num? totalNoOfBusinessCreditTransactions;
  num? totalAmountOfBusinessCreditTransactions;
  num? totalNoOfDebitTransactions;
  double? totalAmountOfDebitTransactions;
  num? totalNoOfCashDeposits;
  num? totalAmountOfCashDeposits;
  num? totalNoOfCashWithdrawals;
  num? chqDeposits;
  num? totalNoOfChequeDeposits;
  num? chqIssues;
  num? totalNoOfChequeIssues;
  num? totalChqDeposits;
  num? totalAmountOfChequeDeposits;
  num? totalChqIssues;
  num? totalAmountOfChequeIssues;
  num? noOfEmiLoanPayments;
  num? totalNoOfEmiLoanPayments;
  num? totalNoOfIWBounced;
  num? sumOfIWBounced;
  num? totalAmountOfIWBounced;
  num? totalNumberOfOutwardChequeBounces;
  num? noOfTransactionsInBs;
  num? noOfTransactionsInBsInLast6Months;
  num? totalAmountOfGamingInLast6Months;
  num? totalLoanDisbursal;
  num? totalAmountOfLoanDisbursal;
  num? loanDisbursal;
  num? overallLoanDisbursal;
  num? totalNoOfLoanDisbursal;
  num? overallTotalNoOfIWChqBounced;
  num? totalNoOfIWChqBounced;
  num? inwChqBounceNonTechnical;
  num? totalNoOfIWChequeBounceNonTechnical;
  num? totalInwChqBounceNonTechnical;
  num? totalAmountOfIWChequeBounceNonTechnical;
  num? salaryCount;
  num? overallStartDate;
  num? startDate;
  double? averageEodBalance;
  num? totalNoOfSalaryCredits180Days;
  String? recommendedDateRangeForNach;
  num? abbOn114LastDay;
  num? abbOn1St14Th30ThLastDay;
  num? totalNoOfNetCreditTransactions;
  num? totalNetCreditAmount;
  num? totalNoOfNetDebitTransactions;
  double? totalNetDebitAmount;
  num? totalNoOfCreditCardPayment;
  num? totalNoOfBillsUtilities;
  num? totalNoOfFood;
  num? totalNoOfAlcohol;
  num? totalNoOfTravel;
  num? totalNoOfEntertainmentLifestyle;
  num? totalNoOfShoppingPurchase;
  num? totalNoOfInvestmentExpense;
  num? totalNoOfGaming;
  num? totalNoOfPersonalLoan;
  num? totalNoOfHomeLoan;
  num? totalNoOfAutoLoan;
  num? totalNoOfInsurance;
  num? totalNoOfTaxTransactionDebit;
  num? totalNoOfTransferToWalletTransaction;
  num? totalNoOfReversalTransactionDebit;
  num? totalNoOfMedicalTransaction;
  num? totalNoOfChargesTransaction;
  num? totalNoOfBelowMinimumBalanceTransaction;
  num? totalNoOfSalaryPaidTransaction;
  num? totalNoOfTransferOutTransaction;
  num? totalNoOfForeignWalletTransaction;
  num? totalNoOfOtherCategoryDebitTransaction;
  num? totalAmountOfBillsUtilities;
  num? totalAmountOfFood;
  num? totalAmountOfAlcohol;
  num? totalAmountOfPersonalLoan;
  num? totalAmountOfHomeLoan;
  num? totalAmountOfAutoLoan;
  num? totalAmountOfTravel;
  num? totalAmountOfEntertainmentLifestyle;
  num? totalAmountOfShoppingPurchase;
  num? totalAmountOfInvestmentExpense;
  num? totalAmountOfInsurance;
  num? totalAmountOfTaxTransactionDebit;
  num? totalAmountOfGaming;
  num? totalAmountOfTransferToWalletTransaction;
  num? totalAmountOfReversalTransactionDebit;
  num? totalAmountOfCreditCardPayment;
  num? totalAmountOfCashWithdrawals;
  num? totalAmountOfMedicalTransaction;
  num? totalAmountOfChargesTransaction;
  num? totalAmountOfBelowMinimumBalanceTransaction;
  num? totalAmountOfSalaryPaidTransaction;
  double? totalAmountOfTransferOutTransaction;
  num? totalAmountOfForeignWalletTransaction;
  num? totalAmountOfEmiLoanPayments;
  num? totalAmountOfOtherCategoryDebitTransaction;
  num? percentOfCashDepositOutOfTotalCreditInAmount;
  num? percentOfCashDepositOutOfTotalCreditInNumber;
  num? totalNoOfnumerestReceived;
  num? totalAmountOfnumerestReceived;
  num? totalNoOfChequeReturnCharges;
  num? totalNoOfTechnicalChequeBounces;
  num? totalNoOfAtmWithdrawalsAbove2000;
  num? totalEcsNachNumber;
  num? totalEcsNachAmount;
  num? totalNoOfDebitnumernalTransfer;
  num? totalAmountOfDebitnumernalTransfer;
  num? totalNoOfCreditnumernalTransfer;
  num? totalAmountOfCreditnumernalTransfer;
  num? totalNoOfExpenseTransactions;
  num? totalNoOfHolidayTransactions;
  double? totalAmountOfHolidayTransactions;
  num? totalNoOfBouncedOWPayment;
  num? totalAmountOfBouncedOWPayment;
  num? totalNoOfPaymentBounceCharges;
  num? totalAmountOfPaymentBounceCharges;
  num? totalNoOfnumerestPaid;
  num? totalAmountOfnumerestPaid;
  num? totalNoOfDdCancel;
  num? totalAmountOfDdCancel;
  num? totalNoOfDdIssue;
  num? totalAmountOfDdIssue;
  double? averageCreditAmountLast1Months;
  double? averageCreditAmountLast2Months;
  double? averageCreditAmountLast3Months;
  double? averageCreditAmountLast6Months;
  String? employmentType;
  num? salaryFlag;
  double? avgEodBalanceLast3Months;
  double? avgEodBalanceInLast6Months;
  double? avgEodBalanceInLast12Months;
  num? noOfCreditTransactionsInLast3Months;
  num? noOfCreditTransactionsInLast6Months;
  num? noOfCreditTransactionsInLast12Months;
  num? amountOfCreditTransactionsInLast1Months;
  num? amountOfCreditTransactionsInLast2Months;
  num? amountOfCreditTransactionsInLast3Months;
  num? amountOfCreditTransactionsInLast6Months;
  num? amountOfCreditTransactionsInLast12Months;
  num? totalNoOfBusinessCreditTransactionsInLast30Days;
  num? totalNoOfBusinessCreditTransactionsInLast180Days;
  num? totalAmountOfBusinessCreditTransactionsInLast30Days;
  num? totalAmountOfBusinessCreditTransactionsInLast180Days;
  num? totalNoOfBusinessCreditTransactions0M;
  num? totalNoOfBusinessCreditTransactions1M;
  num? totalNoOfBusinessCreditTransactions2M;
  num? totalNoOfBusinessCreditTransactions3M;
  num? totalNoOfBusinessCreditTransactions4M;
  num? totalNoOfBusinessCreditTransactions5M;
  num? totalNoOfBusinessCreditTransactions6M;
  num? totalAmountOfBusinessCreditTransactions0M;
  num? totalAmountOfBusinessCreditTransactions1M;
  num? totalAmountOfBusinessCreditTransactions2M;
  num? totalAmountOfBusinessCreditTransactions3M;
  num? totalAmountOfBusinessCreditTransactions4M;
  num? totalAmountOfBusinessCreditTransactions5M;
  num? totalAmountOfBusinessCreditTransactions6M;
  num? noOfDebitTransactionsInLast3Months;
  num? noOfDebitTransactionsInLast6Months;
  num? noOfDebitTransactionsInLast12Months;
  num? amountOfDebitTransactionsInLast3Months;
  double? amountOfDebitTransactionsInLast6Months;
  double? amountOfDebitTransactionsInLast12Months;
  num? avgSalaryCreditedInLast1Month;
  num? avgSalaryCreditedInLast3Months;
  num? avgSalaryCreditedInLast6Months;
  num? totalLoanCreditedInLast1Month;
  num? totalLoanCreditedInLast3Months;
  num? totalLoanCreditedInLast6Months;
  num? totalLoanCreditedInLast12Months;
  num? totalNoOfEmiBouncesInLast1Month;
  num? totalNoOfEmiBouncesInLast2Months;
  num? totalNoOfEmiBouncesInLast3Months;
  double? avgEodBalance1M;
  double? avgEodBalance2M;
  num? avgEodBalance3M;
  double? avgEodBalance4M;
  double? avgEodBalance5M;
  num? avgEodBalance6M;
  num? totalSalaryAmount1M;
  num? totalSalaryAmount2M;
  num? totalSalaryAmount3M;
  num? totalSalaryAmount4M;
  num? totalSalaryAmount5M;
  num? totalSalaryAmount6M;
  num? totalNumberOfCashDepositsRange910L;
  num? totalNumberOfCashDepositsRange1020K;
  num? totalNumberOfCashDepositsRange4050K;
  num? totalAmountOfNetCreditTransactions1M;
  num? totalAmountOfNetCreditTransactions2M;
  num? totalAmountOfNetCreditTransactions3M;
  num? totalAmountOfNetCreditTransactions4M;
  num? totalAmountOfNetCreditTransactions5M;
  num? totalAmountOfNetCreditTransactions6M;
  num? totalNoOfNetCreditTransactions1M;
  num? totalNoOfNetCreditTransactions2M;
  num? totalNoOfNetCreditTransactions3M;
  num? totalNoOfNetCreditTransactions4M;
  num? totalNoOfNetCreditTransactions5M;
  num? totalNoOfNetCreditTransactions6M;
  double? avgEodBalanceBelow5001M;
  double? avgEodBalanceBelow5002M;
  double? avgEodBalanceBelow5003M;
  double? avgEodBalanceBelow5004M;
  double? avgEodBalanceBelow5005M;
  num? avgEodBalanceBelow5006M;
  double? avgEodBalanceBelow10001M;
  double? avgEodBalanceBelow10002M;
  double? avgEodBalanceBelow10003M;
  double? avgEodBalanceBelow10004M;
  double? avgEodBalanceBelow10005M;
  num? avgEodBalanceBelow10006M;
  double? avgEodBalanceBelow20001M;
  double? avgEodBalanceBelow20002M;
  double? avgEodBalanceBelow20003M;
  double? avgEodBalanceBelow20004M;
  double? avgEodBalanceBelow20005M;
  num? avgEodBalanceBelow20006M;
  double? avgEodBalanceBelow50001M;
  double? avgEodBalanceBelow50002M;
  num? avgEodBalanceBelow50003M;
  double? avgEodBalanceBelow50004M;
  double? avgEodBalanceBelow50005M;
  num? avgEodBalanceBelow50006M;
  num? totalNoOfEmiBounces;
  num? totalAmountOfEmiBounces;
  num? averageCreditLoanAmountInLast3Months;
  num? averageCreditLoanAmountInLast6Months;
  num? amountOfInvestmentIncomeLast3Months;
  num? amountOfInvestmentIncomeLast6Months;
  num? avgAmountOfInvestmentIncomeLast3Months;
  num? avgAmountOfInvestmentIncomeLast6Months;
  num? amountOfSalaryCreditedInLast3Months;
  num? amountOfSalaryCreditedLast6Months;
  num? amountOfSalaryCreditedInLast1Month;
  num? amountOfSalaryCreditedLast12Months;
  num? totalAmountOfSalaryCreditedInLast3Months;
  num? noOfSalaryCreditedInLast3Month;
  num? noOfSalaryCreditedLast6Months;
  num? noOfSalaryCreditedLast1Month;
  num? noOfSalaryCreditedLast12Months;
  double? minimumEodBalanceLast3Months;
  num? minimumEodBalanceLast6Months;
  double? maximumEodBalanceLast3Months;
  double? maximumEodBalanceLast6Months;
  num? noOfLoanCreditedLast1Month;
  num? noOfLoanCreditedLast3Months;
  num? noOfLoanCreditedLast6Months;
  num? noOfLoanCreditedLast12Months;
  num? debitAmountOfCreditCardLast1Month;
  num? debitAmountOfCreditCardLast3Months;
  num? debitAmountOfCreditCardLast6Months;
  num? avgDebitAmountOfCreditCardLast3Months;
  num? avgDebitAmountOfCreditCardLast6Months;
  num? avgDebitAmountOfCreditCardLast12Months;
  num? amountOfCashDepositsLast3Months;
  num? amountOfCashDepositsLast6Months;
  num? amountOfCashDepositsLast12Months;
  num? noOfCreditCardPaymentLast1Month;
  num? noOfCreditCardPaymentLast3Months;
  num? noOfCreditCardPaymentLast6Months;
  double? debitCreditRatioForLast1Month;
  double? debitCreditRatioForLast3Month;
  double? debitCreditRatioForLast6Month;
  num? noOfIWChequeBounces1M;
  num? noOfIWChequeBounces2M;
  num? noOfIWChequeBounces3M;
  num? noOfIWChequeBounces4M;
  num? noOfIWChequeBounces5M;
  num? noOfIWChequeBounces6M;
  double? ratioOfAverageBalanceForLast1MTo3M;
  num? amountOfCashWithdrawalLast3Months;
  num? amountOfCashWithdrawalLast6Months;
  num? amountOfCashWithdrawalLast12Months;
  num? noOfLoanEmiPaymentsLast1Month;
  num? noOfLoanEmiPaymentsLast3Month;
  num? amountOfLoanEmiPaymentsLast1Month;
  num? amountOfLoanEmiPaymentsLast3Month;
  num? totalNoOfMutualFunds;
  num? totalDebitAmountOfMutualFunds;
  num? totalNoOfInvestmentIncomeLast12Months;
  num? totalAmountOfInvestmentIncomeLast12Months;
  num? totalExpenseOnCryptoCurrency;
  num? totalExpenseOnShareMarket;
  double? standardDeviationOfBalanceLast1Month;
  double? standardDeviationOfBalanceLast6Months;
  double? standardDeviationOfBalanceLast3Months;
  double? coefficientOfVarianceOfBalanceLast1Month;
  double? coefficientOfVarianceOfBalanceLast3Months;
  double? coefficientOfVarianceOfBalanceLast6Months;
  double? standardDeviationOfDebitAmount;
  double? standardDeviationOfCreditAmount;
  double? coefficientOfVariationOfDebitAmount;
  double? coefficientOfVarianceOfCreditAmount;
  double? medianEodBalanceLast1Month;
  double? medianEodBalanceLast3Months;
  double? medianEodBalanceLast6Months;
  double? minBalanceLast1Month;
  double? avgMinBalanceLast1Month;
  double? ratioOfCreditsAmountsIn30DaysTo60Days;
  num? ratioOfCreditsAmountsIn90DaysTo180Days;
  double? ratioOfCreditsAmountsIn60DaysTo90Days;
  num? loanDisbursalAmount1M;
  num? loanDisbursalAmount2M;
  num? loanDisbursalAmount3M;
  num? loanDisbursalAmount4M;
  num? loanDisbursalAmount5M;
  num? loanDisbursalAmount6M;
  num? totalNoOfGasBillPayments;
  num? totalAmountOfGasBillPayments;
  num? totalNoOfElectricityBillPayments;
  num? totalNoOfMobileBroadbandBillPayments;
  num? totalAmountOfMobileBroadbandBillPayments;
  num? totalAmountOfElectricityBillPayments;
  num? totalNoOfDividend;
  num? totalAmountOfDividend;
  num? noOfPennyDropTransactions;
  num? noOfPennyDropTransactionsInLast6Months;
  num? amountPaidTowardsInsurancePerYear;
  num? totalVeEventTransactionsInLast1Month;
  num? totalVeEventTransactionsInLast3Months;
  num? totalVeEventTransactionsInLast6Months;
  num? totalAmountOfVeEventTransactionsInLast1Month;
  num? totalAmountOfVeEventTransactionsInLast3Months;
  num? totalAmountOfVeEventTransactionsInLast6Months;
  List<dynamic>? salaryDates;
  num? amountOfCreditTransactionLast45Days;
  num? amountOfMoneyPaidTowardsMutualFundPerYear;
  double? averageVelocity;
  num? daysSinceLastNegativeDebitEvent;
  num? amountOfCreditInvestmentTransactionLast12Months;
  num? businessIncome;
  num? businessIncomeInLast6Months;
  num? amountOfNonDiscretionarySpends;
  num? immediateLoanShareMarketGamingPaymentAfterTakingCreditLine;
  String? oldestTransactionDate;

  Overall({
    this.minOpeningBalance,
    this.maxOpeningBalance,
    this.minBalance,
    this.medianBalance,
    this.maxBalance,
    this.firstDayEodBalance,
    this.lastDayEodBalance,
    this.opening,
    this.closingBalance,
    this.minEodBalance,
    this.maxEodBalance,
    this.medianEodBalance,
    this.totalNoOfSalaryCredits,
    this.totalAmountOfSalaryCredits,
    this.totalNoOfCreditTransactions,
    this.totalAmountOfCreditTransactions,
    this.totalNoOfBusinessCreditTransactions,
    this.totalAmountOfBusinessCreditTransactions,
    this.totalNoOfDebitTransactions,
    this.totalAmountOfDebitTransactions,
    this.totalNoOfCashDeposits,
    this.totalAmountOfCashDeposits,
    this.totalNoOfCashWithdrawals,
    this.chqDeposits,
    this.totalNoOfChequeDeposits,
    this.chqIssues,
    this.totalNoOfChequeIssues,
    this.totalChqDeposits,
    this.totalAmountOfChequeDeposits,
    this.totalChqIssues,
    this.totalAmountOfChequeIssues,
    this.noOfEmiLoanPayments,
    this.totalNoOfEmiLoanPayments,
    this.totalNoOfIWBounced,
    this.sumOfIWBounced,
    this.totalAmountOfIWBounced,
    this.totalNumberOfOutwardChequeBounces,
    this.noOfTransactionsInBs,
    this.noOfTransactionsInBsInLast6Months,
    this.totalAmountOfGamingInLast6Months,
    this.totalLoanDisbursal,
    this.totalAmountOfLoanDisbursal,
    this.loanDisbursal,
    this.overallLoanDisbursal,
    this.totalNoOfLoanDisbursal,
    this.overallTotalNoOfIWChqBounced,
    this.totalNoOfIWChqBounced,
    this.inwChqBounceNonTechnical,
    this.totalNoOfIWChequeBounceNonTechnical,
    this.totalInwChqBounceNonTechnical,
    this.totalAmountOfIWChequeBounceNonTechnical,
    this.salaryCount,
    this.overallStartDate,
    this.startDate,
    this.averageEodBalance,
    this.totalNoOfSalaryCredits180Days,
    this.recommendedDateRangeForNach,
    this.abbOn114LastDay,
    this.abbOn1St14Th30ThLastDay,
    this.totalNoOfNetCreditTransactions,
    this.totalNetCreditAmount,
    this.totalNoOfNetDebitTransactions,
    this.totalNetDebitAmount,
    this.totalNoOfCreditCardPayment,
    this.totalNoOfBillsUtilities,
    this.totalNoOfFood,
    this.totalNoOfAlcohol,
    this.totalNoOfTravel,
    this.totalNoOfEntertainmentLifestyle,
    this.totalNoOfShoppingPurchase,
    this.totalNoOfInvestmentExpense,
    this.totalNoOfGaming,
    this.totalNoOfPersonalLoan,
    this.totalNoOfHomeLoan,
    this.totalNoOfAutoLoan,
    this.totalNoOfInsurance,
    this.totalNoOfTaxTransactionDebit,
    this.totalNoOfTransferToWalletTransaction,
    this.totalNoOfReversalTransactionDebit,
    this.totalNoOfMedicalTransaction,
    this.totalNoOfChargesTransaction,
    this.totalNoOfBelowMinimumBalanceTransaction,
    this.totalNoOfSalaryPaidTransaction,
    this.totalNoOfTransferOutTransaction,
    this.totalNoOfForeignWalletTransaction,
    this.totalNoOfOtherCategoryDebitTransaction,
    this.totalAmountOfBillsUtilities,
    this.totalAmountOfFood,
    this.totalAmountOfAlcohol,
    this.totalAmountOfPersonalLoan,
    this.totalAmountOfHomeLoan,
    this.totalAmountOfAutoLoan,
    this.totalAmountOfTravel,
    this.totalAmountOfEntertainmentLifestyle,
    this.totalAmountOfShoppingPurchase,
    this.totalAmountOfInvestmentExpense,
    this.totalAmountOfInsurance,
    this.totalAmountOfTaxTransactionDebit,
    this.totalAmountOfGaming,
    this.totalAmountOfTransferToWalletTransaction,
    this.totalAmountOfReversalTransactionDebit,
    this.totalAmountOfCreditCardPayment,
    this.totalAmountOfCashWithdrawals,
    this.totalAmountOfMedicalTransaction,
    this.totalAmountOfChargesTransaction,
    this.totalAmountOfBelowMinimumBalanceTransaction,
    this.totalAmountOfSalaryPaidTransaction,
    this.totalAmountOfTransferOutTransaction,
    this.totalAmountOfForeignWalletTransaction,
    this.totalAmountOfEmiLoanPayments,
    this.totalAmountOfOtherCategoryDebitTransaction,
    this.percentOfCashDepositOutOfTotalCreditInAmount,
    this.percentOfCashDepositOutOfTotalCreditInNumber,
    this.totalNoOfnumerestReceived,
    this.totalAmountOfnumerestReceived,
    this.totalNoOfChequeReturnCharges,
    this.totalNoOfTechnicalChequeBounces,
    this.totalNoOfAtmWithdrawalsAbove2000,
    this.totalEcsNachNumber,
    this.totalEcsNachAmount,
    this.totalNoOfDebitnumernalTransfer,
    this.totalAmountOfDebitnumernalTransfer,
    this.totalNoOfCreditnumernalTransfer,
    this.totalAmountOfCreditnumernalTransfer,
    this.totalNoOfExpenseTransactions,
    this.totalNoOfHolidayTransactions,
    this.totalAmountOfHolidayTransactions,
    this.totalNoOfBouncedOWPayment,
    this.totalAmountOfBouncedOWPayment,
    this.totalNoOfPaymentBounceCharges,
    this.totalAmountOfPaymentBounceCharges,
    this.totalNoOfnumerestPaid,
    this.totalAmountOfnumerestPaid,
    this.totalNoOfDdCancel,
    this.totalAmountOfDdCancel,
    this.totalNoOfDdIssue,
    this.totalAmountOfDdIssue,
    this.averageCreditAmountLast1Months,
    this.averageCreditAmountLast2Months,
    this.averageCreditAmountLast3Months,
    this.averageCreditAmountLast6Months,
    this.employmentType,
    this.salaryFlag,
    this.avgEodBalanceLast3Months,
    this.avgEodBalanceInLast6Months,
    this.avgEodBalanceInLast12Months,
    this.noOfCreditTransactionsInLast3Months,
    this.noOfCreditTransactionsInLast6Months,
    this.noOfCreditTransactionsInLast12Months,
    this.amountOfCreditTransactionsInLast1Months,
    this.amountOfCreditTransactionsInLast2Months,
    this.amountOfCreditTransactionsInLast3Months,
    this.amountOfCreditTransactionsInLast6Months,
    this.amountOfCreditTransactionsInLast12Months,
    this.totalNoOfBusinessCreditTransactionsInLast30Days,
    this.totalNoOfBusinessCreditTransactionsInLast180Days,
    this.totalAmountOfBusinessCreditTransactionsInLast30Days,
    this.totalAmountOfBusinessCreditTransactionsInLast180Days,
    this.totalNoOfBusinessCreditTransactions0M,
    this.totalNoOfBusinessCreditTransactions1M,
    this.totalNoOfBusinessCreditTransactions2M,
    this.totalNoOfBusinessCreditTransactions3M,
    this.totalNoOfBusinessCreditTransactions4M,
    this.totalNoOfBusinessCreditTransactions5M,
    this.totalNoOfBusinessCreditTransactions6M,
    this.totalAmountOfBusinessCreditTransactions0M,
    this.totalAmountOfBusinessCreditTransactions1M,
    this.totalAmountOfBusinessCreditTransactions2M,
    this.totalAmountOfBusinessCreditTransactions3M,
    this.totalAmountOfBusinessCreditTransactions4M,
    this.totalAmountOfBusinessCreditTransactions5M,
    this.totalAmountOfBusinessCreditTransactions6M,
    this.noOfDebitTransactionsInLast3Months,
    this.noOfDebitTransactionsInLast6Months,
    this.noOfDebitTransactionsInLast12Months,
    this.amountOfDebitTransactionsInLast3Months,
    this.amountOfDebitTransactionsInLast6Months,
    this.amountOfDebitTransactionsInLast12Months,
    this.avgSalaryCreditedInLast1Month,
    this.avgSalaryCreditedInLast3Months,
    this.avgSalaryCreditedInLast6Months,
    this.totalLoanCreditedInLast1Month,
    this.totalLoanCreditedInLast3Months,
    this.totalLoanCreditedInLast6Months,
    this.totalLoanCreditedInLast12Months,
    this.totalNoOfEmiBouncesInLast1Month,
    this.totalNoOfEmiBouncesInLast2Months,
    this.totalNoOfEmiBouncesInLast3Months,
    this.avgEodBalance1M,
    this.avgEodBalance2M,
    this.avgEodBalance3M,
    this.avgEodBalance4M,
    this.avgEodBalance5M,
    this.avgEodBalance6M,
    this.totalSalaryAmount1M,
    this.totalSalaryAmount2M,
    this.totalSalaryAmount3M,
    this.totalSalaryAmount4M,
    this.totalSalaryAmount5M,
    this.totalSalaryAmount6M,
    this.totalNumberOfCashDepositsRange910L,
    this.totalNumberOfCashDepositsRange1020K,
    this.totalNumberOfCashDepositsRange4050K,
    this.totalAmountOfNetCreditTransactions1M,
    this.totalAmountOfNetCreditTransactions2M,
    this.totalAmountOfNetCreditTransactions3M,
    this.totalAmountOfNetCreditTransactions4M,
    this.totalAmountOfNetCreditTransactions5M,
    this.totalAmountOfNetCreditTransactions6M,
    this.totalNoOfNetCreditTransactions1M,
    this.totalNoOfNetCreditTransactions2M,
    this.totalNoOfNetCreditTransactions3M,
    this.totalNoOfNetCreditTransactions4M,
    this.totalNoOfNetCreditTransactions5M,
    this.totalNoOfNetCreditTransactions6M,
    this.avgEodBalanceBelow5001M,
    this.avgEodBalanceBelow5002M,
    this.avgEodBalanceBelow5003M,
    this.avgEodBalanceBelow5004M,
    this.avgEodBalanceBelow5005M,
    this.avgEodBalanceBelow5006M,
    this.avgEodBalanceBelow10001M,
    this.avgEodBalanceBelow10002M,
    this.avgEodBalanceBelow10003M,
    this.avgEodBalanceBelow10004M,
    this.avgEodBalanceBelow10005M,
    this.avgEodBalanceBelow10006M,
    this.avgEodBalanceBelow20001M,
    this.avgEodBalanceBelow20002M,
    this.avgEodBalanceBelow20003M,
    this.avgEodBalanceBelow20004M,
    this.avgEodBalanceBelow20005M,
    this.avgEodBalanceBelow20006M,
    this.avgEodBalanceBelow50001M,
    this.avgEodBalanceBelow50002M,
    this.avgEodBalanceBelow50003M,
    this.avgEodBalanceBelow50004M,
    this.avgEodBalanceBelow50005M,
    this.avgEodBalanceBelow50006M,
    this.totalNoOfEmiBounces,
    this.totalAmountOfEmiBounces,
    this.averageCreditLoanAmountInLast3Months,
    this.averageCreditLoanAmountInLast6Months,
    this.amountOfInvestmentIncomeLast3Months,
    this.amountOfInvestmentIncomeLast6Months,
    this.avgAmountOfInvestmentIncomeLast3Months,
    this.avgAmountOfInvestmentIncomeLast6Months,
    this.amountOfSalaryCreditedInLast3Months,
    this.amountOfSalaryCreditedLast6Months,
    this.amountOfSalaryCreditedInLast1Month,
    this.amountOfSalaryCreditedLast12Months,
    this.totalAmountOfSalaryCreditedInLast3Months,
    this.noOfSalaryCreditedInLast3Month,
    this.noOfSalaryCreditedLast6Months,
    this.noOfSalaryCreditedLast1Month,
    this.noOfSalaryCreditedLast12Months,
    this.minimumEodBalanceLast3Months,
    this.minimumEodBalanceLast6Months,
    this.maximumEodBalanceLast3Months,
    this.maximumEodBalanceLast6Months,
    this.noOfLoanCreditedLast1Month,
    this.noOfLoanCreditedLast3Months,
    this.noOfLoanCreditedLast6Months,
    this.noOfLoanCreditedLast12Months,
    this.debitAmountOfCreditCardLast1Month,
    this.debitAmountOfCreditCardLast3Months,
    this.debitAmountOfCreditCardLast6Months,
    this.avgDebitAmountOfCreditCardLast3Months,
    this.avgDebitAmountOfCreditCardLast6Months,
    this.avgDebitAmountOfCreditCardLast12Months,
    this.amountOfCashDepositsLast3Months,
    this.amountOfCashDepositsLast6Months,
    this.amountOfCashDepositsLast12Months,
    this.noOfCreditCardPaymentLast1Month,
    this.noOfCreditCardPaymentLast3Months,
    this.noOfCreditCardPaymentLast6Months,
    this.debitCreditRatioForLast1Month,
    this.debitCreditRatioForLast3Month,
    this.debitCreditRatioForLast6Month,
    this.noOfIWChequeBounces1M,
    this.noOfIWChequeBounces2M,
    this.noOfIWChequeBounces3M,
    this.noOfIWChequeBounces4M,
    this.noOfIWChequeBounces5M,
    this.noOfIWChequeBounces6M,
    this.ratioOfAverageBalanceForLast1MTo3M,
    this.amountOfCashWithdrawalLast3Months,
    this.amountOfCashWithdrawalLast6Months,
    this.amountOfCashWithdrawalLast12Months,
    this.noOfLoanEmiPaymentsLast1Month,
    this.noOfLoanEmiPaymentsLast3Month,
    this.amountOfLoanEmiPaymentsLast1Month,
    this.amountOfLoanEmiPaymentsLast3Month,
    this.totalNoOfMutualFunds,
    this.totalDebitAmountOfMutualFunds,
    this.totalNoOfInvestmentIncomeLast12Months,
    this.totalAmountOfInvestmentIncomeLast12Months,
    this.totalExpenseOnCryptoCurrency,
    this.totalExpenseOnShareMarket,
    this.standardDeviationOfBalanceLast1Month,
    this.standardDeviationOfBalanceLast6Months,
    this.standardDeviationOfBalanceLast3Months,
    this.coefficientOfVarianceOfBalanceLast1Month,
    this.coefficientOfVarianceOfBalanceLast3Months,
    this.coefficientOfVarianceOfBalanceLast6Months,
    this.standardDeviationOfDebitAmount,
    this.standardDeviationOfCreditAmount,
    this.coefficientOfVariationOfDebitAmount,
    this.coefficientOfVarianceOfCreditAmount,
    this.medianEodBalanceLast1Month,
    this.medianEodBalanceLast3Months,
    this.medianEodBalanceLast6Months,
    this.minBalanceLast1Month,
    this.avgMinBalanceLast1Month,
    this.ratioOfCreditsAmountsIn30DaysTo60Days,
    this.ratioOfCreditsAmountsIn90DaysTo180Days,
    this.ratioOfCreditsAmountsIn60DaysTo90Days,
    this.loanDisbursalAmount1M,
    this.loanDisbursalAmount2M,
    this.loanDisbursalAmount3M,
    this.loanDisbursalAmount4M,
    this.loanDisbursalAmount5M,
    this.loanDisbursalAmount6M,
    this.totalNoOfGasBillPayments,
    this.totalAmountOfGasBillPayments,
    this.totalNoOfElectricityBillPayments,
    this.totalNoOfMobileBroadbandBillPayments,
    this.totalAmountOfMobileBroadbandBillPayments,
    this.totalAmountOfElectricityBillPayments,
    this.totalNoOfDividend,
    this.totalAmountOfDividend,
    this.noOfPennyDropTransactions,
    this.noOfPennyDropTransactionsInLast6Months,
    this.amountPaidTowardsInsurancePerYear,
    this.totalVeEventTransactionsInLast1Month,
    this.totalVeEventTransactionsInLast3Months,
    this.totalVeEventTransactionsInLast6Months,
    this.totalAmountOfVeEventTransactionsInLast1Month,
    this.totalAmountOfVeEventTransactionsInLast3Months,
    this.totalAmountOfVeEventTransactionsInLast6Months,
    this.salaryDates,
    this.amountOfCreditTransactionLast45Days,
    this.amountOfMoneyPaidTowardsMutualFundPerYear,
    this.averageVelocity,
    this.daysSinceLastNegativeDebitEvent,
    this.amountOfCreditInvestmentTransactionLast12Months,
    this.businessIncome,
    this.businessIncomeInLast6Months,
    this.amountOfNonDiscretionarySpends,
    this.immediateLoanShareMarketGamingPaymentAfterTakingCreditLine,
    this.oldestTransactionDate,
  });

  factory Overall.fromRawJson(String str) => Overall.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Overall.fromJson(Map<String, dynamic> json) => Overall(
        minOpeningBalance: json["Min Opening Balance"],
        maxOpeningBalance: json["Max Opening Balance"]?.toDouble(),
        minBalance: json["Min Balance"],
        medianBalance: json["Median Balance"]?.toDouble(),
        maxBalance: json["Max Balance"]?.toDouble(),
        firstDayEodBalance: json["First Day EOD Balance"],
        lastDayEodBalance: json["Last Day EOD Balance"],
        opening: json["Opening"],
        closingBalance: json["Closing Balance"],
        minEodBalance: json["Min EOD Balance"],
        maxEodBalance: json["Max EOD Balance"]?.toDouble(),
        medianEodBalance: json["Median EOD Balance"]?.toDouble(),
        totalNoOfSalaryCredits: json["Total No of Salary Credits"],
        totalAmountOfSalaryCredits: json["Total Amount of Salary Credits"],
        totalNoOfCreditTransactions: json["Total No. of Credit Transactions"],
        totalAmountOfCreditTransactions:
            json["Total Amount of Credit Transactions"],
        totalNoOfBusinessCreditTransactions:
            json["Total No. of Business Credit Transactions"],
        totalAmountOfBusinessCreditTransactions:
            json["Total Amount of Business Credit Transactions"],
        totalNoOfDebitTransactions: json["Total No. of Debit Transactions"],
        totalAmountOfDebitTransactions:
            json["Total Amount of Debit Transactions"]?.toDouble(),
        totalNoOfCashDeposits: json["Total No. of Cash Deposits"],
        totalAmountOfCashDeposits: json["Total Amount of Cash Deposits"],
        totalNoOfCashWithdrawals: json["Total No. of Cash Withdrawals"],
        chqDeposits: json["chqDeposits"],
        totalNoOfChequeDeposits: json["Total No. of Cheque Deposits"],
        chqIssues: json["chqIssues"],
        totalNoOfChequeIssues: json["Total No. of Cheque Issues"],
        totalChqDeposits: json["totalChqDeposits"],
        totalAmountOfChequeDeposits: json["Total Amount of Cheque Deposits"],
        totalChqIssues: json["totalChqIssues"],
        totalAmountOfChequeIssues: json["Total Amount of Cheque Issues"],
        noOfEmiLoanPayments: json["No. of EMI / loan payments"],
        totalNoOfEmiLoanPayments: json["Total No. of EMI / loan payments"],
        totalNoOfIWBounced: json["Total No.of I / W Bounced"],
        sumOfIWBounced: json["Sum of I/W Bounced"],
        totalAmountOfIWBounced: json["Total amount of I / W Bounced"],
        totalNumberOfOutwardChequeBounces:
            json["Total Number of Outward Cheque Bounces"],
        noOfTransactionsInBs: json["No. of transactions in BS"],
        noOfTransactionsInBsInLast6Months:
            json["No. of transactions in BS in last 6 months"],
        totalAmountOfGamingInLast6Months:
            json["Total amount of Gaming in last 6 months"],
        totalLoanDisbursal: json["totalLoanDisbursal"],
        totalAmountOfLoanDisbursal: json["Total Amount of Loan Disbursal"],
        loanDisbursal: json["Loan Disbursal"],
        overallLoanDisbursal: json["loanDisbursal"],
        totalNoOfLoanDisbursal: json["Total No. of Loan Disbursal"],
        overallTotalNoOfIWChqBounced: json["Total No. of I/W Chq Bounced"],
        totalNoOfIWChqBounced: json["Total No. of I / W Chq Bounced"],
        inwChqBounceNonTechnical: json["inw_chq_bounce_nonTechnical"],
        totalNoOfIWChequeBounceNonTechnical:
            json["Total No. of I / W Cheque Bounce Non Technical"],
        totalInwChqBounceNonTechnical:
            json["total_inw_chq_bounce_nonTechnical"],
        totalAmountOfIWChequeBounceNonTechnical:
            json["Total Amount of I / W Cheque Bounce Non Technical"],
        salaryCount: json["salary_count"],
        overallStartDate: json["startDate"],
        startDate: json["Start Date"],
        averageEodBalance: json["Average EOD Balance"]?.toDouble(),
        totalNoOfSalaryCredits180Days:
            json["Total No of Salary Credits 180 days"],
        recommendedDateRangeForNach: json["Recommended Date Range for NACH"],
        abbOn114LastDay: json["ABB on 1 14 last day"],
        abbOn1St14Th30ThLastDay: json["ABB on 1st,14th, 30th/Last Day"],
        totalNoOfNetCreditTransactions:
            json["Total No. of Net Credit Transactions"],
        totalNetCreditAmount: json["Total Net Credit Amount"],
        totalNoOfNetDebitTransactions:
            json["Total No. of Net Debit Transactions"],
        totalNetDebitAmount: json["Total Net Debit Amount"]?.toDouble(),
        totalNoOfCreditCardPayment: json["Total No. of CreditCard Payment"],
        totalNoOfBillsUtilities: json["Total No. of Bills & Utilities"],
        totalNoOfFood: json["Total No. of Food"],
        totalNoOfAlcohol: json["Total No. of Alcohol"],
        totalNoOfTravel: json["Total No. of Travel"],
        totalNoOfEntertainmentLifestyle:
            json["Total No. of Entertainment & Lifestyle"],
        totalNoOfShoppingPurchase: json["Total No. of Shopping & Purchase"],
        totalNoOfInvestmentExpense: json["Total No. of Investment Expense"],
        totalNoOfGaming: json["Total No. of Gaming"],
        totalNoOfPersonalLoan: json["Total No. of Personal Loan"],
        totalNoOfHomeLoan: json["Total No. of Home Loan"],
        totalNoOfAutoLoan: json["Total No. of Auto Loan "],
        totalNoOfInsurance: json["Total No. of Insurance"],
        totalNoOfTaxTransactionDebit:
            json["Total No. of Tax Transaction Debit"],
        totalNoOfTransferToWalletTransaction:
            json["Total No. of Transfer to Wallet Transaction"],
        totalNoOfReversalTransactionDebit:
            json["Total No. of Reversal Transaction Debit"],
        totalNoOfMedicalTransaction: json["Total No. of Medical Transaction"],
        totalNoOfChargesTransaction: json["Total No. of Charges Transaction"],
        totalNoOfBelowMinimumBalanceTransaction:
            json["Total No. of Below Minimum Balance Transaction"],
        totalNoOfSalaryPaidTransaction:
            json["Total No. of Salary Paid Transaction"],
        totalNoOfTransferOutTransaction:
            json["Total No. of Transfer Out Transaction"],
        totalNoOfForeignWalletTransaction:
            json["Total No. of Foreign Wallet Transaction"],
        totalNoOfOtherCategoryDebitTransaction:
            json["Total No. of Other Category Debit Transaction"],
        totalAmountOfBillsUtilities: json["Total Amount of Bills & Utilities"],
        totalAmountOfFood: json["Total Amount of Food"],
        totalAmountOfAlcohol: json["Total Amount of Alcohol"],
        totalAmountOfPersonalLoan: json["Total Amount of Personal Loan"],
        totalAmountOfHomeLoan: json["Total Amount of Home Loan"],
        totalAmountOfAutoLoan: json["Total Amount of Auto Loan "],
        totalAmountOfTravel: json["Total Amount of Travel"],
        totalAmountOfEntertainmentLifestyle:
            json["Total Amount of Entertainment & Lifestyle"],
        totalAmountOfShoppingPurchase:
            json["Total Amount of Shopping & Purchase"],
        totalAmountOfInvestmentExpense:
            json["Total Amount of Investment Expense"],
        totalAmountOfInsurance: json["Total Amount of Insurance"],
        totalAmountOfTaxTransactionDebit:
            json["Total Amount of Tax Transaction Debit"],
        totalAmountOfGaming: json["Total Amount of Gaming"],
        totalAmountOfTransferToWalletTransaction:
            json["Total Amount of Transfer to Wallet Transaction"],
        totalAmountOfReversalTransactionDebit:
            json["Total Amount of Reversal Transaction Debit"],
        totalAmountOfCreditCardPayment:
            json["Total Amount of CreditCard Payment"],
        totalAmountOfCashWithdrawals: json["Total Amount of Cash Withdrawals"],
        totalAmountOfMedicalTransaction:
            json["Total Amount of Medical Transaction"],
        totalAmountOfChargesTransaction:
            json["Total Amount of Charges Transaction"],
        totalAmountOfBelowMinimumBalanceTransaction:
            json["Total Amount of Below Minimum Balance Transaction"],
        totalAmountOfSalaryPaidTransaction:
            json["Total Amount of Salary Paid Transaction"],
        totalAmountOfTransferOutTransaction:
            json["Total Amount of Transfer Out Transaction"]?.toDouble(),
        totalAmountOfForeignWalletTransaction:
            json["Total Amount of Foreign Wallet Transaction"],
        totalAmountOfEmiLoanPayments:
            json["Total Amount of EMI / loan Payments"],
        totalAmountOfOtherCategoryDebitTransaction:
            json["Total Amount of Other Category Debit Transaction"],
        percentOfCashDepositOutOfTotalCreditInAmount:
            json["Percent of Cash Deposit out of total Credit in Amount"],
        percentOfCashDepositOutOfTotalCreditInNumber:
            json["Percent of Cash Deposit out of total Credit in Number"],
        totalNoOfnumerestReceived: json["Total No. of numerest Received"],
        totalAmountOfnumerestReceived:
            json["Total Amount of numerest Received"],
        totalNoOfChequeReturnCharges:
            json["Total No. of Cheque Return Charges"],
        totalNoOfTechnicalChequeBounces:
            json["Total No. of Technical Cheque Bounces"],
        totalNoOfAtmWithdrawalsAbove2000:
            json["Total No. of ATM Withdrawals above 2000"],
        totalEcsNachNumber: json["Total ECS Nach Number"],
        totalEcsNachAmount: json["Total ECS Nach Amount"],
        totalNoOfDebitnumernalTransfer:
            json["Total No. of Debit numernal Transfer"],
        totalAmountOfDebitnumernalTransfer:
            json["Total Amount of Debit numernal Transfer"],
        totalNoOfCreditnumernalTransfer:
            json["Total No. of Credit numernal Transfer"],
        totalAmountOfCreditnumernalTransfer:
            json["Total Amount of Credit numernal Transfer"],
        totalNoOfExpenseTransactions: json["Total no. of expense transactions"],
        totalNoOfHolidayTransactions: json["Total No. of Holiday Transactions"],
        totalAmountOfHolidayTransactions:
            json["Total Amount of Holiday Transactions"]?.toDouble(),
        totalNoOfBouncedOWPayment: json["Total No of Bounced O/W Payment"],
        totalAmountOfBouncedOWPayment:
            json["Total Amount of Bounced O/W Payment"],
        totalNoOfPaymentBounceCharges:
            json["Total No of Payment Bounce Charges"],
        totalAmountOfPaymentBounceCharges:
            json["Total Amount of Payment Bounce Charges"],
        totalNoOfnumerestPaid: json["Total No of numerest Paid"],
        totalAmountOfnumerestPaid: json["Total Amount of numerest Paid"],
        totalNoOfDdCancel: json["Total No of DD Cancel"],
        totalAmountOfDdCancel: json["Total Amount of DD Cancel"],
        totalNoOfDdIssue: json["Total No of DD Issue"],
        totalAmountOfDdIssue: json["Total Amount of DD Issue"],
        averageCreditAmountLast1Months:
            json["Average Credit amount last 1 months"]?.toDouble(),
        averageCreditAmountLast2Months:
            json["Average Credit amount last 2 months"]?.toDouble(),
        averageCreditAmountLast3Months:
            json["Average Credit amount last 3 months"]?.toDouble(),
        averageCreditAmountLast6Months:
            json["Average Credit amount last 6 months"]?.toDouble(),
        employmentType: json["Employment Type"],
        salaryFlag: json["Salary Flag"],
        avgEodBalanceLast3Months:
            json["Avg EOD Balance last 3 months"]?.toDouble(),
        avgEodBalanceInLast6Months:
            json["Avg EOD Balance in last 6 months"]?.toDouble(),
        avgEodBalanceInLast12Months:
            json["Avg EOD Balance in last 12 months"]?.toDouble(),
        noOfCreditTransactionsInLast3Months:
            json["No. of Credit Transactions in last 3 months"],
        noOfCreditTransactionsInLast6Months:
            json["No. of Credit Transactions in last 6 months"],
        noOfCreditTransactionsInLast12Months:
            json["No. of Credit Transactions in last 12 months"],
        amountOfCreditTransactionsInLast1Months:
            json["Amount of Credit Transactions in last 1 months"],
        amountOfCreditTransactionsInLast2Months:
            json["Amount of Credit Transactions in last 2 months"],
        amountOfCreditTransactionsInLast3Months:
            json["Amount of Credit Transactions in last 3 months"],
        amountOfCreditTransactionsInLast6Months:
            json["Amount of Credit Transactions in last 6 months"],
        amountOfCreditTransactionsInLast12Months:
            json["Amount of Credit Transactions in last 12 months"],
        totalNoOfBusinessCreditTransactionsInLast30Days:
            json["Total No. of Business Credit Transactions in last 30 days"],
        totalNoOfBusinessCreditTransactionsInLast180Days:
            json["Total No. of Business Credit Transactions in last 180 days"],
        totalAmountOfBusinessCreditTransactionsInLast30Days: json[
            "Total Amount of Business Credit Transactions in last 30 days"],
        totalAmountOfBusinessCreditTransactionsInLast180Days: json[
            "Total Amount of Business Credit Transactions in last 180 days"],
        totalNoOfBusinessCreditTransactions0M:
            json["Total No. of Business Credit Transactions 0M"],
        totalNoOfBusinessCreditTransactions1M:
            json["Total No. of Business Credit Transactions 1M"],
        totalNoOfBusinessCreditTransactions2M:
            json["Total No. of Business Credit Transactions 2M"],
        totalNoOfBusinessCreditTransactions3M:
            json["Total No. of Business Credit Transactions 3M"],
        totalNoOfBusinessCreditTransactions4M:
            json["Total No. of Business Credit Transactions 4M"],
        totalNoOfBusinessCreditTransactions5M:
            json["Total No. of Business Credit Transactions 5M"],
        totalNoOfBusinessCreditTransactions6M:
            json["Total No. of Business Credit Transactions 6M"],
        totalAmountOfBusinessCreditTransactions0M:
            json["Total Amount of Business Credit Transactions 0M"],
        totalAmountOfBusinessCreditTransactions1M:
            json["Total Amount of Business Credit Transactions 1M"],
        totalAmountOfBusinessCreditTransactions2M:
            json["Total Amount of Business Credit Transactions 2M"],
        totalAmountOfBusinessCreditTransactions3M:
            json["Total Amount of Business Credit Transactions 3M"],
        totalAmountOfBusinessCreditTransactions4M:
            json["Total Amount of Business Credit Transactions 4M"],
        totalAmountOfBusinessCreditTransactions5M:
            json["Total Amount of Business Credit Transactions 5M"],
        totalAmountOfBusinessCreditTransactions6M:
            json["Total Amount of Business Credit Transactions 6M"],
        noOfDebitTransactionsInLast3Months:
            json["No. of Debit Transactions in last 3 months"],
        noOfDebitTransactionsInLast6Months:
            json["No. of Debit Transactions in last 6 months"],
        noOfDebitTransactionsInLast12Months:
            json["No. of Debit Transactions in last 12 months"],
        amountOfDebitTransactionsInLast3Months:
            json["Amount of Debit Transactions in last 3 months"],
        amountOfDebitTransactionsInLast6Months:
            json["Amount of Debit Transactions in last 6 months"]?.toDouble(),
        amountOfDebitTransactionsInLast12Months:
            json["Amount of Debit Transactions in last 12 months"]?.toDouble(),
        avgSalaryCreditedInLast1Month:
            json["Avg Salary Credited in last 1 month"],
        avgSalaryCreditedInLast3Months:
            json["Avg Salary Credited in last 3 months"],
        avgSalaryCreditedInLast6Months:
            json["Avg Salary Credited in last 6 months"],
        totalLoanCreditedInLast1Month:
            json["Total Loan Credited in last 1 month"],
        totalLoanCreditedInLast3Months:
            json["Total Loan Credited in last 3 months"],
        totalLoanCreditedInLast6Months:
            json["Total Loan Credited in last 6 months"],
        totalLoanCreditedInLast12Months:
            json["Total Loan Credited in last 12 months"],
        totalNoOfEmiBouncesInLast1Month:
            json["Total No. of EMI bounces in last 1 month"],
        totalNoOfEmiBouncesInLast2Months:
            json["Total No. of EMI bounces in last 2 months"],
        totalNoOfEmiBouncesInLast3Months:
            json["Total No. of EMI bounces in last 3 months"],
        avgEodBalance1M: json["Avg EOD Balance 1M"]?.toDouble(),
        avgEodBalance2M: json["Avg EOD Balance 2M"]?.toDouble(),
        avgEodBalance3M: json["Avg EOD Balance 3M"],
        avgEodBalance4M: json["Avg EOD Balance 4M"]?.toDouble(),
        avgEodBalance5M: json["Avg EOD Balance 5M"]?.toDouble(),
        avgEodBalance6M: json["Avg EOD Balance 6M"],
        totalSalaryAmount1M: json["Total Salary Amount 1M"],
        totalSalaryAmount2M: json["Total Salary Amount 2M"],
        totalSalaryAmount3M: json["Total Salary Amount 3M"],
        totalSalaryAmount4M: json["Total Salary Amount 4M"],
        totalSalaryAmount5M: json["Total Salary Amount 5M"],
        totalSalaryAmount6M: json["Total Salary Amount 6M"],
        totalNumberOfCashDepositsRange910L:
            json["total number of cash deposits range 9 10l"],
        totalNumberOfCashDepositsRange1020K:
            json["total number of cash deposits range 10 20k"],
        totalNumberOfCashDepositsRange4050K:
            json["total number of cash deposits range 40 50k"],
        totalAmountOfNetCreditTransactions1M:
            json["Total Amount of Net Credit Transactions 1M"],
        totalAmountOfNetCreditTransactions2M:
            json["Total Amount of Net Credit Transactions 2M"],
        totalAmountOfNetCreditTransactions3M:
            json["Total Amount of Net Credit Transactions 3M"],
        totalAmountOfNetCreditTransactions4M:
            json["Total Amount of Net Credit Transactions 4M"],
        totalAmountOfNetCreditTransactions5M:
            json["Total Amount of Net Credit Transactions 5M"],
        totalAmountOfNetCreditTransactions6M:
            json["Total Amount of Net Credit Transactions 6M"],
        totalNoOfNetCreditTransactions1M:
            json["Total No. of Net Credit Transactions 1M"],
        totalNoOfNetCreditTransactions2M:
            json["Total No. of Net Credit Transactions 2M"],
        totalNoOfNetCreditTransactions3M:
            json["Total No. of Net Credit Transactions 3M"],
        totalNoOfNetCreditTransactions4M:
            json["Total No. of Net Credit Transactions 4M"],
        totalNoOfNetCreditTransactions5M:
            json["Total No. of Net Credit Transactions 5M"],
        totalNoOfNetCreditTransactions6M:
            json["Total No. of Net Credit Transactions 6M"],
        avgEodBalanceBelow5001M:
            json["Avg EOD Balance below 500 1M"]?.toDouble(),
        avgEodBalanceBelow5002M:
            json["Avg EOD Balance below 500 2M"]?.toDouble(),
        avgEodBalanceBelow5003M:
            json["Avg EOD Balance below 500 3M"]?.toDouble(),
        avgEodBalanceBelow5004M:
            json["Avg EOD Balance below 500 4M"]?.toDouble(),
        avgEodBalanceBelow5005M:
            json["Avg EOD Balance below 500 5M"]?.toDouble(),
        avgEodBalanceBelow5006M: json["Avg EOD Balance below 500 6M"],
        avgEodBalanceBelow10001M:
            json["Avg EOD Balance below 1000 1M"]?.toDouble(),
        avgEodBalanceBelow10002M:
            json["Avg EOD Balance below 1000 2M"]?.toDouble(),
        avgEodBalanceBelow10003M:
            json["Avg EOD Balance below 1000 3M"]?.toDouble(),
        avgEodBalanceBelow10004M:
            json["Avg EOD Balance below 1000 4M"]?.toDouble(),
        avgEodBalanceBelow10005M:
            json["Avg EOD Balance below 1000 5M"]?.toDouble(),
        avgEodBalanceBelow10006M: json["Avg EOD Balance below 1000 6M"],
        avgEodBalanceBelow20001M:
            json["Avg EOD Balance below 2000 1M"]?.toDouble(),
        avgEodBalanceBelow20002M:
            json["Avg EOD Balance below 2000 2M"]?.toDouble(),
        avgEodBalanceBelow20003M:
            json["Avg EOD Balance below 2000 3M"]?.toDouble(),
        avgEodBalanceBelow20004M:
            json["Avg EOD Balance below 2000 4M"]?.toDouble(),
        avgEodBalanceBelow20005M:
            json["Avg EOD Balance below 2000 5M"]?.toDouble(),
        avgEodBalanceBelow20006M: json["Avg EOD Balance below 2000 6M"],
        avgEodBalanceBelow50001M:
            json["Avg EOD Balance below 5000 1M"]?.toDouble(),
        avgEodBalanceBelow50002M:
            json["Avg EOD Balance below 5000 2M"]?.toDouble(),
        avgEodBalanceBelow50003M: json["Avg EOD Balance below 5000 3M"],
        avgEodBalanceBelow50004M:
            json["Avg EOD Balance below 5000 4M"]?.toDouble(),
        avgEodBalanceBelow50005M:
            json["Avg EOD Balance below 5000 5M"]?.toDouble(),
        avgEodBalanceBelow50006M: json["Avg EOD Balance below 5000 6M"],
        totalNoOfEmiBounces: json["Total No. of EMI Bounces"],
        totalAmountOfEmiBounces: json["Total Amount of EMI Bounces"],
        averageCreditLoanAmountInLast3Months:
            json["Average Credit Loan Amount in Last 3 Months"],
        averageCreditLoanAmountInLast6Months:
            json["Average Credit Loan Amount in Last 6 Months"],
        amountOfInvestmentIncomeLast3Months:
            json["Amount of Investment Income Last 3 Months"],
        amountOfInvestmentIncomeLast6Months:
            json["Amount of Investment Income Last 6 Months"],
        avgAmountOfInvestmentIncomeLast3Months:
            json["Avg Amount of Investment Income Last 3 Months"],
        avgAmountOfInvestmentIncomeLast6Months:
            json["Avg Amount of Investment Income Last 6 Months"],
        amountOfSalaryCreditedInLast3Months:
            json["Amount of Salary Credited in last 3 months"],
        amountOfSalaryCreditedLast6Months:
            json["Amount of Salary Credited Last 6 Months"],
        amountOfSalaryCreditedInLast1Month:
            json["Amount of Salary Credited in last 1 month"],
        amountOfSalaryCreditedLast12Months:
            json["Amount of Salary Credited Last 12 Months"],
        totalAmountOfSalaryCreditedInLast3Months:
            json["Total Amount of Salary Credited in Last 3 Months"],
        noOfSalaryCreditedInLast3Month:
            json["No. of Salary Credited in last 3 month"],
        noOfSalaryCreditedLast6Months:
            json["No. of  Salary Credited Last 6 Months"],
        noOfSalaryCreditedLast1Month:
            json["No. of  Salary Credited Last 1 Month"],
        noOfSalaryCreditedLast12Months:
            json["No. of  Salary Credited Last 12 Months"],
        minimumEodBalanceLast3Months:
            json["Minimum EOD Balance Last 3 Months"]?.toDouble(),
        minimumEodBalanceLast6Months: json["Minimum EOD Balance Last 6 Months"],
        maximumEodBalanceLast3Months:
            json["Maximum EOD Balance Last 3 Months"]?.toDouble(),
        maximumEodBalanceLast6Months:
            json["Maximum EOD Balance Last 6 Months"]?.toDouble(),
        noOfLoanCreditedLast1Month: json["No. of Loan Credited Last 1 Month"],
        noOfLoanCreditedLast3Months: json["No. of Loan Credited Last 3 Months"],
        noOfLoanCreditedLast6Months: json["No. of Loan Credited Last 6 Months"],
        noOfLoanCreditedLast12Months:
            json["No. of Loan Credited Last 12 Months"],
        debitAmountOfCreditCardLast1Month:
            json["Debit Amount of Credit Card Last 1 Month"],
        debitAmountOfCreditCardLast3Months:
            json["Debit Amount of Credit Card Last 3 Months"],
        debitAmountOfCreditCardLast6Months:
            json["Debit Amount of Credit Card Last 6 Months"],
        avgDebitAmountOfCreditCardLast3Months:
            json["Avg Debit Amount of Credit Card Last 3 Months"],
        avgDebitAmountOfCreditCardLast6Months:
            json["Avg Debit Amount of Credit Card Last 6 Months"],
        avgDebitAmountOfCreditCardLast12Months:
            json["Avg Debit Amount of Credit Card Last 12 Months"],
        amountOfCashDepositsLast3Months:
            json["Amount of Cash Deposits Last 3 Months"],
        amountOfCashDepositsLast6Months:
            json["Amount of Cash Deposits Last 6 Months"],
        amountOfCashDepositsLast12Months:
            json["Amount of Cash Deposits Last 12 Months"],
        noOfCreditCardPaymentLast1Month:
            json["No. of Credit Card Payment Last 1 Month"],
        noOfCreditCardPaymentLast3Months:
            json["No. of Credit Card Payment Last 3 Months"],
        noOfCreditCardPaymentLast6Months:
            json["No. of Credit Card Payment Last 6 Months"],
        debitCreditRatioForLast1Month:
            json["Debit/Credit Ratio for last 1 Month"]?.toDouble(),
        debitCreditRatioForLast3Month:
            json["Debit/Credit Ratio for last 3 Month"]?.toDouble(),
        debitCreditRatioForLast6Month:
            json["Debit/Credit Ratio for last 6 Month"]?.toDouble(),
        noOfIWChequeBounces1M: json["No. of I/W Cheque Bounces 1M"],
        noOfIWChequeBounces2M: json["No. of I/W Cheque Bounces 2M"],
        noOfIWChequeBounces3M: json["No. of I/W Cheque Bounces 3M"],
        noOfIWChequeBounces4M: json["No. of I/W Cheque Bounces 4M"],
        noOfIWChequeBounces5M: json["No. of I/W Cheque Bounces 5M"],
        noOfIWChequeBounces6M: json["No. of I/W Cheque Bounces 6M"],
        ratioOfAverageBalanceForLast1MTo3M:
            json["Ratio of Average Balance for last 1M to 3M"]?.toDouble(),
        amountOfCashWithdrawalLast3Months:
            json["Amount of Cash Withdrawal Last 3 Months"],
        amountOfCashWithdrawalLast6Months:
            json["Amount of Cash Withdrawal Last 6 Months"],
        amountOfCashWithdrawalLast12Months:
            json["Amount of Cash Withdrawal Last 12 Months"],
        noOfLoanEmiPaymentsLast1Month:
            json["No. of Loan(EMI) Payments Last 1 Month"],
        noOfLoanEmiPaymentsLast3Month:
            json["No. of Loan(EMI) Payments Last 3 Month"],
        amountOfLoanEmiPaymentsLast1Month:
            json["Amount of Loan(EMI) Payments Last 1 Month"],
        amountOfLoanEmiPaymentsLast3Month:
            json["Amount of Loan(EMI) Payments Last 3 Month"],
        totalNoOfMutualFunds: json["Total No. of Mutual Funds"],
        totalDebitAmountOfMutualFunds:
            json["Total Debit Amount of Mutual Funds"],
        totalNoOfInvestmentIncomeLast12Months:
            json["Total No. of Investment Income last 12 months"],
        totalAmountOfInvestmentIncomeLast12Months:
            json["Total Amount of Investment Income last 12 months"],
        totalExpenseOnCryptoCurrency: json["Total Expense on Crypto Currency"],
        totalExpenseOnShareMarket: json["Total Expense on Share Market"],
        standardDeviationOfBalanceLast1Month:
            json["Standard Deviation of Balance last 1 month"]?.toDouble(),
        standardDeviationOfBalanceLast6Months:
            json["Standard Deviation of Balance last 6 months"]?.toDouble(),
        standardDeviationOfBalanceLast3Months:
            json["Standard Deviation of Balance last 3 months"]?.toDouble(),
        coefficientOfVarianceOfBalanceLast1Month:
            json["Coefficient of Variance of Balance last 1 Month"]?.toDouble(),
        coefficientOfVarianceOfBalanceLast3Months:
            json["Coefficient of Variance of Balance last 3 Months"]
                ?.toDouble(),
        coefficientOfVarianceOfBalanceLast6Months:
            json["Coefficient of Variance of Balance last 6 Months"]
                ?.toDouble(),
        standardDeviationOfDebitAmount:
            json["Standard Deviation of Debit Amount"]?.toDouble(),
        standardDeviationOfCreditAmount:
            json["Standard Deviation of Credit Amount"]?.toDouble(),
        coefficientOfVariationOfDebitAmount:
            json["Coefficient of Variation of Debit Amount"]?.toDouble(),
        coefficientOfVarianceOfCreditAmount:
            json["Coefficient of Variance of Credit Amount"]?.toDouble(),
        medianEodBalanceLast1Month:
            json["Median Eod Balance last 1 month"]?.toDouble(),
        medianEodBalanceLast3Months:
            json["Median Eod Balance last 3 months"]?.toDouble(),
        medianEodBalanceLast6Months:
            json["Median Eod Balance last 6 months"]?.toDouble(),
        minBalanceLast1Month: json["Min Balance Last 1 month"]?.toDouble(),
        avgMinBalanceLast1Month:
            json["Avg Min Balance Last 1 month"]?.toDouble(),
        ratioOfCreditsAmountsIn30DaysTo60Days:
            json["Ratio of credits amounts in 30 days to 60 days"]?.toDouble(),
        ratioOfCreditsAmountsIn90DaysTo180Days:
            json["Ratio of credits amounts in 90 days to 180 days"],
        ratioOfCreditsAmountsIn60DaysTo90Days:
            json["Ratio of credits amounts in 60 days to 90 days"]?.toDouble(),
        loanDisbursalAmount1M: json["Loan Disbursal Amount 1M"],
        loanDisbursalAmount2M: json["Loan Disbursal Amount 2M"],
        loanDisbursalAmount3M: json["Loan Disbursal Amount 3M"],
        loanDisbursalAmount4M: json["Loan Disbursal Amount 4M"],
        loanDisbursalAmount5M: json["Loan Disbursal Amount 5M"],
        loanDisbursalAmount6M: json["Loan Disbursal Amount 6M"],
        totalNoOfGasBillPayments: json["Total No. of Gas Bill Payments"],
        totalAmountOfGasBillPayments: json["Total Amount of Gas Bill Payments"],
        totalNoOfElectricityBillPayments:
            json["Total No. of Electricity Bill Payments"],
        totalNoOfMobileBroadbandBillPayments:
            json["Total No. of Mobile & Broadband Bill Payments"],
        totalAmountOfMobileBroadbandBillPayments:
            json["Total Amount of Mobile & Broadband Bill Payments"],
        totalAmountOfElectricityBillPayments:
            json["Total Amount of Electricity Bill Payments"],
        totalNoOfDividend: json["Total No. of Dividend"],
        totalAmountOfDividend: json["Total Amount of Dividend"],
        noOfPennyDropTransactions: json["No. of Penny Drop transactions"],
        noOfPennyDropTransactionsInLast6Months:
            json["No. of Penny Drop transactions in last 6 months"],
        amountPaidTowardsInsurancePerYear:
            json["Amount Paid Towards Insurance per Year"],
        totalVeEventTransactionsInLast1Month:
            json["Total -ve event transactions in last 1 month"],
        totalVeEventTransactionsInLast3Months:
            json["Total -ve event transactions in last 3 months"],
        totalVeEventTransactionsInLast6Months:
            json["Total -ve event transactions in last 6 months"],
        totalAmountOfVeEventTransactionsInLast1Month:
            json["Total Amount of -ve event transactions in last 1 month"],
        totalAmountOfVeEventTransactionsInLast3Months:
            json["Total Amount of -ve event transactions in last 3 months"],
        totalAmountOfVeEventTransactionsInLast6Months:
            json["Total Amount of -ve event transactions in last 6 months"],
        salaryDates: json["Salary Dates"] == null
            ? []
            : List<dynamic>.from(json["Salary Dates"].map((x) => x)),
        amountOfCreditTransactionLast45Days:
            json["Amount of Credit Transaction Last 45 Days"],
        amountOfMoneyPaidTowardsMutualFundPerYear:
            json["Amount of money paid towards Mutual Fund per year"],
        averageVelocity: json["Average Velocity"]?.toDouble(),
        daysSinceLastNegativeDebitEvent:
            json["Days since last Negative Debit Event"],
        amountOfCreditInvestmentTransactionLast12Months:
            json["Amount of Credit Investment Transaction Last 12 Months"],
        businessIncome: json["Business Income"],
        businessIncomeInLast6Months: json["Business Income in last 6 months"],
        amountOfNonDiscretionarySpends:
            json["Amount of Non-Discretionary Spends"],
        immediateLoanShareMarketGamingPaymentAfterTakingCreditLine: json[
            "Immediate loan/share market/gaming payment after taking credit line"],
        oldestTransactionDate: json["Oldest Transaction Date"],
      );

  Map<String, dynamic> toJson() => {
        "Min Opening Balance": minOpeningBalance,
        "Max Opening Balance": maxOpeningBalance,
        "Min Balance": minBalance,
        "Median Balance": medianBalance,
        "Max Balance": maxBalance,
        "First Day EOD Balance": firstDayEodBalance,
        "Last Day EOD Balance": lastDayEodBalance,
        "Opening": opening,
        "Closing Balance": closingBalance,
        "Min EOD Balance": minEodBalance,
        "Max EOD Balance": maxEodBalance,
        "Median EOD Balance": medianEodBalance,
        "Total No of Salary Credits": totalNoOfSalaryCredits,
        "Total Amount of Salary Credits": totalAmountOfSalaryCredits,
        "Total No. of Credit Transactions": totalNoOfCreditTransactions,
        "Total Amount of Credit Transactions": totalAmountOfCreditTransactions,
        "Total No. of Business Credit Transactions":
            totalNoOfBusinessCreditTransactions,
        "Total Amount of Business Credit Transactions":
            totalAmountOfBusinessCreditTransactions,
        "Total No. of Debit Transactions": totalNoOfDebitTransactions,
        "Total Amount of Debit Transactions": totalAmountOfDebitTransactions,
        "Total No. of Cash Deposits": totalNoOfCashDeposits,
        "Total Amount of Cash Deposits": totalAmountOfCashDeposits,
        "Total No. of Cash Withdrawals": totalNoOfCashWithdrawals,
        "chqDeposits": chqDeposits,
        "Total No. of Cheque Deposits": totalNoOfChequeDeposits,
        "chqIssues": chqIssues,
        "Total No. of Cheque Issues": totalNoOfChequeIssues,
        "totalChqDeposits": totalChqDeposits,
        "Total Amount of Cheque Deposits": totalAmountOfChequeDeposits,
        "totalChqIssues": totalChqIssues,
        "Total Amount of Cheque Issues": totalAmountOfChequeIssues,
        "No. of EMI / loan payments": noOfEmiLoanPayments,
        "Total No. of EMI / loan payments": totalNoOfEmiLoanPayments,
        "Total No.of I / W Bounced": totalNoOfIWBounced,
        "Sum of I/W Bounced": sumOfIWBounced,
        "Total amount of I / W Bounced": totalAmountOfIWBounced,
        "Total Number of Outward Cheque Bounces":
            totalNumberOfOutwardChequeBounces,
        "No. of transactions in BS": noOfTransactionsInBs,
        "No. of transactions in BS in last 6 months":
            noOfTransactionsInBsInLast6Months,
        "Total amount of Gaming in last 6 months":
            totalAmountOfGamingInLast6Months,
        "totalLoanDisbursal": totalLoanDisbursal,
        "Total Amount of Loan Disbursal": totalAmountOfLoanDisbursal,
        "Loan Disbursal": loanDisbursal,
        "loanDisbursal": overallLoanDisbursal,
        "Total No. of Loan Disbursal": totalNoOfLoanDisbursal,
        "Total No. of I/W Chq Bounced": overallTotalNoOfIWChqBounced,
        "Total No. of I / W Chq Bounced": totalNoOfIWChqBounced,
        "inw_chq_bounce_nonTechnical": inwChqBounceNonTechnical,
        "Total No. of I / W Cheque Bounce Non Technical":
            totalNoOfIWChequeBounceNonTechnical,
        "total_inw_chq_bounce_nonTechnical": totalInwChqBounceNonTechnical,
        "Total Amount of I / W Cheque Bounce Non Technical":
            totalAmountOfIWChequeBounceNonTechnical,
        "salary_count": salaryCount,
        "startDate": overallStartDate,
        "Start Date": startDate,
        "Average EOD Balance": averageEodBalance,
        "Total No of Salary Credits 180 days": totalNoOfSalaryCredits180Days,
        "Recommended Date Range for NACH": recommendedDateRangeForNach,
        "ABB on 1 14 last day": abbOn114LastDay,
        "ABB on 1st,14th, 30th/Last Day": abbOn1St14Th30ThLastDay,
        "Total No. of Net Credit Transactions": totalNoOfNetCreditTransactions,
        "Total Net Credit Amount": totalNetCreditAmount,
        "Total No. of Net Debit Transactions": totalNoOfNetDebitTransactions,
        "Total Net Debit Amount": totalNetDebitAmount,
        "Total No. of CreditCard Payment": totalNoOfCreditCardPayment,
        "Total No. of Bills & Utilities": totalNoOfBillsUtilities,
        "Total No. of Food": totalNoOfFood,
        "Total No. of Alcohol": totalNoOfAlcohol,
        "Total No. of Travel": totalNoOfTravel,
        "Total No. of Entertainment & Lifestyle":
            totalNoOfEntertainmentLifestyle,
        "Total No. of Shopping & Purchase": totalNoOfShoppingPurchase,
        "Total No. of Investment Expense": totalNoOfInvestmentExpense,
        "Total No. of Gaming": totalNoOfGaming,
        "Total No. of Personal Loan": totalNoOfPersonalLoan,
        "Total No. of Home Loan": totalNoOfHomeLoan,
        "Total No. of Auto Loan ": totalNoOfAutoLoan,
        "Total No. of Insurance": totalNoOfInsurance,
        "Total No. of Tax Transaction Debit": totalNoOfTaxTransactionDebit,
        "Total No. of Transfer to Wallet Transaction":
            totalNoOfTransferToWalletTransaction,
        "Total No. of Reversal Transaction Debit":
            totalNoOfReversalTransactionDebit,
        "Total No. of Medical Transaction": totalNoOfMedicalTransaction,
        "Total No. of Charges Transaction": totalNoOfChargesTransaction,
        "Total No. of Below Minimum Balance Transaction":
            totalNoOfBelowMinimumBalanceTransaction,
        "Total No. of Salary Paid Transaction": totalNoOfSalaryPaidTransaction,
        "Total No. of Transfer Out Transaction":
            totalNoOfTransferOutTransaction,
        "Total No. of Foreign Wallet Transaction":
            totalNoOfForeignWalletTransaction,
        "Total No. of Other Category Debit Transaction":
            totalNoOfOtherCategoryDebitTransaction,
        "Total Amount of Bills & Utilities": totalAmountOfBillsUtilities,
        "Total Amount of Food": totalAmountOfFood,
        "Total Amount of Alcohol": totalAmountOfAlcohol,
        "Total Amount of Personal Loan": totalAmountOfPersonalLoan,
        "Total Amount of Home Loan": totalAmountOfHomeLoan,
        "Total Amount of Auto Loan ": totalAmountOfAutoLoan,
        "Total Amount of Travel": totalAmountOfTravel,
        "Total Amount of Entertainment & Lifestyle":
            totalAmountOfEntertainmentLifestyle,
        "Total Amount of Shopping & Purchase": totalAmountOfShoppingPurchase,
        "Total Amount of Investment Expense": totalAmountOfInvestmentExpense,
        "Total Amount of Insurance": totalAmountOfInsurance,
        "Total Amount of Tax Transaction Debit":
            totalAmountOfTaxTransactionDebit,
        "Total Amount of Gaming": totalAmountOfGaming,
        "Total Amount of Transfer to Wallet Transaction":
            totalAmountOfTransferToWalletTransaction,
        "Total Amount of Reversal Transaction Debit":
            totalAmountOfReversalTransactionDebit,
        "Total Amount of CreditCard Payment": totalAmountOfCreditCardPayment,
        "Total Amount of Cash Withdrawals": totalAmountOfCashWithdrawals,
        "Total Amount of Medical Transaction": totalAmountOfMedicalTransaction,
        "Total Amount of Charges Transaction": totalAmountOfChargesTransaction,
        "Total Amount of Below Minimum Balance Transaction":
            totalAmountOfBelowMinimumBalanceTransaction,
        "Total Amount of Salary Paid Transaction":
            totalAmountOfSalaryPaidTransaction,
        "Total Amount of Transfer Out Transaction":
            totalAmountOfTransferOutTransaction,
        "Total Amount of Foreign Wallet Transaction":
            totalAmountOfForeignWalletTransaction,
        "Total Amount of EMI / loan Payments": totalAmountOfEmiLoanPayments,
        "Total Amount of Other Category Debit Transaction":
            totalAmountOfOtherCategoryDebitTransaction,
        "Percent of Cash Deposit out of total Credit in Amount":
            percentOfCashDepositOutOfTotalCreditInAmount,
        "Percent of Cash Deposit out of total Credit in Number":
            percentOfCashDepositOutOfTotalCreditInNumber,
        "Total No. of numerest Received": totalNoOfnumerestReceived,
        "Total Amount of numerest Received": totalAmountOfnumerestReceived,
        "Total No. of Cheque Return Charges": totalNoOfChequeReturnCharges,
        "Total No. of Technical Cheque Bounces":
            totalNoOfTechnicalChequeBounces,
        "Total No. of ATM Withdrawals above 2000":
            totalNoOfAtmWithdrawalsAbove2000,
        "Total ECS Nach Number": totalEcsNachNumber,
        "Total ECS Nach Amount": totalEcsNachAmount,
        "Total No. of Debit numernal Transfer": totalNoOfDebitnumernalTransfer,
        "Total Amount of Debit numernal Transfer":
            totalAmountOfDebitnumernalTransfer,
        "Total No. of Credit numernal Transfer":
            totalNoOfCreditnumernalTransfer,
        "Total Amount of Credit numernal Transfer":
            totalAmountOfCreditnumernalTransfer,
        "Total no. of expense transactions": totalNoOfExpenseTransactions,
        "Total No. of Holiday Transactions": totalNoOfHolidayTransactions,
        "Total Amount of Holiday Transactions":
            totalAmountOfHolidayTransactions,
        "Total No of Bounced O/W Payment": totalNoOfBouncedOWPayment,
        "Total Amount of Bounced O/W Payment": totalAmountOfBouncedOWPayment,
        "Total No of Payment Bounce Charges": totalNoOfPaymentBounceCharges,
        "Total Amount of Payment Bounce Charges":
            totalAmountOfPaymentBounceCharges,
        "Total No of numerest Paid": totalNoOfnumerestPaid,
        "Total Amount of numerest Paid": totalAmountOfnumerestPaid,
        "Total No of DD Cancel": totalNoOfDdCancel,
        "Total Amount of DD Cancel": totalAmountOfDdCancel,
        "Total No of DD Issue": totalNoOfDdIssue,
        "Total Amount of DD Issue": totalAmountOfDdIssue,
        "Average Credit amount last 1 months": averageCreditAmountLast1Months,
        "Average Credit amount last 2 months": averageCreditAmountLast2Months,
        "Average Credit amount last 3 months": averageCreditAmountLast3Months,
        "Average Credit amount last 6 months": averageCreditAmountLast6Months,
        "Employment Type": employmentType,
        "Salary Flag": salaryFlag,
        "Avg EOD Balance last 3 months": avgEodBalanceLast3Months,
        "Avg EOD Balance in last 6 months": avgEodBalanceInLast6Months,
        "Avg EOD Balance in last 12 months": avgEodBalanceInLast12Months,
        "No. of Credit Transactions in last 3 months":
            noOfCreditTransactionsInLast3Months,
        "No. of Credit Transactions in last 6 months":
            noOfCreditTransactionsInLast6Months,
        "No. of Credit Transactions in last 12 months":
            noOfCreditTransactionsInLast12Months,
        "Amount of Credit Transactions in last 1 months":
            amountOfCreditTransactionsInLast1Months,
        "Amount of Credit Transactions in last 2 months":
            amountOfCreditTransactionsInLast2Months,
        "Amount of Credit Transactions in last 3 months":
            amountOfCreditTransactionsInLast3Months,
        "Amount of Credit Transactions in last 6 months":
            amountOfCreditTransactionsInLast6Months,
        "Amount of Credit Transactions in last 12 months":
            amountOfCreditTransactionsInLast12Months,
        "Total No. of Business Credit Transactions in last 30 days":
            totalNoOfBusinessCreditTransactionsInLast30Days,
        "Total No. of Business Credit Transactions in last 180 days":
            totalNoOfBusinessCreditTransactionsInLast180Days,
        "Total Amount of Business Credit Transactions in last 30 days":
            totalAmountOfBusinessCreditTransactionsInLast30Days,
        "Total Amount of Business Credit Transactions in last 180 days":
            totalAmountOfBusinessCreditTransactionsInLast180Days,
        "Total No. of Business Credit Transactions 0M":
            totalNoOfBusinessCreditTransactions0M,
        "Total No. of Business Credit Transactions 1M":
            totalNoOfBusinessCreditTransactions1M,
        "Total No. of Business Credit Transactions 2M":
            totalNoOfBusinessCreditTransactions2M,
        "Total No. of Business Credit Transactions 3M":
            totalNoOfBusinessCreditTransactions3M,
        "Total No. of Business Credit Transactions 4M":
            totalNoOfBusinessCreditTransactions4M,
        "Total No. of Business Credit Transactions 5M":
            totalNoOfBusinessCreditTransactions5M,
        "Total No. of Business Credit Transactions 6M":
            totalNoOfBusinessCreditTransactions6M,
        "Total Amount of Business Credit Transactions 0M":
            totalAmountOfBusinessCreditTransactions0M,
        "Total Amount of Business Credit Transactions 1M":
            totalAmountOfBusinessCreditTransactions1M,
        "Total Amount of Business Credit Transactions 2M":
            totalAmountOfBusinessCreditTransactions2M,
        "Total Amount of Business Credit Transactions 3M":
            totalAmountOfBusinessCreditTransactions3M,
        "Total Amount of Business Credit Transactions 4M":
            totalAmountOfBusinessCreditTransactions4M,
        "Total Amount of Business Credit Transactions 5M":
            totalAmountOfBusinessCreditTransactions5M,
        "Total Amount of Business Credit Transactions 6M":
            totalAmountOfBusinessCreditTransactions6M,
        "No. of Debit Transactions in last 3 months":
            noOfDebitTransactionsInLast3Months,
        "No. of Debit Transactions in last 6 months":
            noOfDebitTransactionsInLast6Months,
        "No. of Debit Transactions in last 12 months":
            noOfDebitTransactionsInLast12Months,
        "Amount of Debit Transactions in last 3 months":
            amountOfDebitTransactionsInLast3Months,
        "Amount of Debit Transactions in last 6 months":
            amountOfDebitTransactionsInLast6Months,
        "Amount of Debit Transactions in last 12 months":
            amountOfDebitTransactionsInLast12Months,
        "Avg Salary Credited in last 1 month": avgSalaryCreditedInLast1Month,
        "Avg Salary Credited in last 3 months": avgSalaryCreditedInLast3Months,
        "Avg Salary Credited in last 6 months": avgSalaryCreditedInLast6Months,
        "Total Loan Credited in last 1 month": totalLoanCreditedInLast1Month,
        "Total Loan Credited in last 3 months": totalLoanCreditedInLast3Months,
        "Total Loan Credited in last 6 months": totalLoanCreditedInLast6Months,
        "Total Loan Credited in last 12 months":
            totalLoanCreditedInLast12Months,
        "Total No. of EMI bounces in last 1 month":
            totalNoOfEmiBouncesInLast1Month,
        "Total No. of EMI bounces in last 2 months":
            totalNoOfEmiBouncesInLast2Months,
        "Total No. of EMI bounces in last 3 months":
            totalNoOfEmiBouncesInLast3Months,
        "Avg EOD Balance 1M": avgEodBalance1M,
        "Avg EOD Balance 2M": avgEodBalance2M,
        "Avg EOD Balance 3M": avgEodBalance3M,
        "Avg EOD Balance 4M": avgEodBalance4M,
        "Avg EOD Balance 5M": avgEodBalance5M,
        "Avg EOD Balance 6M": avgEodBalance6M,
        "Total Salary Amount 1M": totalSalaryAmount1M,
        "Total Salary Amount 2M": totalSalaryAmount2M,
        "Total Salary Amount 3M": totalSalaryAmount3M,
        "Total Salary Amount 4M": totalSalaryAmount4M,
        "Total Salary Amount 5M": totalSalaryAmount5M,
        "Total Salary Amount 6M": totalSalaryAmount6M,
        "total number of cash deposits range 9 10l":
            totalNumberOfCashDepositsRange910L,
        "total number of cash deposits range 10 20k":
            totalNumberOfCashDepositsRange1020K,
        "total number of cash deposits range 40 50k":
            totalNumberOfCashDepositsRange4050K,
        "Total Amount of Net Credit Transactions 1M":
            totalAmountOfNetCreditTransactions1M,
        "Total Amount of Net Credit Transactions 2M":
            totalAmountOfNetCreditTransactions2M,
        "Total Amount of Net Credit Transactions 3M":
            totalAmountOfNetCreditTransactions3M,
        "Total Amount of Net Credit Transactions 4M":
            totalAmountOfNetCreditTransactions4M,
        "Total Amount of Net Credit Transactions 5M":
            totalAmountOfNetCreditTransactions5M,
        "Total Amount of Net Credit Transactions 6M":
            totalAmountOfNetCreditTransactions6M,
        "Total No. of Net Credit Transactions 1M":
            totalNoOfNetCreditTransactions1M,
        "Total No. of Net Credit Transactions 2M":
            totalNoOfNetCreditTransactions2M,
        "Total No. of Net Credit Transactions 3M":
            totalNoOfNetCreditTransactions3M,
        "Total No. of Net Credit Transactions 4M":
            totalNoOfNetCreditTransactions4M,
        "Total No. of Net Credit Transactions 5M":
            totalNoOfNetCreditTransactions5M,
        "Total No. of Net Credit Transactions 6M":
            totalNoOfNetCreditTransactions6M,
        "Avg EOD Balance below 500 1M": avgEodBalanceBelow5001M,
        "Avg EOD Balance below 500 2M": avgEodBalanceBelow5002M,
        "Avg EOD Balance below 500 3M": avgEodBalanceBelow5003M,
        "Avg EOD Balance below 500 4M": avgEodBalanceBelow5004M,
        "Avg EOD Balance below 500 5M": avgEodBalanceBelow5005M,
        "Avg EOD Balance below 500 6M": avgEodBalanceBelow5006M,
        "Avg EOD Balance below 1000 1M": avgEodBalanceBelow10001M,
        "Avg EOD Balance below 1000 2M": avgEodBalanceBelow10002M,
        "Avg EOD Balance below 1000 3M": avgEodBalanceBelow10003M,
        "Avg EOD Balance below 1000 4M": avgEodBalanceBelow10004M,
        "Avg EOD Balance below 1000 5M": avgEodBalanceBelow10005M,
        "Avg EOD Balance below 1000 6M": avgEodBalanceBelow10006M,
        "Avg EOD Balance below 2000 1M": avgEodBalanceBelow20001M,
        "Avg EOD Balance below 2000 2M": avgEodBalanceBelow20002M,
        "Avg EOD Balance below 2000 3M": avgEodBalanceBelow20003M,
        "Avg EOD Balance below 2000 4M": avgEodBalanceBelow20004M,
        "Avg EOD Balance below 2000 5M": avgEodBalanceBelow20005M,
        "Avg EOD Balance below 2000 6M": avgEodBalanceBelow20006M,
        "Avg EOD Balance below 5000 1M": avgEodBalanceBelow50001M,
        "Avg EOD Balance below 5000 2M": avgEodBalanceBelow50002M,
        "Avg EOD Balance below 5000 3M": avgEodBalanceBelow50003M,
        "Avg EOD Balance below 5000 4M": avgEodBalanceBelow50004M,
        "Avg EOD Balance below 5000 5M": avgEodBalanceBelow50005M,
        "Avg EOD Balance below 5000 6M": avgEodBalanceBelow50006M,
        "Total No. of EMI Bounces": totalNoOfEmiBounces,
        "Total Amount of EMI Bounces": totalAmountOfEmiBounces,
        "Average Credit Loan Amount in Last 3 Months":
            averageCreditLoanAmountInLast3Months,
        "Average Credit Loan Amount in Last 6 Months":
            averageCreditLoanAmountInLast6Months,
        "Amount of Investment Income Last 3 Months":
            amountOfInvestmentIncomeLast3Months,
        "Amount of Investment Income Last 6 Months":
            amountOfInvestmentIncomeLast6Months,
        "Avg Amount of Investment Income Last 3 Months":
            avgAmountOfInvestmentIncomeLast3Months,
        "Avg Amount of Investment Income Last 6 Months":
            avgAmountOfInvestmentIncomeLast6Months,
        "Amount of Salary Credited in last 3 months":
            amountOfSalaryCreditedInLast3Months,
        "Amount of Salary Credited Last 6 Months":
            amountOfSalaryCreditedLast6Months,
        "Amount of Salary Credited in last 1 month":
            amountOfSalaryCreditedInLast1Month,
        "Amount of Salary Credited Last 12 Months":
            amountOfSalaryCreditedLast12Months,
        "Total Amount of Salary Credited in Last 3 Months":
            totalAmountOfSalaryCreditedInLast3Months,
        "No. of Salary Credited in last 3 month":
            noOfSalaryCreditedInLast3Month,
        "No. of  Salary Credited Last 6 Months": noOfSalaryCreditedLast6Months,
        "No. of  Salary Credited Last 1 Month": noOfSalaryCreditedLast1Month,
        "No. of  Salary Credited Last 12 Months":
            noOfSalaryCreditedLast12Months,
        "Minimum EOD Balance Last 3 Months": minimumEodBalanceLast3Months,
        "Minimum EOD Balance Last 6 Months": minimumEodBalanceLast6Months,
        "Maximum EOD Balance Last 3 Months": maximumEodBalanceLast3Months,
        "Maximum EOD Balance Last 6 Months": maximumEodBalanceLast6Months,
        "No. of Loan Credited Last 1 Month": noOfLoanCreditedLast1Month,
        "No. of Loan Credited Last 3 Months": noOfLoanCreditedLast3Months,
        "No. of Loan Credited Last 6 Months": noOfLoanCreditedLast6Months,
        "No. of Loan Credited Last 12 Months": noOfLoanCreditedLast12Months,
        "Debit Amount of Credit Card Last 1 Month":
            debitAmountOfCreditCardLast1Month,
        "Debit Amount of Credit Card Last 3 Months":
            debitAmountOfCreditCardLast3Months,
        "Debit Amount of Credit Card Last 6 Months":
            debitAmountOfCreditCardLast6Months,
        "Avg Debit Amount of Credit Card Last 3 Months":
            avgDebitAmountOfCreditCardLast3Months,
        "Avg Debit Amount of Credit Card Last 6 Months":
            avgDebitAmountOfCreditCardLast6Months,
        "Avg Debit Amount of Credit Card Last 12 Months":
            avgDebitAmountOfCreditCardLast12Months,
        "Amount of Cash Deposits Last 3 Months":
            amountOfCashDepositsLast3Months,
        "Amount of Cash Deposits Last 6 Months":
            amountOfCashDepositsLast6Months,
        "Amount of Cash Deposits Last 12 Months":
            amountOfCashDepositsLast12Months,
        "No. of Credit Card Payment Last 1 Month":
            noOfCreditCardPaymentLast1Month,
        "No. of Credit Card Payment Last 3 Months":
            noOfCreditCardPaymentLast3Months,
        "No. of Credit Card Payment Last 6 Months":
            noOfCreditCardPaymentLast6Months,
        "Debit/Credit Ratio for last 1 Month": debitCreditRatioForLast1Month,
        "Debit/Credit Ratio for last 3 Month": debitCreditRatioForLast3Month,
        "Debit/Credit Ratio for last 6 Month": debitCreditRatioForLast6Month,
        "No. of I/W Cheque Bounces 1M": noOfIWChequeBounces1M,
        "No. of I/W Cheque Bounces 2M": noOfIWChequeBounces2M,
        "No. of I/W Cheque Bounces 3M": noOfIWChequeBounces3M,
        "No. of I/W Cheque Bounces 4M": noOfIWChequeBounces4M,
        "No. of I/W Cheque Bounces 5M": noOfIWChequeBounces5M,
        "No. of I/W Cheque Bounces 6M": noOfIWChequeBounces6M,
        "Ratio of Average Balance for last 1M to 3M":
            ratioOfAverageBalanceForLast1MTo3M,
        "Amount of Cash Withdrawal Last 3 Months":
            amountOfCashWithdrawalLast3Months,
        "Amount of Cash Withdrawal Last 6 Months":
            amountOfCashWithdrawalLast6Months,
        "Amount of Cash Withdrawal Last 12 Months":
            amountOfCashWithdrawalLast12Months,
        "No. of Loan(EMI) Payments Last 1 Month": noOfLoanEmiPaymentsLast1Month,
        "No. of Loan(EMI) Payments Last 3 Month": noOfLoanEmiPaymentsLast3Month,
        "Amount of Loan(EMI) Payments Last 1 Month":
            amountOfLoanEmiPaymentsLast1Month,
        "Amount of Loan(EMI) Payments Last 3 Month":
            amountOfLoanEmiPaymentsLast3Month,
        "Total No. of Mutual Funds": totalNoOfMutualFunds,
        "Total Debit Amount of Mutual Funds": totalDebitAmountOfMutualFunds,
        "Total No. of Investment Income last 12 months":
            totalNoOfInvestmentIncomeLast12Months,
        "Total Amount of Investment Income last 12 months":
            totalAmountOfInvestmentIncomeLast12Months,
        "Total Expense on Crypto Currency": totalExpenseOnCryptoCurrency,
        "Total Expense on Share Market": totalExpenseOnShareMarket,
        "Standard Deviation of Balance last 1 month":
            standardDeviationOfBalanceLast1Month,
        "Standard Deviation of Balance last 6 months":
            standardDeviationOfBalanceLast6Months,
        "Standard Deviation of Balance last 3 months":
            standardDeviationOfBalanceLast3Months,
        "Coefficient of Variance of Balance last 1 Month":
            coefficientOfVarianceOfBalanceLast1Month,
        "Coefficient of Variance of Balance last 3 Months":
            coefficientOfVarianceOfBalanceLast3Months,
        "Coefficient of Variance of Balance last 6 Months":
            coefficientOfVarianceOfBalanceLast6Months,
        "Standard Deviation of Debit Amount": standardDeviationOfDebitAmount,
        "Standard Deviation of Credit Amount": standardDeviationOfCreditAmount,
        "Coefficient of Variation of Debit Amount":
            coefficientOfVariationOfDebitAmount,
        "Coefficient of Variance of Credit Amount":
            coefficientOfVarianceOfCreditAmount,
        "Median Eod Balance last 1 month": medianEodBalanceLast1Month,
        "Median Eod Balance last 3 months": medianEodBalanceLast3Months,
        "Median Eod Balance last 6 months": medianEodBalanceLast6Months,
        "Min Balance Last 1 month": minBalanceLast1Month,
        "Avg Min Balance Last 1 month": avgMinBalanceLast1Month,
        "Ratio of credits amounts in 30 days to 60 days":
            ratioOfCreditsAmountsIn30DaysTo60Days,
        "Ratio of credits amounts in 90 days to 180 days":
            ratioOfCreditsAmountsIn90DaysTo180Days,
        "Ratio of credits amounts in 60 days to 90 days":
            ratioOfCreditsAmountsIn60DaysTo90Days,
        "Loan Disbursal Amount 1M": loanDisbursalAmount1M,
        "Loan Disbursal Amount 2M": loanDisbursalAmount2M,
        "Loan Disbursal Amount 3M": loanDisbursalAmount3M,
        "Loan Disbursal Amount 4M": loanDisbursalAmount4M,
        "Loan Disbursal Amount 5M": loanDisbursalAmount5M,
        "Loan Disbursal Amount 6M": loanDisbursalAmount6M,
        "Total No. of Gas Bill Payments": totalNoOfGasBillPayments,
        "Total Amount of Gas Bill Payments": totalAmountOfGasBillPayments,
        "Total No. of Electricity Bill Payments":
            totalNoOfElectricityBillPayments,
        "Total No. of Mobile & Broadband Bill Payments":
            totalNoOfMobileBroadbandBillPayments,
        "Total Amount of Mobile & Broadband Bill Payments":
            totalAmountOfMobileBroadbandBillPayments,
        "Total Amount of Electricity Bill Payments":
            totalAmountOfElectricityBillPayments,
        "Total No. of Dividend": totalNoOfDividend,
        "Total Amount of Dividend": totalAmountOfDividend,
        "No. of Penny Drop transactions": noOfPennyDropTransactions,
        "No. of Penny Drop transactions in last 6 months":
            noOfPennyDropTransactionsInLast6Months,
        "Amount Paid Towards Insurance per Year":
            amountPaidTowardsInsurancePerYear,
        "Total -ve event transactions in last 1 month":
            totalVeEventTransactionsInLast1Month,
        "Total -ve event transactions in last 3 months":
            totalVeEventTransactionsInLast3Months,
        "Total -ve event transactions in last 6 months":
            totalVeEventTransactionsInLast6Months,
        "Total Amount of -ve event transactions in last 1 month":
            totalAmountOfVeEventTransactionsInLast1Month,
        "Total Amount of -ve event transactions in last 3 months":
            totalAmountOfVeEventTransactionsInLast3Months,
        "Total Amount of -ve event transactions in last 6 months":
            totalAmountOfVeEventTransactionsInLast6Months,
        "Salary Dates": salaryDates == null
            ? []
            : List<dynamic>.from(salaryDates!.map((x) => x)),
        "Amount of Credit Transaction Last 45 Days":
            amountOfCreditTransactionLast45Days,
        "Amount of money paid towards Mutual Fund per year":
            amountOfMoneyPaidTowardsMutualFundPerYear,
        "Average Velocity": averageVelocity,
        "Days since last Negative Debit Event": daysSinceLastNegativeDebitEvent,
        "Amount of Credit Investment Transaction Last 12 Months":
            amountOfCreditInvestmentTransactionLast12Months,
        "Business Income": businessIncome,
        "Business Income in last 6 months": businessIncomeInLast6Months,
        "Amount of Non-Discretionary Spends": amountOfNonDiscretionarySpends,
        "Immediate loan/share market/gaming payment after taking credit line":
            immediateLoanShareMarketGamingPaymentAfterTakingCreditLine,
        "Oldest Transaction Date": oldestTransactionDate,
      };
}

class OverallMax {
  double? minOpeningBalance;
  double? maxOpeningBalance;
  double? minBalance;
  String? medianBalance;
  double? maxBalance;
  String? firstDayEodBalance;
  String? lastDayEodBalance;
  String? opening;
  String? closingBalance;
  double? minEodBalance;
  double? maxEodBalance;
  double? medianEodBalance;
  num? totalNoOfSalaryCredits;
  num? totalAmountOfSalaryCredits;
  double? totalNoOfCreditTransactions;
  double? totalAmountOfCreditTransactions;
  double? totalNoOfBusinessCreditTransactions;
  double? totalAmountOfBusinessCreditTransactions;
  double? totalNoOfDebitTransactions;
  double? totalAmountOfDebitTransactions;
  num? totalNoOfCashDeposits;
  num? totalAmountOfCashDeposits;
  num? totalNoOfCashWithdrawals;
  num? chqDeposits;
  num? totalNoOfChequeDeposits;
  num? chqIssues;
  num? totalNoOfChequeIssues;
  num? totalChqDeposits;
  num? totalAmountOfChequeDeposits;
  num? totalChqIssues;
  num? totalAmountOfChequeIssues;
  num? noOfEmiLoanPayments;
  num? totalNoOfEmiLoanPayments;
  num? totalNoOfIWBounced;
  num? sumOfIWBounced;
  num? totalAmountOfIWBounced;
  num? totalNumberOfOutwardChequeBounces;
  double? noOfTransactionsInBs;
  num? totalLoanDisbursal;
  num? totalAmountOfLoanDisbursal;
  num? loanDisbursal;
  num? overallMaxLoanDisbursal;
  num? totalNoOfLoanDisbursal;
  num? overallMaxTotalNoOfIWChqBounced;
  num? totalNoOfIWChqBounced;
  num? inwChqBounceNonTechnical;
  num? totalNoOfIWChequeBounceNonTechnical;
  num? totalInwChqBounceNonTechnical;
  num? totalAmountOfIWChequeBounceNonTechnical;
  num? salaryCount;
  String? overallMaxStartDate;
  String? startDate;
  double? averageEodBalance;
  String? abbOn114LastDay;
  String? abbOn1St14Th30ThLastDay;
  double? totalNoOfNetCreditTransactions;
  double? totalNetCreditAmount;
  double? totalNoOfNetDebitTransactions;
  double? totalNetDebitAmount;
  num? totalNoOfCreditCardPayment;
  num? totalNoOfBillsUtilities;
  num? totalNoOfFood;
  num? totalNoOfAlcohol;
  num? totalNoOfTravel;
  num? totalNoOfEntertainmentLifestyle;
  num? totalNoOfShoppingPurchase;
  num? totalNoOfInvestmentExpense;
  num? totalNoOfGaming;
  num? totalNoOfPersonalLoan;
  num? totalNoOfHomeLoan;
  num? totalNoOfAutoLoan;
  num? totalNoOfInsurance;
  num? totalNoOfTaxTransactionDebit;
  num? totalNoOfTransferToWalletTransaction;
  num? totalNoOfReversalTransactionDebit;
  num? totalNoOfMedicalTransaction;
  num? totalNoOfChargesTransaction;
  num? totalNoOfBelowMinimumBalanceTransaction;
  num? totalNoOfSalaryPaidTransaction;
  double? totalNoOfTransferOutTransaction;
  num? totalNoOfForeignWalletTransaction;
  num? totalNoOfOtherCategoryDebitTransaction;
  num? totalAmountOfBillsUtilities;
  num? totalAmountOfFood;
  num? totalAmountOfAlcohol;
  num? totalAmountOfPersonalLoan;
  num? totalAmountOfHomeLoan;
  num? totalAmountOfAutoLoan;
  num? totalAmountOfTravel;
  num? totalAmountOfEntertainmentLifestyle;
  num? totalAmountOfShoppingPurchase;
  num? totalAmountOfInvestmentExpense;
  num? totalAmountOfInsurance;
  num? totalAmountOfTaxTransactionDebit;
  num? totalAmountOfGaming;
  num? totalAmountOfTransferToWalletTransaction;
  num? totalAmountOfReversalTransactionDebit;
  num? totalAmountOfCreditCardPayment;
  num? totalAmountOfCashWithdrawals;
  num? totalAmountOfMedicalTransaction;
  num? totalAmountOfChargesTransaction;
  num? totalAmountOfBelowMinimumBalanceTransaction;
  num? totalAmountOfSalaryPaidTransaction;
  double? totalAmountOfTransferOutTransaction;
  num? totalAmountOfForeignWalletTransaction;
  num? totalAmountOfEmiLoanPayments;
  num? totalAmountOfOtherCategoryDebitTransaction;
  String? totalNoOfMutualFunds;
  String? totalDebitAmountOfMutualFunds;
  String? totalExpenseOnCryptoCurrency;
  String? totalExpenseOnShareMarket;
  String? totalNoOfGasBillPayments;
  String? totalAmountOfGasBillPayments;
  String? totalNoOfElectricityBillPayments;
  String? totalNoOfMobileBroadbandBillPayments;
  String? totalAmountOfMobileBroadbandBillPayments;
  String? totalAmountOfElectricityBillPayments;
  String? totalNoOfDividend;
  String? totalAmountOfDividend;

  OverallMax({
    this.minOpeningBalance,
    this.maxOpeningBalance,
    this.minBalance,
    this.medianBalance,
    this.maxBalance,
    this.firstDayEodBalance,
    this.lastDayEodBalance,
    this.opening,
    this.closingBalance,
    this.minEodBalance,
    this.maxEodBalance,
    this.medianEodBalance,
    this.totalNoOfSalaryCredits,
    this.totalAmountOfSalaryCredits,
    this.totalNoOfCreditTransactions,
    this.totalAmountOfCreditTransactions,
    this.totalNoOfBusinessCreditTransactions,
    this.totalAmountOfBusinessCreditTransactions,
    this.totalNoOfDebitTransactions,
    this.totalAmountOfDebitTransactions,
    this.totalNoOfCashDeposits,
    this.totalAmountOfCashDeposits,
    this.totalNoOfCashWithdrawals,
    this.chqDeposits,
    this.totalNoOfChequeDeposits,
    this.chqIssues,
    this.totalNoOfChequeIssues,
    this.totalChqDeposits,
    this.totalAmountOfChequeDeposits,
    this.totalChqIssues,
    this.totalAmountOfChequeIssues,
    this.noOfEmiLoanPayments,
    this.totalNoOfEmiLoanPayments,
    this.totalNoOfIWBounced,
    this.sumOfIWBounced,
    this.totalAmountOfIWBounced,
    this.totalNumberOfOutwardChequeBounces,
    this.noOfTransactionsInBs,
    this.totalLoanDisbursal,
    this.totalAmountOfLoanDisbursal,
    this.loanDisbursal,
    this.overallMaxLoanDisbursal,
    this.totalNoOfLoanDisbursal,
    this.overallMaxTotalNoOfIWChqBounced,
    this.totalNoOfIWChqBounced,
    this.inwChqBounceNonTechnical,
    this.totalNoOfIWChequeBounceNonTechnical,
    this.totalInwChqBounceNonTechnical,
    this.totalAmountOfIWChequeBounceNonTechnical,
    this.salaryCount,
    this.overallMaxStartDate,
    this.startDate,
    this.averageEodBalance,
    this.abbOn114LastDay,
    this.abbOn1St14Th30ThLastDay,
    this.totalNoOfNetCreditTransactions,
    this.totalNetCreditAmount,
    this.totalNoOfNetDebitTransactions,
    this.totalNetDebitAmount,
    this.totalNoOfCreditCardPayment,
    this.totalNoOfBillsUtilities,
    this.totalNoOfFood,
    this.totalNoOfAlcohol,
    this.totalNoOfTravel,
    this.totalNoOfEntertainmentLifestyle,
    this.totalNoOfShoppingPurchase,
    this.totalNoOfInvestmentExpense,
    this.totalNoOfGaming,
    this.totalNoOfPersonalLoan,
    this.totalNoOfHomeLoan,
    this.totalNoOfAutoLoan,
    this.totalNoOfInsurance,
    this.totalNoOfTaxTransactionDebit,
    this.totalNoOfTransferToWalletTransaction,
    this.totalNoOfReversalTransactionDebit,
    this.totalNoOfMedicalTransaction,
    this.totalNoOfChargesTransaction,
    this.totalNoOfBelowMinimumBalanceTransaction,
    this.totalNoOfSalaryPaidTransaction,
    this.totalNoOfTransferOutTransaction,
    this.totalNoOfForeignWalletTransaction,
    this.totalNoOfOtherCategoryDebitTransaction,
    this.totalAmountOfBillsUtilities,
    this.totalAmountOfFood,
    this.totalAmountOfAlcohol,
    this.totalAmountOfPersonalLoan,
    this.totalAmountOfHomeLoan,
    this.totalAmountOfAutoLoan,
    this.totalAmountOfTravel,
    this.totalAmountOfEntertainmentLifestyle,
    this.totalAmountOfShoppingPurchase,
    this.totalAmountOfInvestmentExpense,
    this.totalAmountOfInsurance,
    this.totalAmountOfTaxTransactionDebit,
    this.totalAmountOfGaming,
    this.totalAmountOfTransferToWalletTransaction,
    this.totalAmountOfReversalTransactionDebit,
    this.totalAmountOfCreditCardPayment,
    this.totalAmountOfCashWithdrawals,
    this.totalAmountOfMedicalTransaction,
    this.totalAmountOfChargesTransaction,
    this.totalAmountOfBelowMinimumBalanceTransaction,
    this.totalAmountOfSalaryPaidTransaction,
    this.totalAmountOfTransferOutTransaction,
    this.totalAmountOfForeignWalletTransaction,
    this.totalAmountOfEmiLoanPayments,
    this.totalAmountOfOtherCategoryDebitTransaction,
    this.totalNoOfMutualFunds,
    this.totalDebitAmountOfMutualFunds,
    this.totalExpenseOnCryptoCurrency,
    this.totalExpenseOnShareMarket,
    this.totalNoOfGasBillPayments,
    this.totalAmountOfGasBillPayments,
    this.totalNoOfElectricityBillPayments,
    this.totalNoOfMobileBroadbandBillPayments,
    this.totalAmountOfMobileBroadbandBillPayments,
    this.totalAmountOfElectricityBillPayments,
    this.totalNoOfDividend,
    this.totalAmountOfDividend,
  });

  factory OverallMax.fromRawJson(String str) =>
      OverallMax.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OverallMax.fromJson(Map<String, dynamic> json) => OverallMax(
        minOpeningBalance: json["Min Opening Balance"]?.toDouble(),
        maxOpeningBalance: json["Max Opening Balance"]?.toDouble(),
        minBalance: json["Min Balance"]?.toDouble(),
        medianBalance: json["Median Balance"],
        maxBalance: json["Max Balance"]?.toDouble(),
        firstDayEodBalance: json["First Day EOD Balance"],
        lastDayEodBalance: json["Last Day EOD Balance"],
        opening: json["Opening"],
        closingBalance: json["Closing Balance"],
        minEodBalance: json["Min EOD Balance"]?.toDouble(),
        maxEodBalance: json["Max EOD Balance"]?.toDouble(),
        medianEodBalance: json["Median EOD Balance"]?.toDouble(),
        totalNoOfSalaryCredits: json["Total No of Salary Credits"],
        totalAmountOfSalaryCredits: json["Total Amount of Salary Credits"],
        totalNoOfCreditTransactions:
            json["Total No. of Credit Transactions"]?.toDouble(),
        totalAmountOfCreditTransactions:
            json["Total Amount of Credit Transactions"]?.toDouble(),
        totalNoOfBusinessCreditTransactions:
            json["Total No. of Business Credit Transactions"]?.toDouble(),
        totalAmountOfBusinessCreditTransactions:
            json["Total Amount of Business Credit Transactions"]?.toDouble(),
        totalNoOfDebitTransactions:
            json["Total No. of Debit Transactions"]?.toDouble(),
        totalAmountOfDebitTransactions:
            json["Total Amount of Debit Transactions"]?.toDouble(),
        totalNoOfCashDeposits: json["Total No. of Cash Deposits"],
        totalAmountOfCashDeposits: json["Total Amount of Cash Deposits"],
        totalNoOfCashWithdrawals: json["Total No. of Cash Withdrawals"],
        chqDeposits: json["chqDeposits"],
        totalNoOfChequeDeposits: json["Total No. of Cheque Deposits"],
        chqIssues: json["chqIssues"],
        totalNoOfChequeIssues: json["Total No. of Cheque Issues"],
        totalChqDeposits: json["totalChqDeposits"],
        totalAmountOfChequeDeposits: json["Total Amount of Cheque Deposits"],
        totalChqIssues: json["totalChqIssues"],
        totalAmountOfChequeIssues: json["Total Amount of Cheque Issues"],
        noOfEmiLoanPayments: json["No. of EMI / loan payments"],
        totalNoOfEmiLoanPayments: json["Total No. of EMI / loan payments"],
        totalNoOfIWBounced: json["Total No.of I / W Bounced"],
        sumOfIWBounced: json["Sum of I/W Bounced"],
        totalAmountOfIWBounced: json["Total amount of I / W Bounced"],
        totalNumberOfOutwardChequeBounces:
            json["Total Number of Outward Cheque Bounces"],
        noOfTransactionsInBs: json["No. of transactions in BS"]?.toDouble(),
        totalLoanDisbursal: json["totalLoanDisbursal"],
        totalAmountOfLoanDisbursal: json["Total Amount of Loan Disbursal"],
        loanDisbursal: json["Loan Disbursal"],
        overallMaxLoanDisbursal: json["loanDisbursal"],
        totalNoOfLoanDisbursal: json["Total No. of Loan Disbursal"],
        overallMaxTotalNoOfIWChqBounced: json["Total No. of I/W Chq Bounced"],
        totalNoOfIWChqBounced: json["Total No. of I / W Chq Bounced"],
        inwChqBounceNonTechnical: json["inw_chq_bounce_nonTechnical"],
        totalNoOfIWChequeBounceNonTechnical:
            json["Total No. of I / W Cheque Bounce Non Technical"],
        totalInwChqBounceNonTechnical:
            json["total_inw_chq_bounce_nonTechnical"],
        totalAmountOfIWChequeBounceNonTechnical:
            json["Total Amount of I / W Cheque Bounce Non Technical"],
        salaryCount: json["salary_count"],
        overallMaxStartDate: json["startDate"],
        startDate: json["Start Date"],
        averageEodBalance: json["Average EOD Balance"]?.toDouble(),
        abbOn114LastDay: json["ABB on 1 14 last day"],
        abbOn1St14Th30ThLastDay: json["ABB on 1st,14th, 30th/Last Day"],
        totalNoOfNetCreditTransactions:
            json["Total No. of Net Credit Transactions"]?.toDouble(),
        totalNetCreditAmount: json["Total Net Credit Amount"]?.toDouble(),
        totalNoOfNetDebitTransactions:
            json["Total No. of Net Debit Transactions"]?.toDouble(),
        totalNetDebitAmount: json["Total Net Debit Amount"]?.toDouble(),
        totalNoOfCreditCardPayment: json["Total No. of CreditCard Payment"],
        totalNoOfBillsUtilities: json["Total No. of Bills & Utilities"],
        totalNoOfFood: json["Total No. of Food"],
        totalNoOfAlcohol: json["Total No. of Alcohol"],
        totalNoOfTravel: json["Total No. of Travel"],
        totalNoOfEntertainmentLifestyle:
            json["Total No. of Entertainment & Lifestyle"],
        totalNoOfShoppingPurchase: json["Total No. of Shopping & Purchase"],
        totalNoOfInvestmentExpense: json["Total No. of Investment Expense"],
        totalNoOfGaming: json["Total No. of Gaming"],
        totalNoOfPersonalLoan: json["Total No. of Personal Loan"],
        totalNoOfHomeLoan: json["Total No. of Home Loan"],
        totalNoOfAutoLoan: json["Total No. of Auto Loan "],
        totalNoOfInsurance: json["Total No. of Insurance"],
        totalNoOfTaxTransactionDebit:
            json["Total No. of Tax Transaction Debit"],
        totalNoOfTransferToWalletTransaction:
            json["Total No. of Transfer to Wallet Transaction"],
        totalNoOfReversalTransactionDebit:
            json["Total No. of Reversal Transaction Debit"],
        totalNoOfMedicalTransaction: json["Total No. of Medical Transaction"],
        totalNoOfChargesTransaction: json["Total No. of Charges Transaction"],
        totalNoOfBelowMinimumBalanceTransaction:
            json["Total No. of Below Minimum Balance Transaction"],
        totalNoOfSalaryPaidTransaction:
            json["Total No. of Salary Paid Transaction"],
        totalNoOfTransferOutTransaction:
            json["Total No. of Transfer Out Transaction"]?.toDouble(),
        totalNoOfForeignWalletTransaction:
            json["Total No. of Foreign Wallet Transaction"],
        totalNoOfOtherCategoryDebitTransaction:
            json["Total No. of Other Category Debit Transaction"],
        totalAmountOfBillsUtilities: json["Total Amount of Bills & Utilities"],
        totalAmountOfFood: json["Total Amount of Food"],
        totalAmountOfAlcohol: json["Total Amount of Alcohol"],
        totalAmountOfPersonalLoan: json["Total Amount of Personal Loan"],
        totalAmountOfHomeLoan: json["Total Amount of Home Loan"],
        totalAmountOfAutoLoan: json["Total Amount of Auto Loan "],
        totalAmountOfTravel: json["Total Amount of Travel"],
        totalAmountOfEntertainmentLifestyle:
            json["Total Amount of Entertainment & Lifestyle"],
        totalAmountOfShoppingPurchase:
            json["Total Amount of Shopping & Purchase"],
        totalAmountOfInvestmentExpense:
            json["Total Amount of Investment Expense"],
        totalAmountOfInsurance: json["Total Amount of Insurance"],
        totalAmountOfTaxTransactionDebit:
            json["Total Amount of Tax Transaction Debit"],
        totalAmountOfGaming: json["Total Amount of Gaming"],
        totalAmountOfTransferToWalletTransaction:
            json["Total Amount of Transfer to Wallet Transaction"],
        totalAmountOfReversalTransactionDebit:
            json["Total Amount of Reversal Transaction Debit"],
        totalAmountOfCreditCardPayment:
            json["Total Amount of CreditCard Payment"],
        totalAmountOfCashWithdrawals: json["Total Amount of Cash Withdrawals"],
        totalAmountOfMedicalTransaction:
            json["Total Amount of Medical Transaction"],
        totalAmountOfChargesTransaction:
            json["Total Amount of Charges Transaction"],
        totalAmountOfBelowMinimumBalanceTransaction:
            json["Total Amount of Below Minimum Balance Transaction"],
        totalAmountOfSalaryPaidTransaction:
            json["Total Amount of Salary Paid Transaction"],
        totalAmountOfTransferOutTransaction:
            json["Total Amount of Transfer Out Transaction"]?.toDouble(),
        totalAmountOfForeignWalletTransaction:
            json["Total Amount of Foreign Wallet Transaction"],
        totalAmountOfEmiLoanPayments:
            json["Total Amount of EMI / loan Payments"],
        totalAmountOfOtherCategoryDebitTransaction:
            json["Total Amount of Other Category Debit Transaction"],
        totalNoOfMutualFunds: json["Total No. of Mutual Funds"],
        totalDebitAmountOfMutualFunds:
            json["Total Debit Amount of Mutual Funds"],
        totalExpenseOnCryptoCurrency: json["Total Expense on Crypto Currency"],
        totalExpenseOnShareMarket: json["Total Expense on Share Market"],
        totalNoOfGasBillPayments: json["Total No. of Gas Bill Payments"],
        totalAmountOfGasBillPayments: json["Total Amount of Gas Bill Payments"],
        totalNoOfElectricityBillPayments:
            json["Total No. of Electricity Bill Payments"],
        totalNoOfMobileBroadbandBillPayments:
            json["Total No. of Mobile & Broadband Bill Payments"],
        totalAmountOfMobileBroadbandBillPayments:
            json["Total Amount of Mobile & Broadband Bill Payments"],
        totalAmountOfElectricityBillPayments:
            json["Total Amount of Electricity Bill Payments"],
        totalNoOfDividend: json["Total No. of Dividend"],
        totalAmountOfDividend: json["Total Amount of Dividend"],
      );

  Map<String, dynamic> toJson() => {
        "Min Opening Balance": minOpeningBalance,
        "Max Opening Balance": maxOpeningBalance,
        "Min Balance": minBalance,
        "Median Balance": medianBalance,
        "Max Balance": maxBalance,
        "First Day EOD Balance": firstDayEodBalance,
        "Last Day EOD Balance": lastDayEodBalance,
        "Opening": opening,
        "Closing Balance": closingBalance,
        "Min EOD Balance": minEodBalance,
        "Max EOD Balance": maxEodBalance,
        "Median EOD Balance": medianEodBalance,
        "Total No of Salary Credits": totalNoOfSalaryCredits,
        "Total Amount of Salary Credits": totalAmountOfSalaryCredits,
        "Total No. of Credit Transactions": totalNoOfCreditTransactions,
        "Total Amount of Credit Transactions": totalAmountOfCreditTransactions,
        "Total No. of Business Credit Transactions":
            totalNoOfBusinessCreditTransactions,
        "Total Amount of Business Credit Transactions":
            totalAmountOfBusinessCreditTransactions,
        "Total No. of Debit Transactions": totalNoOfDebitTransactions,
        "Total Amount of Debit Transactions": totalAmountOfDebitTransactions,
        "Total No. of Cash Deposits": totalNoOfCashDeposits,
        "Total Amount of Cash Deposits": totalAmountOfCashDeposits,
        "Total No. of Cash Withdrawals": totalNoOfCashWithdrawals,
        "chqDeposits": chqDeposits,
        "Total No. of Cheque Deposits": totalNoOfChequeDeposits,
        "chqIssues": chqIssues,
        "Total No. of Cheque Issues": totalNoOfChequeIssues,
        "totalChqDeposits": totalChqDeposits,
        "Total Amount of Cheque Deposits": totalAmountOfChequeDeposits,
        "totalChqIssues": totalChqIssues,
        "Total Amount of Cheque Issues": totalAmountOfChequeIssues,
        "No. of EMI / loan payments": noOfEmiLoanPayments,
        "Total No. of EMI / loan payments": totalNoOfEmiLoanPayments,
        "Total No.of I / W Bounced": totalNoOfIWBounced,
        "Sum of I/W Bounced": sumOfIWBounced,
        "Total amount of I / W Bounced": totalAmountOfIWBounced,
        "Total Number of Outward Cheque Bounces":
            totalNumberOfOutwardChequeBounces,
        "No. of transactions in BS": noOfTransactionsInBs,
        "totalLoanDisbursal": totalLoanDisbursal,
        "Total Amount of Loan Disbursal": totalAmountOfLoanDisbursal,
        "Loan Disbursal": loanDisbursal,
        "loanDisbursal": overallMaxLoanDisbursal,
        "Total No. of Loan Disbursal": totalNoOfLoanDisbursal,
        "Total No. of I/W Chq Bounced": overallMaxTotalNoOfIWChqBounced,
        "Total No. of I / W Chq Bounced": totalNoOfIWChqBounced,
        "inw_chq_bounce_nonTechnical": inwChqBounceNonTechnical,
        "Total No. of I / W Cheque Bounce Non Technical":
            totalNoOfIWChequeBounceNonTechnical,
        "total_inw_chq_bounce_nonTechnical": totalInwChqBounceNonTechnical,
        "Total Amount of I / W Cheque Bounce Non Technical":
            totalAmountOfIWChequeBounceNonTechnical,
        "salary_count": salaryCount,
        "startDate": overallMaxStartDate,
        "Start Date": startDate,
        "Average EOD Balance": averageEodBalance,
        "ABB on 1 14 last day": abbOn114LastDay,
        "ABB on 1st,14th, 30th/Last Day": abbOn1St14Th30ThLastDay,
        "Total No. of Net Credit Transactions": totalNoOfNetCreditTransactions,
        "Total Net Credit Amount": totalNetCreditAmount,
        "Total No. of Net Debit Transactions": totalNoOfNetDebitTransactions,
        "Total Net Debit Amount": totalNetDebitAmount,
        "Total No. of CreditCard Payment": totalNoOfCreditCardPayment,
        "Total No. of Bills & Utilities": totalNoOfBillsUtilities,
        "Total No. of Food": totalNoOfFood,
        "Total No. of Alcohol": totalNoOfAlcohol,
        "Total No. of Travel": totalNoOfTravel,
        "Total No. of Entertainment & Lifestyle":
            totalNoOfEntertainmentLifestyle,
        "Total No. of Shopping & Purchase": totalNoOfShoppingPurchase,
        "Total No. of Investment Expense": totalNoOfInvestmentExpense,
        "Total No. of Gaming": totalNoOfGaming,
        "Total No. of Personal Loan": totalNoOfPersonalLoan,
        "Total No. of Home Loan": totalNoOfHomeLoan,
        "Total No. of Auto Loan ": totalNoOfAutoLoan,
        "Total No. of Insurance": totalNoOfInsurance,
        "Total No. of Tax Transaction Debit": totalNoOfTaxTransactionDebit,
        "Total No. of Transfer to Wallet Transaction":
            totalNoOfTransferToWalletTransaction,
        "Total No. of Reversal Transaction Debit":
            totalNoOfReversalTransactionDebit,
        "Total No. of Medical Transaction": totalNoOfMedicalTransaction,
        "Total No. of Charges Transaction": totalNoOfChargesTransaction,
        "Total No. of Below Minimum Balance Transaction":
            totalNoOfBelowMinimumBalanceTransaction,
        "Total No. of Salary Paid Transaction": totalNoOfSalaryPaidTransaction,
        "Total No. of Transfer Out Transaction":
            totalNoOfTransferOutTransaction,
        "Total No. of Foreign Wallet Transaction":
            totalNoOfForeignWalletTransaction,
        "Total No. of Other Category Debit Transaction":
            totalNoOfOtherCategoryDebitTransaction,
        "Total Amount of Bills & Utilities": totalAmountOfBillsUtilities,
        "Total Amount of Food": totalAmountOfFood,
        "Total Amount of Alcohol": totalAmountOfAlcohol,
        "Total Amount of Personal Loan": totalAmountOfPersonalLoan,
        "Total Amount of Home Loan": totalAmountOfHomeLoan,
        "Total Amount of Auto Loan ": totalAmountOfAutoLoan,
        "Total Amount of Travel": totalAmountOfTravel,
        "Total Amount of Entertainment & Lifestyle":
            totalAmountOfEntertainmentLifestyle,
        "Total Amount of Shopping & Purchase": totalAmountOfShoppingPurchase,
        "Total Amount of Investment Expense": totalAmountOfInvestmentExpense,
        "Total Amount of Insurance": totalAmountOfInsurance,
        "Total Amount of Tax Transaction Debit":
            totalAmountOfTaxTransactionDebit,
        "Total Amount of Gaming": totalAmountOfGaming,
        "Total Amount of Transfer to Wallet Transaction":
            totalAmountOfTransferToWalletTransaction,
        "Total Amount of Reversal Transaction Debit":
            totalAmountOfReversalTransactionDebit,
        "Total Amount of CreditCard Payment": totalAmountOfCreditCardPayment,
        "Total Amount of Cash Withdrawals": totalAmountOfCashWithdrawals,
        "Total Amount of Medical Transaction": totalAmountOfMedicalTransaction,
        "Total Amount of Charges Transaction": totalAmountOfChargesTransaction,
        "Total Amount of Below Minimum Balance Transaction":
            totalAmountOfBelowMinimumBalanceTransaction,
        "Total Amount of Salary Paid Transaction":
            totalAmountOfSalaryPaidTransaction,
        "Total Amount of Transfer Out Transaction":
            totalAmountOfTransferOutTransaction,
        "Total Amount of Foreign Wallet Transaction":
            totalAmountOfForeignWalletTransaction,
        "Total Amount of EMI / loan Payments": totalAmountOfEmiLoanPayments,
        "Total Amount of Other Category Debit Transaction":
            totalAmountOfOtherCategoryDebitTransaction,
        "Total No. of Mutual Funds": totalNoOfMutualFunds,
        "Total Debit Amount of Mutual Funds": totalDebitAmountOfMutualFunds,
        "Total Expense on Crypto Currency": totalExpenseOnCryptoCurrency,
        "Total Expense on Share Market": totalExpenseOnShareMarket,
        "Total No. of Gas Bill Payments": totalNoOfGasBillPayments,
        "Total Amount of Gas Bill Payments": totalAmountOfGasBillPayments,
        "Total No. of Electricity Bill Payments":
            totalNoOfElectricityBillPayments,
        "Total No. of Mobile & Broadband Bill Payments":
            totalNoOfMobileBroadbandBillPayments,
        "Total Amount of Mobile & Broadband Bill Payments":
            totalAmountOfMobileBroadbandBillPayments,
        "Total Amount of Electricity Bill Payments":
            totalAmountOfElectricityBillPayments,
        "Total No. of Dividend": totalNoOfDividend,
        "Total Amount of Dividend": totalAmountOfDividend,
      };
}

class CustomerInfo {
  String? holdingType;
  List<Holder>? holders;

  CustomerInfo({
    this.holdingType,
    this.holders,
  });

  factory CustomerInfo.fromRawJson(String str) =>
      CustomerInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CustomerInfo.fromJson(Map<String, dynamic> json) => CustomerInfo(
        holdingType: json["holding_type"],
        holders: json["holders"] == null
            ? []
            : List<Holder>.from(json["holders"].map((x) => Holder.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "holding_type": holdingType,
        "holders": holders == null
            ? []
            : List<dynamic>.from(holders!.map((x) => x.toJson())),
      };
}

class Holder {
  String? name;
  String? email;
  String? contactNumber;
  String? address;
  String? pan;
  String? ckycCompliance;
  DateTime? dob;
  String? landline;
  String? nominee;

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

  factory Holder.fromRawJson(String str) => Holder.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Holder.fromJson(Map<String, dynamic> json) => Holder(
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

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "contact_number": contactNumber,
        "address": address,
        "pan": pan,
        "ckyc_compliance": ckycCompliance,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "landline": landline,
        "nominee": nominee,
      };
}

class DailyOpenCloseBalance {
  String? month;
  List<DailyBalance>? dailyBalance;

  DailyOpenCloseBalance({
    this.month,
    this.dailyBalance,
  });

  factory DailyOpenCloseBalance.fromRawJson(String str) =>
      DailyOpenCloseBalance.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DailyOpenCloseBalance.fromJson(Map<String, dynamic> json) =>
      DailyOpenCloseBalance(
        month: json["month"],
        dailyBalance: json["dailyBalance"] == null
            ? []
            : List<DailyBalance>.from(
                json["dailyBalance"].map((x) => DailyBalance.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "month": month,
        "dailyBalance": dailyBalance == null
            ? []
            : List<dynamic>.from(dailyBalance!.map((x) => x.toJson())),
      };
}

class DailyBalance {
  num? timestamp;
  DateTime? transactionDate;
  double? openingBalance;
  double? closingBalance;

  DailyBalance({
    this.timestamp,
    this.transactionDate,
    this.openingBalance,
    this.closingBalance,
  });

  factory DailyBalance.fromRawJson(String str) =>
      DailyBalance.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DailyBalance.fromJson(Map<String, dynamic> json) => DailyBalance(
        timestamp: json["timestamp"],
        transactionDate: json["transaction_date"] == null
            ? null
            : DateTime.parse(json["transaction_date"]),
        openingBalance: json["opening_balance"]?.toDouble(),
        closingBalance: json["closing_balance"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "transaction_date":
            "${transactionDate!.year.toString().padLeft(4, '0')}-${transactionDate!.month.toString().padLeft(2, '0')}-${transactionDate!.day.toString().padLeft(2, '0')}",
        "opening_balance": openingBalance,
        "closing_balance": closingBalance,
      };
}

class FraudAnalysis {
  String? type;
  String? dgBdtinCode;
  Result? result;
  List<FraudAnalysisTransaction>? transactions;

  FraudAnalysis({
    this.type,
    this.dgBdtinCode,
    this.result,
    this.transactions,
  });

  factory FraudAnalysis.fromRawJson(String str) =>
      FraudAnalysis.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FraudAnalysis.fromJson(Map<String, dynamic> json) => FraudAnalysis(
        type: json["type"],
        dgBdtinCode: json["dg_bdtin_code"],
        result: resultValues.map[json["result"]],
        transactions: json["transactions"] == null
            ? []
            : List<FraudAnalysisTransaction>.from(json["transactions"]
                .map((x) => FraudAnalysisTransaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "dg_bdtin_code": dgBdtinCode,
        "result": resultValues.reverse[result],
        "transactions": transactions == null
            ? []
            : List<dynamic>.from(transactions!.map((x) => x.toJson())),
      };
}

enum Result { APPLICABLE, NOT_APPLICABLE }

final resultValues = EnumValues(
    {"applicable": Result.APPLICABLE, "not_applicable": Result.NOT_APPLICABLE});

class FraudAnalysisTransaction {
  num? amount;
  double? balance;
  String? chequeNum;
  DateTime? transactionDate;
  Tion? narration;
  Category? category;

  FraudAnalysisTransaction({
    this.amount,
    this.balance,
    this.chequeNum,
    this.transactionDate,
    this.narration,
    this.category,
  });

  factory FraudAnalysisTransaction.fromRawJson(String str) =>
      FraudAnalysisTransaction.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FraudAnalysisTransaction.fromJson(Map<String, dynamic> json) =>
      FraudAnalysisTransaction(
        amount: json["amount"],
        balance: json["balance"]?.toDouble(),
        chequeNum: json["cheque_num"],
        transactionDate: json["transaction_date"] == null
            ? null
            : DateTime.parse(json["transaction_date"]),
        narration: tionValues.map[json["narration"]],
        category: categoryValues.map[json["category"]],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "balance": balance,
        "cheque_num": chequeNum,
        "transaction_date":
            "${transactionDate!.year.toString().padLeft(4, '0')}-${transactionDate!.month.toString().padLeft(2, '0')}-${transactionDate!.day.toString().padLeft(2, '0')}",
        "narration": tionValues.reverse[narration],
        "category": categoryValues.reverse[category],
      };
}

enum Category { numEREST, OPENING_BALANCE, TRANSFER_IN, TRANSFER_OUT }

final categoryValues = EnumValues({
  "numerest": Category.numEREST,
  "Opening Balance": Category.OPENING_BALANCE,
  "Transfer in": Category.TRANSFER_IN,
  "Transfer out": Category.TRANSFER_OUT
});

enum Tion {
  BY_DEBIT_CARD,
  BY_TRANSFER,
  CREDIT_numEREST,
  OPENING_BALANCE,
  TO_TRANSFER
}

final tionValues = EnumValues({
  "by debit card": Tion.BY_DEBIT_CARD,
  "BY TRANSFER": Tion.BY_TRANSFER,
  "CREDIT numEREST": Tion.CREDIT_numEREST,
  "OPENING BALANCE": Tion.OPENING_BALANCE,
  "TO TRANSFER": Tion.TO_TRANSFER
});

class Pending {
  String? amount;
  String? transactionType;

  Pending({
    this.amount,
    this.transactionType,
  });

  factory Pending.fromRawJson(String str) => Pending.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pending.fromJson(Map<String, dynamic> json) => Pending(
        amount: json["amount"],
        transactionType: json["transaction_type"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "transaction_type": transactionType,
      };
}

class RawDatum {
  num? sn;
  String? date;
  Tion? description;
  Category? category;
  dynamic debit;
  dynamic credit;
  double? balance;

  RawDatum({
    this.sn,
    this.date,
    this.description,
    this.category,
    this.debit,
    this.credit,
    this.balance,
  });

  factory RawDatum.fromRawJson(String str) =>
      RawDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RawDatum.fromJson(Map<String, dynamic> json) => RawDatum(
        sn: json["SN"],
        date: json["Date"],
        description: tionValues.map[json["Description"]],
        category: categoryValues.map[json["Category"]],
        debit: json["Debit"],
        credit: json["Credit"],
        balance: json["Balance"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "SN": sn,
        "Date": date,
        "Description": tionValues.reverse[description],
        "Category": categoryValues.reverse[category],
        "Debit": debit,
        "Credit": credit,
        "Balance": balance,
      };
}

class RecurrentCr {
  RecurrentCrRecurrentNarration? recurrentNarration;
  List<RecurrentCrRecurrentTransaction>? recurrentTransaction;

  RecurrentCr({
    this.recurrentNarration,
    this.recurrentTransaction,
  });

  factory RecurrentCr.fromRawJson(String str) =>
      RecurrentCr.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RecurrentCr.fromJson(Map<String, dynamic> json) => RecurrentCr(
        recurrentNarration: json["recurrent_narration"] == null
            ? null
            : RecurrentCrRecurrentNarration.fromJson(
                json["recurrent_narration"]),
        recurrentTransaction: json["recurrent_transaction"] == null
            ? []
            : List<RecurrentCrRecurrentTransaction>.from(
                json["recurrent_transaction"]
                    .map((x) => RecurrentCrRecurrentTransaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "recurrent_narration": recurrentNarration?.toJson(),
        "recurrent_transaction": recurrentTransaction == null
            ? []
            : List<dynamic>.from(recurrentTransaction!.map((x) => x.toJson())),
      };
}

class RecurrentCrRecurrentNarration {
  ByTransfer? byTransfer;
  ByTransfer? creditnumerest;

  RecurrentCrRecurrentNarration({
    this.byTransfer,
    this.creditnumerest,
  });

  factory RecurrentCrRecurrentNarration.fromRawJson(String str) =>
      RecurrentCrRecurrentNarration.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RecurrentCrRecurrentNarration.fromJson(Map<String, dynamic> json) =>
      RecurrentCrRecurrentNarration(
        byTransfer: json["BY TRANSFER"] == null
            ? null
            : ByTransfer.fromJson(json["BY TRANSFER"]),
        creditnumerest: json["CREDIT numEREST"] == null
            ? null
            : ByTransfer.fromJson(json["CREDIT numEREST"]),
      );

  Map<String, dynamic> toJson() => {
        "BY TRANSFER": byTransfer?.toJson(),
        "CREDIT numEREST": creditnumerest?.toJson(),
      };
}

class ByTransfer {
  String? totalRecurrentCrSum;
  String? totalMonthRecurrentCrCount;
  IndividualMonth? individualMonth;

  ByTransfer({
    this.totalRecurrentCrSum,
    this.totalMonthRecurrentCrCount,
    this.individualMonth,
  });

  factory ByTransfer.fromRawJson(String str) =>
      ByTransfer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ByTransfer.fromJson(Map<String, dynamic> json) => ByTransfer(
        totalRecurrentCrSum: json["total_recurrent_cr_sum"],
        totalMonthRecurrentCrCount: json["total_month_recurrent_cr_count"],
        individualMonth: json["individual_month"] == null
            ? null
            : IndividualMonth.fromJson(json["individual_month"]),
      );

  Map<String, dynamic> toJson() => {
        "total_recurrent_cr_sum": totalRecurrentCrSum,
        "total_month_recurrent_cr_count": totalMonthRecurrentCrCount,
        "individual_month": individualMonth?.toJson(),
      };
}

class IndividualMonth {
  The2024? april2024;
  The2024? may2024;
  The2024? june2024;
  The2024? july2024;
  The2024? august2024;
  The2024? september2024;

  IndividualMonth({
    this.april2024,
    this.may2024,
    this.june2024,
    this.july2024,
    this.august2024,
    this.september2024,
  });

  factory IndividualMonth.fromRawJson(String str) =>
      IndividualMonth.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IndividualMonth.fromJson(Map<String, dynamic> json) =>
      IndividualMonth(
        april2024: json["April 2024"] == null
            ? null
            : The2024.fromJson(json["April 2024"]),
        may2024: json["May 2024"] == null
            ? null
            : The2024.fromJson(json["May 2024"]),
        june2024: json["June 2024"] == null
            ? null
            : The2024.fromJson(json["June 2024"]),
        july2024: json["July 2024"] == null
            ? null
            : The2024.fromJson(json["July 2024"]),
        august2024: json["August 2024"] == null
            ? null
            : The2024.fromJson(json["August 2024"]),
        september2024: json["September 2024"] == null
            ? null
            : The2024.fromJson(json["September 2024"]),
      );

  Map<String, dynamic> toJson() => {
        "April 2024": april2024?.toJson(),
        "May 2024": may2024?.toJson(),
        "June 2024": june2024?.toJson(),
        "July 2024": july2024?.toJson(),
        "August 2024": august2024?.toJson(),
        "September 2024": september2024?.toJson(),
      };
}

class The2024 {
  String? individualMonthRecurrentCrSum;
  String? individualMonthRecurrentCrCount;

  The2024({
    this.individualMonthRecurrentCrSum,
    this.individualMonthRecurrentCrCount,
  });

  factory The2024.fromRawJson(String str) => The2024.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory The2024.fromJson(Map<String, dynamic> json) => The2024(
        individualMonthRecurrentCrSum:
            json["individual_month_recurrent_cr_sum"],
        individualMonthRecurrentCrCount:
            json["individual_month_recurrent_cr_count"],
      );

  Map<String, dynamic> toJson() => {
        "individual_month_recurrent_cr_sum": individualMonthRecurrentCrSum,
        "individual_month_recurrent_cr_count": individualMonthRecurrentCrCount,
      };
}

class RecurrentCrRecurrentTransaction {
  DateTime? date;
  Tion? description;
  Category? category;
  num? amount;

  RecurrentCrRecurrentTransaction({
    this.date,
    this.description,
    this.category,
    this.amount,
  });

  factory RecurrentCrRecurrentTransaction.fromRawJson(String str) =>
      RecurrentCrRecurrentTransaction.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RecurrentCrRecurrentTransaction.fromJson(Map<String, dynamic> json) =>
      RecurrentCrRecurrentTransaction(
        date: json["Date"] == null ? null : DateTime.parse(json["Date"]),
        description: tionValues.map[json["Description"]],
        category: categoryValues.map[json["Category"]],
        amount: json["Amount"],
      );

  Map<String, dynamic> toJson() => {
        "Date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "Description": tionValues.reverse[description],
        "Category": categoryValues.reverse[category],
        "Amount": amount,
      };
}

class RecurrentDr {
  RecurrentDrRecurrentNarration? recurrentNarration;
  List<RecurrentDrRecurrentTransaction>? recurrentTransaction;

  RecurrentDr({
    this.recurrentNarration,
    this.recurrentTransaction,
  });

  factory RecurrentDr.fromRawJson(String str) =>
      RecurrentDr.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RecurrentDr.fromJson(Map<String, dynamic> json) => RecurrentDr(
        recurrentNarration: json["recurrent_narration"] == null
            ? null
            : RecurrentDrRecurrentNarration.fromJson(
                json["recurrent_narration"]),
        recurrentTransaction: json["recurrent_transaction"] == null
            ? []
            : List<RecurrentDrRecurrentTransaction>.from(
                json["recurrent_transaction"]
                    .map((x) => RecurrentDrRecurrentTransaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "recurrent_narration": recurrentNarration?.toJson(),
        "recurrent_transaction": recurrentTransaction == null
            ? []
            : List<dynamic>.from(recurrentTransaction!.map((x) => x.toJson())),
      };
}

class RecurrentDrRecurrentNarration {
  ByTransfer? toTransfer;
  ByTransfer? byDebitCard;

  RecurrentDrRecurrentNarration({
    this.toTransfer,
    this.byDebitCard,
  });

  factory RecurrentDrRecurrentNarration.fromRawJson(String str) =>
      RecurrentDrRecurrentNarration.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RecurrentDrRecurrentNarration.fromJson(Map<String, dynamic> json) =>
      RecurrentDrRecurrentNarration(
        toTransfer: json["TO TRANSFER"] == null
            ? null
            : ByTransfer.fromJson(json["TO TRANSFER"]),
        byDebitCard: json["by debit card"] == null
            ? null
            : ByTransfer.fromJson(json["by debit card"]),
      );

  Map<String, dynamic> toJson() => {
        "TO TRANSFER": toTransfer?.toJson(),
        "by debit card": byDebitCard?.toJson(),
      };
}

class RecurrentDrRecurrentTransaction {
  DateTime? date;
  Tion? description;
  Category? category;
  double? amount;
  double? balance;
  String? chqno;

  RecurrentDrRecurrentTransaction({
    this.date,
    this.description,
    this.category,
    this.amount,
    this.balance,
    this.chqno,
  });

  factory RecurrentDrRecurrentTransaction.fromRawJson(String str) =>
      RecurrentDrRecurrentTransaction.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RecurrentDrRecurrentTransaction.fromJson(Map<String, dynamic> json) =>
      RecurrentDrRecurrentTransaction(
        date: json["Date"] == null ? null : DateTime.parse(json["Date"]),
        description: tionValues.map[json["Description"]],
        category: categoryValues.map[json["Category"]],
        amount: json["Amount"]?.toDouble(),
        balance: json["balance"]?.toDouble(),
        chqno: json["chqno"],
      );

  Map<String, dynamic> toJson() => {
        "Date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "Description": tionValues.reverse[description],
        "Category": categoryValues.reverse[category],
        "Amount": amount,
        "balance": balance,
        "chqno": chqno,
      };
}

class AccountTransaction {
  double? amount;
  String? balance;
  String? chequeNum;
  DateTime? date;
  ModeFromSource? modeFromSource;
  String? narration;
  String? reference;
  String? transactionId;
  DateTime? transactionTimestamp;
  String? category;
  String? subCategory;

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

  factory AccountTransaction.fromRawJson(String str) =>
      AccountTransaction.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AccountTransaction.fromJson(Map<String, dynamic> json) =>
      AccountTransaction(
        amount: json["amount"]?.toDouble(),
        balance: json["balance"],
        chequeNum: json["cheque_num"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        modeFromSource: modeFromSourceValues.map[json["mode_from_source"]],
        narration: json["narration"] ?? '',
        reference: json["reference"],
        transactionId: json["transaction_id"],
        transactionTimestamp: json["transaction_timestamp"] == null
            ? null
            : DateTime.parse(json["transaction_timestamp"]),
        category: json["category"] ?? '',
        subCategory: json["sub_category"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "balance": balance,
        "cheque_num": chequeNum,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "mode_from_source": modeFromSourceValues.reverse[modeFromSource],
        "narration": tionValues.reverse[narration],
        "reference": reference,
        "transaction_id": transactionId,
        "transaction_timestamp": transactionTimestamp?.toIso8601String(),
        "category": categoryValues.reverse[category],
        "sub_category": subCategory,
      };
}

enum ModeFromSource { CARD, FT, OTHERS }

final modeFromSourceValues = EnumValues({
  "CARD": ModeFromSource.CARD,
  "FT": ModeFromSource.FT,
  "OTHERS": ModeFromSource.OTHERS
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
