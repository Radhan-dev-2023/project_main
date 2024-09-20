import 'package:finfresh_mobile/controller/achController/ach_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/webview/screen_webview.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenAchRegistration extends StatelessWidget {
  const ScreenAchRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Provider.of<AchController>(context, listen: false).clearValue();
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
        title: const Text('ACH Mandate Registration'),
      ),
      body: Container(
        margin: EdgeInsets.all(15.sp),
        child: SingleChildScrollView(
          child: Consumer<AchController>(builder: (context, achController, _) {
            return Form(
              key: achController.formkeyForAch,
              child: Column(
                children: [
                  // VerticalSpacer(2.h),
                  // TextFormField(
                  //   controller: achController.microController,
                  //   style: Theme.of(context).textTheme.labelLarge!,
                  //   // autovalidateMode: AutovalidateMode.onUserInteraction,
                  //   // validator: (value) {
                  //   //   if (value == null || value.isEmpty) {
                  //   //     return 'Please Enter MICR Number';
                  //   //   }
                  //   //   return null;
                  //   // },
                  //   decoration: InputDecoration(
                  //     // filled: true,
                  //     // fillColor: const Color(0xFF0E1330),
                  //     border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(10)),
                  //     hintText: 'Enter MICR Number',
                  //   ),
                  // ),
                  VerticalSpacer(2.h),
                  DropdownButtonFormField<String>(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null) {
                        return 'Please Select Until Cancelled';
                      }
                      return null;
                    },
                    style: Theme.of(context).textTheme.labelLarge!,
                    value: achController.cancelvalue,
                    decoration: InputDecoration(
                      hintText: 'Select Until Cancelled',
                      label: Text(
                        'Select Until Cancelled',
                        style: Theme.of(context).textTheme.labelLarge!,
                      ),
                    ),
                    onChanged: (String? newValue) {
                      achController.updateCancelValue(newValue ?? '');
                      if (newValue == 'Yes') {
                        achController.achTodate();
                      } else {
                        achController.todateController.clear();
                      }
                    },
                    items: achController.cancellist.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    }).toList(),
                  ),
                  VerticalSpacer(2.h),
                  CustomDateWidget(
                    hittext: 'Select From Date',
                    controller: achController.fromdateController,
                  ),
                  VerticalSpacer(2.h),
                  CustomDateWidget(
                    controller: achController.todateController,
                    hittext: 'Select To Date',
                  ),
                  VerticalSpacer(2.h),
                  TextFormField(
                    controller: achController.amountController,
                    style: Theme.of(context).textTheme.labelLarge!,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter The Amount';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        // filled: true,
                        // fillColor: const Color(0xFF0E1330),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Enter Amount',
                        label: Text('Enter Amount',
                            style: Theme.of(context).textTheme.labelLarge!)),
                  ),
                  VerticalSpacer(2.h),
                  DropdownButtonFormField<String>(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null) {
                        return 'Please Select Process Mode';
                      }
                      return null;
                    },
                    style: Theme.of(context).textTheme.labelLarge!,
                    value: achController.processmodevalue,
                    decoration: InputDecoration(
                        hintText: 'Select Process Mode',
                        label: Text(
                          'Select Process Mode',
                          style: Theme.of(context).textTheme.labelLarge!,
                        )),
                    onChanged: (String? newValue) {
                      achController.updateProcessMode(newValue!);
                    },
                    items: achController.processmode.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    }).toList(),
                  ),
                  VerticalSpacer(2.h),
                  DropdownButtonFormField<String>(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null) {
                        return 'Please Select Channel Type';
                      }
                      return null;
                    },
                    style: Theme.of(context).textTheme.labelLarge!,
                    value: achController.channelvalue,
                    decoration: InputDecoration(
                        hintText: 'Select Channel Type',
                        label: Text('Select Channel Type',
                            style: Theme.of(context).textTheme.labelLarge!)),
                    onChanged: (String? newValue) {
                      achController.updateChannelType(newValue!);
                    },
                    items: achController.channel.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    }).toList(),
                  ),
                  VerticalSpacer(5.h),
                  achController.loadingAch == true
                      ? const LoadingButton()
                      : ButtonWidget(
                          btName: 'Submit',
                          onTap: () async {
                            if (achController.formkeyForAch.currentState!
                                .validate()) {
                              bool result = await achController.registerAch(
                                context,
                                true,
                              );
                              if (result == true) {
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ScreenWebview(
                                        url: achController.result),
                                  ),
                                );

                                // achController.clearValue();
                              }
                            }
                          },
                        )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class CustomDateWidget extends StatelessWidget {
  final String hittext;
  final TextEditingController controller;

  const CustomDateWidget({
    super.key,
    required this.hittext,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2999),
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                primaryTextTheme: TextTheme(
                    bodyMedium: TextStyle(fontSize: 15.sp),
                    bodyLarge: TextStyle(fontSize: 15.sp)),
                colorScheme: const ColorScheme.light(
                  primary: Color(0xFF4D84BD), // header background color
                  onPrimary: Colors.white, // header text color
                  onSurface: Colors.black, // body text color
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor:
                        const Color(0xFF4D84BD), // button text color
                  ),
                ),
              ),
              child: child!,
            );
          },
        );
        if (picked != null) {
          String selectdate = DateFormat('dd-MMM-yyyy').format(picked);
          // log('selected date ===$selectdate');
          controller.text = selectdate;
        }
      },
      readOnly: true,
      style: Theme.of(context).textTheme.labelLarge!,
      // maxLength: 10,
      // controller: ,
      validator: (value) {
        if (!RegExp(r'^\d{2}-[a-zA-Z]{3}-\d{4}$').hasMatch(value!)) {
          return 'Please $hittext';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        // prefix: const Text('+91'),
        hintText: hittext,
        label: Text(
          hittext,
          style: Theme.of(context).textTheme.labelLarge!,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
        ),
      ),
    );
  }
}
