import 'package:flutter/material.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/features/auth/ui/login_screen.dart';
import 'package:sanayi_app/features/auth/ui/otp_code_screen.dart';
import 'package:sanayi_app/features/bottom_nav/app_layout.dart';
import 'package:sanayi_app/features/bottom_nav/cubit/app_cubit.dart';
import 'package:sanayi_app/features/categories/ui/categories_screen.dart';
import 'package:sanayi_app/features/choose_user_type/choose_user_type_screen.dart';
import 'package:sanayi_app/features/craftman_details/ui/craftman_details_screen.dart';
import 'package:sanayi_app/features/booking_craftman/ui/booking_craftman_screen.dart';
import 'package:sanayi_app/features/create_account_client/ui/create_account_client_screen.dart';
import 'package:sanayi_app/features/create_account_craftman/ui/create_account_craftman_screen.dart';
import 'package:sanayi_app/features/edit_profile/ui/edit_profile_screen.dart';
import 'package:sanayi_app/features/language/ui/language_screen.dart';
import 'package:sanayi_app/features/notifications/ui/notifications_screen.dart';
import 'package:sanayi_app/features/on_boarding/on_boarding_screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanayi_app/features/see_craftman_profile/ui/see_craftman_profile_screen.dart';
import 'package:sanayi_app/features/services/ui/services_screen.dart';
import 'package:sanayi_app/features/settings/ui/settings_screen.dart';

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
      case Routes.appLayout:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [BlocProvider(create: (context) => AppCubit())],
            child: const AppLayout(),
          ),
        );
      case Routes.notificationsScreen:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
      case Routes.settingsScreen:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case Routes.editProfileScreen:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case Routes.languageScreen:
        return MaterialPageRoute(builder: (_) => const LanguageScreen());
      case Routes.categoriesScreen:
        return MaterialPageRoute(builder: (_) => const CategoriesScreen());
      case Routes.servicesScreen:
        return MaterialPageRoute(builder: (_) => const ServicesScreen());
      case Routes.craftmanDetailsScreen:
        return MaterialPageRoute(builder: (_) => const CraftmanDetailsScreen());
      case Routes.bookingCraftmanScreen:
        return MaterialPageRoute(builder: (_) => const BookingCraftmanScreen());
      case Routes.seeCraftmanProfileScreen:
        return MaterialPageRoute(
          builder: (_) => const SeeCraftmanProfileScreen(),
        );
      default:
        return null;
    }
  }
}
