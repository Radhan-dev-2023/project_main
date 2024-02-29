import 'dart:convert';
import 'dart:io';

import 'package:finfresh_mobile/model/account%20type%20model/account_type_model.dart';
import 'package:finfresh_mobile/model/country%20model/country_model.dart';
import 'package:finfresh_mobile/model/holding%20nature%20model/holding_nature_model.dart';
import 'package:finfresh_mobile/model/occupation%20model/occupation.dart';
import 'package:finfresh_mobile/model/pincode%20model/pincode_model.dart';
import 'package:finfresh_mobile/model/product%20code%20model/product_code_model.dart';
import 'package:finfresh_mobile/model/source%20wealth%20model/source_wealth_model.dart';
import 'package:finfresh_mobile/model/state%20model/state_model.dart';
import 'package:finfresh_mobile/model/ubo%20income%20model/ubo_income_model.dart';
import 'package:finfresh_mobile/model/ubo%20model/ubo_model.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:http/http.dart' as http;

class MasterService {
  HoldingNatureModel holdingNatureModel = HoldingNatureModel();
  AccountTypeModel accountTypeModel = AccountTypeModel();
  ProductCodeModel productCodeModel = ProductCodeModel();
  Future<HoldingNatureModel?> fetchData() async {
    Map<String, dynamic> payload = {"methodname": "holdingnature"};
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
      logger.d('response holding == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      logger.d('jsonResponse == ${jsonResponse['status']}');
      if (jsonResponse['status'] == 200) {
        holdingNatureModel = HoldingNatureModel.fromJson(
            jsonResponse); // Assuming modelClass has a fromJson method
        // logger.d('modelClass ==== ${modelClass.toJson()}');
        return holdingNatureModel;
      }
    } catch (e) {
      logger.d('exception in fetchData $e');
      return null;
    }
    return null;
  }

  Future<AccountTypeModel?> fetchAccountType() async {
    Map<String, dynamic> payload = {"methodname": "accounttype"};
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
      logger.d('response holding == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      logger.d('jsonResponse == ${jsonResponse['status']}');
      if (jsonResponse['status'] == 200) {
        accountTypeModel = AccountTypeModel.fromJson(
            jsonResponse); // Assuming modelClass has a fromJson method
        // logger.d('modelClass ==== ${modelClass.toJson()}');
        return accountTypeModel;
      }
    } catch (e) {
      logger.d('exception in fetchData $e');
      return null;
    }
    return null;
  }

  Future<void> fetchExceptions() async {
    Map<String, dynamic> payload = {"methodname": "panexemptcategory"};
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
      logger.d('response holding == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      logger.d('jsonResponse == ${jsonResponse['status']}');
      if (jsonResponse['status'] == 200) {
        // Assuming modelClass has a fromJson method
        // logger.d('modelClass ==== ${modelClass.toJson()}');
        // return accountTypeModel;
      }
    } catch (e) {
      logger.d('exception in fetchData $e');
      return null;
    }
    return null;
  }

  Future<ProductCodeModel?> getProductCode(String infNumber) async {
    String url = '${ApiEndpoint.baseUrl}/v1/products/$infNumber';

    try {
      http.Response response = await http.get(
        Uri.parse(url),
      );
      logger.d('product response ==${response.statusCode}');
      logger.d('Product body =${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 200) {
        productCodeModel = ProductCodeModel.fromJson(jsonResponse);
        return productCodeModel;
      } else {
        return null;
      }
    } catch (e) {
      logger.d('product code exception $e');
      return null;
    }
  }

  IncomeModel incomeModel = IncomeModel();
  Future<IncomeModel?> fetchUBOMaterIncome() async {
    Map<String, dynamic> payload = {"methodname": "applicableincome"};
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
      logger.d('response holding == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      logger.d('jsonResponse == ${jsonResponse['status']}');
      if (jsonResponse['status'] == 200) {
        incomeModel = IncomeModel.fromJson(jsonResponse);
        return incomeModel;
      }
    } catch (e) {
      logger.d('exception in fetchData $e');
      return null;
    }
    return null;
  }

  SourceWealthModel sourceWealthModel = SourceWealthModel();
  Future<SourceWealthModel?> fetchSourceWealth() async {
    Map<String, dynamic> payload = {"methodname": "sourcewealth"};
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
      logger.d('response holding == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      logger.d('jsonResponse == ${jsonResponse['status']}');
      if (jsonResponse['status'] == 200) {
        sourceWealthModel = SourceWealthModel.fromJson(jsonResponse);
        return sourceWealthModel;
      }
    } catch (e) {
      logger.d('exception in fetchData $e');
      return null;
    }
    return null;
  }

  UboModel uboModel = UboModel();
  Future<UboModel?> fetchUBO() async {
    Map<String, dynamic> payload = {"methodname": "ubo"};
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
      logger.d('response holding == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      logger.d('jsonResponse == ${jsonResponse['status']}');
      if (jsonResponse['status'] == 200) {
        uboModel = UboModel.fromJson(jsonResponse);
        return uboModel;
      }
    } catch (e) {
      logger.d('exception in fetchData $e');
      return null;
    }
    return null;
  }

  CountryModel countryModel = CountryModel();
  Future<CountryModel?> fetchCountries() async {
    Map<String, dynamic> payload = {"methodname": "country"};
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
      logger.d('response holding == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      logger.d('jsonResponse == ${jsonResponse['status']}');
      if (jsonResponse['status'] == 200) {
        countryModel = CountryModel.fromJson(jsonResponse);
        return countryModel;
      }
    } catch (e) {
      logger.d('exception in fetchData $e');
      return null;
    }
    return null;
  }

  StateModel stateModel = StateModel();
  Future<StateModel?> fetchStates() async {
    Map<String, dynamic> payload = {"methodname": "state"};
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
      logger.d('response holding == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      logger.d('jsonResponse == ${jsonResponse['status']}');
      if (jsonResponse['status'] == 200) {
        stateModel = StateModel.fromJson(jsonResponse);
        return stateModel;
      }
    } catch (e) {
      logger.d('exception in fetchData $e');
      return null;
    }
    return null;
  }

  OccupationModel occupationModel = OccupationModel();
  Future<OccupationModel?> fetchOccupation() async {
    Map<String, dynamic> payload = {"methodname": "occupation"};
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
      logger.d('response holding == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      logger.d('jsonResponse == ${jsonResponse['status']}');
      if (jsonResponse['status'] == 200) {
        occupationModel = OccupationModel.fromJson(jsonResponse);
        return occupationModel;
      }
    } catch (e) {
      logger.d('exception in fetchData $e');
      return null;
    }
    return null;
  }

  PincodeModel pincodeModel = PincodeModel();
  Future<PincodeModel?> fetchStateAndDistrict(String pincode, context) async {
    Map<String, dynamic> payload = {
      "methodname": "pincode",
      "pincode": pincode
    };

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
      logger.d('response pincode == ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      logger.d('jsonResponse == ${jsonResponse['status']}');
      if (jsonResponse['status'] == 200) {
        pincodeModel = PincodeModel.fromJson(jsonResponse);
        return pincodeModel;
      }
    } on SocketException {
      // ignore: use_build_context_synchronously
      showSnackBar(context, 'No Internet Connection');
    } catch (e) {
      logger.d('exception in fetchDatain pincode $e');
      return null;
    }
    return null;
  }
}
