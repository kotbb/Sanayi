import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sanayi_app/core/networking/api_error_model.dart';
import 'package:sanayi_app/features/booking_craftman/data/models/create_booking_model_request.dart';
import 'package:sanayi_app/features/booking_craftman/data/models/create_booking_response_model.dart';
import 'package:sanayi_app/features/bottom_nav/reservations/data/repos/my_booking_repo.dart';

part 'create_booking_state.dart';

class CreateBookingCubit extends Cubit<CreateBookingState> {
  CreateBookingCubit(this.bookingRepo) : super(CreateBookingInitial());
  final MyBookingRepo bookingRepo;

  void createBooking(CreateBookingModelRequest bookingDetails) async {
    emit(CreateBookingLoading());
    final result = await bookingRepo.createBooking(bookingDetails);
    if (result.isSuccess) {
      emit(CreateBookingSuccess(result.data!));
    } else {
      emit(CreateBookingFailure(result.errorModel!));
    }
  }
}
