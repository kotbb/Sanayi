import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sanayi_app/core/helpers/spacing.dart';

class WorkGalleryItemBuilder extends StatelessWidget {
  String image;
  String title;
  String date;
  Function()? onTap;

  WorkGalleryItemBuilder({
    super.key,
    required this.image,
    required this.title,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shadowColor: Colors.white,
        child: Column(
          children: [
            verticalSpace(8),
            Image.network(
              image,
              height: 114.h,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 12.h),
              child: Column(
                children: [
                  Text(
                    title,
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium?.copyWith(fontSize: 12.sp),
                  ),
                  verticalSpace(8),
                  Text(date, style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
