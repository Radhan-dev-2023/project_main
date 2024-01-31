import 'dart:convert';
import 'dart:developer';

import 'package:finfresh_mobile/db/functions/db_functions.dart';
import 'package:finfresh_mobile/db/model/investors_data_model.dart';
import 'package:finfresh_mobile/model/account%20type%20model/account_type_model.dart';
import 'package:finfresh_mobile/model/bank%20details%20model/bank_details_model.dart';
import 'package:finfresh_mobile/model/holding%20nature%20model/holding_nature_model.dart';
import 'package:finfresh_mobile/model/investors%20details/investors_details_model.dart';
import 'package:finfresh_mobile/model/tax%20status%20model/tax_status_model.dart';
import 'package:finfresh_mobile/services/get%20bank%20details/get_bank_details.dart';
import 'package:finfresh_mobile/services/kyc/create_customer.dart';
import 'package:finfresh_mobile/services/kyc/getinn_service.dart';
import 'package:finfresh_mobile/services/kyc/master_services.dart';
import 'package:finfresh_mobile/services/kyc/non_individual_service.dart';
import 'package:finfresh_mobile/services/kyc/tax_status_service.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path/path.dart';

class KycController extends ChangeNotifier {
  GetInnService getInnService = GetInnService();
  TaxMaster taxMaster = TaxMaster();
  MasterService masterService = MasterService();
  NonIndividualService nonIndividualService = NonIndividualService();
  List<MasterDetail> masterDetailList = [];
  List<dynamic> masterDetailsList = [];
  InvestorDetails investorDetails = InvestorDetails();
  CreateCustomer createCustomerService = CreateCustomer();
  TaxStatusService taxStatusService = TaxStatusService();
  List<String> taxStatusDescList = [];
  DbFunctions dbFunctions = DbFunctions();
  final GlobalKey<FormState> panformKey = GlobalKey<FormState>();
  final GlobalKey<FormState> banknameFormkey = GlobalKey<FormState>();
  final GlobalKey<FormState> bankAccountnumberFormkey = GlobalKey<FormState>();
  final GlobalKey<FormState> ifscCodeFormkey = GlobalKey<FormState>();
  final GlobalKey<FormState> addressFormkey = GlobalKey<FormState>();
  final GlobalKey<FormState> investornameFormkey = GlobalKey<FormState>();
  final GlobalKey<FormState> jh1Formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> jh2Formkey = GlobalKey<FormState>();
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
  TextEditingController nominee1panCotroller = TextEditingController();
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
  TextEditingController nominee2panCotroller = TextEditingController();
  TextEditingController nominee3address1Controller = TextEditingController();
  TextEditingController nominee3address2Controller = TextEditingController();
  TextEditingController nominee3address3Controller = TextEditingController();
  TextEditingController nominee3cityController = TextEditingController();
  TextEditingController nominee3pincodeController = TextEditingController();
  TextEditingController nominee3DOBController = TextEditingController();
  TextEditingController nominee3CountryController = TextEditingController();
  TextEditingController nominee3nameController = TextEditingController();
  TextEditingController nominee3panCotroller = TextEditingController();
  TextEditingController nominee3gurdnameCotroller = TextEditingController();
  TextEditingController nominee3guardpanController = TextEditingController();
  TextEditingController jh1DOBController = TextEditingController();
  TextEditingController jh1nameController = TextEditingController();
  TextEditingController jh1panController = TextEditingController();
  TextEditingController jh1phoneNumberCotroller = TextEditingController();
  TextEditingController jh1emailController = TextEditingController();
  TextEditingController jh2DOBController = TextEditingController();
  TextEditingController jh2nameController = TextEditingController();
  TextEditingController jh2panController = TextEditingController();
  TextEditingController jh2phoneNumberCotroller = TextEditingController();
  TextEditingController jh2emailController = TextEditingController();
  TextEditingController guardpanController = TextEditingController();
  TextEditingController guardnameCotroller = TextEditingController();
  TextEditingController guardDOBController = TextEditingController();
  String phonenumber = '';
  String? email;
  bool taxpageloading = false;
  MasterDetail? taxStatusValue;
  MasterHoldingDetail? holdingValue;
  MasterAccountDetail? acountypeValue;
  String? taxcode;
  int? selectedIndex;
  String? selectedValue;
  String nomineeOption = 'N';
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
  String guardianrelationvalue = 'Select Guardian relationShip';
  String gudianvalueToBackend = '';
  String nominee1guardRelationvalue = "Select Guardian relationShip";
  String nominee2guardRelationvalue = "Select Guardian relationShip";
  String nominee3guardRelationvalue = "Select Guardian relationShip";
  String nom1guardrelationtobackend = '';
  String nom2guardrelationtobackend = '';
  String nom3guardrelationtobackend = '';
  List<String> guardianRelation = [
    'Select Guardian relationShip',
    "Natural Guardian",
    "Legaly Appointed Guardian",
  ];
  updateguardRelationValue(String? value) {
    nominee1guardRelationvalue = value ?? '';
    notifyListeners();
    if (nominee1guardRelationvalue == "Natural Guardian") {
      gudianvalueToBackend = "NG";
    } else if (guardianrelationvalue == "Legaly Appointed Guardian") {
      gudianvalueToBackend = "LG";
      log('guardianrelationvalue == $gudianvalueToBackend ');
    }
  }

  updatenom1guardRelationValue(String? value) {
    nominee1guardRelationvalue = value ?? '';
    notifyListeners();
    if (nominee1guardRelationvalue == "Natural Guardian") {
      nom1guardrelationtobackend = "NG";
    } else if (nominee1guardRelationvalue == "Legaly Appointed Guardian") {
      nom1guardrelationtobackend = "LG";
      log('guardianrelationvalue == $gudianvalueToBackend ');
    }
  }

  updatenom2guardRelationValue(String? value) {
    nominee2guardRelationvalue = value ?? '';
    notifyListeners();
    if (nominee2guardRelationvalue == "Natural Guardian") {
      nom2guardrelationtobackend = "NG";
    } else if (nominee2guardRelationvalue == "Legaly Appointed Guardian") {
      nom2guardrelationtobackend = "LG";
      log('guardianrelationvalue == $gudianvalueToBackend ');
    }
  }

  updatenom3guardRelationValue(String? value) {
    nominee3guardRelationvalue = value ?? '';
    notifyListeners();
    if (nominee3guardRelationvalue == "Natural Guardian") {
      nom3guardrelationtobackend = "NG";
    } else if (nominee3guardRelationvalue == "Legaly Appointed Guardian") {
      nom3guardrelationtobackend = "LG";
      log('guardianrelationvalue == $gudianvalueToBackend ');
    }
  }

  String mobileRation = 'Select Mobile relation';
  String jh1MobileRelation = 'Select Mobile relation';
  String jh2MobileRelation = 'Select Mobile relation';
  String mobilerelationtobackend = '';
  List<String> mobileRelation = [
    'Select Mobile relation',
    "Self",
    "Spouse",
    "Dependent Children",
    "Dependent Parents",
    "Dependent Siblings",
    "Guardian",
    'PMS',
    "Custodian",
    "POA",
  ];
  updateMobileRelationValue(String? value) {
    mobileRation = value ?? '';
    notifyListeners();
    if (mobileRation == "Self") {
      mobilerelationtobackend = "SE";
    } else if (mobileRation == "Spouse") {
      mobilerelationtobackend = "SP";
    } else if (mobileRation == "Dependent Siblings") {
      mobilerelationtobackend = "DS";
      log('mobileRation == $mobilerelationtobackend');
    } else if (mobileRation == "Dependent Parents") {
      mobilerelationtobackend = "DP";
    } else if (mobileRation == "Dependent Children") {
      mobilerelationtobackend = "DC";
    } else if (mobileRation == "Guardian") {
      mobilerelationtobackend = "GD";
    } else if (mobileRation == "PMS") {
      mobilerelationtobackend = "PM";
    } else if (mobileRation == "Custodian") {
      mobilerelationtobackend = "CD";
    } else if (mobileRation == "POA") {
      mobilerelationtobackend = "PO";
    }
  }

  String jh1MobileRelationtoBckend = '';
  String jh2MobileRelationtoBckend = '';
  updateJH1MobileRelationValue(String? value) {
    jh1MobileRelation = value ?? '';
    notifyListeners();
    if (jh1MobileRelation == "Self") {
      jh1MobileRelationtoBckend = "SE";
    } else if (jh1MobileRelation == "Spouse") {
      jh1MobileRelationtoBckend = "SP";
    } else if (jh1MobileRelation == "Dependent Siblings") {
      jh1MobileRelationtoBckend = "DS";
    } else if (jh1MobileRelation == "Dependent Parents") {
      jh1MobileRelationtoBckend = "DP";
    } else if (jh1MobileRelation == "Dependent Children") {
      jh1MobileRelationtoBckend = "DC";
    } else if (jh1MobileRelation == "Guardian") {
      jh1MobileRelationtoBckend = "GD";
    } else if (jh1MobileRelation == "PMS") {
      jh1MobileRelationtoBckend = "PM";
    } else if (jh1MobileRelation == "Custodian") {
      jh1MobileRelationtoBckend = "CD";
    } else if (jh1MobileRelation == "POA") {
      jh1MobileRelationtoBckend = "PO";
    }
  }

  updateJH2MobileRelationValue(String? value) {
    jh2MobileRelation = value ?? '';
    notifyListeners();
    if (jh2MobileRelation == "Self") {
      jh2MobileRelationtoBckend = "SE";
    } else if (jh2MobileRelation == "Spouse") {
      jh2MobileRelationtoBckend = "SP";
    } else if (jh2MobileRelation == "Dependent Siblings") {
      jh2MobileRelationtoBckend = "DS";
      log('mobileRation == $mobilerelationtobackend');
    } else if (jh2MobileRelation == "Dependent Parents") {
      jh2MobileRelationtoBckend = "DP";
    } else if (jh2MobileRelation == "Dependent Children") {
      jh2MobileRelationtoBckend = "DC";
    } else if (jh2MobileRelation == "Guardian") {
      jh2MobileRelationtoBckend = "GD";
    } else if (jh2MobileRelation == "PMS") {
      jh2MobileRelationtoBckend = "PM";
    } else if (jh2MobileRelation == "Custodian") {
      jh2MobileRelationtoBckend = "CD";
    } else if (jh2MobileRelation == "POA") {
      jh2MobileRelationtoBckend = "PO";
    }
  }

  String guardEmailrelationTobacked = '';
  String emailRation = 'Select Email relation';
  String jh1emailRation = 'Select Email relation';
  String jh2emailRation = 'Select Email relation';
  List<String> emailRelation = [
    'Select Email relation',
    "Self",
    "Spouse",
    "Dependent Children",
    "Dependent Parents",
    "Dependent Siblings",
    "Guardian",
  ];
  String jh1EmailRelationtoBckend = '';
  String jh2EmailRelationtoBckend = '';
  void updatejh1EmailRelationValue(String? value) {
    jh1emailRation = value ?? '';
    notifyListeners();
    if (jh1emailRation == "Self") {
      jh1EmailRelationtoBckend = "SE";
    } else if (jh1emailRation == "Spouse") {
      jh1EmailRelationtoBckend = "SP";
    } else if (jh1emailRation == "Dependent Siblings") {
      jh1EmailRelationtoBckend = "DS";
      log('mobileRation == $guardEmailrelationTobacked');
    } else if (jh1emailRation == "Dependent Parents") {
      jh1EmailRelationtoBckend = "DP";
    } else if (jh1emailRation == "Dependent Children") {
      jh1EmailRelationtoBckend = "DC";
    } else if (jh1emailRation == "Guardian") {
      jh1EmailRelationtoBckend = "GD";
    }
  }

  void updatejh2EmailRelationValue(String? value) {
    jh2emailRation = value ?? '';
    notifyListeners();
    if (jh2emailRation == "Self") {
      jh2EmailRelationtoBckend = "SE";
    } else if (jh2emailRation == "Spouse") {
      jh2EmailRelationtoBckend = "SP";
    } else if (jh2emailRation == "Dependent Siblings") {
      jh2EmailRelationtoBckend = "DS";
      log('mobileRation == $guardEmailrelationTobacked');
    } else if (jh2emailRation == "Dependent Parents") {
      jh2EmailRelationtoBckend = "DP";
    } else if (jh2emailRation == "Dependent Children") {
      jh2EmailRelationtoBckend = "DC";
    } else if (jh2emailRation == "Guardian") {
      jh2EmailRelationtoBckend = "GD";
    }
  }

  void updateEmailRelationValue(String? value) {
    emailRation = value ?? '';
    notifyListeners();
    if (emailRation == "Self") {
      guardEmailrelationTobacked = "SE";
    } else if (emailRation == "Spouse") {
      guardEmailrelationTobacked = "SP";
    } else if (emailRation == "Dependent Siblings") {
      guardEmailrelationTobacked = "DS";
      log('mobileRation == $guardEmailrelationTobacked');
    } else if (emailRation == "Dependent Parents") {
      guardEmailrelationTobacked = "DP";
    } else if (emailRation == "Dependent Children") {
      guardEmailrelationTobacked = "DC";
    } else if (emailRation == "Guardian") {
      guardEmailrelationTobacked = "GD";
    }
  }

  String typevalue = "select a type";
  String typevalueNominee2 = "select a type";
  String typevalueNominee3 = "select a type";
  List<String> typeList = ["select a type", "Minor", "Major"];
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
  bool guardianSelected = false;
  void changeGuardianSelected(bool value) {
    guardianSelected = value;
    notifyListeners();
  }

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

  void nomineeChosse(String value) {
    log('valuee =$value');
    nomineeOption = value;
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
    taxStatusValue = value;
    taxcode = taxStatusValue?.taxStatusCode;
    logger.d('tax code == $taxcode');
    notifyListeners();
  }

  String? holdingValuetoBackend;
  void updateHoldingValue(value) {
    holdingValue = value;
    holdingValuetoBackend = holdingValue?.holdNatureCode;

    // taxcode = taxStatusValue?.taxStatusCode;
    logger.d('holdingNatureCode == $holdingValuetoBackend');
    notifyListeners();
  }

  void clearValueinAdress() {
    address1Controller.clear();
    address2Controller.clear();
    address3Controller.clear();
    cityController.clear();
    countryController.clear();
    pinCodeController.clear();
    stateValue = "State";
    residencenumberController.clear();
    officenumberController.clear();
    residencefaxController.clear();
    officefaxController.clear();
  }

  void clearValueinNri() {
    nriCityController.clear();
    nriCountryController.clear();
    nriStateController.clear();
    nriPincodeController.clear();
    nriaddress1Controller.clear();
    nriaddress2Controller.clear();
    nriaddress3Controller.clear();
  }

  void clearJH1value() {
    jh1DOBController.clear();
    jh1MobileRelation = 'Select Mobile relation';
    jh1emailController.clear();
    jh1phoneNumberCotroller.clear();
    jh1emailRation = 'Select Email relation';
    jh1nameController.clear();
    jh1panController.clear();
  }

  void clearJh2Value() {
    jh2DOBController.clear();
    jh2MobileRelation = 'Select Mobile relation';
    jh2emailRation = 'Select Email relation';
    jh2emailController.clear();
    jh2panController.clear();
    jh2phoneNumberCotroller.clear();
    jh2panController.clear();
  }

  void clearNom1vlaue() {
    nominee1CountryController.clear();
    nominee1DOBController.clear();
    nominee1cityController.clear();
    nominee1address1Controller.clear();
    nominee1address2Controller.clear();
    nominee1address3Controller.clear();
    nominee1pincodeController.clear();
    nominee1gurdnameCotroller.clear();
    nominee1guardpanController.clear();
    nominee1pincodeController.clear();
    nominee1panCotroller.clear();
    typevalue = "select a type";
    selectRelationValue = 'Select relation';
    nominee1guardRelationvalue = "Select Guardian relationShip";
    nominee1stateValue = 'State';
  }

  void clearnom2Value() {
    typevalueNominee2 = "select a type";
    selectRelationValueNominne2 = 'Select relation';
    nominee2guardRelationvalue = "Select Guardian relationShip";
    nominee2guardpanController.clear();
    nominee2gurdnameCotroller.clear();
    nominee2panCotroller.clear();
    nominee2DOBController.clear();
    nominee2nameController.clear();
  }

  void clearnom3Value() {
    typevalueNominee3 = "select a type";
    selectRelationValueNominne3 = 'Select relation';
    nominee3guardRelationvalue = "Select Guardian relationShip";
    nominee3guardpanController.clear();
    nominee3gurdnameCotroller.clear();
    nominee3panCotroller.clear();
    nominee3DOBController.clear();
    nominee3nameController.clear();
  }

  void clearGuardianValue() {
    guardDOBController.clear();
    guardnameCotroller.clear();
    guardpanController.clear();
    mobileRation = 'Select Mobile relation';
    guardianrelationvalue = 'Select Guardian relationShip';
    emailRation = 'Select Email relation';
  }

  String? accountypeToBackend;
  void updateAccountType(value) {
    acountypeValue = value;
    accountypeToBackend = acountypeValue?.accType;
    notifyListeners();
  }

  callHodingAndTax(context) async {
    await getTaxStatus(context);
    await getHoldingNature();
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
  String username = '';
  getusername() async {
    username = await SecureStorage.readToken('username');
    notifyListeners();
  }

  void updateSelectedValue(String? value) {
    selectedValue = value ?? '';
    notifyListeners();
  }

  BankDeatilsModel? bankDeatilsModel;
  bool ifscLoading = false;
  GetBankDetailsService getBankDetailsService = GetBankDetailsService();
  Future<bool> getbankDetailsWithIfsc(context, ifscCode) async {
    ifscLoading = true;
    notifyListeners();
    try {
      bankDeatilsModel =
          await getBankDetailsService.getBankDetails(context, ifscCode);
      log('bank detailsinkyc == ${bankDeatilsModel?.bankDetails!.toJson()}');
      ifscLoading = false;
      notifyListeners();
      return bankDeatilsModel?.bankDetails == null ? false : true;
    } catch (e) {
      logger.d('Failed with an exception$e');
      return false;
    }
  }

  void addingbankname() {
    banknameController.text = bankDeatilsModel?.bankDetails?.bank?[0] ?? '';
    SecureStorage.addToken('bankName', banknameController.text);
    notifyListeners();
  }

  void addingbankAccNumber() {
    SecureStorage.addToken('bankAccNumber', accountnumberCotroller.text);
    notifyListeners();
  }

  void updatePagenumber(String number) {
    log('page number ==$number');
    InvestorModel investorModel = InvestorModel(pageNumber: number);
    dbFunctions.updatePagenumber(investorModel);
  }

  void addpancardnumber() async {
    final investorDb = await Hive.openBox<InvestorModel>('investor_db');
    final retrievedValue = investorDb.get('email');
    log('phonenumber${retrievedValue?.mobileNo}email=${retrievedValue?.email}');
    InvestorModel investorModel = InvestorModel(
        email: retrievedValue?.email,
        mobileNo: retrievedValue?.mobileNo,
        pan: panController.text);
    dbFunctions.addTodb(investorModel);
  }

  void addtaxstatus() async {
    final investorDb = await Hive.openBox<InvestorModel>('investor_db');
    final retrievedValue = investorDb.get('email');
    InvestorModel investorModel = InvestorModel(
      email: retrievedValue?.email,
      mobileNo: retrievedValue?.mobileNo,
      pan: retrievedValue?.pan,
      invName: retrievedValue?.invName,
      dob: retrievedValue?.dob,
      taxStatus: taxcode ?? '',
      holdNature: holdingValuetoBackend ?? '',
    );
    dbFunctions.addTodb(investorModel);
  }

  void addOcupation() async {
    final investorDb = await Hive.openBox<InvestorModel>('investor_db');
    final retrievedValue = investorDb.get('email');
    InvestorModel investorModel = InvestorModel(
      email: retrievedValue?.email,
      mobileNo: retrievedValue?.mobileNo,
      pan: retrievedValue?.pan,
      taxStatus: retrievedValue?.taxStatus,
      holdNature: retrievedValue?.holdNature,
      invName: retrievedValue?.invName,
      dob: retrievedValue?.dob,
      occupation: selectedValue ?? '',
    );
    dbFunctions.addTodb(investorModel);
  }

  void addnameAndDOB() async {
    final investorDb = await Hive.openBox<InvestorModel>('investor_db');
    final retrievedValue = investorDb.get('email');
    log('phonenumber${retrievedValue?.mobileNo}email=${retrievedValue?.email} pan${retrievedValue?.pan}');

    InvestorModel investorModel = InvestorModel(
      email: retrievedValue?.email,
      mobileNo: retrievedValue?.mobileNo,
      pan: retrievedValue?.pan,
      // taxStatus: retrievedValue?.taxStatus,
      // holdNature: retrievedValue?.holdNature,
      // occupation: retrievedValue?.occupation,
      invName: nameController.text,
      dob: dobController.text,
    );
    dbFunctions.addTodb(investorModel);
  }

  void addAddress() async {
    final investorDb = await Hive.openBox<InvestorModel>('investor_db');
    final retrievedValue = investorDb.get('email');
    InvestorModel investorModel = InvestorModel(
      email: retrievedValue?.email,
      mobileNo: retrievedValue?.mobileNo,
      pan: retrievedValue?.pan,
      taxStatus: retrievedValue?.taxStatus,
      holdNature: retrievedValue?.holdNature,
      occupation: retrievedValue?.occupation,
      invName: retrievedValue?.invName,
      dob: retrievedValue?.dob,
      addr1: address1Controller.text,
      addr2: address2Controller.text,
      addr3: address3Controller.text,
      city: cityController.text,
      state: stateValue,
      country: countryController.text,
      pincode: pinCodeController.text,
      resPhone: residencenumberController.text,
      offPhone: officenumberController.text,
      resFax: residencefaxController.text,
      offFax: officefaxController.text,
    );
    dbFunctions.addTodb(investorModel);
  }

  void addnriAccount() async {
    final investorDb = await Hive.openBox<InvestorModel>('investor_db');
    final retrievedValue = investorDb.get('email');
    InvestorModel investorModel = InvestorModel(
      email: retrievedValue?.email,
      mobileNo: retrievedValue?.mobileNo,
      pan: retrievedValue?.pan,
      taxStatus: retrievedValue?.taxStatus,
      holdNature: retrievedValue?.holdNature,
      occupation: retrievedValue?.occupation,
      invName: retrievedValue?.invName,
      dob: retrievedValue?.dob,
      addr1: retrievedValue?.addr1,
      addr2: retrievedValue?.addr2,
      addr3: retrievedValue?.addr3,
      city: retrievedValue?.city,
      state: retrievedValue?.state,
      country: retrievedValue?.country,
      pincode: retrievedValue?.pincode,
      resPhone: retrievedValue?.resPhone,
      offPhone: retrievedValue?.offPhone,
      resFax: retrievedValue?.resFax,
      offFax: retrievedValue?.offFax,
      nriAddr1: nriaddress1Controller.text,
      nriAddr2: nriaddress2Controller.text,
      nriAddr3: nriaddress3Controller.text,
      nriCity: nriCityController.text,
      nriState: nriStateController.text,
      nriPincode: nriPincodeController.text,
      nriCountry: nriCountryController.text,
    );
    dbFunctions.addTodb(investorModel);
  }

  void addParentDetails() async {
    final investorDb = await Hive.openBox<InvestorModel>('investor_db');
    final retrievedValue = investorDb.get('email');
    InvestorModel investorModel = InvestorModel(
      email: retrievedValue?.email,
      mobileNo: retrievedValue?.mobileNo,
      pan: retrievedValue?.pan,
      taxStatus: retrievedValue?.taxStatus,
      holdNature: retrievedValue?.holdNature,
      occupation: retrievedValue?.occupation,
      invName: retrievedValue?.invName,
      dob: retrievedValue?.dob,
      addr1: retrievedValue?.addr1,
      addr2: retrievedValue?.addr2,
      addr3: retrievedValue?.addr3,
      city: retrievedValue?.city,
      state: retrievedValue?.state,
      country: retrievedValue?.country,
      pincode: retrievedValue?.pincode,
      resPhone: retrievedValue?.resPhone,
      offPhone: retrievedValue?.offPhone,
      resFax: retrievedValue?.resFax,
      offFax: retrievedValue?.offFax,
      nriAddr1: retrievedValue?.nriAddr1,
      nriAddr2: retrievedValue?.nriAddr2,
      nriAddr3: retrievedValue?.nriAddr3,
      nriCity: retrievedValue?.nriCity,
      nriState: retrievedValue?.nriState,
      nriPincode: retrievedValue?.nriPincode,
      nriCountry: retrievedValue?.nriCountry,
      fatherName: fatherNameController.text,
      motherName: motherNameCotroller.text,
    );
    dbFunctions.addTodb(investorModel);
  }

  void addIfsc() async {
    final investorDb = await Hive.openBox<InvestorModel>('investor_db');
    final retrievedValue = investorDb.get('email');
    InvestorModel investorModel = InvestorModel(
      email: retrievedValue?.email,
      mobileNo: retrievedValue?.mobileNo,
      pan: retrievedValue?.pan,
      taxStatus: retrievedValue?.taxStatus,
      holdNature: retrievedValue?.holdNature,
      occupation: retrievedValue?.occupation,
      invName: retrievedValue?.invName,
      dob: retrievedValue?.dob,
      addr1: retrievedValue?.addr1,
      addr2: retrievedValue?.addr2,
      addr3: retrievedValue?.addr3,
      city: retrievedValue?.city,
      state: retrievedValue?.state,
      country: retrievedValue?.country,
      pincode: retrievedValue?.pincode,
      resPhone: retrievedValue?.resPhone,
      offPhone: retrievedValue?.offPhone,
      resFax: retrievedValue?.resFax,
      offFax: retrievedValue?.offFax,
      nriAddr1: retrievedValue?.nriAddr1,
      nriAddr2: retrievedValue?.nriAddr2,
      nriAddr3: retrievedValue?.nriAddr3,
      nriCity: retrievedValue?.nriCity,
      nriState: retrievedValue?.nriState,
      nriPincode: retrievedValue?.nriPincode,
      nriCountry: retrievedValue?.nriCountry,
      fatherName: retrievedValue?.fatherName,
      motherName: retrievedValue?.motherName,
      ifscCode: ifscCodeController.text,
    );
    dbFunctions.addTodb(investorModel);
  }

  void addbankname() async {
    final investorDb = await Hive.openBox<InvestorModel>('investor_db');
    final retrievedValue = investorDb.get('email');

    InvestorModel investorModel = InvestorModel(
      email: retrievedValue?.email,
      mobileNo: retrievedValue?.mobileNo,
      pan: retrievedValue?.pan,
      taxStatus: retrievedValue?.taxStatus,
      holdNature: retrievedValue?.holdNature,
      occupation: retrievedValue?.occupation,
      invName: retrievedValue?.invName,
      dob: retrievedValue?.dob,
      addr1: retrievedValue?.addr1,
      addr2: retrievedValue?.addr2,
      addr3: retrievedValue?.addr3,
      city: retrievedValue?.city,
      state: retrievedValue?.state,
      country: retrievedValue?.country,
      pincode: retrievedValue?.pincode,
      resPhone: retrievedValue?.resPhone,
      offPhone: retrievedValue?.offPhone,
      resFax: retrievedValue?.resFax,
      offFax: retrievedValue?.offFax,
      nriAddr1: retrievedValue?.nriAddr1,
      nriAddr2: retrievedValue?.nriAddr2,
      nriAddr3: retrievedValue?.nriAddr3,
      nriCity: retrievedValue?.nriCity,
      nriState: retrievedValue?.nriState,
      nriPincode: retrievedValue?.nriPincode,
      nriCountry: retrievedValue?.nriCountry,
      fatherName: retrievedValue?.fatherName,
      motherName: retrievedValue?.motherName,
      ifscCode: retrievedValue?.ifscCode,
      bankName: banknameController.text,
      branchName: bankDeatilsModel?.bankDetails?.branch,
    );
    dbFunctions.addTodb(investorModel);
  }

  void addNominee() async {
    final investorDb = await Hive.openBox<InvestorModel>('investor_db');
    final retrievedValue = investorDb.get('email');
    InvestorModel investorModel = InvestorModel(
      email: retrievedValue?.email,
      mobileNo: retrievedValue?.mobileNo,
      pan: retrievedValue?.pan,
      taxStatus: retrievedValue?.taxStatus,
      holdNature: retrievedValue?.holdNature,
      occupation: retrievedValue?.occupation,
      invName: retrievedValue?.invName,
      dob: retrievedValue?.dob,
      addr1: retrievedValue?.addr1,
      addr2: retrievedValue?.addr2,
      addr3: retrievedValue?.addr3,
      city: retrievedValue?.city,
      state: retrievedValue?.state,
      country: retrievedValue?.country,
      pincode: retrievedValue?.pincode,
      resPhone: retrievedValue?.resPhone,
      offPhone: retrievedValue?.offPhone,
      resFax: retrievedValue?.resFax,
      offFax: retrievedValue?.offFax,
      nriAddr1: retrievedValue?.nriAddr1,
      nriAddr2: retrievedValue?.nriAddr2,
      nriAddr3: retrievedValue?.nriAddr3,
      nriCity: retrievedValue?.nriCity,
      nriState: retrievedValue?.nriState,
      nriPincode: retrievedValue?.nriPincode,
      nriCountry: retrievedValue?.nriCountry,
      fatherName: retrievedValue?.fatherName,
      motherName: retrievedValue?.motherName,
      ifscCode: retrievedValue?.ifscCode,
      bankName: retrievedValue?.bankName,

      branchName: retrievedValue?.branchName,
      accNo: retrievedValue?.accNo,
      accType: retrievedValue?.accType,
      jh1Name: retrievedValue?.jh1Name,
      jh1Pan: retrievedValue?.jh2Name,
      jh1ValidPan: '',
      jh1Exemption: '',
      jh1ExemptCategory: '',
      jh1ExemptRefNo: '',
      jh1Dob: retrievedValue?.jh1Dob,
      jh1Kyc: '',
      jh1Ckyc: '',
      jh1CkycRefNo: '',
      jh1Email: retrievedValue?.jh1Email,
      jh1MobileNo: retrievedValue?.jh1MobileNo,
      jh1MobileRelation: retrievedValue?.mobileRelation,
      jh1EmailRelation: retrievedValue?.emailRelation,
      jh2Name: retrievedValue?.jh2Name,
      jh2Pan: retrievedValue?.jh2Pan,
      jh2ValidPan: '',
      jh2Exemption: '',
      jh2ExemptCategory: '',
      jh2ExemptRefNo: '',
      jh2Dob: retrievedValue?.jh2Dob,
      jh2Kyc: '',
      jh2Ckyc: '',
      jh2CkycRefNo: '',
      jh2Email: retrievedValue?.jh2Email,
      jh2MobileNo: retrievedValue?.jh2MobileNo,
      jh2MobileRelation: retrievedValue?.jh2MobileRelation,
      jh2EmailRelation: retrievedValue?.jh2EmailRelation,
      guardianRelation: retrievedValue?.guardianRelation,
      mobileRelation: retrievedValue?.mobileRelation,
      emailRelation: retrievedValue?.emailRelation,
      guardName: retrievedValue?.guardName,
      guardPan: retrievedValue?.guardPan,
      guardValidPan: '',
      guardExemption: '',
      guardExemptCategory: '',
      guardPanRefNo: '',
      guardDob: retrievedValue?.guardDob,
      guardKyc: '',
      guardCkyc: '',
      guardCkycRefNo: '',
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
      nom1Pan: nominee1panCotroller.text,
      nom2Pan: nominee2panCotroller.text,
      nom3Pan: nominee3panCotroller.text,
      nom1GuardianRelation: nom1guardrelationtobackend,
      nom2GuardianRelation: nom2guardrelationtobackend,
      nom3GuardianRelation: nom3guardrelationtobackend,
    );
    dbFunctions.addTodb(investorModel);
  }

  void addGuardian() async {
    final investorDb = await Hive.openBox<InvestorModel>('investor_db');
    final retrievedValue = investorDb.get('email');
    InvestorModel investorModel = InvestorModel(
      email: retrievedValue?.email,
      mobileNo: retrievedValue?.mobileNo,
      pan: retrievedValue?.pan,
      taxStatus: retrievedValue?.taxStatus,
      holdNature: retrievedValue?.holdNature,
      occupation: retrievedValue?.occupation,
      invName: retrievedValue?.invName,
      dob: retrievedValue?.dob,
      addr1: retrievedValue?.addr1,
      addr2: retrievedValue?.addr2,
      addr3: retrievedValue?.addr3,
      city: retrievedValue?.city,
      state: retrievedValue?.state,
      country: retrievedValue?.country,
      pincode: retrievedValue?.pincode,
      resPhone: retrievedValue?.resPhone,
      offPhone: retrievedValue?.offPhone,
      resFax: retrievedValue?.resFax,
      offFax: retrievedValue?.offFax,
      nriAddr1: retrievedValue?.nriAddr1,
      nriAddr2: retrievedValue?.nriAddr2,
      nriAddr3: retrievedValue?.nriAddr3,
      nriCity: retrievedValue?.nriCity,
      nriState: retrievedValue?.nriState,
      nriPincode: retrievedValue?.nriPincode,
      nriCountry: retrievedValue?.nriCountry,
      fatherName: retrievedValue?.fatherName,
      motherName: retrievedValue?.motherName,
      ifscCode: retrievedValue?.ifscCode,
      bankName: retrievedValue?.bankName,
      branchName: retrievedValue?.branchName,
      accNo: retrievedValue?.accNo,
      accType: retrievedValue?.accType,
      jh1Name: retrievedValue?.jh1Name,
      jh1Pan: retrievedValue?.jh2Name,
      jh1ValidPan: '',
      jh1Exemption: '',
      jh1ExemptCategory: '',
      jh1ExemptRefNo: '',
      jh1Dob: retrievedValue?.jh1Dob,
      jh1Kyc: '',
      jh1Ckyc: '',
      jh1CkycRefNo: '',
      jh1Email: retrievedValue?.jh1Email,
      jh1MobileNo: retrievedValue?.jh1MobileNo,
      jh1MobileRelation: retrievedValue?.mobileRelation,
      jh1EmailRelation: retrievedValue?.emailRelation,
      jh2Name: retrievedValue?.jh2Name,
      jh2Pan: retrievedValue?.jh2Pan,
      jh2ValidPan: '',
      jh2Exemption: '',
      jh2ExemptCategory: '',
      jh2ExemptRefNo: '',
      jh2Dob: retrievedValue?.jh2Dob,
      jh2Kyc: '',
      jh2Ckyc: '',
      jh2CkycRefNo: '',
      jh2Email: retrievedValue?.jh2Email,
      jh2MobileNo: retrievedValue?.jh2MobileNo,
      jh2MobileRelation: retrievedValue?.jh2MobileRelation,
      jh2EmailRelation: retrievedValue?.jh2EmailRelation,
      noOfNominee: retrievedValue?.noOfNominee,
      nominee1Type: retrievedValue?.nominee1Type,
      nominee1Name: retrievedValue?.nominee1Name,
      nominee1Dob: retrievedValue?.nominee1Dob,
      nominee1Addr1: retrievedValue?.nominee1Addr1,
      nominee1Addr2: retrievedValue?.nominee1Addr2,
      nominee1Addr3: retrievedValue?.nominee1Addr3,
      nominee1City: retrievedValue?.nominee1City,
      nominee1State: retrievedValue?.nominee1State,
      nominee1Pincode: retrievedValue?.nominee1Pincode,
      nominee1Relation: '',
      // selectRelationValue == 'Select relation' ? '' : selectRelationValue,
      nominee1Percent: '',
      nominee1GuardName: retrievedValue?.nominee1GuardName,
      nominee1GuardPan: retrievedValue?.nominee1GuardPan,
      nominee2Type: '',
      // typevalueNominee2 == 'select a type ' ? '' : typevalueNominee2,
      nominee2Name: retrievedValue?.nominee2Name,
      nominee2Dob: retrievedValue?.nominee2Dob,
      nominee2Relation: '',
      // nominee2Relation: selectRelationValueNominne2 == 'Select relation'
      //     ? ''
      //     : selectRelationValueNominne2,
      nominee2Percent: '',
      nominee2GuardName: retrievedValue?.nominee2GuardName,
      nominee2GuardPan: retrievedValue?.nominee2GuardPan,
      nominee3Type: '',
      // typevalueNominee3 == 'select a type ' ? '' : typevalueNominee3,
      nominee3Name: retrievedValue?.nominee3Name,
      nominee3Dob: retrievedValue?.nominee3Dob,
      nominee3Relation: '',
      // nominee3Relation: selectRelationValueNominne3 == 'Select relation'
      //     ? ''
      //     : selectRelationValueNominne3,
      nominee3Percent: '',
      nominee3GuardName: retrievedValue?.nominee3GuardName,
      nominee3GuardPan: retrievedValue?.nominee3GuardPan,
      nom1Pan: retrievedValue?.nom1Pan,
      nom2Pan: retrievedValue?.nom2Pan,
      nom3Pan: retrievedValue?.nom3Pan,
      nom1GuardianRelation: retrievedValue?.nom1GuardianRelation,
      nom2GuardianRelation: retrievedValue?.nom2GuardianRelation,
      nom3GuardianRelation: retrievedValue?.nom3GuardianRelation,
      guardianRelation: gudianvalueToBackend,
      mobileRelation: mobilerelationtobackend,
      emailRelation: guardEmailrelationTobacked,
      guardName: guardnameCotroller.text,
      guardPan: guardpanController.text,
      guardValidPan: '',
      guardExemption: '',
      guardExemptCategory: '',
      guardPanRefNo: '',
      guardDob: guardDOBController.text,
      guardKyc: '',
      guardCkyc: '',
      guardCkycRefNo: '',
    );
    dbFunctions.addTodb(investorModel);
  }

  void addbanknameAccountnumber() async {
    final investorDb = await Hive.openBox<InvestorModel>('investor_db');
    final retrievedValue = investorDb.get('email');
    InvestorModel investorModel = InvestorModel(
      email: retrievedValue?.email,
      mobileNo: retrievedValue?.mobileNo,
      pan: retrievedValue?.pan,
      taxStatus: retrievedValue?.taxStatus,
      holdNature: retrievedValue?.holdNature,
      occupation: retrievedValue?.occupation,
      invName: retrievedValue?.invName,
      dob: retrievedValue?.dob,
      addr1: retrievedValue?.addr1,
      addr2: retrievedValue?.addr2,
      addr3: retrievedValue?.addr3,
      city: retrievedValue?.city,
      state: retrievedValue?.state,
      country: retrievedValue?.country,
      pincode: retrievedValue?.pincode,
      resPhone: retrievedValue?.resPhone,
      offPhone: retrievedValue?.offPhone,
      resFax: retrievedValue?.resFax,
      offFax: retrievedValue?.offFax,
      nriAddr1: retrievedValue?.nriAddr1,
      nriAddr2: retrievedValue?.nriAddr2,
      nriAddr3: retrievedValue?.nriAddr3,
      nriCity: retrievedValue?.nriCity,
      nriState: retrievedValue?.nriState,
      nriPincode: retrievedValue?.nriPincode,
      nriCountry: retrievedValue?.nriCountry,
      fatherName: retrievedValue?.fatherName,
      motherName: retrievedValue?.motherName,
      ifscCode: retrievedValue?.ifscCode,
      bankName: retrievedValue?.bankName,
      branchName: retrievedValue?.branchName,
      accNo: accountnumberCotroller.text,
      accType: accountypeToBackend ?? 'SB',
    );
    dbFunctions.addTodb(investorModel);
  }

  void addJointholder1() async {
    final investorDb = await Hive.openBox<InvestorModel>('investor_db');
    final retrievedValue = investorDb.get('email');
    InvestorModel investorModel = InvestorModel(
      email: retrievedValue?.email,
      mobileNo: retrievedValue?.mobileNo,
      pan: retrievedValue?.pan,
      taxStatus: retrievedValue?.taxStatus,
      holdNature: retrievedValue?.holdNature,
      occupation: retrievedValue?.occupation,
      invName: retrievedValue?.invName,
      dob: retrievedValue?.dob,
      addr1: retrievedValue?.addr1,
      addr2: retrievedValue?.addr2,
      addr3: retrievedValue?.addr3,
      city: retrievedValue?.city,
      state: retrievedValue?.state,
      country: retrievedValue?.country,
      pincode: retrievedValue?.pincode,
      resPhone: retrievedValue?.resPhone,
      offPhone: retrievedValue?.offPhone,
      resFax: retrievedValue?.resFax,
      offFax: retrievedValue?.offFax,
      nriAddr1: retrievedValue?.nriAddr1,
      nriAddr2: retrievedValue?.nriAddr2,
      nriAddr3: retrievedValue?.nriAddr3,
      nriCity: retrievedValue?.nriCity,
      nriState: retrievedValue?.nriState,
      nriPincode: retrievedValue?.nriPincode,
      nriCountry: retrievedValue?.nriCountry,
      fatherName: retrievedValue?.fatherName,
      motherName: retrievedValue?.motherName,
      ifscCode: retrievedValue?.ifscCode,
      bankName: retrievedValue?.bankName,
      branchName: retrievedValue?.branchName,
      accNo: retrievedValue?.accNo,
      accType: retrievedValue?.accType,
      jh1Name: jh1nameController.text,
      jh1Pan: jh1panController.text,
      jh1ValidPan: '',
      jh1Exemption: '',
      jh1ExemptCategory: '',
      jh1ExemptRefNo: '',
      jh1Dob: jh1DOBController.text,
      jh1Kyc: '',
      jh1Ckyc: '',
      jh1CkycRefNo: '',
      jh1Email: jh1emailController.text,
      jh1MobileNo: jh1phoneNumberCotroller.text,
      jh1MobileRelation: jh1MobileRelationtoBckend,
      jh1EmailRelation: jh1EmailRelationtoBckend,
      jh2Name: jh2nameController.text,
      jh2Pan: jh2panController.text,
      jh2ValidPan: '',
      jh2Exemption: '',
      jh2ExemptCategory: '',
      jh2ExemptRefNo: '',
      jh2Dob: jh2DOBController.text,
      jh2Kyc: '',
      jh2Ckyc: '',
      jh2CkycRefNo: '',
      jh2Email: jh2emailController.text,
      jh2MobileNo: jh2phoneNumberCotroller.text,
      jh2MobileRelation: jh2MobileRelationtoBckend,
      jh2EmailRelation: jh2EmailRelationtoBckend,
    );
    dbFunctions.addTodb(investorModel);
  }

  void addbanknameToController() async {
    final investorDb = await Hive.openBox<InvestorModel>('investor_db');
    final retrievedValue = investorDb.get('bankName');
    banknameController.text = retrievedValue!.bankName ?? '';
  }

  bool loading = false;

  Future<void> addingvaluetoModel() async {
    loading = true;
    notifyListeners();
    // email = email == null ? investorDb.values.toList()[0].email : email;
    final investorDb = await Hive.openBox<InvestorModel>('investor_db');
    final retrievedValue = investorDb.get('email');
    log('retreieve vslure===${retrievedValue?.branchName} email${retrievedValue?.email}');
    investorDetails = InvestorDetails(
      processMode: 'D',
      title: '',
      invName: nameController.text.isEmpty
          ? retrievedValue?.invName
          : nameController.text,
      pan:
          panController.text.isEmpty ? retrievedValue?.pan : panController.text,
      validPan: 'Y',
      exemption: 'N',
      exemptCategory: 'N',
      exemptRefNo: '',
      dob:
          dobController.text.isEmpty ? retrievedValue?.dob : dobController.text,
      holdNature: holdingValuetoBackend ?? retrievedValue?.holdNature,
      taxStatus: taxcode ?? retrievedValue?.taxStatus,
      kyc: 'Y',
      fhCkyc: '',
      fhCkycRefNo: '',
      occupation: selectedValue ?? retrievedValue?.occupation,
      mfuCan: '',
      dpId: '',
      fatherName: fatherNameController.text.isEmpty
          ? retrievedValue?.fatherName
          : fatherNameController.text,
      motherName: motherNameCotroller.text.isEmpty
          ? retrievedValue?.motherName
          : motherNameCotroller.text,
      trxnAcceptance: '',
      addr1: address1Controller.text.isEmpty
          ? retrievedValue?.addr1
          : address1Controller.text,
      addr2: address2Controller.text.isEmpty
          ? retrievedValue?.addr2
          : address2Controller.text,
      addr3: address3Controller.text.isEmpty
          ? retrievedValue?.addr3
          : address3Controller.text,
      city: cityController.text.isEmpty
          ? retrievedValue?.city
          : cityController.text,
      state: stateValue == 'State' ? retrievedValue?.state : stateValue,
      // state: 'TN',
      pincode: pinCodeController.text.isEmpty
          ? retrievedValue?.pincode
          : pinCodeController.text,
      country: countryController.text.isEmpty
          ? retrievedValue?.country
          : countryController.text,
      // country: "IND",
      mobileNo: retrievedValue?.mobileNo,
      resPhone: residencenumberController.text.isEmpty
          ? retrievedValue?.resPhone
          : residencenumberController.text,
      offPhone: officenumberController.text.isEmpty
          ? retrievedValue?.offPhone
          : officenumberController.text,
      resFax: residencefaxController.text.isEmpty
          ? retrievedValue?.resFax
          : residencefaxController.text,
      offFax: officefaxController.text.isEmpty
          ? retrievedValue?.offFax
          : officefaxController.text,
      email: retrievedValue?.email,
      nriAddr1: nriaddress1Controller.text.isEmpty
          ? retrievedValue?.nriAddr1
          : nriaddress1Controller.text,
      nriAddr2: nriaddress2Controller.text.isEmpty
          ? retrievedValue?.nriAddr2
          : nriaddress2Controller.text,
      nriAddr3: nriaddress3Controller.text.isEmpty
          ? retrievedValue?.nriAddr3
          : nriaddress2Controller.text,
      nriCity: nriCityController.text.isEmpty
          ? retrievedValue?.nriCity
          : nricityController.text,
      nriState: nriStateController.text.isEmpty
          ? retrievedValue?.nriState
          : nriStateController.text,
      nriPincode: nriPincodeController.text.isEmpty
          ? retrievedValue?.nriPincode
          : nriPincodeController.text,
      nriCountry: nriCountryController.text.isEmpty
          ? retrievedValue?.nriCountry
          : nriCountryController.text,
      bankName: banknameController.text.isEmpty
          ? retrievedValue?.bankName
          : banknameController.text,
      accNo: accountnumberCotroller.text.isEmpty
          ? retrievedValue?.accNo
          : accountnumberCotroller.text,
      accType: accountypeToBackend ?? retrievedValue?.accType,
      ifscCode: ifscCodeController.text.isEmpty
          ? retrievedValue?.ifscCode
          : ifscCodeController.text,
      branchName:
          bankDeatilsModel?.bankDetails?.branch ?? retrievedValue?.branchName,
      branchAddr1: "String",
      branchAddr2: '',
      branchAddr3: '',
      branchCity: bankDeatilsModel?.bankDetails?.city ?? '',
      branchPincode: '',
      branchCountry: '',
      jh1Name: jh1nameController.text.isEmpty
          ? retrievedValue?.jh1Name
          : jh1nameController.text,
      jh1Pan: jh1panController.text.isEmpty
          ? retrievedValue?.jh1Pan
          : jh1panController.text,
      jh1ValidPan: '',
      jh1Exemption: '',
      jh1ExemptCategory: '',
      jh1ExemptRefNo: '',
      jh1Dob: jh1DOBController.text.isEmpty
          ? retrievedValue?.jh1Dob
          : jh1DOBController.text,
      jh1Kyc: '',
      jh1Ckyc: '',
      jh1CkycRefNo: '',
      jh1Email: jh1emailController.text.isEmpty
          ? retrievedValue?.jh1Email
          : jh1emailController.text,
      jh1MobileNo: jh1phoneNumberCotroller.text.isEmpty
          ? retrievedValue?.jh1MobileNo
          : jh1phoneNumberCotroller.text,
      jh2Name: jh2nameController.text.isEmpty
          ? retrievedValue?.jh2Name
          : jh2nameController.text,
      jh2Pan: jh2panController.text.isEmpty
          ? retrievedValue?.jh2Pan
          : jh2panController.text,
      jh2ValidPan: '',
      jh2Exemption: '',
      jh2ExemptCategory: '',
      jh2ExemptRefNo: '',
      jh2Dob: jh2DOBController.text.isEmpty
          ? retrievedValue?.jh2Dob
          : jh2DOBController.text,
      jh2Kyc: '',
      jh2Ckyc: '',
      jh2CkycRefNo: '',
      jh2Email: jh2emailController.text.isEmpty
          ? retrievedValue?.jh2Email
          : jh2emailController.text,
      jh2MobileNo: jh2phoneNumberCotroller.text.isEmpty
          ? retrievedValue?.jh2MobileNo
          : jh2phoneNumberCotroller.text,
      noOfNominee: countvalue == "select Nominee count"
          ? retrievedValue?.noOfNominee
          : countvalue,
      nominee1Type: typevalue == 'select a type '
          ? retrievedValue?.nominee1Type
          : typevalue,
      nominee1Name: nominee1nameController.text.isEmpty
          ? retrievedValue?.nominee1Name
          : nominee1nameController.text,
      nominee1Dob: nominee1DOBController.text.isEmpty
          ? retrievedValue?.nominee1Dob
          : nominee1DOBController.text,
      nominee1Addr1: nominee1address1Controller.text.isEmpty
          ? retrievedValue?.nominee1Addr1
          : nominee1address1Controller.text,
      nominee1Addr2: nominee1address2Controller.text.isEmpty
          ? retrievedValue?.nominee1Addr2
          : nominee1address2Controller.text,
      nominee1Addr3: nominee1address3Controller.text.isEmpty
          ? retrievedValue?.nominee1Addr3
          : nominee1address3Controller.text,
      nominee1City: nominee1cityController.text.isEmpty
          ? retrievedValue?.nominee1City
          : nominee1cityController.text,
      nominee1State: nominee1stateValue == 'State'
          ? retrievedValue?.nominee1State
          : nominee1stateValue,
      nominee1Pincode: nominee1pincodeController.text.isEmpty
          ? retrievedValue?.nominee1Pincode
          : nominee1pincodeController.text,
      nominee1Relation: '',
      // selectRelationValue == 'Select relation' ? '' : selectRelationValue,
      nominee1Percent: '',
      nominee1GuardName: nominee1gurdnameCotroller.text.isEmpty
          ? retrievedValue?.nominee1GuardName
          : nominee1gurdnameCotroller.text,
      nominee1GuardPan: nominee1guardpanController.text.isEmpty
          ? retrievedValue?.nominee1GuardPan
          : nominee1guardpanController.text,
      nominee2Type: '',
      // typevalueNominee2 == 'select a type ' ? '' : typevalueNominee2,
      nominee2Name: nominee2nameController.text.isEmpty
          ? retrievedValue?.nominee2Name
          : nominee2nameController.text,
      nominee2Dob: nominee2DOBController.text.isEmpty
          ? retrievedValue?.nominee2Dob
          : nominee2DOBController.text,
      nominee2Relation: '',
      // nominee2Relation: selectRelationValueNominne2 == 'Select relation'
      //     ? ''
      //     : selectRelationValueNominne2,
      nominee2Percent: '',
      nominee2GuardName: nominee2gurdnameCotroller.text.isEmpty
          ? retrievedValue?.nominee2GuardName
          : nominee2gurdnameCotroller.text,
      nominee2GuardPan: nominee2guardpanController.text.isEmpty
          ? retrievedValue?.nominee2GuardPan
          : nominee2guardpanController.text,
      nominee3Type: '',
      // typevalueNominee3 == 'select a type ' ? '' : typevalueNominee3,
      nominee3Name: nominee3nameController.text.isEmpty
          ? retrievedValue?.nominee3Name
          : nominee3nameController.text,
      nominee3Dob: nominee3DOBController.text.isEmpty
          ? retrievedValue?.nominee3Dob
          : nominee3DOBController.text,
      nominee3Relation: '',
      // nominee3Relation: selectRelationValueNominne3 == 'Select relation'
      //     ? ''
      //     : selectRelationValueNominne3,
      nominee3Percent: '',
      nominee3GuardName: nominee3gurdnameCotroller.text.isEmpty
          ? retrievedValue?.nominee3GuardName
          : nominee3gurdnameCotroller.text,
      nominee3GuardPan: nominee3guardpanController.text.isEmpty
          ? retrievedValue?.nominee3GuardPan
          : nominee3guardpanController.text,
      guardName: guardnameCotroller.text.isEmpty
          ? retrievedValue?.guardName
          : guardnameCotroller.text,
      guardPan: guardpanController.text.isEmpty
          ? retrievedValue?.guardPan
          : guardpanController.text,
      guardValidPan: '',
      guardExemption: '',
      guardExemptCategory: '',
      guardPanRefNo: '',
      guardDob: guardDOBController.text.isEmpty
          ? retrievedValue?.guardDob
          : guardDOBController.text,
      guardKyc: '',
      guardCkyc: '',
      guardCkycRefNo: '',
      micrNo: '',
      fdFlag: '',
      appKey: '',
      guardianRelation: gudianvalueToBackend.isEmpty
          ? retrievedValue?.guardianRelation
          : gudianvalueToBackend,
      mobileRelation: mobilerelationtobackend.isEmpty
          ? retrievedValue?.mobileRelation
          : mobilerelationtobackend,
      emailRelation: guardEmailrelationTobacked.isEmpty
          ? retrievedValue?.emailRelation
          : guardEmailrelationTobacked,
      nom1Pan: nominee1panCotroller.text.isEmpty
          ? retrievedValue?.nom1Pan
          : nominee1panCotroller.text,
      nom2Pan: nominee2panCotroller.text.isEmpty
          ? retrievedValue?.nom1Pan
          : nominee2panCotroller.text,
      nom3Pan: nominee3panCotroller.text.isEmpty
          ? retrievedValue?.nom3Pan
          : nominee3panCotroller.text,
      nomineeOpted:
          nomineeOption.isEmpty ? retrievedValue?.nomineeOpted : nomineeOption,
      jh1MobileRelation: jh1MobileRelationtoBckend.isEmpty
          ? retrievedValue?.jh1MobileRelation
          : jh1MobileRelationtoBckend,
      jh1EmailRelation: jh1EmailRelationtoBckend.isEmpty
          ? retrievedValue?.jh1EmailRelation
          : jh1EmailRelationtoBckend,
      jh2MobileRelation: jh2MobileRelationtoBckend.isEmpty
          ? retrievedValue?.jh2MobileRelation
          : jh2MobileRelationtoBckend,
      jh2EmailRelation: jh2EmailRelationtoBckend.isEmpty
          ? retrievedValue?.jh2EmailRelation
          : jh2EmailRelationtoBckend,
      nom1GuardianRelation: nom1guardrelationtobackend.isEmpty
          ? retrievedValue?.nom1GuardianRelation
          : nom1guardrelationtobackend,
      nom2GuardianRelation: nom2guardrelationtobackend.isEmpty
          ? retrievedValue?.nom2GuardianRelation
          : nom2guardrelationtobackend,
      nom3GuardianRelation: nom3guardrelationtobackend.isEmpty
          ? retrievedValue?.nom2GuardianRelation
          : nom3guardrelationtobackend,
    );
    logger.d('model vluee ==${investorDetails.toJson()}');
    loading = false;
    notifyListeners();
  }

  Future<bool> getNonIndividualTax(context) async {
    iinLoading = true;
    notifyListeners();
    try {
      bool result = await nonIndividualService.getNonindividualTax(
        phonenumber,
        panController.text,
        nameController.text,
        taxcode,
        context,
      );
      iinLoading = false;
      notifyListeners();
      return result;
    } catch (e) {
      logger.d('non individual failsed with an exception$e');
      iinLoading = false;
      notifyListeners();
      return false;
    }
  }

  bool iinLoading = false;
  Future<bool> getInn() async {
    String phoneNumber = await SecureStorage.readToken('phoneNumber');
    iinLoading = true;
    notifyListeners();
    bool isVerified = await getInnService.getInn(
        phoneNumber, panController.text, taxcode, holdingValuetoBackend);
    iinLoading = false;
    notifyListeners();
    return isVerified;
  }

  bool createcustomerLoading = false;
  Future<bool> createCustomer(context) async {
    createcustomerLoading = true;
    notifyListeners();

    bool isCreated =
        await createCustomerService.createCustomer(investorDetails, context);
    log('isCreated == $isCreated');
    if (isCreated == true) {
      createcustomerLoading = false;
      notifyListeners();
      logger.d('customer created successfully');
      return true;
    } else {
      logger.d('customer creation failed');
      createcustomerLoading = false;
      notifyListeners();
      return false;
    }
  }

  HoldingNatureModel? holdingNatureModel;

  getHoldingNature() async {
    taxpageloading = true;
    holdingNatureModel = await masterService.fetchData();
    // logger.d('holding nature response == $holdingResponse');
    if (holdingNatureModel != null) {
      // Map<String, dynamic> jsonResponse = json.decode(holdingResponse);

      taxpageloading = false;
      notifyListeners();
    } else {
      logger.d('tax status fetched failed');
      taxpageloading = false;
    }
  }

  getTaxStatus(context) async {
    taxpageloading = true;
    String? taxStatusResponse = await taxStatusService.getTaxStatus(context);
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

  AccountTypeModel? accountTypeModel;
  getAccountType() async {
    taxpageloading = true;
    accountTypeModel = await masterService.fetchAccountType();
    // logger.d('holding nature response == $holdingResponse');
    if (accountTypeModel != null) {
      // Map<String, dynamic> jsonResponse = json.decode(holdingResponse);

      taxpageloading = false;
      notifyListeners();
    } else {
      logger.d('account type fetched failed');
      taxpageloading = false;
    }
  }
}
