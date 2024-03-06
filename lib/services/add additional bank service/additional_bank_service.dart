import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:finfresh_mobile/model/bank%20list%20model/bank_list_model.dart';
import 'package:finfresh_mobile/services/refersh%20token/refersh_token.dart';
import 'package:finfresh_mobile/utilities/constant/flushbar.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:http/http.dart' as http;

class AdditionalBankService {
  RefershTokenService refershTokenService = RefershTokenService();
  BankListingModel bankListingModel = BankListingModel();
  Future<BankListingModel?> bankListing(context) async {
    String url = '${ApiEndpoint.baseUrl}/api/v1/additionalbank/get';
    String iin = await SecureStorage.readToken('customerId');
    String phoneNumber = await SecureStorage.readToken('phoneNumber');
    String token = await SecureStorage.readToken('token');
    String userId = await SecureStorage.readToken('userId');
    Map<String, dynamic> payload = {"iin": iin, "phonenumber": phoneNumber};
    try {
      await refershTokenService.postRefershTocken(context);
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'x-key': userId,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );
      logger.d('response.statuscode${response.statusCode}');
      log('get bank response${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse["status"] == 200) {
        bankListingModel = BankListingModel.fromJson(jsonResponse);
        log('success');
        return bankListingModel;
      } else {
        showFlushbar(context, jsonResponse['message']);
        return null;
      }
    } on SocketException {
      showFlushbar(context, 'No Internet Connection');
      return null;
    } catch (e) {
      logger.d('ach mandate failed with an exception$e');
      return null;
    }
  }

  Future<bool> addAdditionalBank(
    String accountNumber,
    String accType,
    String ifscCode,
    String bankName,
    String proof,
    String branchName,
    context,
    String flag,
  ) async {
    String url = '${ApiEndpoint.baseUrl}/api/v1/additionalbank/add';
    String iin = await SecureStorage.readToken('customerId');
    String phoneNumber = await SecureStorage.readToken('phoneNumber');
    String token = await SecureStorage.readToken('token');

    String userId = await SecureStorage.readToken('userId');
    log('iin $iin');

    Map<String, dynamic> payload = {
      "phonenumber": phoneNumber,
      "process_flag": flag, //I->Insert , E-Edit, D-Delete
      "iin": iin,
      "acc_no": accountNumber,
      "acc_type": accType,
      "ifsc_code": ifscCode,
      "micr_no": "",
      "bank_name": bankName,
      "branch_name": branchName,
      "branch_address1": "",
      "branch_address2": "",
      "branch_address3": "",
      "branch_city": "",
      "branch_country": "",
      "branch_pincode": "",
      "proof_of_account": proof
    };

    log('payload$payload');
    try {
      await refershTokenService.postRefershTocken(context);
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'x-key': userId,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );
      logger.d('response.statuscode${response.statusCode}');
      log('add bank response${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse["status"] == 200) {
        return true;
      } else {
        showFlushbar(context, jsonResponse['message']);
        return false;
      }
    } on SocketException {
      showFlushbar(context, 'No Internet Connection');
      return false;
    } catch (e) {
      logger.d('ach mandate failed with an exception$e');
      return false;
    }
  }

  Future<bool> setupDefaultBank(
    context,
    String iin,
    String accNumber,
    String bankName,
  ) async {
    String phoneNumber = await SecureStorage.readToken('phoneNumber');
    String token = await SecureStorage.readToken('token');
    String url = '${ApiEndpoint.baseUrl}/api/v1/defaultbank';
    String userId = await SecureStorage.readToken('userId');
    Map<String, dynamic> payload = {
      "phonenumber": phoneNumber,
      "iin": iin,
      "acc_no": accNumber,
      "bank_name": bankName,
      "default_bank": "Y"
    };
    log('payload of default$payload');
    try {
      await refershTokenService.postRefershTocken(context);
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'x-key': userId,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );
      logger.d('response.statuscode${response.statusCode}');
      log('get bank response${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse["status"] == 200) {
        log('success');
        return true;
      } else {
        showFlushbar(context, jsonResponse['message']);
        return false;
      }
    } on SocketException {
      showFlushbar(context, 'No Internet Connection');
      return false;
    } catch (e) {
      logger.d('ach mandate failed with an exception$e');
      return false;
    }
  }

  Future<bool> uploadBankProof(
    String image,
    String accountNumber,
    String bankCode,
    context,
  ) async {
    String url = '${ApiEndpoint.baseUrl}/api/v1/uploadimage';

    String token = await SecureStorage.readToken('token');
    String userId = await SecureStorage.readToken('userId');
    String customerId = await SecureStorage.readToken('customerId');

    log(image);
    // log(imageType);
    log('token===$token');
    log('userId===$userId');
    log('bank prooodf');

    Map<String, String> body = {
      'ImageType': 'B',
      "CustomerID": customerId,
      "ImageFormat": 'TIFF',
      "BankCode": bankCode,
      "AccNo": accountNumber,
      "POAFlag": 'N',
      "POABankType": '',
    };
    logger.d('body ==$body');
    try {
      await refershTokenService.postRefershTocken(context);
      final formData = await http.MultipartRequest('POST', Uri.parse(url));
      formData.headers.addAll({
        'Authorization': 'Bearer $token',
        'x-key': userId,
      });
      formData.fields.addAll(body);

      formData.files.add(await http.MultipartFile.fromPath('document', image));

      final response = await formData.send();
      final responseData = await http.Response.fromStream(response);
      Map<String, dynamic> jsonResponse = json.decode(responseData.body);
      log('========================');
      log('jsonresponse===$jsonResponse');
      log("=====================");
      log(response.statusCode.toString());
      log("=====================");
      log(responseData.body);

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
        showSnackBar(context, jsonResponse['result']['message']);

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
