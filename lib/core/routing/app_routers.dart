import 'package:flutter/material.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/features/auth/ui/login_screen.dart';
import 'package:sanayi_app/features/auth/ui/otp_code_screen.dart';
import 'package:sanayi_app/features/choose_user_type/choose_user_type_screen.dart';
import 'package:sanayi_app/features/create_account_client/ui/create_account_client_screen.dart';
import 'package:sanayi_app/features/create_account_craftman/ui/create_account_craftman_screen.dart';
import 'package:sanayi_app/features/on_boarding/on_boarding_screens.dart';

class AppRouters {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreens:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreens());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.otpCodeScreen:
        return MaterialPageRoute(builder: (_) => const OtpCodeScreen());
      case Routes.chooseUserTypeScreen:
        return MaterialPageRoute(builder: (_) => const ChooseUserTypeScreen());
      case Routes.createAccountClient:
        return MaterialPageRoute(
          builder: (_) => const CreateAccountClientScreen(),
        );
      case Routes.createAccountCraftmanScreen:
        return MaterialPageRoute(
          builder: (_) => const CreateAccountCraftmanScreen(),
        );
      default:
        return null;
    }
  }
}
