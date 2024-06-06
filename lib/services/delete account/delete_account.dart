import 'dart:convert';
import 'dart:io';

import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:http/http.dart' as http;

class DeleteAccountService {
  Future<bool> deleteAccount(
    context,
  ) async {
    String token = await SecureStorage.readToken('token');
    String userId = await SecureStorage.readToken('userId');
    // String iin = await SecureStorage.readToken('customerId');
    // log(userId);
    // log(token);
    // log(iin);
    String url = '${ApiEndpoint.baseUrl}/api/v1/user/$userId/delete';

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'x-key': userId,
          'Content-Type': 'application/json',
        },
      );
      logger.d('response of delete account ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
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
}
