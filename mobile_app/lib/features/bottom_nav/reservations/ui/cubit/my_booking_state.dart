part of 'my_booking_cubit.dart';

@immutable
sealed class MyBookingState {}

final class MyBookingInitial extends MyBookingState {}

final class MyBookingLoading extends MyBookingState {}


final class MyBookingSuccess extends MyBookingState {
  final GetMyBookingResponseModel bookingResponseModel;
  MyBookingSuccess({required this.bookingResponseModel});
}

final class MyBookingFailure extends MyBookingState {
  final ApiErrorModel errorModel;
  MyBookingFailure({required this.errorModel});
}
