import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sanayi_app/core/networking/api_constants.dart';
import 'package:sanayi_app/features/bottom_nav/profile/data/models/get_my_profile_response_model.dart';

part 'profile_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ProfileService {
  factory ProfileService(Dio dio, {String baseUrl}) = _ProfileService;


  @GET(ApiConstants.getMyProfile)
  Future<GetMyProfileResponseModel> getMyProfile();


   @MultiPart()
  @POST(ApiConstants.profileUpdate)
  Future<GetMyProfileResponseModel> updateProfile({
    @Part(name: 'name') String? name,
    @Part(name: 'phoneNumber') String? phoneNumber,
    @Part(name: 'profilePicture') File? profilePicture,
  });
}
