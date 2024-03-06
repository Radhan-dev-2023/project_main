import 'dart:developer';
import 'dart:io';
import 'dart:math' as Math;
import 'package:finfresh_mobile/model/account%20type%20model/account_type_model.dart';
import 'package:finfresh_mobile/model/bank%20details%20model/bank_details_model.dart';
import 'package:finfresh_mobile/model/bank%20list%20model/bank_list_model.dart';
import 'package:finfresh_mobile/services/add%20additional%20bank%20service/additional_bank_service.dart';
import 'package:finfresh_mobile/services/get%20bank%20details/get_bank_details.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:image/image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/src/image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

class BankController extends ChangeNotifier {
  final GlobalKey<FormState> formKeyforAddingBank = GlobalKey<FormState>();
  AdditionalBankService bankService = AdditionalBankService();
  TextEditingController accountController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController branchNameController = TextEditingController();
  MasterAccountDetail? accountype;
  String? accountypeToBackend;
  void updateAccountType(value) {
    accountype = value;
    accountypeToBackend = accountype?.accType;
    notifyListeners();
  }

  void updateBankname(value) {
    bankName = value;

    notifyListeners();
  }

  String? bankName;
  String? proofvalue;
  String proofValueTobackend = '';
  List<String> proofAccountDiscription = [
    'Cancelled cheque',
    "Bank passbook",
    "Bank statement",
    "Letter from Bank confirming the account",
    "IMPS Document",
  ];

  void updateProofValue(String newValue) {
    proofvalue = newValue;
    notifyListeners();

    if (proofvalue == 'Cancelled cheque') {
      proofValueTobackend = 'Original cancelled cheque';
    } else if (proofvalue == 'Bank passbook') {
      proofValueTobackend = 'Attested copy of bank passbook frontpage';
    } else if (proofvalue == 'Bank statement') {
      proofValueTobackend = 'Attested copy of bank statement';
    } else if (proofvalue == 'Letter from Bank confirming the account') {
      proofValueTobackend = 'Attested copy of bank letter';
    } else if (proofvalue == 'IMPS Document') {
      proofValueTobackend = 'IMPS';
    }
  }

  String? acctypValue;
  String acctypeTobackend = '';
  List<String> listofAccType = [
    'Savings Account',
    'Current Account',
    'Post Office Savings Bank Account',
    'Overdraft Account',
    'Cash/Credit',
  ];
  void updateAcctypeValue(String newValue) {
    acctypValue = newValue;
    notifyListeners();
    if (acctypValue == 'Savings Account') {
      acctypeTobackend = 'SB';
    } else if (acctypValue == 'Current Account') {
      acctypeTobackend = 'CA';
    } else if (acctypValue == 'Post Office Savings Bank Account') {
      acctypeTobackend = 'PSB';
    } else if (acctypValue == 'Overdraft Account') {
      acctypeTobackend = 'OD';
    } else if (acctypValue == 'Cash/Credit') {
      acctypeTobackend = 'CC';
    }
  }

  String? bankNameValue;
  bool loadingBank = false;
  Future<bool> bankAdding(context, String flag) async {
    loadingBank = true;
    notifyListeners();
    bool result = await bankService.addAdditionalBank(
      accountController.text,
      flag == 'I' ? accountypeToBackend ?? '' : acctypeTobackend,
      ifscController.text,
      bankCodeForCustomer,
      proofValueTobackend,
      branchNameController.text,
      context,
      flag,
    );
    if (result == true) {
      loadingBank = false;
      notifyListeners();
      return true;
    } else {
      loadingBank = false;
      notifyListeners();
      return false;
    }
  }

  bool loadingBankdelete = false;
  Future<bool> deletebank(
    context,
    String account,
    String accType,
    String ifsc,
    String bank,
    String proof,
    String branch,
  ) async {
    loadingBankdelete = true;
    notifyListeners();
    bool result = await bankService.addAdditionalBank(
      account,
      accType,
      ifsc,
      bank,
      proof,
      branch,
      context,
      "D",
    );
    if (result == true) {
      loadingBankdelete = false;
      notifyListeners();
      return true;
    } else {
      loadingBankdelete = false;
      notifyListeners();
      return false;
    }
  }

  String bankCodeForCustomer = '';
  BankDeatilsModel? bankDeatilsModel;
  GetBankDetailsService getBankDetailsService = GetBankDetailsService();
  bool hasDetailsBeenFetched = false;
  bool ifscLoading = false;
  Future<void> getbankDetailsWithIfsc(context, ifscCode) async {
    ifscLoading = true;
    try {
      bankDeatilsModel =
          await getBankDetailsService.getBankDetails(context, ifscCode);
      bankName = bankDeatilsModel?.bankDetails?.bank?[0].bankname ?? '';
      bankNameController.text =
          bankDeatilsModel?.bankDetails?.bank?[0].bankname ?? '';
      bankCodeForCustomer =
          bankDeatilsModel?.bankDetails?.bank?[0].bankcode ?? '';
      branchNameController.text = bankDeatilsModel?.bankDetails?.branch ?? '';
      hasDetailsBeenFetched = true;
      ifscLoading = false;

      notifyListeners();
      log(bankNameController.text);
      log('bank detailsinsettings == ${bankDeatilsModel?.bankDetails!.toJson()}');
    } catch (e) {
      logger.d('Failed with an exception$e');
      ifscLoading = false;
      notifyListeners();
    }
    ifscLoading = false;
    notifyListeners();
  }

  bool loadingbankList = false;
  BankListingModel? bankListingModel;
  Future<void> getBankList(context) async {
    loadingbankList = true;
    // notifyListeners();
    try {
      bankListingModel = await bankService.bankListing(context);
      loadingbankList = false;
      notifyListeners();
    } catch (e) {
      logger.d('Get bank list failed with an exception$e');
      loadingbankList = false;
      notifyListeners();
    }
  }

  bool loadingDefault = false;
  Future<void> changeBankDefult(context, int index) async {
    loadingDefault = true;
    notifyListeners();
    try {
      bool result = await bankService.setupDefaultBank(
        context,
        bankListingModel?.bank![index].iin ?? '',
        bankListingModel?.bank![index].accNo ?? '',
        bankListingModel?.bank![index].bankName ?? '',
      );
      if (result == true) {
        getBankList(context);
        loadingDefault = false;
        notifyListeners();
      } else {
        loadingDefault = false;
        notifyListeners();
      }
    } catch (e) {
      logger.d('change bank failed with an exception$e');
      loadingDefault = false;
      notifyListeners();
    }
  }

  int? currentIndex;
  void updateindex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  Future<void> getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      jpgTOpng(image!.path);
      // imagePdfFormate = await ImageToPdf.imageList(listOfFiles: [image]);
      // log('image path == ${imagePdfFormate}');
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

  File? image;
  final picker = ImagePicker();
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

  bool bankProofUpload = false;
  Future<bool> uploadBankProof(context) async {
    bankProofUpload = true;
    notifyListeners();
    try {
      bool result = await bankService.uploadBankProof(
        compressedImage!.path,
        accountController.text,
        bankCodeForCustomer,
        context,
      );
      if (result == true) {
        bankProofUpload = false;
        notifyListeners();
        return true;
      } else {
        bankProofUpload = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      bankProofUpload = false;
      notifyListeners();
      log('failed with an exception$e');
      return false;
    }
  }
}
