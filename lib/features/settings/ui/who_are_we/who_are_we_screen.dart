import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/features/settings/ui/who_are_we/widgets/build_state_item.dart';
import 'package:sanayi_app/features/settings/ui/who_are_we/widgets/build_value_item.dart';
import 'package:sanayi_app/features/settings/ui/who_are_we/widgets/who_are_we_card.dart';

class WhoAreWeScreen extends StatelessWidget {
  const WhoAreWeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Who We Are',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 120.w,
                height: 120.h,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.group,
                  size: 60,
                  color: const Color(0xff102144),
                ),
              ),
            ),
            verticalSpace(30),
            WhoAreWeCard(),
            verticalSpace(26),
            Text(
              'Our Values',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xff102144),
              ),
            ),
            verticalSpace(16),
            BuildValueItem(
              icon: Icons.verified_user,
              title: 'Quality & Excellence',
              description:
                  'We ensure high-quality services through skilled and certified craftsmen.',
            ),
            BuildValueItem(
              icon: Icons.accessibility,
              title: 'Reliability',
              description:
                  'We build strong trust between craftsmen and customers through full transparency.',
            ),
            BuildValueItem(
              icon: Icons.thumb_up,
              title: 'Complete Satisfaction',
              description:
                  'We aim to achieve customer satisfaction through exceptional service and unique experience.',
            ),
            verticalSpace(26),
            Text(
              'Our Numbers',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xff102144),
              ),
            ),
            verticalSpace(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BuildStateItem(number: '500+', label: 'Skilled CM'),
                BuildStateItem(number: '5,000+', label: 'Satisfied Customers'),
                BuildStateItem(number: '10,000+', label: 'Completed Services'),
              ],
            ),
            verticalSpace(30),
            Center(
              child: Text(
                '©2025 Final Project Code. All rights reserved.',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
