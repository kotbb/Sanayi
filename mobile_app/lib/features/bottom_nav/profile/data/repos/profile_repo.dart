import 'dart:io';

import 'package:sanayi_app/core/networking/api_error_handler.dart';
import 'package:sanayi_app/core/networking/api_result.dart';
import 'package:sanayi_app/features/bottom_nav/profile/data/models/get_my_profile_response_model.dart';
import 'package:sanayi_app/features/bottom_nav/profile/data/service/profile_service.dart';

class ProfileRepo {
  final ProfileService _profileService;

  ProfileRepo(this._profileService);

  Future<ApiResult<GetMyProfileResponseModel>> getMyProfile() async {
    try {
      final response = await _profileService.getMyProfile();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<GetMyProfileResponseModel>> updateProfile({
    String? name,
    String? phoneNumber,
    File? profilePicture,
  }) async {
    try {
      final response = await _profileService.updateProfile(
        name: name,
        phoneNumber: phoneNumber,
        profilePicture: profilePicture,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
