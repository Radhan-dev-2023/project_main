import 'dart:developer';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:finfresh_mobile/view/all%20mutual%20fund/screen_all_mutual_fund.dart';
import 'package:finfresh_mobile/view/digi%20gold%20screen/digi_gold_screen.dart';
import 'package:finfresh_mobile/view/homeScreen/widgets/home_screens.dart';
import 'package:finfresh_mobile/view/mutual%20fund%20screen/screen_mutual_fund.dart';
import 'package:finfresh_mobile/view/settings%20page/screen_settings.dart';
import 'package:finfresh_mobile/view/transaction%20screen/screen_transaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

int? indexfor;

class ScreenHomeView extends StatefulWidget {
  const ScreenHomeView({super.key});

  @override
  State<ScreenHomeView> createState() => _ScreenHomeViewState();
}

// final _controller = NotchBottomBarController(index: 1);
// final _pageController = PageController(initialPage: 1);
int _currentIndex = 0;

class _ScreenHomeViewState extends State<ScreenHomeView> {
  final List<Widget> bottomBarPages = [
    const ScreenMutualFund(),
    const ScreenDigiGold(),
    const ScreenHome(),
    const ScreeenTranscations(),
    const ScreenSettings()
  ];
  @override
  void initState() {
    super.initState();
    _currentIndex = Provider.of<DashBoardController>(context,listen: false).currentIndex;
    _currentIndex = _currentIndex;
    indexfor = _currentIndex;
  }

  final _controller = NotchBottomBarController(index: 2);
  // final _pageController = PageController(initialPage: 2);
  @override
  Widget build(BuildContext context) {
    Brightness platformBrightness = MediaQuery.of(context).platformBrightness;
    List<BottomBarItem> bottomList = [
      BottomBarItem(
        inActiveItem: Image.asset(
          'assets/images/data-network_12074139.png',
          // 'assets/images/dashboard_11118018.png',
          color: Colors.black,
          // color: indexfor == 0
          //     ? const Color(0xFFA6BBFB)
          //     : platformBrightness == Brightness.light
          //         ? Colors.black
          //         : Colors.white,
          height: 25,
          width: 23,
        ),
        activeItem: Image.asset(
          'assets/images/data-network_12074139.png',
          // 'assets/images/dashboard_11118018.png',
          color: const Color(0xFFA6BBFB),
          // color: indexfor == 0
          //     ? const Color(0xFFA6BBFB)
          //     : platformBrightness == Brightness.light
          //         ? Colors.black
          //         : Colors.white,
          height: 25,
          width: 23,
        ),
        itemLabel: '',
      ),
      BottomBarItem(
        inActiveItem: Image.asset(
          'assets/images/money_14298817.png',
          // 'assets/images/money_13299664.png',
          color: Colors.black,
          // color: indexfor == 1
          //     ? const Color(0xFFA6BBFB)
          //     : platformBrightness == Brightness.light
          //         ? Colors.black
          //         : Colors.white,
          height: 25,
          width: 23,
        ),
        activeItem: Image.asset(
          'assets/images/money_14298817.png',
          // 'assets/images/money_13299664.png',
          color: const Color(0xFFA6BBFB),
          // color: indexfor == 1
          //     ? const Color(0xFFA6BBFB)
          //     : platformBrightness == Brightness.light
          //         ? Colors.black
          //         : Colors.white,
          height: 25,
          width: 23,
        ),
        itemLabel: '',
      ),
      BottomBarItem(
        inActiveItem: Image.asset(
          'assets/images/ffdash.png',
          color: Colors.black,
          // color: indexfor == 2
          //     ? const Color(0xFFA6BBFB)
          //     : platformBrightness == Brightness.light
          //         ? Colors.black
          //         : Colors.white,
          height: 25,
          width: 23,
        ),
        activeItem: Image.asset(
          'assets/images/ffdash.png',
          color: const Color(0xFFA6BBFB),
          // color: indexfor == 2
          //     ? const Color(0xFFA6BBFB)
          //     : platformBrightness == Brightness.light
          //         ? Colors.black
          //         : Colors.white,
          height: 25,
          width: 23,
        ),
        itemLabel: '',
      ),
      BottomBarItem(
        inActiveItem: Image.asset(
          'assets/images/transaction_2420245.png',
          color: Colors.black,
          // color: indexfor == 2
          //     ? const Color(0xFFA6BBFB)
          //     : platformBrightness == Brightness.light
          //         ? Colors.black
          //         : Colors.white,
          height: 25,
          width: 23,
        ),
        activeItem: Image.asset(
          'assets/images/transaction_2420245.png',
          color: const Color(0xFFA6BBFB),
          // color: indexfor == 2
          //     ? const Color(0xFFA6BBFB)
          //     : platformBrightness == Brightness.light
          //         ? Colors.black
          //         : Colors.white,
          height: 25,
          width: 23,
        ),
        itemLabel: '',
      ),
      BottomBarItem(
        inActiveItem: Image.asset(
          'assets/images/setting_12326803.png',
          color: Colors.black,
          // color: indexfor == 3
          //     ? const Color(0xFFA6BBFB)
          //     : platformBrightness == Brightness.light
          //         ? Colors.black
          //         : Colors.white,
          height: 25,
          width: 23,
        ),
        activeItem: Image.asset(
          'assets/images/setting_12326803.png',
          color: const Color(0xFFA6BBFB),
          // color: indexfor == 3
          //     ? const Color(0xFFA6BBFB)
          //     : platformBrightness == Brightness.light
          //         ? Colors.black
          //         : Colors.white,
          height: 25,
          width: 23,
        ),
        itemLabel: '',
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
