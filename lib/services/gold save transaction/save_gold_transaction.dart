import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:finfresh_mobile/model/gold%20listing%20model/gold_liting_model.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:http/http.dart' as http;

class GoldSaveTransactionService {
  GolListingModel golListingModel = GolListingModel();
  Future<bool> saveTransactionForgold(
    double goldrate,
    double purchasedGold,
    dynamic response,
    context,
  ) async {
    // log('calling${response['payuResponse']['id']}');
    log('calling in service');

    String token = await SecureStorage.readToken('token');
    String userId = await SecureStorage.readToken('userId');
    String url = '${ApiEndpoint.baseUrl}/api/v1/savegoldTransaction';
    String iin = await SecureStorage.readToken('customerId');

    Map<String, dynamic> responseMap = json.decode(response['payuResponse']);

// // Extract values from the response
//     Map<String, dynamic> payuResponse = responseMap['payuResponse'];
//     Map<String, dynamic> merchantResponse = responseMap['merchantResponse'];
    Map<String, dynamic> payload = {
      "id": responseMap['id'],
      "iin": iin,
      "goldrate": goldrate,
      "purchasedGold": purchasedGold.toStringAsFixed(4),
      "mode": responseMap['mode'].toString(),
      "status": responseMap['status'].toString(),
      "unmappedstatus": responseMap["unmappedstatus"].toString(),
      "key": responseMap["key"].toString(),
      "txnid": responseMap["txnid"].toString(),
      "transaction_fee": responseMap["transaction_fee"].toString(),
      "amount": responseMap["amount"].toString(),
      "cardCategory": responseMap["cardCategory"].toString(),
      "discount": responseMap["discount"].toString(),
      "addedon": responseMap["addedon"].toString(),
      "productinfo": responseMap["productinfo"].toString(),
      "firstname": responseMap["firstname"].toString(),
      "email": responseMap["email"].toString(),
      "phone": responseMap["phone"].toString(),
      "hash": responseMap["hash"].toString(),
      "field1": responseMap["field1"],
      "field2": responseMap["field2"],
      "field3": responseMap["field3"].toString(),
      "field5": responseMap["field5"].toString(),
      "field6": responseMap["field6"].toString(),
      "field7": responseMap["field7"].toString(),
      "field8": responseMap["field8"].toString(),
      "field9": responseMap["field9"].toString(),
      "payment_source": responseMap["payment_source"],
      "PG_TYPE": responseMap["PG_TYPE"].toString(),
      "bank_ref_no": responseMap["bank_ref_no"],
      "ibibo_code": responseMap["ibibo_code"].toString(),
      "error_code": responseMap["error_code"].toString(),
      "Error_Message": responseMap["Error_Message"].toString(),
      "card_no": responseMap["card_no"].toString(),
      "is_seamless": responseMap["is_seamless"],
      "surl": responseMap["surl"].toString(),
      "furl": responseMap["furl"].toString(),
      "merchantResponse": response['merchantResponse'],
    };
    log('payload -===$payload');
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            'Authorization': 'Bearer $token',
            'x-key': userId,
            'Content-Type': 'application/json',
          },
          body: jsonEncode(payload));
      logger.d('response transcation == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
        return true;
      } else if (jsonResponse['status'] == 500) {
        if (context.mounted) {
          showSnackBar(context, jsonResponse['message']);
        }
        return false;
      }
    } on SocketException {
      if (context.mounted) {
        showSnackBar(context, 'No Internet Connection');
      }
      return false;
    } catch (e) {
      logger.d('gold transaction$e');
      return false;
    }
    return false;
  }

  Future<GolListingModel?> getGoldList(context) async {
    String token = await SecureStorage.readToken('token');
    String userId = await SecureStorage.readToken('userId');
    String iin = await SecureStorage.readToken('customerId');
    String phonenumber = await SecureStorage.readToken('phoneNumber');
    String url =
        '${ApiEndpoint.baseUrl}/api/v1/$phonenumber/getgoldTransaction';
    log('iin$iin');
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'x-key': userId,
          'Content-Type': 'application/json',
        },
      );
      logger.d('gold list responsee==== ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
        log('goldlisting completed');
        // dashBoardModel = DashBoardModel.fromJson(jsonResponse);
        golListingModel = GolListingModel.fromJson(jsonResponse);

        return golListingModel;
      } else if (jsonResponse['status'] == 500) {
        showSnackBar(context, jsonResponse['message']);
        return null;
      }
    } on SocketException {
      showSnackBar(context, 'No Internet Connection');
      return null;
    } catch (e) {
      logger.d('exception in golg listing $e');
      return null;
    }
    return null;
  }
}
