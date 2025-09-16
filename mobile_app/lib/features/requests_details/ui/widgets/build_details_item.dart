import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
   
class BuildDetailsItem extends StatelessWidget {
  IconData icon;
  String title;
  String value;
  
  BuildDetailsItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xff102144), size: 24),
        verticalSpace(6),
        Text(title, style: TextStyle(fontSize: 12.sp, color: Colors.grey[600])),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }
}
