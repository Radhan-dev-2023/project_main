import 'dart:developer';

import 'package:finfresh_mobile/model/product%20code%20model/product_code_model.dart';
import 'package:finfresh_mobile/model/productList%20model/product_list_model.dart';
import 'package:finfresh_mobile/model/report%20details%20modal/report_details_model.dart';
import 'package:finfresh_mobile/model/transaction%20report%20model/transaction_report_model.dart';
import 'package:finfresh_mobile/services/holding%20services/holding_service.dart';
import 'package:finfresh_mobile/services/kyc/master_services.dart';
import 'package:finfresh_mobile/services/refersh%20token/refersh_token.dart';
import 'package:finfresh_mobile/utilities/constant/logger.dart';
import 'package:finfresh_mobile/utilities/constant/secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class HoldingsController extends ChangeNotifier {
  final GlobalKey<FormState> formKeyforSwitch = GlobalKey<FormState>();
  final TextEditingController amountController = TextEditingController();
  HoldingServices holdingServices = HoldingServices();
  RefershTokenService refershTokenService = RefershTokenService();
  TransactionReport? transactionReport;
  bool loadingHoldingpage = true;
  Future<void> fetchTransactionReport(context) async {
    loadingHoldingpage = true;
    notifyListeners();
    try {
      String token = await SecureStorage.readToken('token');
      bool isTokenExpired = JwtDecoder.isExpired(token);
      if (isTokenExpired) {
        await refershTokenService.postRefershTocken(context);
        transactionReport =
            await holdingServices.fetchTranscationReprot(context);
        loadingHoldingpage = false;
        notifyListeners();
      } else {
        transactionReport =
            await holdingServices.fetchTranscationReprot(context);
        loadingHoldingpage = false;
        notifyListeners();
      }
    } catch (e) {
      logger.d('report failed with an exception$e');
      loadingHoldingpage = false;
      notifyListeners();
    }
  }

  String? redeemValue;
  String? redeemValueToBackend;
  List<String> radeemList = [
    'Redeem',
    'Switch',
  ];
  void updateRedeemValue(String value) {
    redeemValue = value;
    redeemValueToBackend = value.toLowerCase();
    log(redeemValueToBackend ?? '');
    notifyListeners();
  }

  String? redeemBy;
  List<String> redeemByList = [
    'Amount',
    'All Units',
  ];
  void updateRadeemBy(String? value) {
    redeemBy = value;
    notifyListeners();
  }

  String? foliovalue;
  void updateFolio(String? value) {
    foliovalue = value;
    log('foliovalue ==$foliovalue');
    notifyListeners();
  }

  void clearValue() {
    foliovalue = null;
    redeemValue = null;
    redeemBy = null;
    amountController.clear();
    selectvalue = null;
    notifyListeners();
  }

  List<String> folioList = [];

  bool loading = false;
  ReportDetailsModel? reportDetailsModel;
  Future<void> fetchReportDetails(
      context, String isinNumber, String trxnumber) async {
    folioList.clear();
    loading = true;
    notifyListeners();
    try {
      String token = await SecureStorage.readToken('token');
      bool isTokenExpired = JwtDecoder.isExpired(token);
      if (isTokenExpired) {
        await refershTokenService.postRefershTocken(context);
        reportDetailsModel =
            await holdingServices.fetchReprot(context, isinNumber, trxnumber);

        if (reportDetailsModel != null) {
          log('hi');
          var purchaseDetails = reportDetailsModel?.result?.purchaseDetails;

          if (purchaseDetails != null) {
            for (var purchaseDetail in purchaseDetails) {
              folioList.add(purchaseDetail.folio);
              log("folioList======$folioList");
            }
          }
        }
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        reportDetailsModel =
            await holdingServices.fetchReprot(context, isinNumber, trxnumber);

        if (reportDetailsModel != null) {
          log('hi');
          var purchaseDetails = reportDetailsModel?.result?.purchaseDetails;

          if (purchaseDetails != null) {
            for (var purchaseDetail in purchaseDetails) {
              folioList.add(purchaseDetail.folio);
              log("folioList======$folioList");
            }
          }
        }
        notifyListeners();
        loading = false;
        notifyListeners();
      }
    } catch (e) {
      logger.d('report failed with an exception$e');
      loading = false;
      notifyListeners();
    }
  }

  int currentindex = 0;
  void changeindex(int index) {
    currentindex = index;
    log('curent$currentindex');
    notifyListeners();
  }

  MasterService masterService = MasterService();
  ProductCodeModel? productCodeModel;
  Future<void> getProductCode(String inisinumber) async {
    productCodeModel = await masterService.getProductCode(inisinumber);
  }

  String? sourceProductCode;
  String? sourceReinvestment;
  ProductListModel? productListModel;
  Future<void> getSourceProductCode(context, String inisinumber) async {
    filteredListForAllFunds.clear();
    productCodeModel = await masterService.getProductCode(inisinumber);
    productListModel = await holdingServices.listProductWithAmc(
        context, productCodeModel?.product?.amcCode ?? '');
    filteredListForAllFunds.addAll(productListModel?.product?.reversed ?? []);
    sourceProductCode = productCodeModel?.product?.productCode;
    sourceReinvestment = productCodeModel?.product?.reinvestTag;
    log(sourceProductCode ?? "");
    log(sourceReinvestment ?? "");
  }

  bool loadingmail = false;
  Future<void> sendMailToClinet(
    String mobile,
    String username,
    String schemename,
    String transactiontype,
    context,
  ) async {
    loadingmail = true;
    notifyListeners();
    try {
      String token = await SecureStorage.readToken('token');
      bool isTokenExpired = JwtDecoder.isExpired(token);
      if (isTokenExpired) {
        await refershTokenService.postRefershTocken(context);
        holdingServices.sendmailToClient(
            mobile, username, schemename, transactiontype, context);
        // notifyListeners();
        loadingmail = false;
        notifyListeners();
      } else {
        holdingServices.sendmailToClient(
            mobile, username, schemename, transactiontype, context);
        // notifyListeners();
        loadingmail = false;
        notifyListeners();
      }
    } catch (e) {
      logger.d('report failed with an exception$e');
      loadingmail = false;
      notifyListeners();
    }
  }

  bool loadingSwicth = false;
  Future<bool> switchTransaction(context) async {
    loadingSwicth = true;
    notifyListeners();
    try {
      String token = await SecureStorage.readToken('token');
      bool isTokenExpired = JwtDecoder.isExpired(token);
      if (isTokenExpired) {
        await refershTokenService.postRefershTocken(context);

        bool result = await holdingServices.transactionSwitch(
          context,
          redeemValueToBackend ?? '',
          productCodeModel?.product?.amcCode ?? '',
          foliovalue ?? '',
          redeemBy ?? '',
          amountController.text,
          sourceProductCode ?? '',
          productCodeModel?.product?.productCode ?? '',
          sourceReinvestment ?? '',
          productCodeModel?.product?.reinvestTag ?? '',
        );
        if (result) {
          loadingSwicth = false;
          notifyListeners();
          return true;
        } else {
          loadingSwicth = false;
          notifyListeners();
          return false;
        }
      } else {
        bool result = await holdingServices.transactionSwitch(
          context,
          redeemValueToBackend ?? '',
          productCodeModel?.product?.amcCode ?? '',
          foliovalue ?? '',
          redeemBy ?? '',
          amountController.text,
          sourceProductCode ?? '',
          productCodeModel?.product?.productCode ?? '',
          sourceReinvestment ?? '',
          productCodeModel?.product?.reinvestTag ?? '',
        );
        if (result) {
          loadingSwicth = false;
          notifyListeners();
          return true;
        } else {
          loadingSwicth = false;
          notifyListeners();
          return false;
        }
      }
    } catch (e) {
      logger.d('report failed with an exception$e');
      loadingSwicth = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> redeemTransaction(
      context, String bankname, String ifscCode) async {
    loadingSwicth = true;
    notifyListeners();
    try {
      log(
        productCodeModel?.product?.productCode ?? '',
      );
      String token = await SecureStorage.readToken('token');
      bool isTokenExpired = JwtDecoder.isExpired(token);
      if (isTokenExpired) {
        await refershTokenService.postRefershTocken(context);

        bool result = await holdingServices.transactionRedeem(
          context,
          redeemValueToBackend ?? '',
          productCodeModel?.product?.amcCode ?? '',
          foliovalue ?? '',
          redeemBy ?? '',
          amountController.text,
          productCodeModel?.product?.productCode ?? '',
          bankname,
          ifscCode,
        );
        if (result) {
          loadingSwicth = false;
          notifyListeners();
          return true;
        } else {
          loadingSwicth = false;
          notifyListeners();
          return false;
        }
      } else {
        bool result = await holdingServices.transactionRedeem(
          context,
          redeemValueToBackend ?? '',
          productCodeModel?.product?.amcCode ?? '',
          foliovalue ?? '',
          redeemBy ?? '',
          amountController.text,
          productCodeModel?.product?.productCode ?? '',
          bankname,
          ifscCode,
        );
        if (result) {
          loadingSwicth = false;
          notifyListeners();
          return true;
        } else {
          loadingSwicth = false;
          notifyListeners();
          return false;
        }
      }
    } catch (e) {
      logger.d('report failed with an exception$e');
      loadingSwicth = false;
      notifyListeners();
      return false;
    }
  }

  TextEditingController searchController = TextEditingController();
  // SchemeServices schemeServices = SchemeServices();
  // String returntoBackend = '3Y';
  ProductList? selectvalue;
  void changeSelectValue(value) {
    selectvalue = value;
    notifyListeners();
  }

  List<ProductList> filteredListForAllFunds = [];
  // TopPerformingMutualFundModel? topPerformingMutualFundModel;
  // Future<void> getTopMfs(context, String category) async {
  //   filteredListForAllFunds.clear();

  //   try {
  //     topPerformingMutualFundModel = await schemeServices
  //         .topPerformingMutualFund(context, category, returntoBackend);

  //     filteredListForAllFunds.addAll(topPerformingMutualFundModel?.list ?? []);

  //     loading = false;
  //     notifyListeners();
  //     log(topPerformingMutualFundModel.toString());
  //   } catch (e) {
  //     logger.d('Exception in top MFs$e');
  //     loading = false;
  //     notifyListeners();
  //   }
  //   loading = false;
  //   notifyListeners();
  // }

//   Future<void> getTopMfsFRomPeriod(context, String category) async {
//     log('calling top mfs');
//     filteredListForAllFunds.clear();

//     log('categort$category ,retunrs$returntoBackend');

//     try {
//       topPerformingMutualFundModel = await schemeServices
//           .topPerformingMutualFund(context, category, returntoBackend);

//       filteredListForAllFunds.addAll(topPerformingMutualFundModel?.list ?? []);
//       // await topPicks(context);

//       loading = false;
//       notifyListeners();
//       log(topPerformingMutualFundModel.toString());
//     } catch (e) {
//       logger.d('Exception in top MFs$e');
//       loading = false;
//       notifyListeners();
//     }
//     loading = false;
//     notifyListeners();
//   }
}
