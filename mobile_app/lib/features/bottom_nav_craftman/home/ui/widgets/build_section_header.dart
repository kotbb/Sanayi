import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/routing/routes.dart';

class BuildSectionHeader extends StatelessWidget {
  String title;
  int count;
  BuildSectionHeader({super.key, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xff102144),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.requestsScreen);
          },
          child: Chip(
            label: Text(count.toString()),
            backgroundColor: Colors.blue[100],
          ),
        ),
      ],
    );
  }
}
