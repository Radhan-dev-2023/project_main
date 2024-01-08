import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:finfresh_mobile/view/homeScreen/widgets/home_screens.dart';
import 'package:flutter/material.dart';

class ScreenHomeView extends StatefulWidget {
  const ScreenHomeView({super.key});

  @override
  State<ScreenHomeView> createState() => _ScreenHomeViewState();
}

final _controller = NotchBottomBarController(index: 1);
final _pageController = PageController(initialPage: 1);

class _ScreenHomeViewState extends State<ScreenHomeView> {
  final List<Widget> bottomBarPages = [
    const ScreenHome(),
    const ScreenHome(),
    const ScreenHome(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchColor: const Color(0xFF060B27),
        notchBottomBarController: _controller,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: ImageIcon(
              AssetImage('assets/images/7.png'),
              color: Colors.blueAccent,
            ),
            activeItem: ImageIcon(
              AssetImage('assets/images/7.png'),
              color: Colors.blueAccent,
            ),
            itemLabel: 'Page 1',
          ),
          BottomBarItem(
            inActiveItem: ImageIcon(
              AssetImage('assets/images/8.png'),
              color: Colors.blueAccent,
            ),
            activeItem: ImageIcon(
              AssetImage('assets/images/8.png'),
              color: Colors.blueAccent,
            ),
            itemLabel: 'Page 2',
          ),
          BottomBarItem(
            inActiveItem: ImageIcon(
              AssetImage('assets/images/9.png'),
              color: Colors.blueAccent,
            ),
            // activeItem: Icon(
            //   Icons.home_filled,
            //   color: Colors.blueAccent,
            // ),
            activeItem: ImageIcon(
              AssetImage('assets/images/9.png'),
              color: Colors.blueAccent,
            ),
            itemLabel: 'Page 1',
          ),
        ],
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
