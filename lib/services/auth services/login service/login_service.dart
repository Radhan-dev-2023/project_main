import 'dart:convert';
import 'dart:io';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Future<bool> login(String phonenumber, String password, context) async {
    final url = Uri.parse('${ApiEndpoint.baseUrl}/v1/user/login');
    Map<String, dynamic> payload = {
      "phoneNumber": phonenumber,
      "userType": "customer",
      "password": password,
    };
    try {
      http.Response response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );
      logger.d('response == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['result']['status'] == 200) {
        return true;
      }
    } on SocketException {
      showSnackBar(context, 'No Internet Connection');
    } catch (e) {
      logger.d('failed to login $e');
    }
    return false;
  }
}
