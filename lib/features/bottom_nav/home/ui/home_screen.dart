import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/features/bottom_nav/home/ui/widgets/categories/categories_list_view_builder.dart';
import 'package:sanayi_app/features/bottom_nav/home/ui/widgets/search_widget.dart';
import 'package:sanayi_app/features/bottom_nav/home/ui/widgets/services/services_list_view_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfffEBF0F4),
        title: Text(
          "Hey, Feras",
          style: TextStyle(color: const Color(0xff102144)),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.notifications,
                    color: const Color(0xff102144),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.26,
              decoration: const BoxDecoration(
                color: Color(0xfffEBF0F4),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "We are here to facilitate your services ...",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    verticalSpace(36),
                    SearchWidget(),
                  ],
                ),
              ),
            ),
            verticalSpace(24),
            CategoriesListViewBuilder(),
            verticalSpace(42),
            ServicesListViewBuilder(),
          ],
        ),
      ),
    );
  }
}
