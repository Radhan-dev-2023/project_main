import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:finfresh_mobile/model/dash%20Board%20Model/dash_board_model.dart';
import 'package:finfresh_mobile/model/summary%20model/summary_model.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:http/http.dart' as http;

class DasBoardService {
  Future<DashBoardModel?> getDashBoardDetails(
    context,
  ) async {
    final stopwatch = Stopwatch()..start();
    DashBoardModel dashBoardModel = DashBoardModel();
    String token = await SecureStorage.readToken('token');
    String userId = await SecureStorage.readToken('userId');
    String phonenumber = await SecureStorage.readToken('phoneNumber');
    String url = '${ApiEndpoint.baseUrl}/api/v1/dashboard/$phonenumber';
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'x-key': userId,
          'Content-Type': 'application/json',
        },
      );
      log('response dashBoard details == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['result']['status'] == 200) {
        dashBoardModel = DashBoardModel.fromJson(jsonResponse);
        log('API call took in dashboard ${stopwatch.elapsedMilliseconds} ms');
        return dashBoardModel;
      } else if (jsonResponse['result']['status'] == 500) {
        showSnackBar(context, jsonResponse['result']['message']);
        return null;
      }
    } on SocketException {
      showSnackBar(context, 'No Internet Connection');
    } catch (e) {
      logger.d('exception in get bank details $e');
    }
    return null;
  }

  Future<SummaryModel?> fetchSummary(context, String email) async {
    SummaryModel summaryModel = SummaryModel();
    String token = await SecureStorage.readToken('token');
    String userId = await SecureStorage.readToken('userId');
    String url = '${ApiEndpoint.baseUrl}/api/v1/transactionsummary';
    String iin = await SecureStorage.readToken('customerId');

    Map<String, dynamic> payload = {"iin": iin, "email": email};
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            'Authorization': 'Bearer $token',
            'x-key': userId,
            'Content-Type': 'application/json',
          },
          body: jsonEncode(payload));
      log('response summary == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
        summaryModel = SummaryModel.fromJson(jsonResponse);

        return summaryModel;
      } else if (jsonResponse['status'] == 500) {
        showSnackBar(context, jsonResponse['message']);
        return null;
      }
    } on SocketException {
      showSnackBar(context, 'No Internet Connection');
      return null;
    } catch (e) {
      logger.d('fetch summary failed with an exception$e');
      return null;
    }
    return null;
  }
}
