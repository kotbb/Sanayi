import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/styles/colors.dart';

class AccountDataWidget extends StatelessWidget {
  String label;
  String value;

  AccountDataWidget({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelLarge),
        verticalSpace(8),
        TextFormField(
          enabled: false,
          style: Theme.of(context).textTheme.bodyMedium,
          controller: TextEditingController(text: value),
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
