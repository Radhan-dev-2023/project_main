import 'dart:convert';

import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:http/http.dart' as http;

class MasterService {
  Future<String?> fetchData(String methodname, dynamic modelClass) async {
    Map<String, dynamic> payload = {"methodname": methodname};
    final url = Uri.parse('${ApiEndpoint.baseUrl}/v1/master');
    try {
      http.Response response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );
      logger.d('response == ${response.statusCode}');
      logger.d('response == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      logger.d('jsonResponse == ${jsonResponse['status']}');
      if (jsonResponse['status'] == 200) {
        modelClass.fromJson(
            jsonResponse); // Assuming modelClass has a fromJson method
        logger.d('modelClass ==== ${modelClass.toJson()}');
        return response.body;
      }
    } catch (e) {
      logger.d('exception in fetchData $e');
      return null;
    }
    return null;
  }
}
