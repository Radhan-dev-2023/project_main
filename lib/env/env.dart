// lib/env/env.dart
import 'package:envied/envied.dart';


part 'env.g.dart';
@Envied(path: '.env', requireEnvFile: true)
abstract class Env {
  @EnviedField(varName: 'API_KEY', obfuscate: true)
  static final String key = _Env.key;
}