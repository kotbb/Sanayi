import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/features/on_boarding/first_on_boarding_page.dart';
import 'package:sanayi_app/features/on_boarding/second_on_boarding_page.dart';

class OnBoardingScreens extends StatefulWidget {
  const OnBoardingScreens({super.key});

  @override
  _OnBoardingScreensState createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  List<Widget> screens = const [FirstOnBoardingPage(), SecondOnBoardingPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: screens.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => screens[index],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  screens.length,
                  (index) => Container(
                    margin: const EdgeInsets.all(4),
                    width: currentIndex == index ? 12 : 8,
                    height: currentIndex == index ? 12 : 8,
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? Color(0xFF102144)
                          : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              verticalSpace(20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: Color(0xFF102144),
                  padding: const EdgeInsets.all(16),
                ),
                onPressed: () {
                  if (currentIndex < screens.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Navigator.pushReplacementNamed(context, Routes.loginScreen);
                  }
                },
                child: const Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
