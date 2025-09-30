import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/features/on_boarding/widgets/build_service_item.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class SecondOnBoardingPage extends StatelessWidget {
  const SecondOnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(30),
            Text(LocaleKeys.onBoarding_sanayi.tr(), style: Theme.of(context).textTheme.titleLarge),
            verticalSpace(60),
            Text(
              LocaleKeys.onBoarding_choose.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            verticalSpace(30),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              mainAxisSpacing: 14.h,
              children: [
                BuildServiceItem(
                  title:  LocaleKeys.onBoarding_contractor.tr(),
                  assetPath: 'assets/images/svg/contractor.svg',
                ),
                BuildServiceItem(
                  title: LocaleKeys.onBoarding_Cooker.tr(),
                  assetPath: 'assets/images/svg/cooking.svg',
                ),
                BuildServiceItem(
                  title: LocaleKeys.onBoarding_builder.tr(),
                  assetPath: 'assets/images/svg/building.svg',
                ),
                BuildServiceItem(
                  title: LocaleKeys.onBoarding_mechanical.tr(),
                  assetPath: 'assets/images/svg/optimizing.svg',
                ),
                BuildServiceItem(
                  title: LocaleKeys.onBoarding_cleaner.tr(),
                  assetPath: 'assets/images/svg/cleaner.svg',
                ),
                BuildServiceItem(
                  title: LocaleKeys.onBoarding_deliveryDriver.tr(),
                  assetPath: 'assets/images/svg/delivery_driver.svg',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
