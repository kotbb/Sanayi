import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
    
class CategoriesGridViewItem extends StatelessWidget {
  String image;
  String label;
  Function()? onTap;
  CategoriesGridViewItem({ super.key, required this.image, required this.label, required this.onTap });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xfffEBF0F4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(image, width: 36.w, height: 36.h),
              ),
            ),
            verticalSpace(14),
            Text(label),
          ],
        ),
      ),
    );
  }
}