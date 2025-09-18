import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/features/bottom_nav/home/ui/widgets/categories/categories_list_view_builder.dart';
import 'package:sanayi_app/features/bottom_nav/home/ui/widgets/search_widget.dart';
import 'package:sanayi_app/features/bottom_nav/home/ui/widgets/services/services_list_view_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xfffebf0f4), // لون الخلفية
        statusBarIconBrightness:
            Brightness.dark, // لون الأيقونات (Light = أبيض, Dark = أسود)
      ),
    );

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.33,
              decoration: const BoxDecoration(
                color: Color(0xfffebf0f4),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hey, Feras",
                          style: TextStyle(
                            color: const Color(0xff102144),
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.notificationsScreen,
                            );
                          },
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
                    verticalSpace(24),
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
            verticalSpace(42),
          ],
        ),
      ),
    );
  }
}
