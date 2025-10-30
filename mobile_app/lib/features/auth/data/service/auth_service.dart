import 'package:dio/dio.dart';
import 'package:sanayi_app/features/auth/data/models/login_response_model.dart';
import 'package:sanayi_app/core/networking/api_constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sanayi_app/features/auth/data/models/refresh_token_response_model.dart';
import 'package:sanayi_app/features/auth/data/models/register_response_model.dart';
import 'package:sanayi_app/features/auth/data/models/verify_otp_response_model.dart';
import 'package:sanayi_app/features/create_account_client/data/models/complite_register_response.model.dart';
import 'package:sanayi_app/features/settings/data/models/logout_response_model.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST(ApiConstants.login)
  Future<LoginResponseModel> login(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.refreshToken)
  Future<RefreshTokenResponseModel> refreshToken(
    @Body() Map<String, dynamic> body,
  );

  @POST(ApiConstants.logout)
  Future<LogoutResponseModel> logout();

  @POST(ApiConstants.register)
  Future<RegisterResponseModel> register(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.verifyOtp)
  Future<VerifyOtpResponseModel> verifyOtp(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.completeRegister)
  Future<CompleteRegisterResponse> completeRegister(
    @Body() Map<String, dynamic> body,
  );
}
