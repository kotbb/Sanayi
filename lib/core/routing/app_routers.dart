import 'package:flutter/material.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/features/auth/ui/login_screen.dart';
import 'package:sanayi_app/features/auth/ui/otp_code_screen.dart';
import 'package:sanayi_app/features/booking_craftman/ui/success_booking_screen.dart';
import 'package:sanayi_app/features/booking_details/ui/booking_details_screen.dart';
import 'package:sanayi_app/features/contact_with_craftman/ui/contact_with_craftman_screen.dart';
import 'package:sanayi_app/features/booking_details/ui/success_cancel_booking_screen.dart';
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
import 'package:sanayi_app/features/rate_craftman/ui/rate_craftman_screen.dart';
import 'package:sanayi_app/features/see_craftman_profile/ui/see_craftman_profile_screen.dart';
import 'package:sanayi_app/features/services/ui/services_screen.dart';
import 'package:sanayi_app/features/settings/ui/settings_screen.dart';
import 'package:sanayi_app/features/work_gallery_details/ui/work_gallery_details_screen.dart';
import 'package:sanayi_app/features/works_gallery/ui/works_gallery_screen.dart';

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
      case Routes.worksGalleryScreen:
        return MaterialPageRoute(builder: (_) => const WorksGalleryScreen());
      case Routes.workGalleryDetailsScreen:
        return MaterialPageRoute(builder: (_) => WorkGalleryDetailsScreen());
      case Routes.successBookingScreen:
        return MaterialPageRoute(builder: (_) => const SuccessBookingScreen());
      case Routes.bookingDetailsScreen:
        return MaterialPageRoute(builder: (_) => const BookingDetailsScreen());
      case Routes.successCancelBookingScreen:
        return MaterialPageRoute(
          builder: (_) => const SuccessCancelBookingScreen(),
        );
      case Routes.contactWithCraftmanScreen:
        return MaterialPageRoute(
          builder: (_) => const ContactWithCraftmanScreen(),
        );
      case Routes.rateCraftmanScreen:
        return MaterialPageRoute(builder: (_) => const RateCraftmanScreen());
      default:
        return null;
    }
  }
}
