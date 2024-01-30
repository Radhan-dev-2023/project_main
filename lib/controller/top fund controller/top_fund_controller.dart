import 'package:finfresh_mobile/model/schem%20allCategory/scheme_allcategory_model.dart';
import 'package:finfresh_mobile/services/scheme%20services/scheme_services.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:flutter/material.dart';

class TopFundController extends ChangeNotifier {
  SchemeServices schemeServices = SchemeServices();
  SchemeAllCategoryModel? schemeAllCategoryModel;
  bool loading = false;
  Future<void> getSchemeAllCategory(context) async {
    loading = true;

    try {
      schemeAllCategoryModel = await schemeServices.schemeAllCategory(context);
      loading = false;
      notifyListeners();
    } catch (e) {
      logger.d('Exxception $e');
      loading = false;
      notifyListeners();
    }
    loading = false;
    notifyListeners();
  }
}
