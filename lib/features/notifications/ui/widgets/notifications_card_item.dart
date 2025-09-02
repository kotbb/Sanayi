import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsCardItem extends StatelessWidget {

  String title;
  String subtitle;
  String timeAgo;

   NotificationsCardItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.notifications,
              size: 32.sp,
              color: const Color(0xff102144),
            ),
            title: Text(
              title,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              subtitle,
              style: TextStyle(fontSize: 14.sp),
            ),
            trailing: Text(
              timeAgo,
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
