import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sanayi_app/core/networking/dio_factory.dart';
import 'package:sanayi_app/features/auth/data/repos/auth_repo.dart';
import 'package:sanayi_app/features/auth/data/service/auth_service.dart';
import 'package:sanayi_app/features/auth/ui/manager/login/auth_cubit.dart';
import 'package:sanayi_app/features/auth/ui/manager/register_cubit/register_cubit.dart';
import 'package:sanayi_app/features/auth/ui/manager/verify_otp_cubit/verify_otp_cubit.dart';
import 'package:sanayi_app/features/booking_craftman/ui/cubit/create_booking_cubit.dart';
import 'package:sanayi_app/features/booking_details/ui/cubit/update_booking_cubit.dart';
import 'package:sanayi_app/features/bottom_nav/cubit/categories_cubit/categories_cubit.dart';
import 'package:sanayi_app/features/bottom_nav/cubit/ceaftsmen_cubit/craftsmen_cubit.dart';
import 'package:sanayi_app/features/bottom_nav/cubit/crftsmen_in_category_cubit/cratftsmen_in_category_cubit.dart';
import 'package:sanayi_app/features/bottom_nav/data/repos/home_repo.dart';
import 'package:sanayi_app/features/bottom_nav/data/service/home_service.dart';
import 'package:sanayi_app/features/bottom_nav/profile/data/repos/profile_repo.dart';
import 'package:sanayi_app/features/bottom_nav/profile/data/service/profile_service.dart';
import 'package:sanayi_app/features/bottom_nav/profile/ui/cubit/profile_cubit.dart';
import 'package:sanayi_app/features/bottom_nav/reservations/data/repos/my_booking_repo.dart';
import 'package:sanayi_app/features/bottom_nav/reservations/data/service/booking_service.dart';
import 'package:sanayi_app/features/bottom_nav/reservations/ui/cubit/my_booking_cubit.dart';
import 'package:sanayi_app/features/create_account_client/ui/cubit/complite_register_cubit.dart';
import 'package:sanayi_app/features/settings/ui/cubit/logout_cubit/logout_cubit.dart';

GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = await DioFactory.getDio();
  getIt.registerSingleton<Dio>(dio);

  getIt.registerLazySingleton<AuthService>(() => AuthService(getIt<Dio>()));
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(getIt<AuthService>()));
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepo>()));

  getIt.registerLazySingleton<HomeService>(() => HomeService(getIt<Dio>()));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<HomeService>()));
  getIt.registerFactory<CategoriesCubit>(
    () => CategoriesCubit(getIt<HomeRepo>()),
  );
  getIt.registerFactory<CraftsmenCubit>(
    () => CraftsmenCubit(getIt<HomeRepo>()),
  );
  getIt.registerFactory<CratftsmenInCategoryCubit>(
    () => CratftsmenInCategoryCubit(getIt<HomeRepo>()),
  );

  getIt.registerLazySingleton<BookingService>(
    () => BookingService(getIt<Dio>()),
  );

  getIt.registerFactory<MyBookingRepo>(
    () => MyBookingRepo(bookingService: getIt<BookingService>()),
  );

  getIt.registerFactory<MyBookingCubit>(
    () => MyBookingCubit(myBookingRepo: getIt<MyBookingRepo>()),
  );

  getIt.registerLazySingleton<ProfileService>(
    () => ProfileService(getIt<Dio>()),
  );

  getIt.registerFactory<ProfileRepo>(
    () => ProfileRepo(getIt<ProfileService>()),
  );

  getIt.registerCachedFactory<ProfileCubit>(
    () => ProfileCubit(getIt<ProfileRepo>()),
  );

  getIt.registerFactory<UpdateBookingCubit>(
    () => UpdateBookingCubit(getIt<MyBookingRepo>()),
  );

  getIt.registerFactory<LogoutCubit>(() => LogoutCubit(getIt<AuthRepo>()));

  getIt.registerFactory<CreateBookingCubit>(
    () => CreateBookingCubit(getIt<MyBookingRepo>()),
  );

  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt<AuthRepo>()));

  getIt.registerFactory<VerifyOtpCubit>(
    () => VerifyOtpCubit(getIt<AuthRepo>()),
  );

  getIt.registerFactory<CompliteRegisterCubit>(
    () => CompliteRegisterCubit(getIt<AuthRepo>()),
  );
}

/// rest the getIt instance - for testing purposes

void resetGetIt() {
  getIt.reset();
}
