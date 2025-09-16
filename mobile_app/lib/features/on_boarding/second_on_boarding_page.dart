import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/features/on_boarding/widgets/build_service_item.dart';

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
            Text('Sanayi', style: Theme.of(context).textTheme.titleLarge),
            verticalSpace(60),
            Text(
              'Choose the service you need and book easily.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            verticalSpace(30),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              mainAxisSpacing: 14.h,
              children: [
                BuildServiceItem(
                  title: 'Contractor',
                  assetPath: 'assets/images/svg/contractor.svg',
                ),
                BuildServiceItem(
                  title: 'Cooker',
                  assetPath: 'assets/images/svg/cooking.svg',
                ),
                BuildServiceItem(
                  title: 'Builder',
                  assetPath: 'assets/images/svg/building.svg',
                ),
                BuildServiceItem(
                  title: 'mechanical',
                  assetPath: 'assets/images/svg/optimizing.svg',
                ),
                BuildServiceItem(
                  title: 'Cleaner',
                  assetPath: 'assets/images/svg/cleaner.svg',
                ),
                BuildServiceItem(
                  title: 'Delivery Driver',
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
