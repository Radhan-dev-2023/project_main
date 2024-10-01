import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:finfresh_mobile/model/gold%20sell%20listing%20model/gold_sell_listing_model.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:http/http.dart' as http;

import '../../utilities/constant/snackbar.dart';

class DigiGoldService {
  Future<num?> getDigiGoldRate(context, String value) async {
    final stopwatch = Stopwatch()..start();
    String token = await SecureStorage.readToken('token');
    String userId = await SecureStorage.readToken('userId');
    log(userId);
    log(token);
    String url = '${ApiEndpoint.baseUrl}/api/v1/getrate/purchase/$value';
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'x-key': userId,
          'Content-Type': 'application/json',
        },
      );
      logger.d('purchase gold rate responsee==== ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
        log('manu');
        // dashBoardModel = DashBoardModel.fromJson(jsonResponse);
        num rate = jsonResponse["rate"];
        stopwatch.stop();
        log('API call took ${stopwatch.elapsedMilliseconds} ms');
        // return dashBoajdModel;
        return rate;
      } else if (jsonResponse['result']['status'] == 500) {
        showSnackBar(context, jsonResponse['result']['message']);
        return null;
      }
    } on SocketException {
      showSnackBar(context, 'No Internet Connection');
      return null;
    } catch (e) {
      logger.d('exception in get bank details $e');
      return null;
    }
    return null;
  }

  Future<num?> getsellGoldRate(context, String value) async {
    final stopwatch = Stopwatch()..start();
    String token = await SecureStorage.readToken('token');
    String userId = await SecureStorage.readToken('userId');
    log(userId);
    log(token);
    String url = '${ApiEndpoint.baseUrl}/api/v1/getrate/sell/$value';
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'x-key': userId,
          'Content-Type': 'application/json',
        },
      );
      logger.d('sell gold rate responsee==== ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
        log('manu');
        // dashBoardModel = DashBoardModel.fromJson(jsonResponse);
        num rate = jsonResponse["rate"];
        // return dashBoajdModel;
        stopwatch.stop();
        log('API call tookin sell rate ${stopwatch.elapsedMilliseconds} ms');
        return rate;
      } else if (jsonResponse['status'] == 500) {
        showSnackBar(context, jsonResponse['message']);
        return null;
      }
    } on SocketException {
      showSnackBar(context, 'No Internet Connection');
      return null;
    } catch (e) {
      logger.d('exception in get bank details $e');
      return null;
    }
    return null;
  }

  Future<bool> addDigiGoldRate(
      context, String goldrate, String costtype) async {
    String token = await SecureStorage.readToken('token');
    String userId = await SecureStorage.readToken('userId');
    log(userId);
    log(token);
    String url = '${ApiEndpoint.baseUrl}/api/v1/insertgoldrate';
    Map<String, dynamic> payload = {
      "gold_rate": goldrate,
      "cost_type": costtype,
    };
    log('payload=$payload');
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            'Authorization': 'Bearer $token',
            'x-key': userId,
            'Content-Type': 'application/json',
          },
          body: jsonEncode(payload));
      logger.d('digigold add rate responsee==== ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
        log('manu');
        // dashBoardModel = DashBoardModel.fromJson(jsonResponse);

        return true;
      } else if (jsonResponse['status'] == 500) {
        showSnackBar(context, jsonResponse['message']);
        return false;
      }
    } on SocketException {
      showSnackBar(context, 'No Internet Connection');
      return false;
    } catch (e) {
      logger.d('exception in get bank details $e');
      return false;
    }
    return false;
  }

  Future<bool> sellGold(
      context,
      dynamic goldsellRate,
      dynamic soldMg,
      dynamic amount,
      String name,
      String phonenumber,
      String value,
      String email) async {
    String token = await SecureStorage.readToken('token');
    String userId = await SecureStorage.readToken('userId');
    // String iin = await SecureStorage.readToken('customerId');
    log(userId);
    log(token);
    String url = '${ApiEndpoint.baseUrl}/api/v1/sellgold';

    Map<String, dynamic> payload = {
      // "mobile_no:": phonenumber,
      "currentgoldrate": goldsellRate,
      "soldmg": soldMg,
      "amount": amount,
      "firstname": name,
      "mobile_no": phonenumber,
      "metal_type": value,
      "email": email,
    };
    log('payload =$payload');
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
      logger.d('sell gold  responsee==== ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
        log('sold');
        return true;
        // dashBoardModel = DashBoardModel.fromJson(jsonResponse);
      } else if (jsonResponse['status'] == 500) {
        showSnackBar(context, jsonResponse['message']);
        // return null;
        return false;
      }
    } on SocketException {
      showSnackBar(context, 'No Internet Connection');
      // return null;
      return false;
    } catch (e) {
      logger.d('exception in get bank details $e');
      // return null;
      return false;
    }
    // return null;
    return false;
  }

  GoldSellListingModel sellListingModel = GoldSellListingModel();
  Future<GoldSellListingModel?> getSellGoldList(
    context,
    String value,
    String email,
  ) async {
    String token = await SecureStorage.readToken('token');
    String userId = await SecureStorage.readToken('userId');
    String iin = await SecureStorage.readToken('customerId');
    // String email = await SecureStorage.readToken('email');
    log(userId);
    log(token);
    log(iin);
    String url = '${ApiEndpoint.baseUrl}/api/v1/soldgoldSearch';

    Map<String, dynamic> payload = {"email": email, "metal_type": value};
    log('payload =$payload');
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
      logger.d('get gold list==== ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
        sellListingModel = GoldSellListingModel.fromJson(jsonResponse);
        return sellListingModel;
        // dashBoardModel = DashBoardModel.fromJson(jsonResponse);
      } else if (jsonResponse['status'] == 500) {
        showSnackBar(context, jsonResponse['message']);
        // return null;
        return null;
      }
    } on SocketException {
      showSnackBar(context, 'No Internet Connection');
      // return null;
      return null;
    } catch (e) {
      logger.d('exception in get bank details $e');
      // return null;
      return null;
    }
    // return null;
    return null;
  }
}
