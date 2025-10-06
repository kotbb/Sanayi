import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:sanayi_app/core/helpers/spacing.dart';

class BuildServiceItem extends StatelessWidget {
  String assetPath;
  String title;

  BuildServiceItem({super.key, required this.assetPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(assetPath, width: 50.w, height: 50.h),
          verticalSpace(8),
          Text(title, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12.sp)),
        ],
      ),
    );
  }
}
