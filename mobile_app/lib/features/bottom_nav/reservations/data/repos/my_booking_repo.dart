import 'package:sanayi_app/core/networking/api_error_handler.dart';
import 'package:sanayi_app/core/networking/api_result.dart';
import 'package:sanayi_app/features/booking_craftman/data/models/create_booking_model_request.dart';
import 'package:sanayi_app/features/booking_craftman/data/models/create_booking_response_model.dart';
import 'package:sanayi_app/features/booking_details/data/models/update_booking_response_model.dart';
import 'package:sanayi_app/features/bottom_nav/reservations/data/models/get_my_booking_response_model.dart';
import 'package:sanayi_app/features/bottom_nav/reservations/data/service/booking_service.dart';

class MyBookingRepo {
  final BookingService bookingService;
  MyBookingRepo({required this.bookingService});

  Future<ApiResult<GetMyBookingResponseModel>> getMyBookings() async {
    try {
      final response = await bookingService.getMyBookings();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<UpdateBookingResponseModel>> updateBooking(
    String bookingId,
    Map<String, dynamic> updateData,
  ) async {
    try {
      final response = await bookingService.updateBooking(
        bookingId,
        updateData,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<CreateBookingResponseModel>> createBooking(
    CreateBookingModelRequest bookingDetails,
  ) async {
    try {
      final response = await bookingService.createBooking(bookingDetails);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
