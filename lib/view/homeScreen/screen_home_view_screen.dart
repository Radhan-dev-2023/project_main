import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:finfresh_mobile/view/all%20mutual%20fund/screen_all_mutual_fund.dart';
import 'package:finfresh_mobile/view/homeScreen/widgets/home_screens.dart';
import 'package:finfresh_mobile/view/settings%20page/screen_settings.dart';
import 'package:finfresh_mobile/view/transaction%20screen/screen_transaction.dart';
import 'package:flutter/material.dart';

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
    const ScreenHome(),
    const ScreeenTranscations(),
    const ScreenAllMutualFund(),
    const ScreenSettings()
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = _currentIndex;
    indexfor = _currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> bottomList = [
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images/dashboard_11118018.png',
          color: indexfor == 0 ? Color(0xFFA6BBFB) : Colors.black,
          height: 25,
          width: 23,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images/money_13299664.png',
          color: indexfor == 1 ? const Color(0xFFA6BBFB) : Colors.black,
          height: 25,
          width: 23,
        ),
        label: 'Favorites',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images/hand-holding-usd_9795530.png',
          color: indexfor == 2 ? const Color(0xFFA6BBFB) : Colors.black,
          height: 25,
          width: 23,
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images/gear_609492.png',
          color: indexfor == 3 ? Color(0xFFA6BBFB) : Colors.black,
          height: 25,
          width: 23,
        ),
        label: '',
      ),
    ];
    return Scaffold(
      body: bottomBarPages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,

        showSelectedLabels: false, // Hide labels for active items
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            indexfor = index;
            log('indexfor$indexfor');
          });
        },
        items: bottomList,
      ),
    );
  }
}
