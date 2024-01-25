import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:finfresh_mobile/services/get%20bank%20code/bank_code_service.dart';
import 'package:finfresh_mobile/services/upload%20proof%20service/upload_proof_service.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart';
import 'dart:ui' as ui;
import 'package:image/src/image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:image_to_pdf_converter/image_to_pdf_converter.dart';

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
    "Bank Proof",
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
    'Y',
    'N',
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
    } else if (proofvalue == "Bank Proof") {
      vlauetoBackend = "B";
    } else {
      vlauetoBackend = "";
    }

    notifyListeners();
  }

  Future<void> getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);

      // img.Image image1 = img.decodeImage(Uint8List.fromList(inputBytes));

      imagePdfFormate = await ImageToPdf.imageList(listOfFiles: [image]);
      log('image path == ${imagePdfFormate}');

      notifyListeners(); // Notify listeners to update the UI
    }
  }

  img.Image? image1;
  String? name;
  Future<void> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      // convertImage(pickedFile.path);
      // image1 = convertTiff(image!.path);
      // log('image1===$image1');
      // Uint8List img2 = encodeTiff(image1!);
      // var img4 = decodeTiff(img2);
      // String resultString = String.fromCharCodes(img2);
      // String base64String = base64Encode(img2);
      // log('resultString$resultString');
      // List<int> decodedBytes = base64.decode(base64String);
      // String result = utf8.decode(decodedBytes);

      // Convert the decoded bytes to a regular string
      // String resultString = utf8.decode(decodedBytes);
      // log('resultend string ===$result');
      // log('img4===$img4');
      imagePdfFormate = await ImageToPdf.imageList(listOfFiles: [image]);
      log('image path == ${imagePdfFormate}');
      log('image.pah == ${image!.path}');
      notifyListeners(); // Notify listeners to update the UI
    }
  }

  // img.Image convertTiff(String imagePath) {
  //   // Read the bytes of the TIFF file
  //   Uint8List tiffBytes = File(imagePath).readAsBytesSync();

  //   // Decode the TIFF bytes using the image package
  //   img.Image? image = decodeImage(tiffBytes);

  //   // Return the img.Image object
  //   return image!;
  // }

  // img.Image convertToImage(Uint8List tiffBytes) {
  //   // Decode the TIFF bytes using the image package
  //   img.Image? image = decodeImage(tiffBytes);

  //   // Return the img.Image object
  //   return image!;
  // }
  // void convertTiff(image1) {
  //   // Image image = image; // Filling with a white color for example
  //   img.Image image =convertTiff(image1);
  //   // Encode the image to TIFF format
  //   Uint8List tiffBytes = encodeTiff(image);

  //   // Get a temporary directory
  //   String tempDir = Directory.systemTemp.path;

  //   // Create a temporary file with a .tiff extension
  //   File tempFile = File('$tempDir/temp_image.tiff');

  //   // Write the TIFF-encoded bytes to the temporary file
  //   tempFile.writeAsBytesSync(tiffBytes, flush: true);

  //   // Get the path of the temporary file
  //   String tiffFilePath = tempFile.path;

  //   log('Temporary TIFF file path: $tiffFilePath');
  // }
  // Uint8List? list;
  // void convertImage(String inputPath) {
  //   // Read the JPEG image
  //   File inputFile = File(inputPath);
  //   List<int> inputBytes = inputFile.readAsBytesSync();
  //   img.Image? image = img.decodeImage(Uint8List.fromList(inputBytes));

  //   // Save the image in TIFF format

  //   var value = img.encodeTiff(image!);
  //   list = value;
  //   // ByteData byteData = ByteData.sublistView(value);
  //   // log('byre data == ${byteData}');
  //   // File fileInMemory = File.fromRawPath(value.buffer.asUint8List());
  //   // log('file in memory == ${fileInMemory}');
  // }

  Future<bool> uploadProof(context) async {
    proofUpload = true;
    notifyListeners();
    try {
      bool result = await uploadProofservice.uploadProof(
          imagePdfFormate!.path, vlauetoBackend, context);
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
    bankProofUpload = true;
    notifyListeners();
    try {
      bool result = await uploadProofservice.uploadBankProof(
        imagePdfFormate!.path,
        vlauetoBackend,
        pOAValue,
        pOABankTypeValue,
        bankCode,
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
