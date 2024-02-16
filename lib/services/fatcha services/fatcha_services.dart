import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FatchaServices {
  Future<bool> fatchaRegister({
    required String appincomeCode,
    required String networthsign,
    required String networth,
    required String networthdate,
    required String sourcewealth,
    required String countryofbirth,
    required String placeofbirth,
    required String taxresidence,
    required String identitytype,
    required String stockexchange,
    required String sponseravailability,
    required String ubomastercode,
    required String ubobirthCountry,
    required String ubocountry,
    required String uboGender,
    required String uboHoldingPercentage,
    required String uboidentitytype,
    required String uboTinNumber,
    required String addresvalue,
    required String pepVlaue,
    required BuildContext context,
  }) async {
    String token = await SecureStorage.readToken('token');
    String userId = await SecureStorage.readToken('userId');
    String iin = await SecureStorage.readToken('customerId');

    String url = '${ApiEndpoint.baseUrl}/api/v1/fatcaregistration';
    Map<String, dynamic> payload = {
      "iin": iin,
      "ubo_applicable_count": "1",
      "kyc": {
        "app_income_code": appincomeCode, //refer applicable income master
        "net_worth_sign": networthsign, //required for non individual
        "net_worth": networth, //required for non individual
        "net_worth_date": networthdate,
        "pep": pepVlaue,
        "source_wealth": sourcewealth, //refer SourceWealth master
        "corp_servs":
            "" //refer transaction API document applicable for non individual
      },
      "fatca": {
        "addr_type": addresvalue, //refer transaction API document
        "data_src": "E",
        "country_of_birth": countryofbirth,
        "place_birth": countryofbirth,
        "tax_residency": taxresidence,
        "country_tax_residency1": "India",
        "tax_payer_identityno1": "PYBQI9229X",
        "id1_type": identitytype,
        "country_tax_residency2": "",
        "tax_payer_identityno2": "",
        "id2_type": "",
        "country_tax_residency3": "",
        "tax_payer_identityno3": "",
        "id3_type": "",
        "country_tax_residency4": "",
        "tax_payer_identityno4": "",
        "id4_type": "",
        "ffi_drnfe": "",
        "nffe_catg": "",
        "nature_bus": "",
        "act_nfe_subcat": "",
        "stock_exchange": stockexchange,
        "listed_company": "",
        "us_person": "N",
        "exemp_code": "",
        "giin_applicable": "",
        "giin": "",
        "giin_exem_cat": "",
        "sponcer_availability": sponseravailability,
        "sponcer_entity": "",
        "giin_not_app": ""
      },
      "ubo": {
        "ubo_master_codes": ubomastercode, //fetch from master ubo
        "ubo_country_tax_residency": ubocountry,
        "ubo_cob": ubobirthCountry,
        "ubo_cocn": "IND",
        "ubo_gender": uboGender,
        "ubo_holding_perc": uboHoldingPercentage,
        "ubo_add_type": "",
        "ubo_id_type": uboidentitytype,
        "ubo_tin_no": uboTinNumber //refer transaction api document
      }
    };

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'x-key': userId,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );
      logger.d('fatchaa respone =${response.statusCode}');
      logger.d('Fatcha response.body =${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse["status"] == 200) {
        // ignore: use_build_context_synchronously
        showSnackBar(context, 'FATCA/KYC Registration Inserted Successfully');
        return true;
      } else {
        // ignore: use_build_context_synchronously
        showSnackBar(context, jsonResponse["message"]);
      }
    } on SocketException {
      // ignore: use_build_context_synchronously
      showSnackBar(context, 'No Internet Connection');
      return false;
    } catch (e) {
      logger.d('Fatcha registration failed with an exception $e');
      return false;
    }
    return false;
  }

  Future<bool> uploadFatchaProof(String image, String pancard, context) async {
    String url = '${ApiEndpoint.baseUrl}/api/v1/uploadimage';

    String token = await SecureStorage.readToken('token');
    String userId = await SecureStorage.readToken('userId');
    // String customerId = await SecureStorage.readToken('customerId');
    log(image);
    // log(imageType);
    log('token===$token');
    log('userId===$userId');
    // log('customer id =$customerId');
    Map<String, String> body = {
      'ImageType': 'F',
      'PAN': pancard,
      // "CustomerID": '5014060638',
      "ImageFormat": 'TIFF',
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
      log('jsonresponse===$jsonResponse');
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
