import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:http/http.dart' as http;

class UploadProofservice {
  Future<bool> uploadProof(String image, String imageType, context) async {
    String url = '${ApiEndpoint.baseUrl}/api/v1/uploadimage';

    String token = await SecureStorage.readToken('token');
    String userId = await SecureStorage.readToken('userId');
    String customerId = await SecureStorage.readToken('customerId');
    log(image);
    log(imageType);
    log('token===$token');
    log('userId===$userId');
    Map<String, String> body = {
      'ImageType': imageType,
      "CustomerID": customerId,
      "ImageFormat": 'pdf',
    };
    try {
      final formData = await http.MultipartRequest('POST', Uri.parse(url));
      formData.headers.addAll({
        'Authorization': 'Bearer $token',
        'x-key': userId,
      });
      formData.fields.addAll(body);

      formData.files.add(await http.MultipartFile.fromPath('document', image));

      final response = await formData.send();
      final responseData = await http.Response.fromStream(response);
      log("=====================");
      log(response.statusCode.toString());
      log("=====================");
      log(responseData.body);
      Map<String, dynamic> jsonResponse = json.decode(responseData.body);
      if (jsonResponse['result']['status'] == 200) {
        log(responseData.body);
        // final jsonData = jsonDecode(responseData.body) as Map<String, dynamic>;
        // showCustomSnackBar(jsonData["message"], isError: false);

        //  uploadData[index]=UploadingUrl.fromJson(jsonData);
        // print(uploadData[index]);

        //isLoaded?.value=true;
        // userInfo.value=User.fromJson(jsonData["data"]);
        //print(userInfo);
        print("success");

        //scaffoldMessengerMethods(context, appgreen," uploaded successfully");
        return true;
      } else {
        print("somthing went wrong");
        return false;
      }
    } on SocketException {
      showSnackBar(context, 'No Internet Connection');
      return false;
    } catch (e) {
      log('Exception $e');
      return false;
    }
  }

  Future<bool> uploadBankProof(String image, String imageType, context) async {
    String url = '${ApiEndpoint.baseUrl}/api/v1/uploadimage';

    String token = await SecureStorage.readToken('token');
    String userId = await SecureStorage.readToken('userId');
    String customerId = await SecureStorage.readToken('customerId');
    log(image);
    log(imageType);
    log('token===$token');
    log('userId===$userId');
    log('bank prooodf');
    Map<String, String> body = {
      'ImageType': imageType,
      "CustomerID": customerId,
      "ImageFormat": 'pdf',
      "BankCode": "HDFC",
      "AccNo": "",
      "POAFlag": "",
      "POABankType": "",
    };
    try {
      final formData = await http.MultipartRequest('POST', Uri.parse(url));
      formData.headers.addAll({
        'Authorization': 'Bearer $token',
        'x-key': userId,
      });
      formData.fields.addAll(body);

      formData.files.add(await http.MultipartFile.fromPath('document', image));

      final response = await formData.send();
      final responseData = await http.Response.fromStream(response);
      log("=====================");
      log(response.statusCode.toString());
      log("=====================");
      log(responseData.body);
      Map<String, dynamic> jsonResponse = json.decode(responseData.body);
      if (jsonResponse['result']['status'] == 200) {
        log(responseData.body);
        // final jsonData = jsonDecode(responseData.body) as Map<String, dynamic>;
        // showCustomSnackBar(jsonData["message"], isError: false);

        //  uploadData[index]=UploadingUrl.fromJson(jsonData);
        // print(uploadData[index]);

        //isLoaded?.value=true;
        // userInfo.value=User.fromJson(jsonData["data"]);
        //print(userInfo);
        print("success");
        return true;
        //scaffoldMessengerMethods(context, appgreen," uploaded successfully");
      } else {
        print("somthing went wrong");
        return false;
      }
    } on SocketException {
      showSnackBar(context, 'No Internet Connection');
      return false;
    } catch (e) {
      log('Exception $e');
      return false;
    }
  }
}
