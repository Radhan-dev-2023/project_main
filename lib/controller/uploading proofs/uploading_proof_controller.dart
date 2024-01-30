import 'dart:developer';
import 'dart:io';

import 'package:finfresh_mobile/services/get%20bank%20code/bank_code_service.dart';
import 'package:finfresh_mobile/services/upload%20proof%20service/upload_proof_service.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart';
import 'dart:math' as Math;
import 'package:image/src/image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';

class UploadingProof extends ChangeNotifier {
  File? image;
  final picker = ImagePicker();
  BankCodeService bankCodeService = BankCodeService();
  File? imagePdfFormate;
  UploadProofservice uploadProofservice = UploadProofservice();
  String proofvalue = "Choose your proof";
  String vlauetoBackend = "";
  bool proofUpload = false;
  bool bankProofUpload = false;
  List<String> proofList = [
    "Choose your proof",
    "Aadhar Card",
    "Pan Card",
    "Driving License",
    "Passport",
    "INN Physical Form",
    "KRA Form",
    "Cheque",
    "ACH Form",
    "POA",
    "FATCA & AOF",
    "POA cheque",
    "IMPS DOCUMENT",
  ];

  String pOAValue = "Please select POAFlag";
  List<String> poaList = [
    "Please select POAFlag",
    'Yes',
    'No',
  ];
  String pOABankTypeValue = "Please select POABankType";
  List<String> poaBankTypeList = [
    "Please select POABankType",
    'DPCMS',
    'NDCPMS',
  ];

  void updatepoaBankTypeValue(String? value) {
    pOABankTypeValue = value ?? '';
    notifyListeners();
  }

  void updatepoaValue(String? value) {
    pOAValue = value ?? '';
    notifyListeners();
  }

  void updateProofValue(String? value) {
    proofvalue = value ?? '';

    if (proofvalue == "Aadhar Card") {
      vlauetoBackend = "AA";
    } else if (proofvalue == "Pan Card") {
      vlauetoBackend = "PC";
    } else if (proofvalue == "Driving License") {
      vlauetoBackend = "DL";
    } else if (proofvalue == "Passport") {
      vlauetoBackend = "PA";
    } else if (proofvalue == "INN Physical Form") {
      vlauetoBackend = "IP";
    } else if (proofvalue == "KRA Form") {
      vlauetoBackend = "KF";
    } else if (proofvalue == "Cheque") {
      vlauetoBackend = "CH";
    } else if (proofvalue == "ACH Form") {
      vlauetoBackend = "Ac";
    } else if (proofvalue == "POA") {
      vlauetoBackend = "P";
    } else if (proofvalue == "FATCA & AOF") {
      vlauetoBackend = "AF";
    } else if (proofvalue == "POA cheque") {
      vlauetoBackend = "PQ";
    } else if (proofvalue == "IMPS DOCUMENT") {
      vlauetoBackend = "IMps";
    } else {
      vlauetoBackend = "";
    }

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

  Future<bool> uploadProof(context) async {
    proofUpload = true;
    notifyListeners();
    try {
      bool result = await uploadProofservice.uploadProof(
          compressedImage!.path, vlauetoBackend, context);
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

  String bankCode = '';
  void getBankCode() async {
    bankCode = await bankCodeService.getBankCode();
    log('bankCode=$bankCode');
  }

  Future<bool> uploadBankProof(context) async {
    String bankcode = await SecureStorage.readToken('bankcode');
    bankProofUpload = true;
    notifyListeners();
    try {
      bool result = await uploadProofservice.uploadBankProof(
        compressedImage!.path,
        pOAValue,
        pOABankTypeValue,
        bankCode.isEmpty ? bankcode : bankCode,
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
