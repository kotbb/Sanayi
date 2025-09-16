import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sanayi_app/core/helpers/spacing.dart';
   
class BuildStateItem extends StatelessWidget {
  String number;
  String label;
  
  BuildStateItem({
    super.key,
    required this.number,
    required this.label,
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xff102144),
          ),
        ),
        verticalSpace(6),
        Text(
          label,
          style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
        ),
      ],
    );
  }
}
