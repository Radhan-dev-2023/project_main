import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class BiometricLogin extends ChangeNotifier {
  bool loginSuccess = false;
  bool buttonEnabled = false;

  Future<String> getpin() async {
    String pin = await SecureStorage.readToken('pin');
    return pin;
  }

  void changeButtonEnabled(bool value) {
    buttonEnabled = value;
    notifyListeners();
  }

  Future<void> authenticate() async {
    final LocalAuthentication localAuth = LocalAuthentication();
    try {
      bool canCheckBiometrics = await localAuth.canCheckBiometrics;

      if (canCheckBiometrics) {
        List<BiometricType> availableBiometrics =
            await localAuth.getAvailableBiometrics();

        if (availableBiometrics.isNotEmpty) {
          bool authenticated = await localAuth.authenticate(
            localizedReason: 'Authenticate to Login',
            options: const AuthenticationOptions(
              stickyAuth: true,
              biometricOnly: true,
              sensitiveTransaction: true,
            ),
          );

          if (authenticated) {
            loginSuccess = true;
            notifyListeners();
            print('Authentication successful');
          } else {
            print('Authentication failed or user canceled');
          }
        } else {
          print('No biometrics available on the device');
        }
      } else {
        print('Local authentication not supported on the device');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  // Future<void> authenticateWithFingerprint(BuildContext context) async {
  //   final LocalAuthentication localAuthentication = LocalAuthentication();

  //   try {
  //     bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

  //     logger.d('cannnn == $canCheckBiometrics');
  //     if (canCheckBiometrics) {
  //       List<BiometricType> availableBiometrics =
  //           await localAuthentication.getAvailableBiometrics();
  //       logger.d('list ===$availableBiometrics');
  //       logger.d('BiometricType.fingerprint${BiometricType.fingerprint}');
  //       if (availableBiometrics.contains(BiometricType.fingerprint)) {
  //         bool authenticated = await localAuthentication.authenticate(
  //           localizedReason: 'Authenticate to Login',
  //           options: const AuthenticationOptions(
  //             stickyAuth: true,
  //             biometricOnly: true,
  //             sensitiveTransaction: true,
  //           ),
  //         );
  //         logger.d('authendicated====$authenticated');
  //         logger.d('authendiacer$authenticated');
  //         if (authenticated) {
  //           // User authenticated successfully
  //           Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) => ScreenHomeView(),
  //               ));
  //         } else {
  //           // User did not authenticate
  //           // ignore: use_build_context_synchronously
  //           ScaffoldMessenger.of(context).showSnackBar(
  //             const SnackBar(
  //               content: Text('Fingerprint authentication failed!'),
  //             ),
  //           );
  //         }
  //       } else {
  //         // Fingerprint authentication not available
  //         // ignore: use_build_context_synchronously
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(
  //             content: Text('Fingerprint authentication not available!'),
  //           ),
  //         );
  //       }
  //     } else {
  //       // Biometrics not available on this device
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Biometrics not available on this device!'),
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     // Handle exceptions
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Error: $e'),
  //       ),
  //     );
  //   }
  // }
}
