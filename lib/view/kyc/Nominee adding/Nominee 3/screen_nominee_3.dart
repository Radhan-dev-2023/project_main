import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/homeScreen/screen_home_view_screen.dart';
import 'package:finfresh_mobile/view/kyc/adding%20nominee%20and%20guardian/adding_nominee_guardian.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenNominee3 extends StatefulWidget {
  const ScreenNominee3({super.key});

  @override
  State<ScreenNominee3> createState() => _ScreenNominee3State();
}

String idtype = 'Select ID type';
bool isChecked = true;
String selectValue = 'Select relation';

List<String> relation = [
  'Select relation',
  'Wife',
  'Husband',
  'Son',
  'Daughter',
  'Father',
  'Mother',
  'Brother',
  'Sister',
  'Grand son',
  'Sister',
  'Grand daughter',
  'Grand father',
  'Grand mother',
  'Other'
];
String stateValue = 'State';
var stateList = [
  'State',
  'Andaman and Nickobar icelands',
  'Andra Pradesh',
  'Arunachal Pradesh',
  'Assam',
  'Bihar',
  'Chandigarh',
  'Dadra and Nagar Haveli',
  'Daman and Diu',
  'Delhi',
  'Goa',
  'Gujarat',
  'Haryana',
  'Himachal pradesh',
  'Jammu and Kashmir',
  'Karnataka',
  'Kerala',
  'West Bengal',
  'Lakshadweep',
  'Madhya Pradesh',
  'Maharashtra',
  // 'Maharastra',
  'Manipur',
  'Meghalaya',
  'Mizoram',
  'Nagaland',
  'Odisha',
  'Puducherry',
  'Punjab',
  'Rajasthan',
  'Sikkim',
  'Tamil Nadu',
  'Telangana',
  'Tripura',
  'Utter Pradesh',
  'Uttrakhand',
];

class _ScreenNominee3State extends State<ScreenNominee3> {
  @override
  Widget build(BuildContext context) {
    final kycController = Provider.of<KycController>(context);

    Brightness brightness = Theme.of(context).brightness;
    String typevalue = "select a type";
    List<String> typeList = ["select a type", "Minor", "major"];
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.all(15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpacer(10.h),
                Text(
                  'Nominee3 details',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 19.sp, fontWeight: FontWeight.w700),
                ),
                VerticalSpacer(3.h),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black),
                    borderRadius: BorderRadius.circular(8),
                    color: brightness == Brightness.light
                        ? Colors.white
                        : const Color(0xFF0E1330),
                  ),
                  height: 60,
                  // width: 120,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      value: kycController.typevalueNominee3,
                      isExpanded: true,
                      underline: Container(
                        height: 0,
                      ),
                      items: kycController.typeList.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        kycController.updateTypeOfnominee3(value);
                      },
                    ),
                  ),
                ),
                VerticalSpacer(3.h),
                TextFormField(
                  controller: kycController.nominee3nameController,
                  style: Theme.of(context).textTheme.labelLarge!,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Nominee3 Name"),
                ),
                VerticalSpacer(3.h),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black),
                    borderRadius: BorderRadius.circular(8),
                    color: brightness == Brightness.light
                        ? Colors.white
                        : const Color(0xFF0E1330),
                  ),
                  height: 60,
                  // width: 120,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      value: kycController.selectRelationValueNominne3,
                      isExpanded: true,
                      underline: Container(
                        height: 0,
                      ),
                      items: relation.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        kycController.updateRelationNominee3(value);
                      },
                    ),
                  ),
                ),
                VerticalSpacer(3.h),
                TextFormField(
                  controller: kycController.nominee3DOBController,
                  style: Theme.of(context).textTheme.labelLarge!,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (!RegExp(r'^\d{2}-[a-zA-Z]{3}-\d{4}$')
                        .hasMatch(value!)) {
                      return 'Invalid DOB format(01-Jan-1950))';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    // filled: true,
                    // fillColor: const Color(0xFF0E1330),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Nominee3 date of birth(01-Jan-1950)",
                  ),
                ),
                VerticalSpacer(3.h),
                TextFormField(
                  controller: kycController.nominee3panCotroller,
                  style: Theme.of(context).textTheme.labelLarge!,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Enter nominee3 pan number(ABCDE1234F)',

                    // labelText: 'Pan card number',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter PAN Card Number';
                    } else if (!RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]$')
                        .hasMatch(value)) {
                      return 'Invalid PAN format';
                    }
                    return null;
                  },
                ),
                VerticalSpacer(3.h),
                TextFormField(
                  controller: kycController.nominee3gurdnameCotroller,
                  style: Theme.of(context).textTheme.labelLarge!,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Nominee3 guardian name",
                  ),
                ),
                VerticalSpacer(3.h),
                TextFormField(
                  controller: kycController.nominee3guardpanController,
                  style: Theme.of(context).textTheme.labelLarge!,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Nominee3 Guardian PAN",
                  ),
                ),
                VerticalSpacer(3.h),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black),
                    borderRadius: BorderRadius.circular(8),
                    color: brightness == Brightness.light
                        ? Colors.white
                        : const Color(0xFF0E1330),
                  ),
                  height: 60,
                  // width: 120,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      value: kycController.nominee3guardRelationvalue,
                      isExpanded: true,
                      underline: Container(
                        height: 0,
                      ),
                      items: kycController.guardianRelation.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        kycController.updatenom3guardRelationValue(value);
                      },
                    ),
                  ),
                ),
                VerticalSpacer(3.h),
                VerticalSpacer(10.h)
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonWidget(
        onTap: () {
          Provider.of<KycController>(context, listen: false).nomineeChosse('Y');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const AddingNomineeAndGuadianScreen(),
            ),
          );
          // kycController.addingvaluetoModel();
          // bool result = await kycController.createCustomer(context);
          // if (result == true) {
          //   // ignore: use_build_context_synchronously
          //   Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const ScreenHomeView(),
          //     ),
          //     (route) => false,
          //   );
          // }
        },
        btName: 'Confirm '.toUpperCase(),
      ),
    );
  }
}
