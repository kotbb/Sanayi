part of 'create_booking_cubit.dart';

@immutable
sealed class CreateBookingState {}

final class CreateBookingInitial extends CreateBookingState {}

final class CreateBookingLoading extends CreateBookingState {}


final class CreateBookingSuccess extends CreateBookingState {
  final CreateBookingResponseModel responseModel;

  CreateBookingSuccess(this.responseModel);
}


final class CreateBookingFailure extends CreateBookingState {
  final ApiErrorModel apiErrorModel;

  CreateBookingFailure(this.apiErrorModel);
}