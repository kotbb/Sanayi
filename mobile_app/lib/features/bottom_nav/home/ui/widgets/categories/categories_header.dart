import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/routing/routes.dart';

class CategoriesHeader extends StatelessWidget {
  const CategoriesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Categories", style: TextStyle(fontSize: 16.sp)),
          // GestureDetector(
          //   onTap: () {
          //     Navigator.pushNamed(context, Routes.categoriesScreen);
          //   },
          //   child: Text(
          //     "See All",
          //     style: TextStyle(
          //       fontSize: 14.sp,

          //       color: const Color(0xff6C7A93),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
