import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/styles/colors.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: "Tajawal",
  scaffoldBackgroundColor: Colors.white,
  cardColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    scrolledUnderElevation: 0.0,
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w800),
    bodyMedium: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
    labelLarge: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
    labelMedium: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
    headlineLarge: TextStyle(
      color: ColorsManager.mainBlue,
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300),
  ),
);

// ThemeData darkTheme = ThemeData(
//   fontFamily: "Tajawal",
//   appBarTheme: AppBarTheme(
//     backgroundColor: Colors.transparent,
//     scrolledUnderElevation: 0.0,
//     centerTitle: true,
//     elevation: 0,
//     // iconTheme: IconThemeData(color: Colors.black),
//     titleTextStyle: TextStyle(
//       fontSize: 16.sp,
//       fontWeight: FontWeight.bold,
//     ),
//   ),
//   textTheme: TextTheme(
//     titleLarge: TextStyle(
//       fontSize: 16.sp,
//       fontWeight: FontWeight.w800,
//     ),
//     bodyMedium: TextStyle(
//       fontSize: 12.sp,
//       fontWeight: FontWeight.w400,
//     ),
//     headlineLarge: TextStyle(
//       color: ColorsManager.mainBlue,
//       fontSize: 18.sp,
//       fontWeight: FontWeight.w700,
//     ),
//   ),
// );
