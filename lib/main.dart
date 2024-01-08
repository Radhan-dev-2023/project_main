import 'package:finfresh_mobile/controller/auth/auth_controller.dart';
import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/controller/login%20pin%20controller/login_pin_controller.dart';
import 'package:finfresh_mobile/controller/pin%20controller/pin_controller.dart';
import 'package:finfresh_mobile/utilities/theme/theme.dart';
import 'package:finfresh_mobile/view/homeScreen/screen_home_view_screen.dart';
import 'package:finfresh_mobile/view/nominee%20id%20adding/screen_nominee_id_adding.dart';
import 'package:finfresh_mobile/view/occupation%20Screen/occupation_screen.dart';
import 'package:finfresh_mobile/view/pancard/screen_pan_card.dart';
import 'package:finfresh_mobile/view/setting%20pin%20number/setting_pin.dart';
import 'package:finfresh_mobile/view/splash%20Screen/splash_screen.dart';
import 'package:finfresh_mobile/view/user%20personal%20details/screen_personal_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Brightness platformBrightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = platformBrightness == Brightness.dark;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthController(),
        ),
        ChangeNotifierProvider(
          create: (context) => PinController(),
        ),
        ChangeNotifierProvider(
          create: (context) => BiometricLogin(),
        ),
        ChangeNotifierProvider(
          create: (context) => KycController(),
        )
      ],
      child: ResponsiveSizer(builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
          // darkTheme: AppTheme.darkTheme,
          home: const SplashScreen(),
          // home: const ScreenPanCard(),
          // home: const ScreenPersonalDetails(),
          // home: const ScreenSetPinNumber(),
          // home: const ScreenHomeView(),
          // home: const ScreenOccupation(),
        );
      }),
    );
  }
}
