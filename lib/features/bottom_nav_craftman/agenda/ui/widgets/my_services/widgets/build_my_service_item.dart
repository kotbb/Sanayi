import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';

class BuildMyServiceItem extends StatelessWidget {
  Map<String, dynamic> service;

  BuildMyServiceItem({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  service['title'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: const Color(0xff102144),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, size: 18.sp),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, size: 18.sp, color: Colors.red),
                      onPressed: () {
                        // Delete service functionality
                      },
                    ),
                  ],
                ),
              ],
            ),
            verticalSpace(8),
            Text(
              service['description'],
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            verticalSpace(8),
            Row(
              children: [
                Chip(
                  label: Text(service['category']),
                  backgroundColor: Colors.blue[100],
                ),
                horizontalSpace(6),
                Icon(Icons.access_time, size: 16, color: Colors.grey),
                horizontalSpace(2),
                Text(
                  service['duration'],
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
                horizontalSpace(6),
                Icon(Icons.attach_money, size: 16, color: Colors.green),
                horizontalSpace(2),
                Text(
                  service['price'],
                  style: TextStyle(fontSize: 12.sp, color: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
