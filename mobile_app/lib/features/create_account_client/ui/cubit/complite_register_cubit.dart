import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sanayi_app/core/helpers/shared_pref.dart';
import 'package:sanayi_app/core/networking/api_error_handler.dart';
import 'package:sanayi_app/core/networking/api_error_model.dart';
import 'package:sanayi_app/features/auth/data/repos/auth_repo.dart';
import 'package:sanayi_app/features/create_account_client/data/models/complite_register_response.model.dart';

part 'complite_register_state.dart';

class CompliteRegisterCubit extends Cubit<CompliteRegisterState> {
  CompliteRegisterCubit(this._authRepo) : super(CompliteRegisterInitial());

  final AuthRepo _authRepo;

  final TextEditingController nameController = TextEditingController();

  void completeRegister() async {
    emit(CompliteRegisterLoading());
    try {
      final response = await _authRepo.completeRegister({
        "name": nameController.text,
        "role": SharedPrefHelper().getValueForKey(
          key: PrefKeys.role,
          defaultValue: 'client',
        ),
        "profilePicture": 'default.jpg',
      });
      emit(CompliteRegisterSuccess(response.data!));
    } catch (e) {
      emit(CompliteRegisterFailure(ApiErrorHandler.handle(e)));
    }
  }
}
