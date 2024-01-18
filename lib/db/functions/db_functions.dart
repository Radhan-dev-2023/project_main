import 'dart:developer';

import 'package:finfresh_mobile/db/model/investors_data_model.dart';
import 'package:hive/hive.dart';

class DbFunctions {
  Future<void> addTodb(InvestorModel value) async {
    final investorDb = await Hive.openBox<InvestorModel>('investor_db');
    investorDb.put('email', value);
  }

  Future<void> updatePagenumber(InvestorModel value) async {
    final investorDb = await Hive.openBox<InvestorModel>('investor_db');
    log('pagenumber value ==${value.pageNumber}');
    investorDb.put('pageNumber', value);
    final nihad = investorDb.get('pageNumber');
    log('nihad${nihad!.pageNumber}');
  }
}
