import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sanayi_app/core/helpers/spacing.dart';

class BuildStateItem extends StatelessWidget {
  String number;
  String label;

  BuildStateItem({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(number, style: Theme.of(context).textTheme.labelMedium),
        verticalSpace(6),
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontSize: 12.sp),
        ),
      ],
    );
  }
}
