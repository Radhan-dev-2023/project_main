// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReportDataHiveModelAdapter extends TypeAdapter<ReportDataHiveModel> {
  @override
  final int typeId = 2;

  @override
  ReportDataHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReportDataHiveModel(
      success: fields[1] as bool?,
      reportData: fields[2] as ReportData?,
    );
  }

  @override
  void write(BinaryWriter writer, ReportDataHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.success)
      ..writeByte(2)
      ..write(obj.reportData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReportDataHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReportDataAdapter extends TypeAdapter<ReportData> {
  @override
  final int typeId = 3;

  @override
  ReportData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReportData(
      clientRefNum: fields[1] as String?,
      requestId: fields[2] as int?,
      txnId: fields[3] as String?,
      startDate: fields[4] as DateTime?,
      endDate: fields[5] as DateTime?,
      durationInMonth: fields[6] as int?,
      dgReportVersion: fields[7] as String?,
      reportNum: fields[8] as String?,
      reportFetchTime: fields[9] as DateTime?,
      reportFetchType: fields[10] as String?,
      sourceOfData: fields[11] as String?,
      statementStartDate: fields[12] as DateTime?,
      statementEndDate: fields[13] as DateTime?,
      multipleAccountsFound: fields[14] as String?,
      banks: (fields[15] as List?)?.cast<Bank>(),
    );
  }

  @override
  void write(BinaryWriter writer, ReportData obj) {
    writer
      ..writeByte(15)
      ..writeByte(1)
      ..write(obj.clientRefNum)
      ..writeByte(2)
      ..write(obj.requestId)
      ..writeByte(3)
      ..write(obj.txnId)
      ..writeByte(4)
      ..write(obj.startDate)
      ..writeByte(5)
      ..write(obj.endDate)
      ..writeByte(6)
      ..write(obj.durationInMonth)
      ..writeByte(7)
      ..write(obj.dgReportVersion)
      ..writeByte(8)
      ..write(obj.reportNum)
      ..writeByte(9)
      ..write(obj.reportFetchTime)
      ..writeByte(10)
      ..write(obj.reportFetchType)
      ..writeByte(11)
      ..write(obj.sourceOfData)
      ..writeByte(12)
      ..write(obj.statementStartDate)
      ..writeByte(13)
      ..write(obj.statementEndDate)
      ..writeByte(14)
      ..write(obj.multipleAccountsFound)
      ..writeByte(15)
      ..write(obj.banks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReportDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BankAdapter extends TypeAdapter<Bank> {
  @override
  final int typeId = 4;

  @override
  Bank read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Bank(
      bank: fields[1] as String?,
      digitapInstitutionId: fields[2] as int?,
      sourceBankId: fields[3] as String?,
      multipleAccountsFound: fields[4] as String?,
      accounts: (fields[5] as List?)?.cast<Account>(),
    );
  }

  @override
  void write(BinaryWriter writer, Bank obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.bank)
      ..writeByte(2)
      ..write(obj.digitapInstitutionId)
      ..writeByte(3)
      ..write(obj.sourceBankId)
      ..writeByte(4)
      ..write(obj.multipleAccountsFound)
      ..writeByte(5)
      ..write(obj.accounts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BankAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AccountAdapter extends TypeAdapter<Account> {
  @override
  final int typeId = 5;

  @override
  Account read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Account(
      customerInfo: fields[1] as CustomerInfo?,
      location: fields[2] as String?,
      openingDate: fields[3] as DateTime?,
      currentBalance: fields[4] as String?,
      balanceDateTime: fields[5] as DateTime?,
      currentOdLimit: fields[6] as String?,
      drawingLimit: fields[7] as String?,
      currency: fields[8] as String?,
      exchgeRate: fields[9] as String?,
      accountStatus: fields[10] as String?,
      facility: fields[11] as String?,
      accountIfscCode: fields[12] as String?,
      micrCode: fields[13] as String?,
      accountNumber: fields[14] as String?,
      accountType: fields[15] as String?,
      accountDescription: fields[16] as String?,
      transactionStartDate: fields[17] as DateTime?,
      transactionEndDate: fields[18] as DateTime?,
      transactions: (fields[19] as List?)?.cast<AccountTransaction>(),
      tamperDetectionDetails: (fields[20] as List?)?.cast<dynamic>(),
      ifscCode: fields[21] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Account obj) {
    writer
      ..writeByte(21)
      ..writeByte(1)
      ..write(obj.customerInfo)
      ..writeByte(2)
      ..write(obj.location)
      ..writeByte(3)
      ..write(obj.openingDate)
      ..writeByte(4)
      ..write(obj.currentBalance)
      ..writeByte(5)
      ..write(obj.balanceDateTime)
      ..writeByte(6)
      ..write(obj.currentOdLimit)
      ..writeByte(7)
      ..write(obj.drawingLimit)
      ..writeByte(8)
      ..write(obj.currency)
      ..writeByte(9)
      ..write(obj.exchgeRate)
      ..writeByte(10)
      ..write(obj.accountStatus)
      ..writeByte(11)
      ..write(obj.facility)
      ..writeByte(12)
      ..write(obj.accountIfscCode)
      ..writeByte(13)
      ..write(obj.micrCode)
      ..writeByte(14)
      ..write(obj.accountNumber)
      ..writeByte(15)
      ..write(obj.accountType)
      ..writeByte(16)
      ..write(obj.accountDescription)
      ..writeByte(17)
      ..write(obj.transactionStartDate)
      ..writeByte(18)
      ..write(obj.transactionEndDate)
      ..writeByte(19)
      ..write(obj.transactions)
      ..writeByte(20)
      ..write(obj.tamperDetectionDetails)
      ..writeByte(21)
      ..write(obj.ifscCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CustomerInfoAdapter extends TypeAdapter<CustomerInfo> {
  @override
  final int typeId = 6;

  @override
  CustomerInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomerInfo(
      holdingType: fields[1] as String?,
      holders: (fields[2] as List?)?.cast<Holder>(),
    );
  }

  @override
  void write(BinaryWriter writer, CustomerInfo obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.holdingType)
      ..writeByte(2)
      ..write(obj.holders);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HolderAdapter extends TypeAdapter<Holder> {
  @override
  final int typeId = 7;

  @override
  Holder read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Holder(
      name: fields[1] as String?,
      email: fields[2] as String?,
      contactNumber: fields[3] as String?,
      address: fields[4] as String?,
      pan: fields[5] as String?,
      ckycCompliance: fields[6] as String?,
      dob: fields[7] as DateTime?,
      landline: fields[8] as String?,
      nominee: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Holder obj) {
    writer
      ..writeByte(9)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.contactNumber)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.pan)
      ..writeByte(6)
      ..write(obj.ckycCompliance)
      ..writeByte(7)
      ..write(obj.dob)
      ..writeByte(8)
      ..write(obj.landline)
      ..writeByte(9)
      ..write(obj.nominee);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HolderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AccountTransactionAdapter extends TypeAdapter<AccountTransaction> {
  @override
  final int typeId = 8;

  @override
  AccountTransaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountTransaction(
      amount: fields[1] as dynamic,
      balance: fields[2] as String?,
      chequeNum: fields[3] as String?,
      date: fields[4] as DateTime?,
      modeFromSource: fields[5] as String?,
      narration: fields[6] as String?,
      reference: fields[7] as String?,
      transactionId: fields[8] as String?,
      transactionTimestamp: fields[9] as DateTime?,
      category: fields[10] as String?,
      subCategory: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AccountTransaction obj) {
    writer
      ..writeByte(11)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.balance)
      ..writeByte(3)
      ..write(obj.chequeNum)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.modeFromSource)
      ..writeByte(6)
      ..write(obj.narration)
      ..writeByte(7)
      ..write(obj.reference)
      ..writeByte(8)
      ..write(obj.transactionId)
      ..writeByte(9)
      ..write(obj.transactionTimestamp)
      ..writeByte(10)
      ..write(obj.category)
      ..writeByte(11)
      ..write(obj.subCategory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountTransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
