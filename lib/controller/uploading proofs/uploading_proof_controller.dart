import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:image/image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

class UploadingProof extends ChangeNotifier {
  File? image;
  final picker = ImagePicker();
  String proofvalue = "Choose your proof";
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
  void updateProofValue(String? value) {
    proofvalue = value ?? '';
    notifyListeners();
  }

  Future<void> getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      notifyListeners(); // Notify listeners to update the UI
    }
  }

  String? name;
  Future<void> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      // name = await convertFileToBase64(image!.path);
      convertToTiff(image);

      notifyListeners(); // Notify listeners to update the UI
    }
  }

  Future<void> convertToTiff1(String inputPath) async {
    try {
      File inputFile = File(inputPath);

      if (await inputFile.exists()) {
        // Load the image using the image package
        var image = decodeImage(await inputFile.readAsBytes());

        // Convert the image to PNG format
        List<int> pngBytes = encodeTiff(image!);
        String base64String = base64Encode(pngBytes);
        log('tiff$base64String');
        // Write the PNG bytes to a temporary file
        File tempPngFile = File(inputPath);
        await tempPngFile.writeAsBytes(pngBytes);

        // Use ImageMagick to convert PNG to TIFF
        // ProcessResult result = await Process.run(
        //   'convert',  // ImageMagick's convert command
        //   [tempPngFile.path, outputPath],
        // );

        // Print the result of the conversion process
        // print(result.stdout);
        // print(result.stderr);

        // Delete the temporary PNG file
        // await tempPngFile.delete();

        print('Conversion to TIFF successful.');
      } else {
        throw FileSystemException("File not found", inputPath);
      }
    } catch (e) {
      print('Error converting to TIFF: $e');
    }
  }

  Future<void> convertToTiff(inputPath) async {
    try {
      File inputFile = File(inputPath);

      if (await inputFile.exists()) {
        // Load the image using the image package
        // img.Image image = img.decodeImage(await inputFile.readAsBytes())!;

        // Save the image as a TIFF file
        File outputFile = File(inputPath);
        outputFile.writeAsBytesSync(img.encodeTiff(inputPath));
        log('output$image');
        log('output$outputFile');

        print('Conversion to TIFF successful.');
      } else {
        throw FileSystemException("File not found", inputPath);
      }
    } catch (e) {
      print('Error converting to TIFF: $e');
    }
  }

  Future<String> convertFileToBase64(String filePath) async {
    try {
      File file = File(filePath);

      if (await file.exists()) {
        List<int> bytes = await file.readAsBytes();
        String base64String = base64Encode(bytes);

        return base64String;
      } else {
        throw FileSystemException("File not found", filePath);
      }
    } catch (e) {
      print('Error converting file to base64: $e');
      return '';
    }
  }
}
