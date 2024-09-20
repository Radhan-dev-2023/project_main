import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:finfresh_mobile/controller/goldController/gold_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenSellGold extends StatelessWidget {
  const ScreenSellGold({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardController =
        Provider.of<DashBoardController>(context, listen: false);
    // Brightness platformBrightness = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<GoldController>(builder: (context, goldController, _) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: goldController.goldselecteed
                    ? [const Color(0xFFF7BF05), const Color(0xFFF7BF05)]
                    : [
                        const Color(0xFF939391),
                        const Color(0xFFD0D0D0),
                      ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                VerticalSpacer(Adaptive.h(5)),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      )),
                ),
                VerticalSpacer(15.h),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    goldController.goldselecteed
                        ? 'Selling from Finfresh \n 99.99% pure 24K gold'
                        : 'Selling from Finfresh \n 99.99% pure Sterling Silver',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                VerticalSpacer(5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: Adaptive.w(20),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: goldController.sellgoldrateController,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.sp,
                        ),
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'field is required';
                        //   }
                        //   if (!RegExp(r"^[A-Za-z]{4}[a-zA-Z0-9]{7}$").hasMatch(value)) {
                        //     return 'Invalid IFSC code';
                        //   }
                        //   return null;
                        // },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          border: InputBorder.none,
                          hintText: '0',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      goldController.goldselecteed ? 'Mg' : 'g',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
                VerticalSpacer(5.h),
                // const Text(
                //   'Price ₹ 7.56/mg (excl 3% GST)',
                //   style: TextStyle(
                //     color: Colors.white,
                //   ),
                //   textAlign: TextAlign.center,
                // ),
                VerticalSpacer(25.h),
                InkWell(
                  onTap: () async {
                    if (goldController.sellgoldrateController.text.isNotEmpty) {
                      if (double.parse(
                              goldController.sellgoldrateController.text) >
                          goldController.goldlistingmodel?.res?.total) {
                        showFlushbar(context, 'Sorry not enough gold');
                      } else {
                        goldController.calculateSellAmount();

                        bool result = await goldController.sellGold(
                          context,
                          dashboardController
                                  .dashBoardModel?.result?.data?.name ??
                              '',
                          dashboardController
                                  .dashBoardModel?.result?.data?.phoneNumber ??
                              '',
                          dashboardController
                                  .dashBoardModel?.result?.data?.email ??
                              "",
                        );
                        if (result == true) {
                          goldController.sellgoldrateController.clear();
                          goldController.getSellGoldListing(
                              context,
                              Provider.of<DashBoardController>(context,
                                          listen: false)
                                      .dashBoardModel
                                      ?.result
                                      ?.data
                                      ?.email ??
                                  '');
                          Navigator.pop(context);
                        }
                      }
                    } else {
                      showFlushbar(context, 'Please enter mg of gold');
                    }
                  },
                  child: Container(
                    height: Adaptive.h(5),
                    width: Adaptive.w(25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.sp),
                        // color: Color(0xFF2D5D5F),
                        color: Colors.white
                        // color: const Color(0xFFF7BF05),
                        ),
                    child: goldController.selbuttonClicked == true
                        ? const CupertinoActivityIndicator(
                            color: Color(0xFF2D5D5F),
                          )
                        : const Center(
                            child: Text(
                              'Sell',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2D5D5F),
                              ),
                            ),
                          ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
