import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:finfresh_mobile/model/report%20details%20modal/report_details_model.dart';
import 'package:finfresh_mobile/model/report%20summary%20model/report_summary_model.dart';
import 'package:finfresh_mobile/model/status%20check%20model/status_check_model.dart';
import 'package:http/http.dart' as http;
import 'package:finfresh_mobile/utilities/constant/flushbar.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class ExpenseServices {
  Future<String?> generateUrl(context) async {
    // notifyListeners();
    String phoneNumber = await SecureStorage.readToken('phoneNumber');
    String token = await SecureStorage.readToken('token');
    log('token$token');
    log('phonenumber$phoneNumber');
    String userId = await SecureStorage.readToken('userId');
    final generateUrl = Uri.parse(
        'https://finfresh-expense-api.micro.m1.finfresh.in/api/v1/generateUrl');
    String? receivedUrl;

    try {
      final response = await http.post(
        generateUrl,
        headers: {
          'Authorization': 'Bearer $token',
          'x-key': userId,
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'phoneNumber': phoneNumber}),
      );

      if (kDebugMode) {
        print('generateUrl-------->>> ${response.body}');
        print('status code ${response.statusCode}');
      }

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData['success']) {
          receivedUrl = responseData['responseData']['url'];
          // _requestId = responseData['updatedUser']['requestId'];
          var phnno = responseData['updatedUser']['phoneNumber'];
          var reqId = responseData['updatedUser']['requestId'];

          if (kDebugMode) {
            print("Received URL: $receivedUrl");
          }
          if (kDebugMode) {
            // print("Request ID: $_requestId");
          }
          // fetchStatusCheck();
          // await statusCheck(context, phoneNumber, _requestId);
        } else if (response.statusCode == 400) {
          showFlushbar(context, 'Failed: ${responseData['message']}');
        } else if (response.statusCode == 500) {
          showFlushbar(context, 'Failed: ${responseData['message']}');
        } else {
          showFlushbar(context, 'Failed: ${responseData['message']}');
        }
      } else {
        showFlushbar(
            context, 'Server responded with status: ${response.statusCode}');
      }
    } on SocketException catch (_) {
      showFlushbar(context, 'Network error: Unable to connect to the server.');
    } on FormatException catch (_) {
      showFlushbar(
          context, 'Format Execption:Unable to connect to the server.');
    } on PlatformException catch (_) {
      showFlushbar(context, 'PlatformException :Please Check the Permissions.');
    } catch (error) {
      showFlushbar(context, 'Exception: $error');
    } finally {}

    return receivedUrl;
  }

  StatusCheck statusCheckResponse = StatusCheck();

  Future<StatusCheck?> fetchStatusCheck(context) async {
    // if (reqId == null) return;

    String phoneNumber = await SecureStorage.readToken('phoneNumber');
    String userId = await SecureStorage.readToken('userId');
    String token = await SecureStorage.readToken('token');
    final statusCheckUrl = Uri.parse(
        'https://finfresh-expense-api.micro.m1.finfresh.in/api/v1/statusCheck');
    try {
      final response = await http.post(
        statusCheckUrl,
        headers: {
          'Authorization': 'Bearer $token',
          'x-key': userId,
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'phoneNumber': phoneNumber, /*'requestId': reqId*/
        }),
      );

      print('fetchStatusCheck-------->>> ${response.body}');
      log('response of status check ===${response.statusCode}');
      if (response.statusCode == 200) {
        statusCheckResponse = StatusCheck.fromJson(json.decode(response.body));

        return statusCheckResponse;
      }
      // else {
      //  showSnackBar('Status Check Failed: ${statusResponseData['message']}');
      ////  }
      // }
      else if (response.statusCode == 500) {
        showFlushbar(context, 'Status Check Server responded with status 500');
        return null;
      } else {
        showFlushbar(context,
            'Status Check Server responded with status: ${response.statusCode}');
        return null;
      }
    } on SocketException catch (_) {
      showFlushbar(context, 'Network error: Unable to connect to the server.');
      return null;
    } on FormatException catch (_) {
      showFlushbar(
          context, 'Format Execption:Unable to connect to the server.');
      return null;
    } on PlatformException catch (_) {
      showFlushbar(context, 'PlatformException :Please Check the Permissions.');
      return null;
    } catch (error) {
      showFlushbar(context, 'Status Check Exception: $error');
      return null;
    }
  }

  ReportSummaryModel reportSummaryModel = ReportSummaryModel();
  Future<ReportSummaryModel?> retrieveReportAPI(context) async {
    String phoneNumber = await SecureStorage.readToken('phoneNumber');
    String userId = await SecureStorage.readToken('userId');
    String token = await SecureStorage.readToken('token');

    final retrieveReportUrl = Uri.parse(
        'https://finfresh-expense-api.micro.m1.finfresh.in/api/v1/retrieveReport');

    try {
      final response = await http.post(
        retrieveReportUrl,
        headers: {
          'Authorization': 'Bearer $token',
          'x-key': userId,
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'phoneNumber': phoneNumber, /*'txn_id': _txn_id*/
        }),
      );

      print('retrieveReportAPI-------->>> ${response.body}');
      log('response statuscode reportapi------>>>>> ${response.statusCode}');
      if (response.statusCode == 200) {
        log('retrieveReportAPI-------->>> ${response.body}');
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        log('jsonresponse ${jsonResponse}');
        reportSummaryModel = ReportSummaryModel.fromJson(jsonResponse);
        log('asigned value to model $reportSummaryModel');
        return reportSummaryModel;
      } else {
        showFlushbar(context,
            'Report Retrieval Server responded with status: ${response.statusCode}');
        return null;
      }
    } on SocketException catch (_) {
      showFlushbar(context, 'Network error: Unable to connect to the server.');

      return null;
    } on FormatException catch (e) {
      showFlushbar(
          context, 'Format Execption:Unable to connect to the server.');
      log('exception FormatException--------->>>>.$e');
      return null;
    } on PlatformException catch (e) {
      showFlushbar(context, 'PlatformException :Please Check the Permissions.');
      log('exception platform--------->>>>.$e');
      return null;
    } catch (error) {
      showFlushbar(context, 'Report Retrieval Exception: $error');
      log('exception--------->>>>. $error');
      return null;
    }
  }
}
