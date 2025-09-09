import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';

class ClientReviewWidget extends StatelessWidget {
  const ClientReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Client Review",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xff102144),
          ),
        ),
        verticalSpace(12),
        Row(
          children: [
             CircleAvatar(
              radius: 22.r,
              backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=3"),
            ),
            horizontalSpace(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Feras AbuZayed",
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
                verticalSpace(4),
                Row(
                  children: [
                    Icon(Icons.star, size: 18, color: Colors.orangeAccent),
                    Icon(Icons.star, size: 18, color: Colors.orangeAccent),
                    Icon(Icons.star, size: 18, color: Colors.orangeAccent),
                    Icon(Icons.star, size: 18, color: Colors.orangeAccent),
                    Icon(Icons.star_half, size: 18, color: Colors.orangeAccent),
                  ],
                ),
              ],
            ),
          ],
        ),
        verticalSpace(12),
        const Text(
          "The craftsman was professional and delivered the work on time. "
          "Very satisfied with the results!",
          style: TextStyle(color: Colors.black87, height: 1.4),
        ),
      ],
    );
  }
}
