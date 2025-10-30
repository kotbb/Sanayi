import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sanayi_app/core/networking/api_error_model.dart';
import 'package:sanayi_app/features/bottom_nav/reservations/data/models/get_my_booking_response_model.dart';
import 'package:sanayi_app/features/bottom_nav/reservations/data/repos/my_booking_repo.dart';

part 'my_booking_state.dart';

class MyBookingCubit extends Cubit<MyBookingState> {
  MyBookingCubit({required this.myBookingRepo}) : super(MyBookingInitial());
  final MyBookingRepo myBookingRepo;

  void getMyBookings() async {
    emit(MyBookingLoading());
    final result = await myBookingRepo.getMyBookings();
    if (result.isSuccess) {
      emit(MyBookingSuccess(bookingResponseModel: result.data!));
    } else if (result.isFailure) {
      emit(MyBookingFailure(errorModel: result.errorModel!));
    }
  }
}
