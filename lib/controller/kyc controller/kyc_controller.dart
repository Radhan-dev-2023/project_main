import 'package:finfresh_mobile/model/investors%20details/investors_details_model.dart';
import 'package:finfresh_mobile/services/kyc/create_customer.dart';
import 'package:finfresh_mobile/services/kyc/getinn_service.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:flutter/material.dart';

class KycController extends ChangeNotifier {
  GetInnService getInnService = GetInnService();
  InvestorDetails investorDetails = InvestorDetails();
  CreateCustomer createCustomerService = CreateCustomer();
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

  void updateStateValue(String? value) {
    stateValue = value ?? '';
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
      processMode: '',
      title: '',
      invName: nameController.text,
      pan: panController.text,
      validPan: '',
      exemption: '',
      exemptCategory: '',
      exemptRefNo: '',
      dob: dobController.text,
      holdNature: '',
      taxStatus: '',
      kyc: '',
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
      pincode: pinCodeController.text,
      country: countryController.text,
      mobileNo: '',
      resPhone: residencenumberController.text,
      offPhone: officenumberController.text,
      resFax: residencefaxController.text,
      offFax: officefaxController.text,
      email: '',
      nriAddr1: nriaddress1Controller.text,
      nriAddr2: nriaddress2Controller.text,
      nriAddr3: nriaddress3Controller.text,
      nriCity: nriCityController.text,
      nriState: nriStateController.text,
      nriPincode: nriPincodeController.text,
      nriCountry: nriCountryController.text,
      bankName: banknameController.text,
      accNo: accountnumberCotroller.text,
      accType: '',
      ifscCode: ifscCodeController.text,
      branchName: '',
      branchAddr1: '',
      branchAddr2: '',
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
      noOfNominee: '',
      nominee1Type: '',
      nominee1Name: '',
      nominee1Dob: '',
      nominee1Addr1: '',
      nominee1Addr2: '',
      nominee1Addr3: '',
      nominee1City: '',
      nominee1State: '',
      nominee1Pincode: '',
      nominee1Relation: '',
      nominee1Percent: '',
      nominee1GuardName: '',
      nominee1GuardPan: '',
      nominee2Type: '',
      nominee2Name: '',
      nominee2Dob: '',
      nominee2Relation: '',
      nominee2Percent: '',
      nominee2GuardName: '',
      nominee2GuardPan: '',
      nominee3Type: '',
      nominee3Name: '',
      nominee3Dob: '',
      nominee3Relation: '',
      nominee3Percent: '',
      nominee3GuardName: '',
      nominee3GuardPan: '',
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
        await getInnService.getInn(phoneNumber, panController.text);
    return isVerified;
  }

  Future<void> createCustomer() async {
    bool isCreated =
        await createCustomerService.createCustomer(investorDetails);
    if (isCreated) {
      logger.d('customer created successfully');
    } else {
      logger.d('customer creation failed');
    }
  }
}
