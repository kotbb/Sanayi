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
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160.w,
        height: 174.h,
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: Card(
          shadowColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                verticalSpace(8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    image,
                    height: 90,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
                verticalSpace(8),
                Text(title),
                verticalSpace(14),
                Text(date),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
