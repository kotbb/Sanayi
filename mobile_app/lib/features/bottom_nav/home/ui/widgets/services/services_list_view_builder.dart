import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/features/bottom_nav/home/ui/widgets/services/services_list_view_item.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class ServicesListViewBuilder extends StatelessWidget {
  const ServicesListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.clientHome_services.tr(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.servicesScreen);
                },
                child: Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
        verticalSpace(22),
        SizedBox(
          height: 200.h,
          child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              //go to ServicesListViewItem and handle onTap & the image
              return ServicesListViewItem(
                image: "",
                name: "Feras AZ",
                service: "Cleaner",
                rating: "4.9",
                onTap: () {
                  Navigator.pushNamed(context, Routes.craftmanDetailsScreen);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
