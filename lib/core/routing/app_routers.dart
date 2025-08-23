import 'package:flutter/material.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/features/on_boarding/on_boarding_screen.dart';

class AppRouters {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      default:
        return null;
    }
  }
}
