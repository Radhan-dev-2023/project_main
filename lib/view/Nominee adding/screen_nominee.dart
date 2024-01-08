import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/homeScreen/screen_home_view_screen.dart';
import 'package:finfresh_mobile/view/nominee%20id%20adding/screen_nominee_id_adding.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenAddingNominee extends StatefulWidget {
  const ScreenAddingNominee({super.key});

  @override
  State<ScreenAddingNominee> createState() => _ScreenAddingNomineeState();
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
String? selectedIdType;
final List<String> idTypes = [
  'Aadhar number',
  'Passport number',
  'PAN number',
  'Voter ID number',
  'Driving Licence Number',
];

class _ScreenAddingNomineeState extends State<ScreenAddingNominee> {
  @override
  Widget build(BuildContext context) {
    final kycController = Provider.of<KycController>(context);
    bool iscliked = false;
    Brightness brightness = Theme.of(context).brightness;
    Future showOptions() async {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return SizedBox(
              height: 350.0, // Set the desired height of the bottom sheet
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Select an ID type for this nominee',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text('Aadhar number',
                        style: Theme.of(context).textTheme.labelLarge!),
                    onTap: () {},
                    trailing: CupertinoCheckbox(
                      value: iscliked,
                      onChanged: (value) {
                        setState(() {
                          iscliked = value!;
                        });
                        if (value == true) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NomineeIdAdding(),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('Passport number',
                        style: Theme.of(context).textTheme.labelLarge!),
                    onTap: () {},
                    trailing: CupertinoCheckbox(
                      value: false, // Replace with your logic
                      onChanged: (value) {},
                    ),
                  ),
                  ListTile(
                    title: Text('PAN number',
                        style: Theme.of(context).textTheme.labelLarge!),
                    onTap: () {},
                    trailing: CupertinoCheckbox(
                      value: false, // Replace with your logic
                      onChanged: (value) {},
                    ),
                  ),
                  ListTile(
                    title: Text('Voter ID number',
                        style: Theme.of(context).textTheme.labelLarge!),
                    onTap: () {},
                    trailing: CupertinoCheckbox(
                      value: false, // Replace with your logic
                      onChanged: (value) {},
                    ),
                  ),
                  ListTile(
                    title: Text('Driving Licence Number',
                        style: Theme.of(context).textTheme.labelLarge!),
                    onTap: () {},
                    trailing: CupertinoCheckbox(
                      value: false, // Replace with your logic
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            );
          });
        },
      );
    }

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
                  'Nominee details',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 19.sp, fontWeight: FontWeight.w700),
                ),
                VerticalSpacer(4.h),
                TextFormField(
                  style: Theme.of(context).textTheme.labelLarge!,
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'field is required';
                  //   }
                  //   return null;
                  // },
                  decoration: InputDecoration(
                      // filled: true,
                      // fillColor: const Color(0xFF0E1330),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Nominee Name"),
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
                      value: selectValue,
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
                        setState(() {
                          selectValue = value ?? '';
                        });
                      },
                    ),
                  ),
                ),
                VerticalSpacer(3.h),
                TextFormField(
                  style: Theme.of(context).textTheme.labelLarge!,
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'field is required';
                  //   }
                  //   return null;
                  // },
                  decoration: InputDecoration(
                    // filled: true,
                    // fillColor: const Color(0xFF0E1330),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Nominee's date of birth",
                  ),
                ),
                VerticalSpacer(3.h),
                InkWell(
                  onTap: showOptions,
                  child: Container(
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
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, left: 3),
                        child: Text(idtype),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value ?? false;
                        });
                      },
                    ),
                    const Text('Nominee address is the same as my address'),
                  ],
                ),
                isChecked == false
                    ? // VerticalSpacer(2.h),
                    SizedBox(
                        child: Column(
                          children: [
                            TextFormField(
                              style: Theme.of(context).textTheme.labelLarge!,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  // filled: true,
                                  // fillColor: const Color(0xFF0E1330),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Address 1'),
                            ),
                            VerticalSpacer(3.h),
                            TextFormField(
                              style: Theme.of(context).textTheme.labelLarge!,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  // filled: true,
                                  // fillColor: const Color(0xFF0E1330),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Address 2'),
                            ),
                            VerticalSpacer(3.h),
                            TextFormField(
                              style: Theme.of(context).textTheme.labelLarge!,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  // filled: true,
                                  // fillColor: const Color(0xFF0E1330),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Address 3'),
                            ),
                            VerticalSpacer(3.h),
                            // Row(
                            //   mainAxisSize: MainAxisSize.min,
                            //   children: [

                            //     HorizontalSpacer(11.w),
                            //   ],
                            // ),
                            SizedBox(
                              height: 60,
                              width: double.infinity,
                              child: TextFormField(
                                style: Theme.of(context).textTheme.labelLarge!,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'field is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    // filled: true,
                                    // fillColor: const Color(0xFF0E1330),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: 'City'),
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
                                  value: stateValue,
                                  isExpanded: true,
                                  underline: Container(
                                    height: 0,
                                  ),
                                  items: stateList.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(
                                        items,
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      stateValue = value ?? '';
                                    });
                                  },
                                ),
                              ),
                            ),
                            VerticalSpacer(3.h),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 60,
                                  width: 200,
                                  child: TextFormField(
                                    style:
                                        Theme.of(context).textTheme.labelLarge!,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'field is required';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      // fillColor: const Color(0xFF0E1330),
                                      // filled: true,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      hintText: 'Country',
                                    ),
                                  ),
                                ),
                                HorizontalSpacer(5.w),
                                SizedBox(
                                  height: 60,
                                  width: 145,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'field is required';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        // fillColor: const Color(0xFF0E1330),
                                        // filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        hintText: 'Pincode'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                VerticalSpacer(3.h),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                      radius: 9,
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: 13,
                          color: brightness == Brightness.light
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                    HorizontalSpacer(3.w),
                    const Text('Add another nominee'),
                  ],
                ),
                isChecked == false ? VerticalSpacer(10.h) : SizedBox(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonWidget(
        onTap: () {
          kycController.addingvaluetoModel();
          kycController.createCustomer();
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const ScreenHomeView(),
          //   ),
          // );
        },
        btName: 'Confirm '.toUpperCase(),
      ),
    );
  }
}
