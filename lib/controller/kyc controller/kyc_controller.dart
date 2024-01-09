import 'dart:convert';

import 'package:finfresh_mobile/model/investors%20details/investors_details_model.dart';
import 'package:finfresh_mobile/model/tax%20status%20model/tax_status_model.dart';
import 'package:finfresh_mobile/services/kyc/create_customer.dart';
import 'package:finfresh_mobile/services/kyc/getinn_service.dart';
import 'package:finfresh_mobile/services/kyc/tax_status_service.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:flutter/material.dart';

class KycController extends ChangeNotifier {
  GetInnService getInnService = GetInnService();
  TaxMaster taxMaster = TaxMaster();
  List<MasterDetail> masterDetailList = [];
  List<dynamic> masterDetailsList = [];
  InvestorDetails investorDetails = InvestorDetails();
  CreateCustomer createCustomerService = CreateCustomer();
  TaxStatusService taxStatusService = TaxStatusService();
  List<String> taxStatusDescList = [];
  final GlobalKey<FormState> panformKey = GlobalKey<FormState>();
  final GlobalKey<FormState> banknameFormkey = GlobalKey<FormState>();
  final GlobalKey<FormState> bankAccountnumberFormkey = GlobalKey<FormState>();
  final GlobalKey<FormState> ifscCodeFormkey = GlobalKey<FormState>();
  TextEditingController panController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController address3Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController residencenumberController = TextEditingController();
  TextEditingController officenumberController = TextEditingController();
  TextEditingController residencefaxController = TextEditingController();
  TextEditingController officefaxController = TextEditingController();
  TextEditingController nriaddress1Controller = TextEditingController();
  TextEditingController nriaddress2Controller = TextEditingController();
  TextEditingController nriaddress3Controller = TextEditingController();
  TextEditingController nricityController = TextEditingController();
  TextEditingController nriCityController = TextEditingController();
  TextEditingController nriStateController = TextEditingController();
  TextEditingController nriCountryController = TextEditingController();
  TextEditingController nriPincodeController = TextEditingController();
  TextEditingController motherNameCotroller = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController banknameController = TextEditingController();
  TextEditingController accountnumberCotroller = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();
  TextEditingController nominee1address1Controller = TextEditingController();
  TextEditingController nominee1address2Controller = TextEditingController();
  TextEditingController nominee1address3Controller = TextEditingController();
  TextEditingController nominee1cityController = TextEditingController();
  TextEditingController nominee1pincodeController = TextEditingController();
  TextEditingController nominee1DOBController = TextEditingController();
  TextEditingController nominee1CountryController = TextEditingController();
  TextEditingController nominee1nameController = TextEditingController();
  TextEditingController nominee1gurdnameCotroller = TextEditingController();
  TextEditingController nominee1guardpanController = TextEditingController();
  TextEditingController nominee2address1Controller = TextEditingController();
  TextEditingController nominee2address2Controller = TextEditingController();
  TextEditingController nominee2address3Controller = TextEditingController();
  TextEditingController nominee2cityController = TextEditingController();
  TextEditingController nominee2pincodeController = TextEditingController();
  TextEditingController nominee2DOBController = TextEditingController();
  TextEditingController nominee2CountryController = TextEditingController();
  TextEditingController nominee2nameController = TextEditingController();
  TextEditingController nominee2gurdnameCotroller = TextEditingController();
  TextEditingController nominee2guardpanController = TextEditingController();
  TextEditingController nominee3address1Controller = TextEditingController();
  TextEditingController nominee3address2Controller = TextEditingController();
  TextEditingController nominee3address3Controller = TextEditingController();
  TextEditingController nominee3cityController = TextEditingController();
  TextEditingController nominee3pincodeController = TextEditingController();
  TextEditingController nominee3DOBController = TextEditingController();
  TextEditingController nominee3CountryController = TextEditingController();
  TextEditingController nominee3nameController = TextEditingController();
  TextEditingController nominee3gurdnameCotroller = TextEditingController();
  TextEditingController nominee3guardpanController = TextEditingController();
  String phonenumber = '';
  String email = '';
  bool taxpageloading = false;
  MasterDetail? taxStatusValue;
  String? taxcode = '';
  int? selectedIndex;
  String? selectedValue;
  String stateValue = 'State';
  var stateList = [
    'State',
    'Andaman and Nickobar icelands',
    'Andra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chandigarh',
    'Dadra and Nagar Haveli',
    'Daman and Diu',
    'Delhi',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal pradesh',
    'Jammu and Kashmir',
    'Karnataka',
    'Kerala',
    'West Bengal',
    'Lakshadweep',
    'Madhya Pradesh',
    'Maharashtra',
    // 'Maharastra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Puducherry',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Utter Pradesh',
    'Uttrakhand',
  ];
  String countvalue = "select Nominee count";

  List<String> countList = [
    "select Nominee count",
    "1",
    "2",
    "3",
  ];
  String typevalue = "select a type";
  String typevalueNominee2 = "select a type";
  String typevalueNominee3 = "select a type";
  List<String> typeList = ["select a type", "Minor", "major"];
  String selectRelationValue = 'Select relation';
  String selectRelationValueNominne2 = 'Select relation';
  String selectRelationValueNominne3 = 'Select relation';

  List<String> relation = [
    'Select relation',
    'Wife',
    'Husband',
    'Son',
    'Daughter',
    'Father',
    'Mother',
    'Brother',
    'Sister',
    'Grand son',
    'Sister',
    'Grand daughter',
    'Grand father',
    'Grand mother',
    'Other'
  ];
  String nominee1stateValue = 'State';
  updateNominee1StateValue(String? value) {
    nominee1stateValue = value ?? '';
    notifyListeners();
  }

  void updateRelation(String? value) {
    selectRelationValue = value ?? '';
    notifyListeners();
  }

  void updateRelationNominee2(String? value) {
    selectRelationValueNominne2 = value ?? '';
    notifyListeners();
  }

  void updateRelationNominee3(String? value) {
    selectRelationValueNominne2 = value ?? '';
    notifyListeners();
  }

  void updateTypeOfnominee(String? value) {
    typevalue = value ?? '';
    notifyListeners();
  }

  void updateTypeOfnominee2(String? value) {
    typevalueNominee2 = value ?? '';
    notifyListeners();
  }

  void updateTypeOfnominee3(String? value) {
    typevalueNominee3 = value ?? '';
    notifyListeners();
  }

  void updateCountValue(String? value) {
    countvalue = value ?? '';
    notifyListeners();
  }

  void updateStateValue(String? value) {
    stateValue = value ?? '';
    notifyListeners();
  }

  void updateTaxValue(value) {
    taxStatusValue = value ?? '';
    taxcode = taxStatusValue!.taxStatusCode;
    logger.d('tax code == $taxcode');
    notifyListeners();
  }

  setselectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  final List<String> options = [
    'Public sector service',
    'Government service',
    'Housewife',
    'Student',
    'Self employed',
    'Business',
    'Professional',
    'Retired',
    'Farmer',
    'Service',
    'Agriculture',
    'Private Sector service',
  ];

  void addingvaluetoModel() {
    investorDetails = InvestorDetails(
      processMode: 'P',
      title: '',
      invName: nameController.text,
      pan: panController.text,
      validPan: 'Y',
      exemption: 'N',
      exemptCategory: 'N',
      exemptRefNo: '',
      dob: dobController.text,
      holdNature: 'SI',
      taxStatus: taxcode ?? '',
      kyc: 'Y',
      fhCkyc: '',
      fhCkycRefNo: '',
      occupation: selectedValue ?? '',
      mfuCan: '',
      dpId: '',
      fatherName: fatherNameController.text,
      motherName: motherNameCotroller.text,
      trxnAcceptance: '',
      addr1: address1Controller.text,
      addr2: address2Controller.text,
      addr3: address3Controller.text,
      city: cityController.text,
      state: stateValue,
      // state: 'TN',
      pincode: pinCodeController.text,
      country: countryController.text,
      // country: "IND",
      mobileNo: phonenumber,
      resPhone: residencenumberController.text,
      offPhone: officenumberController.text,
      resFax: residencefaxController.text,
      offFax: officefaxController.text,
      email: email,
      nriAddr1: nriaddress1Controller.text,
      nriAddr2: nriaddress2Controller.text,
      nriAddr3: nriaddress3Controller.text,
      nriCity: nriCityController.text,
      nriState: nriStateController.text,
      nriPincode: nriPincodeController.text,
      nriCountry: nriCountryController.text,
      bankName: banknameController.text,
      accNo: accountnumberCotroller.text,
      accType: 'SB',
      ifscCode: ifscCodeController.text,
      branchName: 'String',
      branchAddr1: 'String',
      branchAddr2: 'String',
      branchAddr3: '',
      branchCity: '',
      branchPincode: '',
      branchCountry: '',
      jh1Name: '',
      jh1Pan: '',
      jh1ValidPan: '',
      jh1Exemption: '',
      jh1ExemptCategory: '',
      jh1ExemptRefNo: '',
      jh1Dob: '',
      jh1Kyc: '',
      jh1Ckyc: '',
      jh1CkycRefNo: '',
      jh1Email: '',
      jh1MobileNo: '',
      jh2Name: '',
      jh2Pan: '',
      jh2ValidPan: '',
      jh2Exemption: '',
      jh2ExemptCategory: '',
      jh2ExemptRefNo: '',
      jh2Dob: '',
      jh2Kyc: '',
      jh2Ckyc: '',
      jh2CkycRefNo: '',
      jh2Email: '',
      jh2MobileNo: '',
      noOfNominee: countvalue == "select Nominee count" ? '' : countvalue,
      nominee1Type: typevalue == 'select a type ' ? '' : typevalue,
      nominee1Name: nominee1nameController.text,
      nominee1Dob: nominee1DOBController.text,
      nominee1Addr1: nominee1address1Controller.text,
      nominee1Addr2: nominee1address2Controller.text,
      nominee1Addr3: nominee1address3Controller.text,
      nominee1City: nominee1cityController.text,
      nominee1State: nominee1stateValue == 'State' ? '' : nominee1stateValue,
      nominee1Pincode: nominee1pincodeController.text,
      nominee1Relation: '',
      // selectRelationValue == 'Select relation' ? '' : selectRelationValue,
      nominee1Percent: '',
      nominee1GuardName: nominee1gurdnameCotroller.text,
      nominee1GuardPan: nominee1guardpanController.text,
      nominee2Type: '',
      // typevalueNominee2 == 'select a type ' ? '' : typevalueNominee2,
      nominee2Name: nominee2nameController.text,
      nominee2Dob: nominee2DOBController.text,
      nominee2Relation: '',
      // nominee2Relation: selectRelationValueNominne2 == 'Select relation'
      //     ? ''
      //     : selectRelationValueNominne2,
      nominee2Percent: '',
      nominee2GuardName: nominee2gurdnameCotroller.text,
      nominee2GuardPan: nominee2guardpanController.text,
      nominee3Type: '',
      // typevalueNominee3 == 'select a type ' ? '' : typevalueNominee3,
      nominee3Name: nominee3nameController.text,
      nominee3Dob: nominee3DOBController.text,
      nominee3Relation: '',
      // nominee3Relation: selectRelationValueNominne3 == 'Select relation'
      //     ? ''
      //     : selectRelationValueNominne3,
      nominee3Percent: '',
      nominee3GuardName: nominee3gurdnameCotroller.text,
      nominee3GuardPan: nominee3guardpanController.text,
      guardName: '',
      guardPan: '',
      guardValidPan: '',
      guardExemption: '',
      guardExemptCategory: '',
      guardPanRefNo: '',
      guardDob: '',
      guardKyc: '',
      guardCkyc: '',
      guardCkycRefNo: '',
      micrNo: '',
      fdFlag: '',
      appKey: '',
      guardianRelation: '',
      mobileRelation: '',
      emailRelation: '',
      nom1Pan: '',
      nom2Pan: '',
      nom3Pan: '',
      nomineeOpted: 'N',
      jh1MobileRelation: '',
      jh1EmailRelation: '',
      jh2MobileRelation: '',
      jh2EmailRelation: '',
      nom1GuardianRelation: '',
      nom2GuardianRelation: '',
      nom3GuardianRelation: '',
    );
    logger.d('model vluee ==${investorDetails.toJson()}');
    notifyListeners();
  }

  Future<bool> getInn(String phoneNumber) async {
    bool isVerified =
        await getInnService.getInn(phoneNumber, panController.text, taxcode);
    return isVerified;
  }

  Future<bool> createCustomer(context) async {
    bool isCreated =
        await createCustomerService.createCustomer(investorDetails, context);
    if (isCreated) {
      logger.d('customer created successfully');
      return true;
    } else {
      logger.d('customer creation failed');
      return false;
    }
  }

  getTaxStatus() async {
    taxpageloading = true;

    String? taxStatusResponse = await taxStatusService.getTaxStatus();
    logger.d('tax status response == $taxStatusResponse');
    if (taxStatusResponse != null) {
      Map<String, dynamic> jsonResponse = json.decode(taxStatusResponse);
      masterDetailsList = jsonResponse['masterDetails'];
      // masterDetailList = jsonResponse['masterDetails'];
      taxStatusDescList = masterDetailsList
          .map((detail) => detail["TAX_STATUS_DESC"])
          .cast<String>()
          .toList();
      logger.d('taxStatusDescList====$taxStatusDescList');
      logger.d('tax status fetched successfully');
      taxpageloading = false;
      notifyListeners();
    } else {
      logger.d('tax status fetched failed');
      taxpageloading = false;
      notifyListeners();
    }
  }
}
