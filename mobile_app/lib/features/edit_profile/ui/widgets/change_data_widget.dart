import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sanayi_app/core/helpers/spacing.dart';

class ChangeDataWidget extends StatelessWidget {
  String label;
  // TextEditingController controller;
  ChangeDataWidget({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 18.sp)),
        verticalSpace(8),
        TextFormField(
          // controller: controller,
          style: TextStyle(color: Colors.black, fontSize: 16.sp),
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xfffebf0f4),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8.r),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 14.h,
            ),
          ),
        ),
      ],
    );
  }
}
