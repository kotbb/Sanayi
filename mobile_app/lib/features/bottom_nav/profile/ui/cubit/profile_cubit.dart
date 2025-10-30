import 'dart:io';

// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanayi_app/core/networking/api_error_model.dart';
import 'package:sanayi_app/features/auth/data/models/user_model.dart';
import 'package:sanayi_app/features/bottom_nav/profile/data/models/get_my_profile_response_model.dart';
import 'package:sanayi_app/features/bottom_nav/profile/data/repos/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  ProfileCubit(this._profileRepo) : super(ProfileState());

  late TextEditingController nameController;
  late TextEditingController phoneNumberController;
  late File? profilePictureFile;

  void initControllers(UserModel userModel) {
    nameController = TextEditingController(text: userModel.name);
    phoneNumberController = TextEditingController(text: userModel.phoneNumber);
    profilePictureFile = File(userModel.profilePicture);
  }

  void getMyProfile() async {
    emit(state.copyWith(isLoading: true));
    final result = await _profileRepo.getMyProfile();
    if (result.isSuccess) {
      emit(
        state.copyWith(
          profileData: result.data!,
          isSuccess: true,
          isUpdating: false,
          isLoading: false,
        ),
      );
    } else {
      emit(state.copyWith(errorModel: result.errorModel!));
    }
  }

  void updateProfile({
    String? name,
    String? phoneNumber,
    File? profilePicture,
  }) async {
    emit(state.copyWith(isLoading: true, isUpdating: false));
    final result = await _profileRepo.updateProfile(
      name: name,
      phoneNumber: phoneNumber,
      profilePicture: profilePicture,
    );
    if (result.isSuccess) {
      emit(
        state.copyWith(
          profileData: result.data!,
          isSuccess: true,
          isUpdating: true,
          isLoading: false,
        ),
      );
    } else {
      emit(
        state.copyWith(
          errorModel: result.errorModel!,
          isLoading: false,
          isUpdating: false,
          isSuccess: false,
        ),
      );
    }
  }
}
