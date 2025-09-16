import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.amber[50],
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          Icon(Icons.star_rate_rounded, size: 50, color: Colors.amber[700]),
          verticalSpace(16),
          Text(
            'How was the service?',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.amber[800],
            ),
            textAlign: TextAlign.center,
          ),
          verticalSpace(10),
          Text(
            'share your experience with us',
            style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
