import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyIconWidget extends StatelessWidget {
  const PrivacyIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100.w,
        height: 100.h,
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
        child: Icon(Icons.security, size: 50, color: const Color(0xff102144)),
      ),
    );
  }
}
