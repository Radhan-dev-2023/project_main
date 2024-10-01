import 'package:finfresh_mobile/controller/achController/ach_controller.dart';
import 'package:finfresh_mobile/controller/auth/auth_controller.dart';
import 'package:finfresh_mobile/controller/bank%20controller/bank_controller.dart';
import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:finfresh_mobile/controller/expense%20summary%20controller/expense_summary_controller.dart';
import 'package:finfresh_mobile/controller/fatcha%20registration/fatcha_registration.dart';
import 'package:finfresh_mobile/controller/filter%20controller/filter_controller.dart';
import 'package:finfresh_mobile/controller/goldController/gold_controller.dart';
import 'package:finfresh_mobile/controller/holdingns%20controller/holdings_controller.dart';
import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/controller/login%20pin%20controller/login_pin_controller.dart';
import 'package:finfresh_mobile/controller/pin%20controller/pin_controller.dart';
import 'package:finfresh_mobile/controller/scheme%20details%20controller/scheme_details_controller.dart';
import 'package:finfresh_mobile/controller/search%20controller/search_controller.dart';
import 'package:finfresh_mobile/controller/top%20MFs%20controller/top_mfs_controller.dart';
import 'package:finfresh_mobile/controller/top%20fund%20controller/top_fund_controller.dart';
import 'package:finfresh_mobile/controller/uploading%20proofs/uploading_proof_controller.dart';
import 'package:finfresh_mobile/db/model/investors_data_model.dart';
import 'package:finfresh_mobile/utilities/theme/theme.dart';
import 'package:finfresh_mobile/view/sign%20in/sign_in_screen.dart';
import 'package:finfresh_mobile/view/splash%20Screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'aggregator/Model/report.dart';
import 'aggregator/Screens/provider_class.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(InvestorModelAdapter().typeId)) {
    Hive.registerAdapter(InvestorModelAdapter());

    ///////newly added adapters for the AGGREGATOR

    Hive.registerAdapter(ReportDataHiveModelAdapter());
    Hive.registerAdapter(ReportDataAdapter());
    Hive.registerAdapter(AccountAdapter());
    Hive.registerAdapter(BankAdapter());
    Hive.registerAdapter(CustomerInfoAdapter());
    Hive.registerAdapter(HolderAdapter());
    Hive.registerAdapter(AccountTransactionAdapter());
  }
  await requestPermissions();
  runApp(const MyApp());
}
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> requestPermissions() async {
  final statuses = await [
    Permission.camera,
  ].request();

  if (statuses[Permission.camera] != PermissionStatus.granted) {
    // Handle the case when permissions are not granted
    print('One or more permissions are not granted.');
  }
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
        ChangeNotifierProvider(
          create: (context) => FilterController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchFundsController(),
        ),
        ChangeNotifierProvider(
          create: (context) => GoldController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ExpenseSummaryController(),
        ),
        ChangeNotifierProvider(create: (context) => TransactionProvider()),
      ],
      child: ResponsiveSizer(builder: (context, orientation, screenType) {

        return MaterialApp(

          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,

          theme: isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
          // darkTheme: AppTheme.darkTheme,
          home: const SplashScreen(),
          // home: const ScreenHomeView(),
          // home: const ScreenSignin(),

          // home: PayUPayment(),
          // home: ScreenSetPinNumber(),
          // home: ScreenGuardianAdding(),
          // home: ScreenMobileRelation(),
          // home: ScreenEnterPhoneNumber(),
          // home: ScreenIfcAdding(),
          // home: ScreenDigiGold(),
          // home: ScreenMutualFund(),
          // home: BoardingViewScreen(),
          // home: CongratualtionScreen(),
          // home: ScreenPayment(),
          // home: ScreenCompletedScreen(),
          // home: const ScreenFatchaProof(),
          // home: ScreenFatchaRegistration(),
          // home: ScreenNriAdress(),
          // home: ScreenSettings(),
          // home: ScreenBankProofs(),
          // home: ScreenAddingParentDetails(),
          // home: ScreenJointHolders(),
          // home: ScreenOtp(title: 'sign up'),
          // home: const AddingNomineeAndGuadianScreen(),
          // home: const ScreenUploadinProofs(),
          // home: ScreenBankAccountNumber(),
          //  home: const ScreenIfcAdding(),
          // home: ScreenBankAccountNumber(),
          // home: const ScreenUploadingBankProof(),
          // home: const ScreenAddress(),
          // home: const ScreenTaxStatus(),
          // home: const ScreenJointHolders(),
          // home: const ScreenAddingNominee(),
          // home: ScreenAddingNominee(),
          // home: const ScreenNomineeCount(),
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
