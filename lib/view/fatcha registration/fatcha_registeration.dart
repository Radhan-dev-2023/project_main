import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:finfresh_mobile/controller/fatcha%20registration/fatcha_registration.dart';
import 'package:finfresh_mobile/model/source%20wealth%20model/source_wealth_model.dart';
import 'package:finfresh_mobile/model/state%20model/state_model.dart';
import 'package:finfresh_mobile/model/ubo%20income%20model/ubo_income_model.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/fatcha%20registration/upload%20fatcha%20proof/screen.upload_fatcha_proof.dart';
import 'package:finfresh_mobile/view/fatcha%20registration/widget/congratulation_screen.dart';
import 'package:finfresh_mobile/view/homeScreen/screen_home_view_screen.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenFatchaRegistration extends StatefulWidget {
  const ScreenFatchaRegistration({super.key});

  @override
  State<ScreenFatchaRegistration> createState() =>
      _ScreenFatchaRegistrationState();
}

class _ScreenFatchaRegistrationState extends State<ScreenFatchaRegistration> {
  @override
  void initState() {
    super.initState();
    Provider.of<FatchaRegistrationController>(context, listen: false)
        .intialvalueofIdentity();
    Provider.of<FatchaRegistrationController>(context, listen: false)
        .incomeModelMaster = null;
    Provider.of<FatchaRegistrationController>(context, listen: false)
        .sourceWealth = null;
    Provider.of<FatchaRegistrationController>(context, listen: false)
        .masterdetails = null;
    // Provider.of<FatchaRegistrationController>(context, listen: false)
    //     .countryMasterDetail = null;
    Provider.of<FatchaRegistrationController>(context, listen: false)
        .stateMasterDetail = null;
    Provider.of<FatchaRegistrationController>(context, listen: false).clear();
    Provider.of<FatchaRegistrationController>(context, listen: false)
        .fetchUboIncome();
    Provider.of<FatchaRegistrationController>(context, listen: false)
        .fetchSourceWealth();
    Provider.of<FatchaRegistrationController>(context, listen: false)
        .fetchUbo();
    // Provider.of<FatchaRegistrationController>(context, listen: false)
    //     .fetchCountry();
    Provider.of<FatchaRegistrationController>(context, listen: false)
        .fetchState();
  }

  @override
  Widget build(BuildContext context) {
    final dashbordcontroller =
        Provider.of<DashBoardController>(context, listen: false);
    // List<String> pepList = ['N', 'Y', 'R'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('FATCA Registration'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15.sp),
          child: Consumer<FatchaRegistrationController>(
              builder: (context, fatchRegitration, child) {
            return Form(
              key: fatchRegitration.formKeyforfatca,
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null) {
                        return 'Please Select Address Type';
                      }
                      return null;
                    },
                    style: Theme.of(context).textTheme.labelLarge!,
                    value: fatchRegitration.addressvalue,
                    decoration: const InputDecoration(
                      hintText: 'Select Address Type',
                    ),
                    onChanged: (String? newValue) {
                      fatchRegitration.updateaddressvalue(newValue);
                    },
                    items: fatchRegitration.addressList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    }).toList(),
                  ),
                  VerticalSpacer(2.h),
                  DropdownButtonFormField<IncomeModelMaster>(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null) {
                        return 'Please Select Income ';
                      }
                      return null;
                    },
                    style: Theme.of(context).textTheme.labelLarge!,
                    value: fatchRegitration.incomeModelMaster,
                    decoration: const InputDecoration(
                      hintText: 'Select Income',
                    ),
                    onChanged: (IncomeModelMaster? value) {
                      fatchRegitration.updateIncomeValue(value);
                    },
                    items: fatchRegitration.incomeModel?.masterDetails
                        ?.map((IncomeModelMaster value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value.appIncomeDesc.toString(),
                        ),
                      );
                    }).toList(),
                  ),
                  dashbordcontroller.dashBoardModel?.result?.data?.taxStatus !=
                          '01'
                      ? VerticalSpacer(2.h)
                      : const SizedBox(),
                  dashbordcontroller.dashBoardModel?.result?.data?.taxStatus !=
                          '01'
                      ? TextFormField(
                          style: Theme.of(context).textTheme.labelLarge!,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Net Worth Sign';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            // filled: true,
                            // fillColor: const Color(0xFF0E1330),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Net Worth Sign',
                          ),
                        )
                      : const SizedBox(),
                  dashbordcontroller.dashBoardModel?.result?.data?.taxStatus !=
                          '01'
                      ? VerticalSpacer(2.h)
                      : const SizedBox(),
                  dashbordcontroller.dashBoardModel?.result?.data?.taxStatus !=
                          '01'
                      ? TextFormField(
                          style: Theme.of(context).textTheme.labelLarge!,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Net Worth';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            // filled: true,
                            // fillColor: const Color(0xFF0E1330),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Net Worth',
                          ),
                        )
                      : const SizedBox(),
                  dashbordcontroller.dashBoardModel?.result?.data?.taxStatus !=
                          '01'
                      ? VerticalSpacer(2.h)
                      : const SizedBox(),
                  dashbordcontroller.dashBoardModel?.result?.data?.taxStatus !=
                          '01'
                      ? TextFormField(
                          style: Theme.of(context).textTheme.labelLarge!,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Net Worth Date';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            // filled: true,
                            // fillColor: const Color(0xFF0E1330),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Net Worth Date',
                          ),
                        )
                      : const SizedBox(),
                  VerticalSpacer(2.h),
                  DropdownButtonFormField<String>(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null) {
                        return 'Please Select Politically Exposed Person';
                      }
                      return null;
                    },
                    style: Theme.of(context).textTheme.labelLarge!,
                    value: fatchRegitration.pepvalue,
                    decoration: const InputDecoration(
                        hintText: 'Politically Exposed Person'),
                    onChanged: (String? newValue) {
                      fatchRegitration.updatePepValue(newValue);
                    },
                    items: fatchRegitration.pepList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    }).toList(),
                  ),
                  VerticalSpacer(2.h),
                  DropdownButtonFormField<SourceWealth>(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null) {
                        return 'Please Select Source wealth ';
                      }
                      return null;
                    },
                    style: Theme.of(context).textTheme.labelLarge!,
                    value: null,
                    decoration:
                        const InputDecoration(hintText: 'Select Source wealth'),
                    onChanged: (SourceWealth? newValue) {
                      fatchRegitration.updateSourceWealthValue(newValue);
                    },
                    items: fatchRegitration.sourceWealthModel?.masterDetails
                        ?.map((SourceWealth value) {
                      return DropdownMenuItem<SourceWealth>(
                        value: value,
                        child: Text(
                          value.sourceOfWealth.toString(),
                        ),
                      );
                    }).toList(),
                  ),
                  VerticalSpacer(2.h),
                  DropdownButtonFormField<String>(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null) {
                        return 'Please Select Country Of Birth ';
                      }
                      return null;
                    },
                    style: Theme.of(context).textTheme.labelLarge!,
                    value: fatchRegitration.contryValue,
                    decoration: const InputDecoration(
                        hintText: 'Select Country Of Birth'),
                    onChanged: (String? newValue) {
                      fatchRegitration.updatecountryvalue(newValue);
                      if (fatchRegitration.contryValue == 'Foreign Nationals') {
                        showAlertDialog(context);
                      }
                    },
                    items: fatchRegitration.countryList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    }).toList(),
                  ),
                  // DropdownButtonFormField<CountryMasterDetail>(
                  //   autovalidateMode: AutovalidateMode.onUserInteraction,
                  //   validator: (value) {
                  //     if (value == null) {
                  //       return 'Please Select Country Of Birth ';
                  //     }
                  //     return null;
                  //   },
                  //   style: Theme.of(context).textTheme.labelLarge!,
                  //   value: fatchRegitration.countryMasterDetail,
                  //   decoration: const InputDecoration(
                  //     hintText: 'Select Country Of Birth',
                  //   ),
                  //   onChanged: (CountryMasterDetail? newValue) {
                  //     fatchRegitration.updateCountryvalue(newValue);
                  //   },
                  //   items: fatchRegitration.countryModel?.masterDetails
                  //       ?.map((CountryMasterDetail value) {
                  //     return DropdownMenuItem<CountryMasterDetail>(
                  //       value: value,
                  //       child: Text(
                  //         value.countryName.toString(),
                  //       ),
                  //     );
                  //   }).toList(),
                  // ),
                  fatchRegitration.contryValue == 'India'
                      ? VerticalSpacer(2.h)
                      : const SizedBox(),
                  fatchRegitration.contryValue == 'India'
                      ? DropdownButtonFormField<StateMasterDetail>(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null) {
                              return 'Please Select State Of Birth ';
                            }
                            return null;
                          },
                          style: Theme.of(context).textTheme.labelLarge!,
                          value: fatchRegitration.stateMasterDetail,
                          decoration: const InputDecoration(
                            hintText: 'Select State Of Birth',
                          ),
                          onChanged: (StateMasterDetail? newValue) {
                            fatchRegitration.updateStatevalue(newValue);
                          },
                          items: fatchRegitration.stateModel?.masterDetails
                              ?.map((StateMasterDetail value) {
                            return DropdownMenuItem<StateMasterDetail>(
                              value: value,
                              child: Text(
                                value.stateName.toString(),
                              ),
                            );
                          }).toList(),
                        )
                      : const SizedBox(),
                  VerticalSpacer(2.h),
                  DropdownButtonFormField<String>(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null) {
                        return 'Please Select Foreign Tax Residency ';
                      }
                      return null;
                    },
                    style: Theme.of(context).textTheme.labelLarge!,
                    value: fatchRegitration.taxresidencyValue,
                    decoration: const InputDecoration(
                        hintText: 'Foreign Tax Residency'),
                    onChanged: (String? newValue) {
                      fatchRegitration.updateTaxresidencyValue(newValue);
                    },
                    items: fatchRegitration.taxresidency.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    }).toList(),
                  ),
                  fatchRegitration.taxresidencyValue == 'Yes'
                      ? VerticalSpacer(2.h)
                      : const SizedBox(),
                  fatchRegitration.taxresidencyValue == 'Yes'
                      ? TextFormField(
                          style: Theme.of(context).textTheme.labelLarge!,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter residency country';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            // filled: true,
                            // fillColor: const Color(0xFF0E1330),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Residency Country',
                          ),
                        )
                      : const SizedBox(),
                  fatchRegitration.taxresidencyValue == 'Yes'
                      ? VerticalSpacer(2.h)
                      : const SizedBox(),
                  fatchRegitration.taxresidencyValue == 'Yes'
                      ? TextFormField(
                          style: Theme.of(context).textTheme.labelLarge!,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter identity number';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            // filled: true,
                            // fillColor: const Color(0xFF0E1330),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Tax Payer Identity Number',
                          ),
                        )
                      : const SizedBox(),
                  VerticalSpacer(2.h),
                  DropdownButtonFormField<String>(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Select Identity Type ';
                      }
                      return null;
                    },
                    style: Theme.of(context).textTheme.labelLarge!,
                    value: fatchRegitration.identityValue,
                    decoration:
                        const InputDecoration(hintText: 'Identity Type'),
                    onChanged: (String? newValue) {
                      fatchRegitration.updatetheIdentitytype(newValue);
                    },
                    items: fatchRegitration.identityList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    }).toList(),
                  ),
                  // VerticalSpacer(2.h),
                  // DropdownButtonFormField<String>(
                  //   style: Theme.of(context).textTheme.labelLarge!,
                  //   value: null,
                  //   decoration: const InputDecoration(hintText: 'Select FFI'),
                  //   onChanged: (String? newValue) {
                  //     // schemeController.updatePaymentMode(newValue);
                  //   },
                  //   items: pepList.map((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(
                  //         value,
                  //       ),
                  //     );
                  //   }).toList(),
                  // ),
                  // VerticalSpacer(2.h),
                  // DropdownButtonFormField<String>(
                  //   style: Theme.of(context).textTheme.labelLarge!,
                  //   value: null,
                  //   decoration: const InputDecoration(hintText: 'FFI Catagory'),
                  //   onChanged: (String? newValue) {
                  //     // schemeController.updatePaymentMode(newValue);
                  //   },
                  //   items: pepList.map((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(
                  //         value,
                  //       ),
                  //     );
                  //   }).toList(),
                  // ),
                  // VerticalSpacer(2.h),
                  // DropdownButtonFormField<String>(
                  //   style: Theme.of(context).textTheme.labelLarge!,
                  //   value: null,
                  //   decoration:
                  //       const InputDecoration(hintText: 'Nature Of Bussiness'),
                  //   onChanged: (String? newValue) {
                  //     // schemeController.updatePaymentMode(newValue);
                  //   },
                  //   items: pepList.map((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(
                  //         value,
                  //       ),
                  //     );
                  //   }).toList(),
                  // ),
                  // VerticalSpacer(2.h),
                  // DropdownButtonFormField<String>(
                  //   style: Theme.of(context).textTheme.labelLarge!,
                  //   value: null,
                  //   decoration: const InputDecoration(
                  //       hintText: 'Active NFE Sub Category'),
                  //   onChanged: (String? newValue) {
                  //     // schemeController.updatePaymentMode(newValue);
                  //   },
                  //   items: pepList.map((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(
                  //         value,
                  //       ),
                  //     );
                  //   }).toList(),
                  // ),
                  VerticalSpacer(2.h),
                  // DropdownButtonFormField<String>(
                  //   autovalidateMode: AutovalidateMode.onUserInteraction,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please Select Stock Exchange ';
                  //     }
                  //     return null;
                  //   },
                  //   style: Theme.of(context).textTheme.labelLarge!,
                  //   value: fatchRegitration.stockvalue,
                  //   decoration: const InputDecoration(
                  //       hintText: 'Select Stock Exchange'),
                  //   onChanged: (String? newValue) {
                  //     // schemeController.updatePaymentMode(newValue);
                  //   },
                  //   items: fatchRegitration.stockList.map((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(
                  //         value,
                  //       ),
                  //     );
                  //   }).toList(),
                  // ),
                  // VerticalSpacer(2.h),
                  // DropdownButtonFormField<String>(
                  //   style: Theme.of(context).textTheme.labelLarge!,
                  //   value: null,
                  //   decoration:
                  //       const InputDecoration(hintText: 'Select GIIN Applicable'),
                  //   onChanged: (String? newValue) {
                  //     // schemeController.updatePaymentMode(newValue);
                  //   },
                  //   items: stockList.map((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(
                  //         value,
                  //       ),
                  //     );
                  //   }).toList(),
                  // ),
                  // VerticalSpacer(2.h),
                  // TextFormField(
                  //   style: Theme.of(context).textTheme.labelLarge!,
                  //   autovalidateMode: AutovalidateMode.onUserInteraction,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please enter Address 1';
                  //     }
                  //     return null;
                  //   },
                  //   decoration: InputDecoration(
                  //     // filled: true,
                  //     // fillColor: const Color(0xFF0E1330),
                  //     border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(10)),
                  //     hintText: 'GIIN',
                  //   ),
                  // ),
                  // VerticalSpacer(2.h),
                  // TextFormField(
                  //   style: Theme.of(context).textTheme.labelLarge!,
                  //   autovalidateMode: AutovalidateMode.onUserInteraction,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please enter Address 1';
                  //     }
                  //     return null;
                  //   },
                  //   decoration: InputDecoration(
                  //     // filled: true,
                  //     // fillColor: const Color(0xFF0E1330),
                  //     border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(10)),
                  //     hintText: 'GIIN Exem Catagory',
                  //   ),
                  // ),
                  // VerticalSpacer(2.h),
                  // DropdownButtonFormField<String>(
                  //   autovalidateMode: AutovalidateMode.onUserInteraction,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please Select Sponsor Availability ';
                  //     }
                  //     return null;
                  //   },
                  //   style: Theme.of(context).textTheme.labelLarge!,
                  //   value: fatchRegitration.sponservalue,
                  //   decoration: const InputDecoration(
                  //       hintText: 'Select Sponsor Availability'),
                  //   onChanged: (String? newValue) {
                  //     fatchRegitration.updateSponser(newValue);
                  //   },
                  //   items: fatchRegitration.taxresidency.map((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(
                  //         value,
                  //       ),
                  //     );
                  //   }).toList(),
                  // ),
                  // fatchRegitration.sponservalue == "Yes"
                  //     ? VerticalSpacer(2.h)
                  //     : const SizedBox(),
                  // fatchRegitration.sponservalue == "Yes"
                  //     ? TextFormField(
                  //         controller: fatchRegitration.sponserentityController,
                  //         style: Theme.of(context).textTheme.labelLarge!,
                  //         autovalidateMode: AutovalidateMode.onUserInteraction,
                  //         validator: (value) {
                  //           if (value == null || value.isEmpty) {
                  //             return 'Please enter sponser entity';
                  //           }
                  //           return null;
                  //         },
                  //         decoration: InputDecoration(
                  //           // filled: true,
                  //           // fillColor: const Color(0xFF0E1330),
                  //           border: OutlineInputBorder(
                  //               borderRadius: BorderRadius.circular(10)),
                  //           hintText: 'Sponcer Entity',
                  //         ),
                  //       )
                  //     : const SizedBox(),
                  // VerticalSpacer(2.h),
                  // DropdownButtonFormField<UboMasterDetail>(
                  //   autovalidateMode: AutovalidateMode.onUserInteraction,
                  //   validator: (value) {
                  //     if (value == null) {
                  //       return 'Please Select UBO Master Code ';
                  //     }
                  //     return null;
                  //   },
                  //   isExpanded: true,
                  //   style: Theme.of(context).textTheme.labelLarge!,
                  //   value: fatchRegitration.masterdetails,
                  //   decoration: const InputDecoration(
                  //       hintText: 'Select UBO Master Code'),
                  //   onChanged: (UboMasterDetail? newValue) {
                  //     fatchRegitration.updateubo(newValue);
                  //   },
                  //   items: fatchRegitration.uboModel?.masterDetails
                  //       ?.map((UboMasterDetail value) {
                  //     return DropdownMenuItem<UboMasterDetail>(
                  //       value: value,
                  //       child: Text(
                  //         value.description.toString(),
                  //       ),
                  //     );
                  //   }).toList(),
                  // ),
                  // VerticalSpacer(2.h),
                  // TextFormField(
                  //   controller: fatchRegitration.ubocountrybirthController,
                  //   style: Theme.of(context).textTheme.labelLarge!,
                  //   autovalidateMode: AutovalidateMode.onUserInteraction,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please enter country of birth';
                  //     }
                  //     return null;
                  //   },
                  //   decoration: InputDecoration(
                  //     // filled: true,
                  //     // fillColor: const Color(0xFF0E1330),
                  //     border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(10)),
                  //     hintText: 'UBO Country Of Birth',
                  //   ),
                  // ),
                  // VerticalSpacer(2.h),
                  // TextFormField(
                  //   controller: fatchRegitration.uboCountryController,
                  //   style: Theme.of(context).textTheme.labelLarge!,
                  //   autovalidateMode: AutovalidateMode.onUserInteraction,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please enter UBO country';
                  //     }
                  //     return null;
                  //   },
                  //   decoration: InputDecoration(
                  //     // filled: true,
                  //     // fillColor: const Color(0xFF0E1330),
                  //     border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(10)),
                  //     hintText: 'Enter UBO Country ',
                  //   ),
                  // ),
                  // VerticalSpacer(2.h),
                  // DropdownButtonFormField<String>(
                  //   autovalidateMode: AutovalidateMode.onUserInteraction,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please Select UBO Gender ';
                  //     }
                  //     return null;
                  //   },
                  //   style: Theme.of(context).textTheme.labelLarge!,
                  //   value: fatchRegitration.gendervalue,
                  //   decoration:
                  //       const InputDecoration(hintText: 'Select UBO Gender'),
                  //   onChanged: (String? newValue) {
                  //     fatchRegitration.updateGenderValue(newValue);
                  //   },
                  //   items: fatchRegitration.genderlist.map((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(
                  //         value,
                  //       ),
                  //     );
                  //   }).toList(),
                  // ),
                  // VerticalSpacer(2.h),
                  // TextFormField(
                  //   controller: fatchRegitration.holdingPercentageController,
                  //   style: Theme.of(context).textTheme.labelLarge!,
                  //   autovalidateMode: AutovalidateMode.onUserInteraction,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please enter holding percentage';
                  //     }
                  //     return null;
                  //   },
                  //   decoration: InputDecoration(
                  //     // filled: true,
                  //     // fillColor: const Color(0xFF0E1330),
                  //     border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(10)),
                  //     hintText: 'Enter UBO Holding Percentage',
                  //   ),
                  // ),
                  // VerticalSpacer(2.h),
                  // DropdownButtonFormField<String>(
                  //   autovalidateMode: AutovalidateMode.onUserInteraction,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please UBO Id Type';
                  //     }
                  //     return null;
                  //   },
                  //   style: Theme.of(context).textTheme.labelLarge!,
                  //   value: fatchRegitration.uboIdentity,
                  //   decoration:
                  //       const InputDecoration(hintText: 'Select UBO Id Type'),
                  //   onChanged: (String? newValue) {
                  //     fatchRegitration.updateuboidentity(newValue);
                  //   },
                  //   items: fatchRegitration.identityList.map((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(
                  //         value,
                  //       ),
                  //     );
                  //   }).toList(),
                  // ),
                  // VerticalSpacer(2.h),
                  // TextFormField(
                  //   controller: fatchRegitration.ubotinnumberController,
                  //   style: Theme.of(context).textTheme.labelLarge!,
                  //   autovalidateMode: AutovalidateMode.onUserInteraction,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please enter UBO TIN Number';
                  //     }
                  //     return null;
                  //   },
                  //   decoration: InputDecoration(
                  //     // filled: true,
                  //     // fillColor: const Color(0xFF0E1330),
                  //     border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(10)),
                  //     hintText: 'Enter UBO TIN Number',
                  //   ),
                  // ),
                  VerticalSpacer(3.h),
                  fatchRegitration.loading == true
                      ? const LoadingButton()
                      : ButtonWidget(
                          btName: 'SUBMIT',
                          onTap: () async {
                            if (fatchRegitration.formKeyforfatca.currentState!
                                .validate()) {
                              if (dashbordcontroller.dashBoardModel?.result
                                      ?.data?.taxStatus !=
                                  '01') {
                                bool result = await fatchRegitration
                                    .fatchRegistration(context);
                                if (result == true) {
                                  // ignore: use_build_context_synchronously
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ScreenFatchaProof(),
                                    ),
                                  );
                                } else {
                                  return;
                                }
                              } else {
                                bool result = await fatchRegitration
                                    .fatchRegistration(context);
                                if (result == true) {
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CongratualtionScreen(),
                                    ),
                                    (route) => false,
                                  );
                                } else {
                                  return;
                                }
                              }
                            }
                          },
                        ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            'Our customer care will contact you shortly',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w500),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const ScreenHomeView(),
                    ),
                    (route) => false); // Close the dialog
              },
              child: Container(
                  height: 4.h,
                  width: 13.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: const Color(0xFF4D84BD),
                  ),
                  child: const Center(
                      child:
                          Text('OK', style: TextStyle(color: Colors.white)))),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(context); // Close the dialog
              },
              child: Container(
                  height: 4.h,
                  width: 13.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: const Color(0xFF4D84BD),
                  ),
                  child: const Center(
                    child: Text(
                      'NO',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ),
          ],
        );
      },
    );
  }
}
