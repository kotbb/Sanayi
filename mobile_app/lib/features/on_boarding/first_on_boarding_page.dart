import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

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
              LocaleKeys.onBoarding_welcome.tr(),
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
              LocaleKeys.onBoarding_body.tr(),
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
