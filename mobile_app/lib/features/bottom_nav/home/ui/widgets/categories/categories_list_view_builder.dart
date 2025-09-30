import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/features/bottom_nav/home/ui/widgets/categories/categories_list_view_item.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

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
              Text(LocaleKeys.clientHome_categories.tr(), style: TextStyle(fontSize: 16.sp)),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.categoriesScreen);
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
              return CategoriesListViewItem(
                image: "assets/images/svg/cleaner.svg",
                label: 'Cleaner',
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
