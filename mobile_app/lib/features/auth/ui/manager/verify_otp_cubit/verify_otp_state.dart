part of 'verify_otp_cubit.dart';

@immutable
sealed class VerifyOtpState {}

final class VerifyOtpInitial extends VerifyOtpState {}

final class VerifyOtpLoading extends VerifyOtpState {}

final class VerifyOtpSuccess extends VerifyOtpState {
  final VerifyOtpResponseModel responseModel;
  VerifyOtpSuccess(this.responseModel);
}

final class VerifyOtpFailure extends VerifyOtpState {
  final ApiErrorModel errorModel;
  VerifyOtpFailure(this.errorModel);
}
