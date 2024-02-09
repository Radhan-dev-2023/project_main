import 'dart:convert';

import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/utilities/urls/url.dart';
import 'package:http/http.dart' as http;

class FatchaServices {
  Future<void> fatchaRegister() async {
    String token = await SecureStorage.readToken('token');
    String userId = await SecureStorage.readToken('userId');

    String url = '${ApiEndpoint.baseUrl}/api/v1/fatcaregistration';
    Map<String, dynamic> payload = {
      "iin": "5014100599",
      "ubo_applicable_count": "1",
      "kyc": {
        "app_income_code": "34", //refer applicable income master
        "net_worth_sign": "", //required for non individual
        "net_worth": "", //required for non individual
        "net_worth_date": "",
        "pep": "N",
        "source_wealth": "", //refer SourceWealth master
        "corp_servs":
            "" //refer transaction API document applicable for non individual
      },
      "fatca": {
        "addr_type": "2", //refer transaction API document
        "data_src": "E",
        "country_of_birth": "IND",
        "place_birth": "TN",
        "tax_residency": "N",
        "country_tax_residency1": "India",
        "tax_payer_identityno1": "PYBQI9229X",
        "id1_type": "C",
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
        "stock_exchange": "",
        "listed_company": "",
        "us_person": "N",
        "exemp_code": "",
        "giin_applicable": "",
        "giin": "",
        "giin_exem_cat": "",
        "sponcer_availability": "N",
        "sponcer_entity": "",
        "giin_not_app": ""
      },
      "ubo": {
        "ubo_master_codes": "C04", //fetch from master ubo
        "ubo_country_tax_residency": "IND",
        "ubo_cob": "TN",
        "ubo_cocn": "IND",
        "ubo_gender": "M",
        "ubo_holding_perc": "100",
        "ubo_add_type": "",
        "ubo_id_type": "N",
        "ubo_tin_no": "IANPM5145P" //refer transaction api document
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
    } catch (e) {
      logger.d('Fatcha registration failed with an exception $e');
    }
  }
}
