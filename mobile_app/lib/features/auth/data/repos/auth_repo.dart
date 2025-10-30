import 'package:sanayi_app/core/networking/api_error_handler.dart';
import 'package:sanayi_app/core/networking/api_result.dart';
import 'package:sanayi_app/features/auth/data/models/login_response_model.dart';
import 'package:sanayi_app/features/auth/data/models/refresh_token_response_model.dart';
import 'package:sanayi_app/features/auth/data/models/register_response_model.dart';
import 'package:sanayi_app/features/auth/data/models/verify_otp_response_model.dart';
import 'package:sanayi_app/features/auth/data/service/auth_service.dart';
import 'package:sanayi_app/features/create_account_client/data/models/complite_register_response.model.dart';
import 'package:sanayi_app/features/settings/data/models/logout_response_model.dart';

class AuthRepo {
  final AuthService _authService;
  AuthRepo(this._authService);

  Future<ApiResult<LoginResponseModel>> login(Map<String, dynamic> body) async {
    try {
      final response = await _authService.login(body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<RefreshTokenResponseModel>> refreshToken(
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await _authService.refreshToken(body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<LogoutResponseModel>> logout() async {
    try {
      final response = await _authService.logout();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<RegisterResponseModel>> register(
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await _authService.register(body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<VerifyOtpResponseModel>> verifyOtp(
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await _authService.verifyOtp(body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<CompleteRegisterResponse>> completeRegister(
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await _authService.completeRegister(body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
