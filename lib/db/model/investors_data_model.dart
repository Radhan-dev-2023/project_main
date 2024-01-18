import 'package:hive/hive.dart';
part 'investors_data_model.g.dart';

@HiveType(typeId: 1)
class InvestorModel {
  @HiveField(0)
  String? pageNumber;
  @HiveField(1)
  String? processMode;
  @HiveField(2)
  String? title;
  @HiveField(3)
  String? invName;
  @HiveField(4)
  String? pan;
  @HiveField(5)
  String? validPan;
  @HiveField(6)
  String? exemption;
  @HiveField(7)
  String? exemptCategory;
  @HiveField(8)
  String? exemptRefNo;
  @HiveField(9)
  String? dob;
  @HiveField(10)
  String? holdNature;
  @HiveField(11)
  String? taxStatus;
  @HiveField(12)
  String? kyc;
  @HiveField(13)
  String? fhCkyc;
  @HiveField(14)
  String? fhCkycRefNo;
  @HiveField(15)
  String? occupation;
  @HiveField(16)
  String? mfuCan;
  @HiveField(17)
  String? dpId;
  @HiveField(18)
  String? fatherName;
  @HiveField(19)
  String? motherName;
  @HiveField(20)
  String? trxnAcceptance;
  @HiveField(21)
  String? addr1;
  @HiveField(22)
  String? addr2;
  @HiveField(23)
  String? addr3;
  @HiveField(25)
  String? city;
  @HiveField(26)
  String? state;
  @HiveField(27)
  String? pincode;
  @HiveField(28)
  String? country;
  @HiveField(29)
  String? mobileNo;
  @HiveField(30)
  String? resPhone;
  @HiveField(31)
  String? offPhone;
  @HiveField(32)
  String? resFax;
  @HiveField(33)
  String? offFax;
  @HiveField(34)
  String? email;
  @HiveField(35)
  String? nriAddr1;
  @HiveField(36)
  String? nriAddr2;
  @HiveField(37)
  String? nriAddr3;
  @HiveField(38)
  String? nriCity;
  @HiveField(39)
  String? nriState;
  @HiveField(40)
  String? nriPincode;
  @HiveField(41)
  String? nriCountry;
  @HiveField(42)
  String? bankName;
  @HiveField(43)
  String? accNo;
  @HiveField(44)
  String? accType;
  @HiveField(45)
  String? ifscCode;
  @HiveField(46)
  String? branchName;
  @HiveField(47)
  String? branchAddr1;
  @HiveField(48)
  String? branchAddr2;
  @HiveField(49)
  String? branchAddr3;
  @HiveField(50)
  String? branchCity;
  @HiveField(51)
  String? branchPincode;
  @HiveField(52)
  String? branchCountry;
  @HiveField(53)
  String? jh1Name;
  @HiveField(54)
  String? jh1Pan;
  @HiveField(55)
  String? jh1ValidPan;
  @HiveField(56)
  String? jh1Exemption;
  @HiveField(57)
  String? jh1ExemptCategory;
  @HiveField(58)
  String? jh1ExemptRefNo;
  @HiveField(59)
  String? jh1Dob;
  @HiveField(60)
  String? jh1Kyc;
  @HiveField(61)
  String? jh1Ckyc;
  @HiveField(62)
  String? jh1CkycRefNo;
  @HiveField(63)
  String? jh1Email;
  @HiveField(64)
  String? jh1MobileNo;
  @HiveField(65)
  String? jh2Name;
  @HiveField(67)
  String? jh2Pan;
  @HiveField(68)
  String? jh2ValidPan;
  @HiveField(69)
  String? jh2Exemption;
  @HiveField(70)
  String? jh2ExemptCategory;
  @HiveField(71)
  String? jh2ExemptRefNo;
  @HiveField(72)
  String? jh2Dob;
  @HiveField(73)
  String? jh2Kyc;
  @HiveField(74)
  String? jh2Ckyc;
  @HiveField(75)
  String? jh2CkycRefNo;
  @HiveField(76)
  String? jh2Email;
  @HiveField(77)
  String? jh2MobileNo;
  @HiveField(78)
  String? noOfNominee;
  @HiveField(79)
  String? nominee1Type;
  @HiveField(80)
  String? nominee1Name;
  @HiveField(81)
  String? nominee1Dob;
  @HiveField(82)
  String? nominee1Addr1;
  @HiveField(83)
  String? nominee1Addr2;
  @HiveField(84)
  String? nominee1Addr3;
  @HiveField(85)
  String? nominee1City;
  @HiveField(86)
  String? nominee1State;
  @HiveField(87)
  String? nominee1Pincode;
  @HiveField(88)
  String? nominee1Relation;
  @HiveField(89)
  String? nominee1Percent;
  @HiveField(90)
  String? nominee1GuardName;
  @HiveField(91)
  String? nominee1GuardPan;
  @HiveField(92)
  String? nominee2Type;
  @HiveField(93)
  String? nominee2Name;
  @HiveField(94)
  String? nominee2Dob;
  @HiveField(95)
  String? nominee2Relation;
  @HiveField(96)
  String? nominee2Percent;
  @HiveField(97)
  String? nominee2GuardName;
  @HiveField(98)
  String? nominee2GuardPan;
  @HiveField(99)
  String? nominee3Type;
  @HiveField(100)
  String? nominee3Name;
  @HiveField(101)
  String? nominee3Dob;
  @HiveField(102)
  String? nominee3Relation;
  @HiveField(103)
  String? nominee3Percent;
  @HiveField(104)
  String? nominee3GuardName;
  @HiveField(105)
  String? nominee3GuardPan;
  @HiveField(106)
  String? guardName;
  @HiveField(107)
  String? guardPan;
  @HiveField(108)
  String? guardValidPan;
  @HiveField(109)
  String? guardExemption;
  @HiveField(110)
  String? guardExemptCategory;
  @HiveField(111)
  String? guardPanRefNo;
  @HiveField(112)
  String? guardDob;
  @HiveField(113)
  String? guardKyc;
  @HiveField(114)
  String? guardCkyc;
  @HiveField(115)
  String? guardCkycRefNo;
  @HiveField(116)
  String? micrNo;
  @HiveField(117)
  String? fdFlag;
  @HiveField(118)
  String? appKey;
  @HiveField(119)
  String? guardianRelation;
  @HiveField(120)
  String? mobileRelation;
  @HiveField(121)
  String? emailRelation;
  @HiveField(122)
  String? nom1Pan;
  @HiveField(123)
  String? nom2Pan;
  @HiveField(124)
  String? nom3Pan;
  @HiveField(125)
  String? nomineeOpted;
  @HiveField(126)
  String? jh1MobileRelation;
  @HiveField(127)
  String? jh1EmailRelation;
  @HiveField(128)
  String? jh2MobileRelation;
  @HiveField(129)
  String? jh2EmailRelation;
  @HiveField(130)
  String? nom1GuardianRelation;
  @HiveField(131)
  String? nom2GuardianRelation;
  @HiveField(132)
  String? nom3GuardianRelation;

  InvestorModel({
    this.pageNumber,
    this.processMode,
    this.title,
    this.invName,
    this.pan,
    this.validPan,
    this.exemption,
    this.exemptCategory,
    this.exemptRefNo,
    this.dob,
    this.holdNature,
    this.taxStatus,
    this.kyc,
    this.fhCkyc,
    this.fhCkycRefNo,
    this.occupation,
    this.mfuCan,
    this.dpId,
    this.fatherName,
    this.motherName,
    this.trxnAcceptance,
    this.addr1,
    this.addr2,
    this.addr3,
    this.city,
    this.state,
    this.pincode,
    this.country,
    this.mobileNo,
    this.resPhone,
    this.offPhone,
    this.resFax,
    this.offFax,
    this.email,
    this.nriAddr1,
    this.nriAddr2,
    this.nriAddr3,
    this.nriCity,
    this.nriState,
    this.nriPincode,
    this.nriCountry,
    this.bankName,
    this.accNo,
    this.accType,
    this.ifscCode,
    this.branchName,
    this.branchAddr1,
    this.branchAddr2,
    this.branchAddr3,
    this.branchCity,
    this.branchPincode,
    this.branchCountry,
    this.jh1Name,
    this.jh1Pan,
    this.jh1ValidPan,
    this.jh1Exemption,
    this.jh1ExemptCategory,
    this.jh1ExemptRefNo,
    this.jh1Dob,
    this.jh1Kyc,
    this.jh1Ckyc,
    this.jh1CkycRefNo,
    this.jh1Email,
    this.jh1MobileNo,
    this.jh2Name,
    this.jh2Pan,
    this.jh2ValidPan,
    this.jh2Exemption,
    this.jh2ExemptCategory,
    this.jh2ExemptRefNo,
    this.jh2Dob,
    this.jh2Kyc,
    this.jh2Ckyc,
    this.jh2CkycRefNo,
    this.jh2Email,
    this.jh2MobileNo,
    this.noOfNominee,
    this.nominee1Type,
    this.nominee1Name,
    this.nominee1Dob,
    this.nominee1Addr1,
    this.nominee1Addr2,
    this.nominee1Addr3,
    this.nominee1City,
    this.nominee1State,
    this.nominee1Pincode,
    this.nominee1Relation,
    this.nominee1Percent,
    this.nominee1GuardName,
    this.nominee1GuardPan,
    this.nominee2Type,
    this.nominee2Name,
    this.nominee2Dob,
    this.nominee2Relation,
    this.nominee2Percent,
    this.nominee2GuardName,
    this.nominee2GuardPan,
    this.nominee3Type,
    this.nominee3Name,
    this.nominee3Relation,
    this.nominee3Dob,
    this.nominee3Percent,
    this.nominee3GuardName,
    this.nominee3GuardPan,
    this.guardName,
    this.guardPan,
    this.guardValidPan,
    this.guardExemption,
    this.guardExemptCategory,
    this.guardPanRefNo,
    this.guardDob,
    this.guardKyc,
    this.guardCkyc,
    this.guardCkycRefNo,
    this.micrNo,
    this.fdFlag,
    this.appKey,
    this.guardianRelation,
    this.mobileRelation,
    this.emailRelation,
    this.nom1Pan,
    this.nom2Pan,
    this.nom3Pan,
    this.nomineeOpted,
    this.jh1MobileRelation,
    this.jh1EmailRelation,
    this.jh2MobileRelation,
    this.jh2EmailRelation,
    this.nom1GuardianRelation,
    this.nom2GuardianRelation,
    this.nom3GuardianRelation,
  });
}
