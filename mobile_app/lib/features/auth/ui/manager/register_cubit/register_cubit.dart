import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:sanayi_app/core/networking/api_error_handler.dart';
import 'package:sanayi_app/core/networking/api_error_model.dart';
import 'package:sanayi_app/features/auth/data/repos/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authRepo) : super(RegisterInitial());
  final AuthRepo _authRepo;

  TextEditingController phoneNumberController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void register() async {
    emit(RegisterLoading());
    try {
      final response = await _authRepo.register({
        "phoneNumber": phoneNumberController.text,
      });
      emit(RegisterSuccess(response.data!.message));
    } catch (e) {
      emit(RegisterFailure(ApiErrorHandler.handle(e)));
    }
  }
}
