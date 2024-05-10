import 'dart:developer';

import 'package:payu_checkoutpro_flutter/PayUConstantKeys.dart';
//Remove this plugin when you implement the salt at your server..
import 'package:crypto/crypto.dart';
import 'dart:convert';

class HashService {
//Find the test credentials from dev guide: https://devguide.payu.in/flutter-sdk-integration/getting-started-flutter-sdk/mobile-sdk-test-environment/
//Keep the hash in backend for Security reasons.
  static const merchantSalt = "pBfJzti7i9Lgo5IYRb66d0faa00M46Zb";
  // "pBfJzti7i9Lgo5IYRb66d0faa00M46Zb";
  //UlxBIVUX1cxVtYMIgJEkc1iJWnMbp1j1
  // // Add you Salt here.
  static const merchantSecretKey = ""; // Add Merchant Secrete Key - Optional

  static Map generateHash(Map response) {
    log('hashname${response[PayUHashConstantsKeys.hashName]} hashStringWithoutSalt ${response[PayUHashConstantsKeys.hashString]}hashType ${response[PayUHashConstantsKeys.hashType]}');
    var hashName = response[PayUHashConstantsKeys.hashName];
    var hashStringWithoutSalt = response[PayUHashConstantsKeys.hashString];
    var hashType = response[PayUHashConstantsKeys.hashType];

    var postSalt = response[PayUHashConstantsKeys.postSalt];

    var hash = "";

    if (hashType == PayUHashConstantsKeys.hashVersionV2) {
      hash = getHmacSHA256Hash(hashStringWithoutSalt, merchantSalt);
    } else if (hashName == PayUHashConstantsKeys.mcpLookup) {
      hash = getHmacSHA1Hash(hashStringWithoutSalt, merchantSecretKey);
    } else {
      var hashDataWithSalt = hashStringWithoutSalt + merchantSalt;
      if (postSalt != null) {
        hashDataWithSalt = hashDataWithSalt + postSalt;
      }
      hash = getSHA512Hash(hashDataWithSalt);
    }
    //Don't use this method, get the hash from your backend.
    var finalHash = {hashName: hash};
    return finalHash;
  }

  //Don't use this method get the hash from your backend.
  static String getSHA512Hash(String hashData) {
    var bytes = utf8.encode(hashData); // data being hashed
    var hash = sha512.convert(bytes);
    return hash.toString();
  }

  //Don't use this method get the hash from your backend.
  static String getHmacSHA256Hash(String hashData, String salt) {
    var key = utf8.encode(salt);
    var bytes = utf8.encode(hashData);
    final hmacSha256 = Hmac(sha256, key).convert(bytes).bytes;
    final hmacBase64 = base64Encode(hmacSha256);
    return hmacBase64;
  }

  static String getHmacSHA1Hash(String hashData, String salt) {
    var key = utf8.encode(salt);
    var bytes = utf8.encode(hashData);
    var hmacSha1 = Hmac(sha1, key); // HMAC-SHA1
    var hash = hmacSha1.convert(bytes);
    return hash.toString();
  }
}
