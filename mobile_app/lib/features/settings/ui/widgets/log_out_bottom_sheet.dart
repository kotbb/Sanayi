import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';

class LogOutBottomSheet extends StatelessWidget {
  const LogOutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(width: 64.w, height: 2.h, color: Colors.grey),
          ),
          verticalSpace(8),
          Text(
            "LogOut",
            style: Theme.of(
              context,
            ).textTheme.displayLarge?.copyWith(fontSize: 24.sp),
          ),
          verticalSpace(16),
          Text(
            "Are you sure you want to log out?",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          verticalSpace(24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 48.h),
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            onPressed: () {},
            child: Text(
              "yes, LogOut",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: "NeoSansArabicMedium",
              ),
            ),
          ),
          verticalSpace(16),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: Size(double.infinity, 48.h),
              backgroundColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            onPressed: () => Navigator.pop(context),
            child: Text(
              "No, Cancel",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: "NeoSansArabicMedium",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
