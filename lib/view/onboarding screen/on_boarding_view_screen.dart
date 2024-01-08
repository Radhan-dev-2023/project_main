import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/onboarding%20screen/widgets/onboarding_screen.dart';
import 'package:finfresh_mobile/view/onboarding%20screen/widgets/small_containers.dart';
import 'package:finfresh_mobile/view/sign%20up/mail%20screen/screen_mail.dart';
import 'package:finfresh_mobile/view/sign%20in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BoardingViewScreen extends StatefulWidget {
  const BoardingViewScreen({super.key});

  @override
  State<BoardingViewScreen> createState() => _BoardingViewScreenState();
}

final PageController _pageController = PageController();
int _currentPage = 0;

class _BoardingViewScreenState extends State<BoardingViewScreen> {
  @override
  void initState() {
    super.initState();
    _pageController.addListener(_pageScrollListener);
  }

  // @override
  // void dispose() {
  //   _pageController.removeListener(_pageScrollListener);
  //   _pageController.dispose();
  //   super.dispose();
  // }

  void _pageScrollListener() {
    setState(() {
      _currentPage = _pageController.page!.round();
    });
  }

  Color getSmallContainerColor(int index) {
    Brightness brightness = Theme.of(context).brightness;

    return index == _currentPage
        ? Colors.purple
        : brightness == Brightness.light
            ? Colors.grey // Color for light theme
            : Colors.white;
  }

  List<String> headingsOfOnboarding = [
    'Welcome to Finfresh',
    'Get Better Returns',
    'Start With one',
    'Your Safety is first',
    'No commission',
    'No spreads',
    'Backed By Real Shares'
  ];
  List<String> condentList = [
    'The best app for invest international stocks \n with as little',
    "Invest in the world's top leading brands & \n unlock amazing return of investment",
    "You don't want to buy a whole share .\n You can buy a fraction",
    "Your bockerage account is maintained by \n interactive Brockers LLC.",
    'No commission ever,just invest free and  \n maximize your returns',
    "No spreads, all trades execute of the\n international best bid &offer",
    'All your trades fully backed by real shares \n all the times.',
  ];
  // final List<Widget> pages = [
  //   const ScreenBoarding(),
  //   const ScreenBoarding(),
  //   const ScreenBoarding()
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 75.h,
            child: PageView.builder(
              controller: _pageController,
              itemCount: headingsOfOnboarding.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    ScreenBoarding(
                      headingsOfOnboarding: headingsOfOnboarding,
                      condent: condentList,
                      index: index,
                    ),
                  ],
                );
              },
            ),
          ),
          if (_currentPage == _currentPage)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallContainer(
                  color: getSmallContainerColor(0),
                  index: _currentPage,
                  curentindex: _currentPage,
                ),
                SmallContainer(
                  color: getSmallContainerColor(1),
                  index: _currentPage,
                  curentindex: _currentPage,
                ),
                SmallContainer(
                  color: getSmallContainerColor(2),
                  index: _currentPage,
                  curentindex: _currentPage,
                ),
                SmallContainer(
                  color: getSmallContainerColor(3),
                  index: _currentPage,
                  curentindex: _currentPage,
                ),
                SmallContainer(
                  color: getSmallContainerColor(4),
                  index: _currentPage,
                  curentindex: _currentPage,
                ),
                SmallContainer(
                  color: getSmallContainerColor(5),
                  index: _currentPage,
                  curentindex: _currentPage,
                ),
                SmallContainer(
                  color: getSmallContainerColor(6),
                  index: _currentPage,
                  curentindex: _currentPage,
                ),
              ],
            ),
          VerticalSpacer(3.h),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 6.h,
                  // color: Theme.of(context).colorScheme.primary,
                  width: 90.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4D84BD),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))

                        // Theme.of(context).buttonTheme.copyWith(buttonColor: Color(Colors.red))
                        ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ScreenMail(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: Colors.white),
                      // style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
                VerticalSpacer(2.h),
                SizedBox(
                  width: 90.w,
                  height: 6.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ScreenSignin(),
                        ),
                      );

                      // if (_currentPage <
                      //     headingsOfOnboarding.length - 1) {
                      //   _pageController.nextPage(
                      //     duration: const Duration(milliseconds: 300),
                      //     curve: Curves.linear,
                      //   );
                      // } else {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const ScreenSignup(),
                      //     ),
                      //   );
                      // }
                      // setState(() {
                      //   _currentPage =0;
                      // });
                    },
                    child: Text(
                      'Sign In',
                      // _currentPage == pages.length - 1 ? 'Login' : 'Next',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
