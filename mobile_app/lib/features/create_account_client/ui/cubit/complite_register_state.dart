part of 'complite_register_cubit.dart';

@immutable
sealed class CompliteRegisterState {}

final class CompliteRegisterInitial extends CompliteRegisterState {}

final class CompliteRegisterLoading extends CompliteRegisterState {}

final class CompliteRegisterSuccess extends CompliteRegisterState {
  final CompleteRegisterResponse response;
  CompliteRegisterSuccess(this.response);
}

final class CompliteRegisterFailure extends CompliteRegisterState {
  final ApiErrorModel error;
  CompliteRegisterFailure(this.error);
}
