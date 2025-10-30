import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sanayi_app/core/networking/api_constants.dart';
import 'package:sanayi_app/features/booking_craftman/data/models/create_booking_model_request.dart';
import 'package:sanayi_app/features/booking_craftman/data/models/create_booking_response_model.dart';
import 'package:sanayi_app/features/booking_details/data/models/update_booking_response_model.dart';
import 'package:sanayi_app/features/bottom_nav/reservations/data/models/get_my_booking_response_model.dart';

part 'booking_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class BookingService {
  factory BookingService(Dio dio, {String baseUrl}) = _BookingService;

  @GET(ApiConstants.getMyBookings)
  Future<GetMyBookingResponseModel> getMyBookings();

  @PATCH("${ApiConstants.updateBooking}{bookingId}")
  Future<UpdateBookingResponseModel> updateBooking(
    @Path("bookingId") String bookingId,
    @Body() Map<String, dynamic> updateData,
  );

  @POST(ApiConstants.createBooking)
  Future<CreateBookingResponseModel> createBooking(
    @Body() CreateBookingModelRequest bookingDetails,
  );
}
