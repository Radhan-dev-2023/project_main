import 'package:finfresh_mobile/services/refersh%20token/refersh_token.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:finfresh_mobile/view/login%20with%20pin/screen_login_with_pin.dart';
import 'package:finfresh_mobile/view/onboarding%20screen/on_boarding_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToOnboarding();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 55.h,
        ),
      ),
    );
  }

  void navigateToOnboarding() async {
    RefershTokenService refershTokenService = RefershTokenService();
    String token = await SecureStorage.readToken('token');

    await Future.delayed(
      const Duration(seconds: 3),
    );
    if (token.isNotEmpty) {
      bool isTokenExpired = JwtDecoder.isExpired(token);
      if (isTokenExpired) {
        // ignore: use_build_context_synchronously
        bool result = await refershTokenService.postRefershTocken(context);
        if (result == true) {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const PinEnterForLoginScreen(),
              ));
        }
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const PinEnterForLoginScreen(),
            ));
      }
      // ignore: use_build_context_synchronously
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BoardingViewScreen(),
        ),
      );
    }
  }
}
