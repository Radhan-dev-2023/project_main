import 'package:finfresh_mobile/controller/achController/ach_controller.dart';
import 'package:finfresh_mobile/controller/auth/auth_controller.dart';
import 'package:finfresh_mobile/controller/bank%20controller/bank_controller.dart';
import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:finfresh_mobile/controller/fatcha%20registration/fatcha_registration.dart';
import 'package:finfresh_mobile/controller/holdingns%20controller/holdings_controller.dart';
import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/controller/login%20pin%20controller/login_pin_controller.dart';
import 'package:finfresh_mobile/controller/pin%20controller/pin_controller.dart';
import 'package:finfresh_mobile/controller/scheme%20details%20controller/scheme_details_controller.dart';
import 'package:finfresh_mobile/controller/top%20MFs%20controller/top_mfs_controller.dart';
import 'package:finfresh_mobile/controller/top%20fund%20controller/top_fund_controller.dart';
import 'package:finfresh_mobile/controller/uploading%20proofs/uploading_proof_controller.dart';
import 'package:finfresh_mobile/db/model/investors_data_model.dart';
import 'package:finfresh_mobile/utilities/theme/theme.dart';
import 'package:finfresh_mobile/view/fatcha%20registration/fatcha_registeration.dart';
import 'package:finfresh_mobile/view/fatcha%20registration/upload%20fatcha%20proof/screen.upload_fatcha_proof.dart';
import 'package:finfresh_mobile/view/kyc/Nominee%20adding/Nominee%202/screen_nominee_2.dart';
import 'package:finfresh_mobile/view/kyc/Nominee%20adding/Nominee%203/screen_nominee_3.dart';
import 'package:finfresh_mobile/view/kyc/Nominee%20adding/nominee%20type/screen_nominee_count.dart';
import 'package:finfresh_mobile/view/kyc/Nominee%20adding/screen_nominee.dart';
import 'package:finfresh_mobile/view/homeScreen/screen_home_view_screen.dart';
import 'package:finfresh_mobile/view/kyc/adding%20bank/ifsc%20adding/enter_ifsc_code.dart';
import 'package:finfresh_mobile/view/kyc/adding%20bank/upload%20bank%20proof/uploading_bank_proof.dart';
import 'package:finfresh_mobile/view/kyc/adding%20nominee%20and%20guardian/adding_nominee_guardian.dart';
import 'package:finfresh_mobile/view/kyc/address/address_screen.dart';
import 'package:finfresh_mobile/view/kyc/bank%20account%20number/screen_bank_accont_number.dart';
import 'package:finfresh_mobile/view/kyc/joint%20holders/join_holders_screen.dart';
import 'package:finfresh_mobile/view/kyc/nri%20address/nri_address_screen.dart';
import 'package:finfresh_mobile/view/kyc/parent%20details%20adding/adding_parent_details.dart';
import 'package:finfresh_mobile/view/kyc/tax%20status/screen_tax_status.dart';
import 'package:finfresh_mobile/view/kyc/uploading%20proofs/screen_upload_proof.dart';
import 'package:finfresh_mobile/view/kyc/uploading%20proofs/upload%20bank%20proof/upload_bank_proof.dart';
import 'package:finfresh_mobile/view/nominee%20id%20adding/screen_nominee_id_adding.dart';
import 'package:finfresh_mobile/view/kyc/occupation%20Screen/occupation_screen.dart';
import 'package:finfresh_mobile/view/kyc/pancard/screen_pan_card.dart';
import 'package:finfresh_mobile/view/otp%20screen/screen_otp.dart';
import 'package:finfresh_mobile/view/payment%20Screen/payment_screen.dart';
import 'package:finfresh_mobile/view/setting%20pin%20number/setting_pin.dart';
import 'package:finfresh_mobile/view/showing%20animation%20screen/screen_showing_animation.dart';
import 'package:finfresh_mobile/view/sign%20in/sign_in_screen.dart';
import 'package:finfresh_mobile/view/sign%20up/enter%20phone%20number/sign_in_screen.dart';
import 'package:finfresh_mobile/view/splash%20Screen/splash_screen.dart';
import 'package:finfresh_mobile/view/kyc/user%20personal%20details/screen_personal_details.dart';
import 'package:finfresh_mobile/view/webview/screen_webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, 
    DeviceOrientation.portraitDown,
  ]);
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(InvestorModelAdapter().typeId)) {
    Hive.registerAdapter(InvestorModelAdapter());
  }
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
        ),
        ChangeNotifierProvider(
          create: (context) => UploadingProof(),
        ),
        ChangeNotifierProvider(
          create: (context) => DashBoardController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SchemeDetailsController(),
        ),
        ChangeNotifierProvider(
          create: (context) => TopFundController(),
        ),
        ChangeNotifierProvider(
          create: (context) => TopMFsController(),
        ),
        ChangeNotifierProvider(
          create: (context) => FatchaRegistrationController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AchController(),
        ),
        ChangeNotifierProvider(
          create: (context) => BankController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HoldingsController(),
        ),
      ],
      child: ResponsiveSizer(builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          theme: isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
          // darkTheme: AppTheme.darkTheme,
          home: const SplashScreen(),
          // home: ScreenPayment(),
          // home: ScreenCompletedScreen(),
          // home: const ScreenFatchaProof(),
          // home: ScreenFatchaRegistration(),
          // home: ScreenNriAdress(),
          // home: ScreenBankProofs(),
          // home: ScreenAddingParentDetails(),
          // home: ScreenJointHolders(),
          // home: ScreenOtp(title: 'sign up'),
          // home: const AddingNomineeAndGuadianScreen(),
          // home: const ScreenUploadinProofs(),
          // home: ScreenBankAccountNumber(),
          // home: const ScreenIfcAdding(),
          //  home: ScreenBankAccountNumber(),
          // home: const ScreenUploadingBankProof(),
          // home: const ScreenAddress(),
          // home: const ScreenTaxStatus(),
          // home: const ScreenJointHolders(),
          // home: const ScreenAddingNominee(),
          // home: ScreenAddingNominee(),
          // home: const ScreenNomineeCount(),
          //  home: const ScreenPanCard(),
          // home: const ScreenPersonalDetails(),
          // home: const ScreenSetPinNumber(),
          // home: const ScreenHomeView(),
          // home: const ScreenOccupation(),
        );
      }),
    );
  }
}
