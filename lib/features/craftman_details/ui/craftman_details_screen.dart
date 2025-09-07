import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';

class CraftmanDetailsScreen extends StatelessWidget {
  const CraftmanDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Text(
              "Feras Osama",
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
            ),
            verticalSpace(8),
            Text(
              "Cleaner",
              style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
            ),
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
                style: TextStyle(
                  fontSize: 14.sp,
                  height: 1.6,
                  color: Colors.grey[800],
                ),
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
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff102144),
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 3,
                      ),
                      child: Text(
                        "Reservation",
                        style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      ),
                    ),
                  ),
                  verticalSpace(12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: const BorderSide(
                          color: Color(0xff102144),
                          width: 2,
                        ),
                      ),
                      child: Text(
                        "See Profile",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Color(0xff102144),
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
