part of 'update_booking_cubit.dart';

@immutable
sealed class UpdateBookingState {}

final class UpdateBookingInitial extends UpdateBookingState {}

final class UpdateBookingLoading extends UpdateBookingState {}

final class UpdateBookingSuccess extends UpdateBookingState {
  final UpdateBookingResponseModel responseModel;

  UpdateBookingSuccess({required this.responseModel});
}

final class UpdateBookingFailure extends UpdateBookingState {
  final ApiErrorModel errorModel;

  UpdateBookingFailure({required this.errorModel});
}
