import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';

class ChooseUserTypeScreen extends StatelessWidget {
  const ChooseUserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'You entered the app as a ...',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff102144),
                ),
                textAlign: TextAlign.center,
              ),
              verticalSpace(12),
              Text(
                "Choose whether you are a client searching for\nservices or a craftman offering services.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[700],
                  height: 1.4,
                ),
              ),
              verticalSpace(48),

              // Expanded row to take space
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 220.h,
                      child: _buildAnimatedCard(
                        title: "Client",
                        description: "Looking for a craftman?",
                        image: Image.asset(
                          "assets/images/user.png",
                          width: 90.w,
                          height: 90.h,
                        ),
                        onTap: () {
                          // action for Client
                        },
                      ),
                    ),
                  ),
                  horizontalSpace(16),
                  Expanded(
                    child: SizedBox(
                      height: 220.h,
                      child: _buildAnimatedCard(
                        title: "Craftman",
                        description: "Provide your services",
                        image: SvgPicture.asset(
                          "assets/images/svg/on_boarding1.svg",
                          width: 90.w,
                          height: 90.h,
                        ),
                        onTap: () {
                          // action for Craftman
                        },
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(32),
              Text(
                "You can change your role later in settings.",
                style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              verticalSpace(12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedCard({
    required String title,
    required String description,
    required Widget image,
    required VoidCallback onTap,
  }) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 200),
      tween: Tween<double>(begin: 1.0, end: 1.0),
      builder: (context, double scale, child) {
        return GestureDetector(
          onTapDown: (_) {
            // عمل Scale صغير عند الضغط
            (context as Element).markNeedsBuild();
          },
          onTapUp: (_) {
            onTap();
          },
          child: Transform.scale(
            scale: scale,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              elevation: 4,
              shadowColor: Colors.grey.withOpacity(0.3),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 12.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    image,
                    verticalSpace(16),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff102144),
                      ),
                    ),
                    verticalSpace(12),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
