import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/routing/routes.dart';

class CraftsmenHeader extends StatelessWidget {
  const CraftsmenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Craftsmen", style: TextStyle(fontSize: 16.sp)),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.servicesScreen);
            },
            child: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
