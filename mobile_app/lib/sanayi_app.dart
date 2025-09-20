import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/routing/app_routers.dart';
import 'package:sanayi_app/features/on_boarding/on_boarding_screens.dart';

class SanayiApp extends StatelessWidget {
  final AppRouters appRouters;
  const SanayiApp({super.key, required this.appRouters});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          themeMode: ThemeMode.system,
          title: 'Sanayi',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouters.onGenerateRoute,
          // initialRoute: isLoggedInUser? Routes.appLayoutScreen : Routes.loginScreen,
          home: OnBoardingScreens(),
        );
      },
    );
  }
}
