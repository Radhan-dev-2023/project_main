import 'package:finfresh_mobile/controller/kyc%20controller/kyc_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/kyc/Nominee%20adding/screen_nominee.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenNomineeCount extends StatefulWidget {
  const ScreenNomineeCount({super.key});

  @override
  State<ScreenNomineeCount> createState() => _ScreenNomineeCountState();
}

class _ScreenNomineeCountState extends State<ScreenNomineeCount> {
  @override
  void initState() {
    Provider.of<KycController>(context, listen: false).updatePagenumber('13');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final kycController = Provider.of<KycController>(context);
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: brightness == Brightness.dark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpacer(8.h),
              const Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: FlutterLogo(),
                ),
              ),
              VerticalSpacer(8.h),
              Text(
                'Select Nominee Count',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 19.sp, fontWeight: FontWeight.w700),
              ),
              VerticalSpacer(4.h),
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
                    value: kycController.countvalue,
                    isExpanded: true,
                    underline: Container(
                      height: 0,
                    ),
                    items: kycController.countList.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      kycController.updateCountValue(value);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonWidget(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenAddingNominee(),
            ),
          );
        },
        btName: 'Confirm '.toUpperCase(),
      ),
    );
  }
}
