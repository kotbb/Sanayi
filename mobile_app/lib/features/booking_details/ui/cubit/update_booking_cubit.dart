import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sanayi_app/core/networking/api_error_model.dart';
import 'package:sanayi_app/features/booking_details/data/models/update_booking_response_model.dart';
import 'package:sanayi_app/features/bottom_nav/reservations/data/repos/my_booking_repo.dart';

part 'update_booking_state.dart';

class UpdateBookingCubit extends Cubit<UpdateBookingState> {
  UpdateBookingCubit(this.bookingRepo) : super(UpdateBookingInitial());
  final MyBookingRepo bookingRepo;

  void updateBooking(String bookingId) async {
    emit(UpdateBookingLoading());
    final result = await bookingRepo.updateBooking(bookingId, {
      "status": "cancelled",
    });

    if (result.isSuccess) {
      emit(UpdateBookingSuccess(responseModel: result.data!));
    } else if (result.isFailure) {
      emit(UpdateBookingFailure(errorModel: result.errorModel!));
    }
  }
}
