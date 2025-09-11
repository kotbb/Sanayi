import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';

class TitleAndLastUpdateWidget extends StatelessWidget {
  const TitleAndLastUpdateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'Terms of Use & Privacy Policy',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xff102144),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        verticalSpace(10),
        Center(
          child: Text(
            'Last updated: September 11, 2025',
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
          ),
        ),
      ],
    );
  }
}
