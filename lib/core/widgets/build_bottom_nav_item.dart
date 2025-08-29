import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildBottomNavItem extends StatelessWidget {
  bool isActive;
  String label;
  IconData activeIcon;
  IconData unActiveIcon;
  Function()? onTap;

  BuildBottomNavItem({
    super.key,
    required this.isActive,
    required this.label,
    required this.activeIcon,
    required this.unActiveIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: Column(
          children: [
            Icon(isActive ? activeIcon : unActiveIcon, size: 30, color: const Color(0xff102144)),
            Text(label, style: TextStyle(color: const Color(0xff102144))),
          ],
        ),
      ),
    );
  }
}
