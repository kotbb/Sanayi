import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/widgets/build_bottom_nav_item.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 67.h,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BuildBottomNavItem(
            label: 'Home',
            onTap: () {},
            isActive: true,
            activeIcon: Icons.home,
            unActiveIcon: Icons.home_outlined,
          ),
          BuildBottomNavItem(
            label: 'Reservations',
            onTap: () {},
            isActive: false,
            activeIcon: Icons.calendar_month,
            unActiveIcon: Icons.calendar_month_outlined,
          ),
          BuildBottomNavItem(
            label: 'profile',
            onTap: () {},
            isActive: false,
            activeIcon: Icons.person,
            unActiveIcon: Icons.person_2_outlined,
          ),
        ],
      ),
    );
  }
}
