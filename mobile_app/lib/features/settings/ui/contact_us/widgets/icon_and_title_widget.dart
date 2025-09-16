import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';

class IconAndTitleWidget extends StatelessWidget {
  const IconAndTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 120.w,
          height: 120.h,
          decoration: BoxDecoration(
            color: Colors.green[100],
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Icon(Icons.chat, size: 60, color: Colors.green[700]),
        ),
        verticalSpace(30),
        Text(
          'We\'re Here to Help!',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Colors.green[800],
          ),
          textAlign: TextAlign.center,
        ),
        verticalSpace(12),
        Text(
          'Get in touch with us through WhatsApp',
          style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
