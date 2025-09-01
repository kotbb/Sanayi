import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/features/bottom_nav/home/ui/widgets/categories/categories_list_view_item.dart';

class CategoriesListViewBuilder extends StatelessWidget {
  const CategoriesListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Categories", style: TextStyle(fontSize: 16.sp)),
              GestureDetector(
                onTap: () {
                  //TODO: adding logic here
                },
                child: Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
        verticalSpace(22),
        SizedBox(
          height: 100.h,
          child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              //go to CategoriesListViewItem and handle onTap
              return CategoriesListViewItem(image: "assets/images/svg/cleaner.svg", label: 'Cleaner',);
            },
          ),
        ),
      ],
    );
  }
}
