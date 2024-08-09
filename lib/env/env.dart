// lib/env/env.dart
import 'package:envied/envied.dart';
// flutter pub run build_runner build --delete-conflicting-outputs

part 'env.g.dart';

@Envied(path: '.env', requireEnvFile: true)
abstract class Env {
  @EnviedField(varName: 'API_KEY', obfuscate: true)
  static final String key = _Env.key;
  @EnviedField(varName: 'PAYU_PAYMENT_KEY_TEST', obfuscate: true)
  static final String payuPaymentTest = _Env.payuPaymentTest;
  @EnviedField(varName: 'PAYU_PAYMENT_KEY_PROD', obfuscate: true)
  static final String payuPaymentProd = _Env.payuPaymentProd;
  @EnviedField(varName: 'SALT_KEY_TEST', obfuscate: true)
  static final String merchantSaltTest = _Env.merchantSaltTest;
  @EnviedField(varName: 'SALT_KEY_PROD', obfuscate: true)
  static final String merchantSaltProd = _Env.merchantSaltProd;
}
