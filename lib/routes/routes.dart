import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/db/model/investors_data_model.dart';
import 'package:finfresh_mobile/view/kyc/Nominee%20adding/Nominee%202/screen_nominee_2.dart';
import 'package:finfresh_mobile/view/kyc/Nominee%20adding/Nominee%203/screen_nominee_3.dart';
import 'package:finfresh_mobile/view/kyc/Nominee%20adding/nominee%20type/screen_nominee_count.dart';
import 'package:finfresh_mobile/view/kyc/Nominee%20adding/screen_nominee.dart';
import 'package:finfresh_mobile/view/kyc/adding%20bank/ifsc%20adding/enter_ifsc_code.dart';
import 'package:finfresh_mobile/view/kyc/adding%20bank/listing%20banks/bank_account_slecting.dart';
import 'package:finfresh_mobile/view/kyc/adding%20nominee%20and%20guardian/adding_nominee_guardian.dart';
import 'package:finfresh_mobile/view/kyc/address/address_screen.dart';
import 'package:finfresh_mobile/view/kyc/bank%20account%20number/screen_bank_accont_number.dart';
import 'package:finfresh_mobile/view/kyc/guardian%20screen/screen_guardian.dart';
import 'package:finfresh_mobile/view/kyc/joint%20holders/join_holders_screen.dart';
import 'package:finfresh_mobile/view/kyc/nri%20address/nri_address_screen.dart';
import 'package:finfresh_mobile/view/kyc/occupation%20Screen/occupation_screen.dart';
import 'package:finfresh_mobile/view/kyc/pancard/screen_pan_card.dart';
import 'package:finfresh_mobile/view/kyc/parent%20details%20adding/adding_parent_details.dart';
import 'package:finfresh_mobile/view/kyc/tax%20status/screen_tax_status.dart';
import 'package:finfresh_mobile/view/kyc/user%20personal%20details/screen_personal_details.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Routes {
  static void dashboardToKycPage(context) async {
    final investorDb = await Hive.openBox<InvestorModel>('investor_db');

    if (investorDb.isOpen) {
      final retrievedValue = investorDb.get('pageNumber');
      final pageNumber = int.tryParse(retrievedValue?.pageNumber ?? '');

      switch (pageNumber) {
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenPanCard(),
            ),
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenTaxStatus(),
            ),
          );
          break;
        case 3:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenOccupation(),
            ),
          );
          break;
        case 4:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenPersonalDetails(),
            ),
          );
          break;
        case 5:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenAddress(),
            ),
          );
          break;
        case 6:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenNriAdress(),
            ),
          );
          break;
        case 7:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenAddingParentDetails(),
            ),
          );
          break;
        case 8:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenIfcAdding(),
            ),
          );
          break;
        case 9:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenIfcAdding(),
            ),
          );
          break;
        case 10:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenBankAccountNumber(),
            ),
          );
          break;
        case 11:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenJointHolders(),
            ),
          );
          break;
        case 12:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddingNomineeAndGuadianScreen(),
            ),
          );
          break;
        case 13:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenNomineeCount(),
            ),
          );
          break;
        case 14:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenAddingNominee(),
            ),
          );
          break;
        case 15:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenNominee2(),
            ),
          );
          break;
        case 16:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenNominee3(),
            ),
          );
          break;
        case 17:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenGuardianAdding(),
            ),
          );
          break;
        default:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenPanCard(),
            ),
          );
          break;
      }
    }
  }
}
