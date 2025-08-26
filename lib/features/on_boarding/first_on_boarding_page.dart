import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';

class FirstOnBoardingPage extends StatelessWidget {
  const FirstOnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(30),
            Text(
              'Welcome to Sanayi',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            verticalSpace(20),
            Lottie.asset(
              "assets/animations/welcome.json",
              width: 67.w,
              height: 56.h,
            ),
            verticalSpace(20),
            Text(
              'An app that connects you to craftsmen in your area',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            verticalSpace(30),
            SvgPicture.asset(
              "assets/images/svg/on_boarding1.svg",
              width: 250.w,
              height: 250.h,
            ),
          ],
        ),
      ),
    );
  }
}
