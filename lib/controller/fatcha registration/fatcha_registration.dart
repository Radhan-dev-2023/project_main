import 'dart:developer';

import 'package:finfresh_mobile/model/country%20model/country_model.dart';
import 'package:finfresh_mobile/model/source%20wealth%20model/source_wealth_model.dart';
import 'package:finfresh_mobile/model/state%20model/state_model.dart';
import 'package:finfresh_mobile/model/ubo%20income%20model/ubo_income_model.dart';
import 'package:finfresh_mobile/model/ubo%20model/ubo_model.dart';
import 'package:finfresh_mobile/services/fatcha%20services/fatcha_services.dart';
import 'package:finfresh_mobile/services/kyc/master_services.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:image/image.dart';
import 'dart:math' as Math;
import 'package:image/src/image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

class FatchaRegistrationController extends ChangeNotifier {
  TextEditingController countrybirthController = TextEditingController();
  TextEditingController placeofController = TextEditingController();
  TextEditingController ubocountrybirthController = TextEditingController();
  TextEditingController uboCountryController = TextEditingController();
  TextEditingController sponserentityController = TextEditingController();
  TextEditingController holdingPercentageController = TextEditingController();
  TextEditingController ubotinnumberController = TextEditingController();
  TextEditingController networthsignController = TextEditingController();
  TextEditingController netWorthController = TextEditingController();
  TextEditingController networthdate = TextEditingController();
  TextEditingController panController = TextEditingController();
  MasterService masterService = MasterService();
  FatchaServices fatchaServices = FatchaServices();
  UboModel? uboModel;
  UboMasterDetail? masterdetails;
  IncomeModelMaster? incomeModelMaster;
  SourceWealthModel? sourceWealthModel;
  SourceWealth? sourceWealth;

  IncomeModel? incomeModel;
  String? incomeCode;
  String? wealthCode;
  String? identityValue;
  String? ffivalue;
  String? stockvalue;
  String? ubocode;
  String? gendervalue;
  String? uboIdentity;
  List<String> genderlist = ['Male', 'Female', 'Other'];
  List<String> stockList = ['BSE', 'NSE', 'Others'];
  String identitytoBackend = '';
  List<String> ffiList = ['Y', "N"];
  List<String> identityList = [
    "Passport",
    'Election ID Card',
    "PAN Card",
    "ID Card",
    "Driving License",
    "UIDIA / Aadhar letter",
    "NREGA Job Card",
    "Others",
    "Not categorized",
    "TIN [Tax Payer Identification Number]",
    "Company Identification Number",
    "US GIIN",
    "Global Entity Identification Number",
  ];
  List<String> pepList = ['N', 'Y', 'R'];
  List<String> taxresidency = ['N', 'Y'];
  String? sponservalue;
  String? taxresidencyValue;

  String? pepvalue;
  Future<void> fetchUboIncome() async {
    incomeModel = await masterService.fetchUBOMaterIncome();
    notifyListeners();
  }

  Future<void> fetchUbo() async {
    uboModel = await masterService.fetchUBO();
    notifyListeners();
  }

  void updateubo(value) {
    masterdetails = value;
    ubocode = masterdetails?.code;
    notifyListeners();
  }

  void updateStockValue(value) {
    stockvalue = value;
    notifyListeners();
  }

  void updateGenderValue(value) {
    gendervalue = value;
    notifyListeners();
  }

  void updateSponser(value) {
    sponservalue = value;
    notifyListeners();
  }

  void updateIncomeValue(value) {
    incomeModelMaster = value;
    incomeCode = incomeModelMaster?.appIncomeCode;
    logger.d('tax code == $incomeCode');
    notifyListeners();
  }

  void updateSourceWealthValue(value) {
    sourceWealth = value;
    wealthCode = sourceWealth?.code;
    logger.d('tax code == $wealthCode');
    notifyListeners();
  }

  void updatePepValue(value) {
    pepvalue = value;
    notifyListeners();
  }

  void updatetheIdentitytype(value) {
    identityValue = value;
    notifyListeners();
    if (identityValue == 'Passport') {
      identitytoBackend = 'A';
    } else if (identityValue == 'Election ID Card') {
      identitytoBackend = 'B';
    } else if (identityValue == 'PAN Card') {
      identitytoBackend = 'C';
    } else if (identityValue == 'ID Card"') {
      identitytoBackend = 'D';
    } else if (identityValue == 'Driving License') {
      identitytoBackend = 'E';
    } else if (identityValue == 'UIDIA / Aadhar letter') {
      identitytoBackend = 'G';
    } else if (identityValue == 'NREGA Job Card') {
      identitytoBackend = 'H';
    } else if (identityValue == 'Others') {
      identitytoBackend = 'O';
    } else if (identityValue == 'Not categorized') {
      identitytoBackend = 'X';
    } else if (identityValue == 'TIN [Tax Payer Identification Number]') {
      identitytoBackend = 'T';
    } else if (identityValue == 'Company Identification Number') {
      identitytoBackend = 'C1 ';
    } else if (identityValue == 'US GIIN') {
      identitytoBackend = 'G1';
    } else if (identityValue == 'Global Entity Identification Number') {
      identitytoBackend = 'E1';
    }
  }

  String uboidentytobakend = '';
  void updateuboidentity(value) {
    uboIdentity = value;
    notifyListeners();
    if (uboIdentity == 'Passport') {
      uboidentytobakend = 'A';
    } else if (uboIdentity == 'Election ID Card') {
      uboidentytobakend = 'B';
    } else if (uboIdentity == 'PAN Card') {
      uboidentytobakend = 'C';
    } else if (uboIdentity == 'ID Card"') {
      uboidentytobakend = 'D';
    } else if (uboIdentity == 'Driving License') {
      uboidentytobakend = 'E';
    } else if (uboIdentity == 'UIDIA / Aadhar letter') {
      uboidentytobakend = 'G';
    } else if (uboIdentity == 'NREGA Job Card') {
      uboidentytobakend = 'H';
    } else if (uboIdentity == 'Others') {
      uboidentytobakend = 'O';
    } else if (uboIdentity == 'Not categorized') {
      uboidentytobakend = 'X';
    } else if (uboIdentity == 'TIN [Tax Payer Identification Number]') {
      uboidentytobakend = 'T';
    } else if (uboIdentity == 'Company Identification Number') {
      uboidentytobakend = 'C1 ';
    } else if (uboIdentity == 'US GIIN') {
      uboidentytobakend = 'G1';
    } else if (uboIdentity == 'Global Entity Identification Number') {
      uboidentytobakend = 'E1';
    }
  }

  void updateTaxresidencyValue(value) {
    taxresidencyValue = value;
    notifyListeners();
  }

  Future<void> fetchSourceWealth() async {
    sourceWealthModel = await masterService.fetchSourceWealth();
    notifyListeners();
  }

  CountryModel? countryModel;
  CountryMasterDetail? countryMasterDetail;
  String? countryCode;
  Future<void> fetchCountry() async {
    countryModel = await masterService.fetchCountries();
    notifyListeners();
  }

  String? stateCode;
  StateModel? stateModel;
  StateMasterDetail? stateMasterDetail;
  Future<void> fetchState() async {
    stateModel = await masterService.fetchStates();
    notifyListeners();
  }

  void updateCountryvalue(value) {
    countryMasterDetail = value;
    countryCode = countryMasterDetail?.countryCode;
    notifyListeners();
  }

  void updateStatevalue(value) {
    stateMasterDetail = value;
    stateCode = stateMasterDetail?.stateCode;
    notifyListeners();
  }

  bool loading = false;

  Future<bool> fatchRegistration(context) async {
    loading = true;
    notifyListeners();
    try {
      bool result = await fatchaServices.fatchaRegister(
        appincomeCode: incomeCode ?? '',
        networthsign: networthsignController.text,
        networth: netWorthController.text,
        networthdate: networthdate.text,
        sourcewealth: wealthCode ?? '',
        countryofbirth: countryCode ?? '',
        placeofbirth: stateCode ?? '',
        taxresidence: taxresidencyValue ?? '',
        identitytype: identitytoBackend,
        stockexchange: stockvalue ?? '',
        sponseravailability: sponservalue ?? '',
        ubomastercode: ubocode ?? '',
        ubobirthCountry: ubocountrybirthController.text,
        ubocountry: uboCountryController.text,
        uboGender: gendervalue ?? ' ',
        uboHoldingPercentage: holdingPercentageController.text,
        uboidentitytype: uboidentytobakend,
        uboTinNumber: ubotinnumberController.text,
        context: context,
      );
      if (result == true) {
        loading = false;
        notifyListeners();
        return true;
      } else {
        loading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      logger.d('Failed with an exception');
      loading = false;
      notifyListeners();
      return false;
    }
  }

  File? image;
  final picker = ImagePicker();
  Future<void> getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      jpgTOpng(image!.path);
      notifyListeners();
    }
  }

  img.Image? image1;
  String? name;
  String? modifiedFilePath;
  Future<void> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      jpgTOpng(image!.path);
      notifyListeners();
      log('image.pah == ${image!.path}');
    }
  }

  String? bankUpload;
  bool loadingPick = false;
  File? compressedImage;
  Future<void> jpgTOpng(path) async {
    loadingPick = true;
    notifyListeners();
    log('loadig ==$loadingPick');
    File imagePath = File(path);
    //get temporary directory
    final tempDir = await getTemporaryDirectory();
    int rand = Math.Random().nextInt(10000);
    //reading jpg image
    img.Image? image = decodeImage(imagePath.readAsBytesSync());
    //decreasing the size of image- optional
    img.Image smallerImage = copyResize(image!, width: 800);
    //get converting and saving in file
    compressedImage = File('${tempDir.path}/img_$rand.png')
      ..writeAsBytesSync(encodePng(smallerImage, level: 8));

    log('compressed path${compressedImage!.path}');
    loadingPick = false;
    notifyListeners();
  }

  bool proofUpload = false;
  Future<bool> uploadProof(context) async {
    proofUpload = true;
    notifyListeners();
    try {
      bool result = await fatchaServices.uploadFatchaProof(
          compressedImage!.path, panController.text, context);
      if (result == true) {
        proofUpload = false;
        notifyListeners();
        return true;
      } else {
        proofUpload = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      log('failed with an exception$e');
      proofUpload = false;
      notifyListeners();
      return false;
    }
  }
}
