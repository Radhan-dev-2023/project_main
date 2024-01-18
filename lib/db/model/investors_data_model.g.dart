// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investors_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InvestorModelAdapter extends TypeAdapter<InvestorModel> {
  @override
  final int typeId = 1;

  @override
  InvestorModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InvestorModel(
      pageNumber: fields[0] as String?,
      processMode: fields[1] as String?,
      title: fields[2] as String?,
      invName: fields[3] as String?,
      pan: fields[4] as String?,
      validPan: fields[5] as String?,
      exemption: fields[6] as String?,
      exemptCategory: fields[7] as String?,
      exemptRefNo: fields[8] as String?,
      dob: fields[9] as String?,
      holdNature: fields[10] as String?,
      taxStatus: fields[11] as String?,
      kyc: fields[12] as String?,
      fhCkyc: fields[13] as String?,
      fhCkycRefNo: fields[14] as String?,
      occupation: fields[15] as String?,
      mfuCan: fields[16] as String?,
      dpId: fields[17] as String?,
      fatherName: fields[18] as String?,
      motherName: fields[19] as String?,
      trxnAcceptance: fields[20] as String?,
      addr1: fields[21] as String?,
      addr2: fields[22] as String?,
      addr3: fields[23] as String?,
      city: fields[25] as String?,
      state: fields[26] as String?,
      pincode: fields[27] as String?,
      country: fields[28] as String?,
      mobileNo: fields[29] as String?,
      resPhone: fields[30] as String?,
      offPhone: fields[31] as String?,
      resFax: fields[32] as String?,
      offFax: fields[33] as String?,
      email: fields[34] as String?,
      nriAddr1: fields[35] as String?,
      nriAddr2: fields[36] as String?,
      nriAddr3: fields[37] as String?,
      nriCity: fields[38] as String?,
      nriState: fields[39] as String?,
      nriPincode: fields[40] as String?,
      nriCountry: fields[41] as String?,
      bankName: fields[42] as String?,
      accNo: fields[43] as String?,
      accType: fields[44] as String?,
      ifscCode: fields[45] as String?,
      branchName: fields[46] as String?,
      branchAddr1: fields[47] as String?,
      branchAddr2: fields[48] as String?,
      branchAddr3: fields[49] as String?,
      branchCity: fields[50] as String?,
      branchPincode: fields[51] as String?,
      branchCountry: fields[52] as String?,
      jh1Name: fields[53] as String?,
      jh1Pan: fields[54] as String?,
      jh1ValidPan: fields[55] as String?,
      jh1Exemption: fields[56] as String?,
      jh1ExemptCategory: fields[57] as String?,
      jh1ExemptRefNo: fields[58] as String?,
      jh1Dob: fields[59] as String?,
      jh1Kyc: fields[60] as String?,
      jh1Ckyc: fields[61] as String?,
      jh1CkycRefNo: fields[62] as String?,
      jh1Email: fields[63] as String?,
      jh1MobileNo: fields[64] as String?,
      jh2Name: fields[65] as String?,
      jh2Pan: fields[67] as String?,
      jh2ValidPan: fields[68] as String?,
      jh2Exemption: fields[69] as String?,
      jh2ExemptCategory: fields[70] as String?,
      jh2ExemptRefNo: fields[71] as String?,
      jh2Dob: fields[72] as String?,
      jh2Kyc: fields[73] as String?,
      jh2Ckyc: fields[74] as String?,
      jh2CkycRefNo: fields[75] as String?,
      jh2Email: fields[76] as String?,
      jh2MobileNo: fields[77] as String?,
      noOfNominee: fields[78] as String?,
      nominee1Type: fields[79] as String?,
      nominee1Name: fields[80] as String?,
      nominee1Dob: fields[81] as String?,
      nominee1Addr1: fields[82] as String?,
      nominee1Addr2: fields[83] as String?,
      nominee1Addr3: fields[84] as String?,
      nominee1City: fields[85] as String?,
      nominee1State: fields[86] as String?,
      nominee1Pincode: fields[87] as String?,
      nominee1Relation: fields[88] as String?,
      nominee1Percent: fields[89] as String?,
      nominee1GuardName: fields[90] as String?,
      nominee1GuardPan: fields[91] as String?,
      nominee2Type: fields[92] as String?,
      nominee2Name: fields[93] as String?,
      nominee2Dob: fields[94] as String?,
      nominee2Relation: fields[95] as String?,
      nominee2Percent: fields[96] as String?,
      nominee2GuardName: fields[97] as String?,
      nominee2GuardPan: fields[98] as String?,
      nominee3Type: fields[99] as String?,
      nominee3Name: fields[100] as String?,
      nominee3Relation: fields[102] as String?,
      nominee3Dob: fields[101] as String?,
      nominee3Percent: fields[103] as String?,
      nominee3GuardName: fields[104] as String?,
      nominee3GuardPan: fields[105] as String?,
      guardName: fields[106] as String?,
      guardPan: fields[107] as String?,
      guardValidPan: fields[108] as String?,
      guardExemption: fields[109] as String?,
      guardExemptCategory: fields[110] as String?,
      guardPanRefNo: fields[111] as String?,
      guardDob: fields[112] as String?,
      guardKyc: fields[113] as String?,
      guardCkyc: fields[114] as String?,
      guardCkycRefNo: fields[115] as String?,
      micrNo: fields[116] as String?,
      fdFlag: fields[117] as String?,
      appKey: fields[118] as String?,
      guardianRelation: fields[119] as String?,
      mobileRelation: fields[120] as String?,
      emailRelation: fields[121] as String?,
      nom1Pan: fields[122] as String?,
      nom2Pan: fields[123] as String?,
      nom3Pan: fields[124] as String?,
      nomineeOpted: fields[125] as String?,
      jh1MobileRelation: fields[126] as String?,
      jh1EmailRelation: fields[127] as String?,
      jh2MobileRelation: fields[128] as String?,
      jh2EmailRelation: fields[129] as String?,
      nom1GuardianRelation: fields[130] as String?,
      nom2GuardianRelation: fields[131] as String?,
      nom3GuardianRelation: fields[132] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, InvestorModel obj) {
    writer
      ..writeByte(131)
      ..writeByte(0)
      ..write(obj.pageNumber)
      ..writeByte(1)
      ..write(obj.processMode)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.invName)
      ..writeByte(4)
      ..write(obj.pan)
      ..writeByte(5)
      ..write(obj.validPan)
      ..writeByte(6)
      ..write(obj.exemption)
      ..writeByte(7)
      ..write(obj.exemptCategory)
      ..writeByte(8)
      ..write(obj.exemptRefNo)
      ..writeByte(9)
      ..write(obj.dob)
      ..writeByte(10)
      ..write(obj.holdNature)
      ..writeByte(11)
      ..write(obj.taxStatus)
      ..writeByte(12)
      ..write(obj.kyc)
      ..writeByte(13)
      ..write(obj.fhCkyc)
      ..writeByte(14)
      ..write(obj.fhCkycRefNo)
      ..writeByte(15)
      ..write(obj.occupation)
      ..writeByte(16)
      ..write(obj.mfuCan)
      ..writeByte(17)
      ..write(obj.dpId)
      ..writeByte(18)
      ..write(obj.fatherName)
      ..writeByte(19)
      ..write(obj.motherName)
      ..writeByte(20)
      ..write(obj.trxnAcceptance)
      ..writeByte(21)
      ..write(obj.addr1)
      ..writeByte(22)
      ..write(obj.addr2)
      ..writeByte(23)
      ..write(obj.addr3)
      ..writeByte(25)
      ..write(obj.city)
      ..writeByte(26)
      ..write(obj.state)
      ..writeByte(27)
      ..write(obj.pincode)
      ..writeByte(28)
      ..write(obj.country)
      ..writeByte(29)
      ..write(obj.mobileNo)
      ..writeByte(30)
      ..write(obj.resPhone)
      ..writeByte(31)
      ..write(obj.offPhone)
      ..writeByte(32)
      ..write(obj.resFax)
      ..writeByte(33)
      ..write(obj.offFax)
      ..writeByte(34)
      ..write(obj.email)
      ..writeByte(35)
      ..write(obj.nriAddr1)
      ..writeByte(36)
      ..write(obj.nriAddr2)
      ..writeByte(37)
      ..write(obj.nriAddr3)
      ..writeByte(38)
      ..write(obj.nriCity)
      ..writeByte(39)
      ..write(obj.nriState)
      ..writeByte(40)
      ..write(obj.nriPincode)
      ..writeByte(41)
      ..write(obj.nriCountry)
      ..writeByte(42)
      ..write(obj.bankName)
      ..writeByte(43)
      ..write(obj.accNo)
      ..writeByte(44)
      ..write(obj.accType)
      ..writeByte(45)
      ..write(obj.ifscCode)
      ..writeByte(46)
      ..write(obj.branchName)
      ..writeByte(47)
      ..write(obj.branchAddr1)
      ..writeByte(48)
      ..write(obj.branchAddr2)
      ..writeByte(49)
      ..write(obj.branchAddr3)
      ..writeByte(50)
      ..write(obj.branchCity)
      ..writeByte(51)
      ..write(obj.branchPincode)
      ..writeByte(52)
      ..write(obj.branchCountry)
      ..writeByte(53)
      ..write(obj.jh1Name)
      ..writeByte(54)
      ..write(obj.jh1Pan)
      ..writeByte(55)
      ..write(obj.jh1ValidPan)
      ..writeByte(56)
      ..write(obj.jh1Exemption)
      ..writeByte(57)
      ..write(obj.jh1ExemptCategory)
      ..writeByte(58)
      ..write(obj.jh1ExemptRefNo)
      ..writeByte(59)
      ..write(obj.jh1Dob)
      ..writeByte(60)
      ..write(obj.jh1Kyc)
      ..writeByte(61)
      ..write(obj.jh1Ckyc)
      ..writeByte(62)
      ..write(obj.jh1CkycRefNo)
      ..writeByte(63)
      ..write(obj.jh1Email)
      ..writeByte(64)
      ..write(obj.jh1MobileNo)
      ..writeByte(65)
      ..write(obj.jh2Name)
      ..writeByte(67)
      ..write(obj.jh2Pan)
      ..writeByte(68)
      ..write(obj.jh2ValidPan)
      ..writeByte(69)
      ..write(obj.jh2Exemption)
      ..writeByte(70)
      ..write(obj.jh2ExemptCategory)
      ..writeByte(71)
      ..write(obj.jh2ExemptRefNo)
      ..writeByte(72)
      ..write(obj.jh2Dob)
      ..writeByte(73)
      ..write(obj.jh2Kyc)
      ..writeByte(74)
      ..write(obj.jh2Ckyc)
      ..writeByte(75)
      ..write(obj.jh2CkycRefNo)
      ..writeByte(76)
      ..write(obj.jh2Email)
      ..writeByte(77)
      ..write(obj.jh2MobileNo)
      ..writeByte(78)
      ..write(obj.noOfNominee)
      ..writeByte(79)
      ..write(obj.nominee1Type)
      ..writeByte(80)
      ..write(obj.nominee1Name)
      ..writeByte(81)
      ..write(obj.nominee1Dob)
      ..writeByte(82)
      ..write(obj.nominee1Addr1)
      ..writeByte(83)
      ..write(obj.nominee1Addr2)
      ..writeByte(84)
      ..write(obj.nominee1Addr3)
      ..writeByte(85)
      ..write(obj.nominee1City)
      ..writeByte(86)
      ..write(obj.nominee1State)
      ..writeByte(87)
      ..write(obj.nominee1Pincode)
      ..writeByte(88)
      ..write(obj.nominee1Relation)
      ..writeByte(89)
      ..write(obj.nominee1Percent)
      ..writeByte(90)
      ..write(obj.nominee1GuardName)
      ..writeByte(91)
      ..write(obj.nominee1GuardPan)
      ..writeByte(92)
      ..write(obj.nominee2Type)
      ..writeByte(93)
      ..write(obj.nominee2Name)
      ..writeByte(94)
      ..write(obj.nominee2Dob)
      ..writeByte(95)
      ..write(obj.nominee2Relation)
      ..writeByte(96)
      ..write(obj.nominee2Percent)
      ..writeByte(97)
      ..write(obj.nominee2GuardName)
      ..writeByte(98)
      ..write(obj.nominee2GuardPan)
      ..writeByte(99)
      ..write(obj.nominee3Type)
      ..writeByte(100)
      ..write(obj.nominee3Name)
      ..writeByte(101)
      ..write(obj.nominee3Dob)
      ..writeByte(102)
      ..write(obj.nominee3Relation)
      ..writeByte(103)
      ..write(obj.nominee3Percent)
      ..writeByte(104)
      ..write(obj.nominee3GuardName)
      ..writeByte(105)
      ..write(obj.nominee3GuardPan)
      ..writeByte(106)
      ..write(obj.guardName)
      ..writeByte(107)
      ..write(obj.guardPan)
      ..writeByte(108)
      ..write(obj.guardValidPan)
      ..writeByte(109)
      ..write(obj.guardExemption)
      ..writeByte(110)
      ..write(obj.guardExemptCategory)
      ..writeByte(111)
      ..write(obj.guardPanRefNo)
      ..writeByte(112)
      ..write(obj.guardDob)
      ..writeByte(113)
      ..write(obj.guardKyc)
      ..writeByte(114)
      ..write(obj.guardCkyc)
      ..writeByte(115)
      ..write(obj.guardCkycRefNo)
      ..writeByte(116)
      ..write(obj.micrNo)
      ..writeByte(117)
      ..write(obj.fdFlag)
      ..writeByte(118)
      ..write(obj.appKey)
      ..writeByte(119)
      ..write(obj.guardianRelation)
      ..writeByte(120)
      ..write(obj.mobileRelation)
      ..writeByte(121)
      ..write(obj.emailRelation)
      ..writeByte(122)
      ..write(obj.nom1Pan)
      ..writeByte(123)
      ..write(obj.nom2Pan)
      ..writeByte(124)
      ..write(obj.nom3Pan)
      ..writeByte(125)
      ..write(obj.nomineeOpted)
      ..writeByte(126)
      ..write(obj.jh1MobileRelation)
      ..writeByte(127)
      ..write(obj.jh1EmailRelation)
      ..writeByte(128)
      ..write(obj.jh2MobileRelation)
      ..writeByte(129)
      ..write(obj.jh2EmailRelation)
      ..writeByte(130)
      ..write(obj.nom1GuardianRelation)
      ..writeByte(131)
      ..write(obj.nom2GuardianRelation)
      ..writeByte(132)
      ..write(obj.nom3GuardianRelation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InvestorModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
