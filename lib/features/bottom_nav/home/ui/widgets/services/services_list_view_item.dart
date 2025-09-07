import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sanayi_app/core/helpers/spacing.dart';

class ServicesListViewItem extends StatelessWidget {
  String? image;
  String name;
  String service;
  String rating;
  Function()? onTap;

  ServicesListViewItem({
    super.key,
    required this.image,
    required this.name,
    required this.service,
    required this.rating,
    required this.onTap,
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
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg",
                  ),
                  radius: 32.r,
                ),
                verticalSpace(8),
                Text(name),
                verticalSpace(14),
                Text(service),
                verticalSpace(8),
                Text("$rating⭐"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
