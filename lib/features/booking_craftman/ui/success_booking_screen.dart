import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/routing/routes.dart';

class SuccessBookingScreen extends StatelessWidget {
  const SuccessBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0.0,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                "assets/animations/done.json",
                width: 200.w,
                height: 174.h,
              ),
              verticalSpace(23),
              Text(
                "Your booking is successful",
                style: Theme.of(
                  context,
                ).textTheme.displayLarge?.copyWith(fontSize: 20.sp),
              ),
              verticalSpace(17),
              Text(
                textAlign: TextAlign.center,
                "You have successfully booked the craftman. The craftman will contact you soon.",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontSize: 14.sp),
              ),
              verticalSpace(50),
              ElevatedButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, Routes.appLayout);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48.h),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                    side: BorderSide(color: Color(0xff102144), width: 1.0),
                  ),
                ),
                child: Text(
                  "Done",
                  style: TextStyle(
                    color: Color(0xff102144),
                    fontSize: 16,
                    fontFamily: "NeoSansArabicMedium",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
