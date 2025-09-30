import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/widgets/build_bottom_nav_item.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';
    
class CustomBottomNavCraftman extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const CustomBottomNavCraftman({ super.key, required this.currentIndex, required this.onTap });
  
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
            label: LocaleKeys.btmNav_home.tr(),
            onTap: () => onTap(0),
            isActive: currentIndex == 0,
            activeIcon: Icons.home,
            unActiveIcon: Icons.home_outlined,
          ),
          BuildBottomNavItem(
            label: LocaleKeys.btmNav_agenda.tr(),
            onTap: () => onTap(1),
            isActive: currentIndex == 1,
            activeIcon: Icons.calendar_month,
            unActiveIcon: Icons.calendar_month_outlined,
          ),
          BuildBottomNavItem(
            label: LocaleKeys.btmNav_profile.tr(),
            onTap: () => onTap(2),
            isActive: currentIndex == 2,
            activeIcon: Icons.person,
            unActiveIcon: Icons.person_2_outlined,
          ),
        ],
      ),
    );
  }
}