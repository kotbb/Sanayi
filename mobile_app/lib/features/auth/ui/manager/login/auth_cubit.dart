import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanayi_app/core/helpers/secure_storage_helper.dart';
import 'package:sanayi_app/core/helpers/shared_pref.dart';
import 'package:sanayi_app/core/networking/api_error_model.dart';
import 'package:sanayi_app/core/networking/dio_factory.dart';
import 'package:sanayi_app/features/auth/data/models/login_response_model.dart';
import 'package:sanayi_app/features/auth/data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitial());
  final AuthRepo _authRepo;

  TextEditingController phoneNumberController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  void login() async {
    Map<String, dynamic> body = {"phoneNumber": phoneNumberController.text};
    emit(AuthLoading());
    final response = await _authRepo.login(body);
    if (response.isSuccess) {
      log("Login Success in Auth Cubit");
      await saveLoginData(response.data!);
      SharedPrefHelper().setValueForKey(
        key: PrefKeys.userName,
        value: response.data?.user.name ?? '',
      );
      // await refreshToken(response.data!.refreshToken);
      emit(AuthSuccess(loginResponseModel: response.data!));
    } else {
      log("Login Failure in Auth Cubit: ${response.errorModel?.message}");
      emit(AuthFailure(response.errorModel!));
    }
  }

  // Future<void> refreshToken(String refreshToken) async {
  //   Map<String, dynamic> body = {"refreshToken": refreshToken};
  //   final response = await _authRepo.refreshToken(body);
  //   if (response.isSuccess) {
  //     log("Token refreshed successfully");
  //     await SecureStorageHelper.setString(
  //       key: PrefKeys.token,
  //       value: response.data!.token,
  //     );
  //     DioFactory.setTokenIntoHeader(response.data!.token);
  //   } else {
  //     log("Failed to refresh token: ${response.errorModel?.message}");
  //   }
  // }
}

// Save token and isLoggedIn in secure storage and shared preferences
Future<void> saveLoginData(LoginResponseModel loginResponseModel) async {
  log("Saving login data");
  DioFactory.setTokenIntoHeader(loginResponseModel.token);
  await SecureStorageHelper.setString(
    key: PrefKeys.token,
    value: loginResponseModel.token,
  );
  await SecureStorageHelper.setString(
    key: PrefKeys.refreshToken,
    value: loginResponseModel.refreshToken,
  );
  SharedPrefHelper().setValueForKey(
    key: PrefKeys.userId,
    value: loginResponseModel.user.id,
  );

  SharedPrefHelper().setValueForKey(key: PrefKeys.isLoggedIn, value: true);
}
