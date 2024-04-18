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
    'WELCOME TO FINFRESH',
    'PERSONAL FINANCE A JOURNEY',
    'INVESTMENT IS REWARD, REWARD IS INVESTMENT',
    'PENNY SAVED IS A PENNY EARNED',
    'JOIN THE TOP 1%',
    'NAME IT ALL',
    'SEAMLESS TRANSACTION'
  ];
  List<String> condentList = [
    'Integrate behavioral finance principles into your \nfinancial planning with FINFRESH.',
    "Integrate behavioral finance principles into your \nfinancial planning with FINFRESH.",
    "Earn rewards on investments with FINFRESH's \n exclusive digigold reward points.",
    "Track expenses effortlessly and make informed\n decisions with FINFRESH's advanced \n expense tracking.",
    "Tailored financial solutions for your unique\n needs – only with FINFRESH.",
    "GOLD ,FD, MF, RD, Insurance, Cards,\n Loans - we have it all",
    'Start as low as INR 100',
  ];
  List<String> imagelist = [
    'assets/images/Welcometoff.png',
    'assets/images/Personalfinancejourny.png',
    'assets/images/invertsmentreward.png',
    'assets/images/pennysaved.png',
    'assets/images/jointop1.png',
    'assets/images/ff.png',
        'assets/images/semelasstransaction.png'
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
                      imagelist: imagelist,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ScreenMail(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign Up',
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
