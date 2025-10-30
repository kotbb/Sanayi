import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sanayi_app/core/networking/api_error_handler.dart';
import 'package:sanayi_app/core/networking/api_error_model.dart';
import 'package:sanayi_app/core/networking/dio_factory.dart';
import 'package:sanayi_app/features/auth/data/models/verify_otp_response_model.dart';
import 'package:sanayi_app/features/auth/data/repos/auth_repo.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  VerifyOtpCubit(this._authRepo) : super(VerifyOtpInitial());
  final AuthRepo _authRepo;

  final TextEditingController otpController = TextEditingController();

  void verifyOtp(String phoneNumber) async {
    emit(VerifyOtpLoading());
    try {
      final response = await _authRepo.verifyOtp({
        "phoneNumber": phoneNumber,
        "otp": otpController.text,
      });
      emit(VerifyOtpSuccess(response.data!));
      DioFactory.setTokenIntoHeader(response.data!.registerationToken);
    } catch (e) {
      emit(VerifyOtpFailure(ApiErrorHandler.handle(e)));
    }
  }
}
