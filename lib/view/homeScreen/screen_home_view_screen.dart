import 'dart:developer';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:finfresh_mobile/controller/goldController/gold_controller.dart';
import 'package:finfresh_mobile/view/digi%20gold%20screen/digi_gold_screen.dart';
import 'package:finfresh_mobile/view/digi%20gold%20screen/gold%20buying%20screen/screen_gold_buying_selling.dart';
import 'package:finfresh_mobile/view/homeScreen/widgets/home_screens.dart';
import 'package:finfresh_mobile/view/mutual%20fund%20screen/screen_mutual_fund.dart';
import 'package:finfresh_mobile/view/settings%20page/screen_settings.dart';
import 'package:finfresh_mobile/view/transaction%20screen/screen_transaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

int? indexfor;

class ScreenHomeView extends StatefulWidget {
  final int? curentindex;
  const ScreenHomeView({super.key, this.curentindex});

  @override
  State<ScreenHomeView> createState() => _ScreenHomeViewState();
}

// final _controller = NotchBottomBarController(index: 1);
// final _pageController = PageController(initialPage: 1);
int _currentIndex = 2;

class _ScreenHomeViewState extends State<ScreenHomeView> {
  @override
  void initState() {
    super.initState();
    if (widget.curentindex != null) {
      _currentIndex = widget.curentindex ?? 0;
      indexfor = _currentIndex;
    } else {
      _currentIndex =
          Provider.of<DashBoardController>(context, listen: false).currentIndex;
      log(_currentIndex.toString());

      _currentIndex = _currentIndex;
      indexfor = _currentIndex;
      // _controller = NotchBottomBarController(index: _currentIndex);
    }
  }

  // final _pageController = PageController(initialPage: 2);
  @override
  Widget build(BuildContext context) {
    final _controller = NotchBottomBarController(index: _currentIndex);
    final goldProvider = Provider.of<GoldController>(context);

    Brightness platformBrightness = MediaQuery.of(context).platformBrightness;
    final List<Widget> bottomBarPages = [
      const ScreenMutualFund(),
      goldProvider.isCompletedGoldPurchase == 'true' ||
              goldProvider.buttonEnable == true
          ? const ScreenGoldBuyingAndSelling()
          : const ScreenDigiGold(),
      const ScreenHome(),
      const ScreeenTranscations(),
      const ScreenSettings()
    ];
    List<BottomBarItem> bottomList = [
      BottomBarItem(
        inActiveItem: Image.asset(
          'assets/images/navicons/mutualfund.png',
          // 'assets/images/navicons/noun-mutual-fund-5991548 1.png',
          // 'assets/images/dashboard_11118018.png',
          color: platformBrightness == Brightness.light
              ? Colors.black
              : Colors.white,
          // color: indexfor == 0
          //     ? const Color(0xFFA6BBFB)
          //     : platformBrightness == Brightness.light
          //         ? Colors.black
          //         : Colors.white,
          // height: 25,
          // width: 23,
        ),
        activeItem: Image.asset("assets/images/navicons/mutualfund.png",
            // 'assets/images/navicons/noun-mutual-fund-5991548 1.png',
            color: platformBrightness == Brightness.light
                ? Colors.white
                : Colors.black
            // height: 45,
            // width: 30,
            ),
      ),
      BottomBarItem(
        inActiveItem: Image.asset(
          'assets/images/navicons/gold.png',
          color: platformBrightness == Brightness.light
              ? Colors.black
              : Colors.white,
          // height: 25,
          // width: 23,
        ),
        activeItem: Image.asset('assets/images/navicons/gold.png',
            // 'assets/images/money_13299664.png',
            color: platformBrightness == Brightness.light
                ? Colors.white
                : Colors.black
            // color: indexfor == 1
            //     ? const Color(0xFFA6BBFB)
            //     : platformBrightness == Brightness.light
            //         ? Colors.black
            //         : Colors.white,
            // height: 45,
            // width: 30,
            ),
      ),
      BottomBarItem(
        inActiveItem: Image.asset(
          'assets/images/ffdash.png',
          color: platformBrightness == Brightness.light
              ? Colors.black
              : Colors.white,
          // color: indexfor == 2
          //     ? const Color(0xFFA6BBFB)
          //     : platformBrightness == Brightness.light
          //         ? Colors.black
          //         : Colors.white,
          // height: 30,
          // width: 23,
        ),
        activeItem: Image.asset('assets/images/ffdash.png',
            color: platformBrightness == Brightness.light
                ? Colors.white
                : Colors.black
            // color: indexfor == 2
            //     ? const Color(0xFFA6BBFB)
            //     : platformBrightness == Brightness.light
            //         ? Colors.black
            //         : Colors.white,
            // height: 45,
            // width: 30,
            ),
      ),
      BottomBarItem(
        inActiveItem: Image.asset(
          'assets/images/navicons/transaction.png',
          color: platformBrightness == Brightness.light
              ? Colors.black
              : Colors.white,
          // color: indexfor == 2
          //     ? const Color(0xFFA6BBFB)
          //     : platformBrightness == Brightness.light
          //         ? Colors.black
          //         : Colors.white,
          // height: 25,
          // width: 23,
        ),
        activeItem: Image.asset('assets/images/navicons/transaction.png',
            color: platformBrightness == Brightness.light
                ? Colors.white
                : Colors.black
            // color: indexfor == 2
            //     ? const Color(0xFFA6BBFB)
            //     : platformBrightness == Brightness.light
            //         ? Colors.black
            //         : Colors.white,
            // height: 45,
            // width: 30,
            ),
      ),
      BottomBarItem(
        inActiveItem: Image.asset(
          'assets/images/navicons/settings.png',
          color: platformBrightness == Brightness.light
              ? Colors.black
              : Colors.white,

          // color: indexfor == 3
          //     ? const Color(0xFFA6BBFB)
          //     : platformBrightness == Brightness.light
          //         ? Colors.black
          //         : Colors.white,
          // height: 25,
          // width: 23,
        ),
        activeItem: Image.asset('assets/images/navicons/settings.png',
            color: platformBrightness == Brightness.light
                ? Colors.white
                : Colors.black

            // height: 45,
            // width: 30,
            ),
      ),
    ];
    return Scaffold(
        // body: PageView(
        //   controller: _pageController,
        //   physics: const NeverScrollableScrollPhysics(),
        //   children: [
        //     bottomBarPages[_currentIndex],
        //   ],
        // ),
        extendBody: true,
        body: bottomBarPages[_currentIndex],
        bottomNavigationBar: AnimatedNotchBottomBar(
          color: platformBrightness == Brightness.light
              // ? Color.fromARGB(255, 232, 241, 250)

              // ? const Color.fromARGB(255, 240, 234, 234)
              ? const Color.fromARGB(255, 239, 240, 241)
              : const Color(0xFF0E1330),

          kBottomRadius: 20,
          topMargin: 8.7,
          showTopRadius: true,
          kIconSize: 23,
          circleMargin: 4.0,
          notchColor: platformBrightness == Brightness.light
              ? const Color(0xFF060B27)
              : Colors.white,
          showShadow: false,
          blurFilterX: 0,
          blurFilterY: 0,
          // showBlurBottomBar: true,
          // blurOpacity: 0.5,
          bottomBarWidth: 100,
          notchBottomBarController: _controller,
          removeMargins: false,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              // _pageController.jumpToPage(index);
              // indexfor = index;
            });
          },
          bottomBarItems: bottomList,
        )
        // bottomNavigationBar: BottomNavigationBar(
        //   type: BottomNavigationBarType.fixed,
        //   unselectedItemColor: platformBrightness == Brightness.light
        //       ? Colors.black
        //       : Colors.white,

        //   showSelectedLabels: false, // Hide labels for active items
        //   showUnselectedLabels: false,
        //   currentIndex: _currentIndex,
        //   onTap: (int index) {
        //     setState(() {
        //       _currentIndex = index;
        //       indexfor = index;
        //       log('indexfor$indexfor');
        //     });
        //   },
        //   items: bottomList,
        // ),
        );
  }
}
