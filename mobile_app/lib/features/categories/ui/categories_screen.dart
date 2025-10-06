import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/features/categories/ui/widgets/categories_grid_view_item.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.clientHome_categories.tr(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 7,
            mainAxisSpacing: 7,
            childAspectRatio: 1.0,
          ),
          itemCount: 11,
          itemBuilder: (context, index) {
            return CategoriesGridViewItem(
              image: "assets/images/svg/cleaner.svg",
              label: 'Cleaner',
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
