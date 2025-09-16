import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sanayi_app/core/helpers/spacing.dart';
   
class BuildPolicySection extends StatelessWidget {
  String title;
  String content;
  
  BuildPolicySection({
    super.key,
    required this.title,
    required this.content,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xff102144),
            ),
          ),
          verticalSpace(8),
          Text(
            content,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey[700],
              height: 1.5,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
