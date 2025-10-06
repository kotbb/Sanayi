import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/styles/colors.dart';

class ChangeDataWidget extends StatelessWidget {
  String label;
  // TextEditingController controller;
  ChangeDataWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelLarge),
        verticalSpace(8),
        TextFormField(
          // controller: controller,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorsManager.seconderyLightGreen,
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
