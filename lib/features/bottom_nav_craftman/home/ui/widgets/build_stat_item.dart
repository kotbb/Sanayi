import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sanayi_app/core/helpers/spacing.dart';
   
class BuildStatItem extends StatelessWidget {
  String title;
  String value;
  IconData icon;
  Color color;
  bool isMoney;
  BuildStatItem({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.isMoney = false,
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        verticalSpace(8),
        Text(
          isMoney ? '\$$value' : value,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        Text(title, style: TextStyle(fontSize: 12.sp, color: Colors.grey[600])),
      ],
    );
  }
}
