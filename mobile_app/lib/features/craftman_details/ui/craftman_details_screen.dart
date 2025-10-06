import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/core/styles/colors.dart';

class CraftmanDetailsScreen extends StatelessWidget {
  const CraftmanDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(80),
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/profile.jpg"),
              ),
            ),
            verticalSpace(16),
            Text("Feras Osama", style: Theme.of(context).textTheme.labelLarge),
            verticalSpace(8),
            Text("Cleaner", style: Theme.of(context).textTheme.labelMedium),
            verticalSpace(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => Icon(
                  index < 4 ? Icons.star : Icons.star_border,
                  color: Colors.orange,
                  size: 22,
                ),
              ),
            ),
            verticalSpace(20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            verticalSpace(30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.bookingCraftmanScreen,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManager.mainBlue,
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        elevation: 3,
                      ),
                      child: Text(
                        "Book Now",
                        style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      ),
                    ),
                  ),
                  verticalSpace(12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.seeCraftmanProfileScreen,
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        side: BorderSide(
                          color: ColorsManager.mainBlue,
                          width: 2.w,
                        ),
                      ),
                      child: Text(
                        "See Profile",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: ColorsManager.mainBlue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(40),
          ],
        ),
      ),
    );
  }
}
