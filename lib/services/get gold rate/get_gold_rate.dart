import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:http/http.dart' as http;

import '../../utilities/constant/snackbar.dart';

class DigiGoldService {
  Future<num?> getDigiGoldRate(context) async {
    String token = await SecureStorage.readToken('token');
    String userId = await SecureStorage.readToken('userId');
    log(userId);
    log(token);
    String url = '${ApiEndpoint.baseUrl}/api/v1/getgoldrate';
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'x-key': userId,
          'Content-Type': 'application/json',
        },
      );
      logger.d('digigold responsee==== ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
        log('manu');
        // dashBoardModel = DashBoardModel.fromJson(jsonResponse);
        num rate = jsonResponse["rate"];
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

  Future<bool> addDigiGoldRate(context, String goldrate) async {
    String token = await SecureStorage.readToken('token');
    String userId = await SecureStorage.readToken('userId');
    log(userId);
    log(token);
    String url = '${ApiEndpoint.baseUrl}/api/v1/insertgoldrate';
    Map<String, dynamic> payload = {"gold_rate": goldrate};
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
      } else if (jsonResponse['result']['status'] == 500) {
        showSnackBar(context, jsonResponse['result']['message']);
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
}
