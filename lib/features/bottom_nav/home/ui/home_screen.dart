import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';

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
                    GestureDetector(
                      onTap: () {
                        //TODO: adding logic here
                      },
                      child: Container(
                        width: double.infinity,
                        height: 52.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(32.r)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xfffEBF0F4),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.search,
                                    color: const Color(0xff102144),
                                  ),
                                ),
                              ),
                              horizontalSpace(12),
                              Text(
                                "Search here ...",
                                style: TextStyle(color: Color(0xff102144)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            verticalSpace(24),
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
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xfffEBF0F4),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset(
                                "assets/images/svg/cleaner.svg",
                                width: 36.w,
                                height: 36.h,
                              ),
                            ),
                          ),
                          verticalSpace(14),
                          Text("Cleaner"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            verticalSpace(42),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Services", style: TextStyle(fontSize: 16.sp)),
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
              height: 200.h,
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 160.w,
                      height: 174.h,
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Card(
                        shadowColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  "https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg",
                                ),
                                radius: 32.r,
                              ),
                              verticalSpace(8),
                              Text("Feras Osama"),
                              verticalSpace(14),
                              Text("Cleaner"),
                              verticalSpace(8),
                              Text("4.9⭐"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
