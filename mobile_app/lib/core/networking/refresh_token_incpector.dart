// import 'package:dio/dio.dart';
// import 'package:sanayi_app/core/helpers/secure_storage_helper.dart';
// import 'package:sanayi_app/core/helpers/shared_pref.dart';
// import 'package:sanayi_app/core/networking/api_constants.dart';
// import 'package:sanayi_app/core/networking/dio_factory.dart';
// import 'dart:developer';

// class RefreshTokenInterceptor extends Interceptor {
//   bool _isRefreshing = false;
//   final List<Function(Response)> _onRefreshDone = [];
//   RefreshTokenInterceptor(){

//   }

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async {
//     log("Error Interceptor in RefreshTokenInterceptor1: ${err.response?.statusCode}");
//     if (err.response?.statusCode == 500 && !_isRefreshing) {
//       _isRefreshing = true;
//       try {
//         final refreshToken = await SecureStorageHelper.getString(
//           key: PrefKeys.refreshToken,
//         );
//         if (refreshToken == null) {
//           return handler.next(err); // No refresh token stored — logout flow
//         }

//         final dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
//         final response = await dio.post(
//           ApiConstants.refreshToken,
//           data: {'refresh_token': refreshToken},
//         );

//         if (response.statusCode == 200) {
//           final newAccessToken = response.data['token'];
//           final newRefreshToken = response.data['refresh_token'];

//           await SecureStorageHelper.setString(
//             key: PrefKeys.token,
//             value: newAccessToken,
//           );
//           await SecureStorageHelper.setString(
//             key: PrefKeys.refreshToken,
//             value: newRefreshToken,
//           );

//           // Update headers for all pending requests
//           DioFactory.setTokenIntoHeader(newAccessToken);

//           // Retry queued requests
//           for (final callback in _onRefreshDone) {
//             callback(response);
//           }
//           _onRefreshDone.clear();

//           // Retry the failed request
//           final clonedRequest = await _retryRequest(
//             err.requestOptions,
//             newAccessToken,
//           );
//           handler.resolve(clonedRequest);
//         } else {
//           handler.next(err); // Refresh failed — forward error
//         }
//       } catch (e) {
//         handler.next(err); // Failed to refresh — logout or show error
//       } finally {
//         _isRefreshing = false;
//       }
//     } else if (err.response?.statusCode == 500 && _isRefreshing) {
//       log("Error Interceptor in RefreshTokenInterceptor2: ${err.response?.statusCode}");
//       // If a refresh is already happening, queue the request
//       final responseCompleter = (Response r) async {
//         final accessToken = await SecureStorageHelper.getString(
//           key: PrefKeys.token,
//         );
//         final clone = await _retryRequest(err.requestOptions, accessToken!);
//         handler.resolve(clone);
//       };
//       _onRefreshDone.add(responseCompleter);
//     } else {
//       handler.next(err);
//     }
//   }

//   Future<Response<dynamic>> _retryRequest(
//     RequestOptions requestOptions,
//     String accessToken,
//   ) {
//     final options = Options(
//       method: requestOptions.method,
//       headers: {'Authorization': 'Bearer $accessToken'},
//     );

//     final dio = Dio();
//     return dio.request(
//       requestOptions.path,
//       data: requestOptions.data,
//       queryParameters: requestOptions.queryParameters,
//       options: options,
//     );
//   }
// }

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:sanayi_app/core/helpers/secure_storage_helper.dart';
import 'package:sanayi_app/core/helpers/shared_pref.dart';
import 'package:sanayi_app/core/networking/api_constants.dart';
import 'package:sanayi_app/core/networking/dio_factory.dart';

class RefreshTokenInterceptor extends Interceptor {
  bool _isRefreshing = false;
  final List<Function()> _retryQueue = [];

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Only handle 500 (Internal Server Error)
    if (err.response?.statusCode != 500) {
      return handler.next(err);
    }

    final requestOptions = err.requestOptions;

    // If refresh is already in progress, queue this request
    if (_isRefreshing) {
      log('[RefreshTokenInterceptor] Queueing request: ${requestOptions.path}');
      _retryQueue.add(() async {
        final accessToken = await SecureStorageHelper.getString(
          key: PrefKeys.token,
        );
        final retryResponse = await _retryRequest(requestOptions, accessToken!);
        handler.resolve(retryResponse);
      });
      return;
    }

    _isRefreshing = true;
    log('[RefreshTokenInterceptor] Refreshing access token...');

    try {
      final refreshToken = await SecureStorageHelper.getString(
        key: PrefKeys.refreshToken,
      );

      if (refreshToken == null) {
        log(
          '[RefreshTokenInterceptor] No refresh token found — user must re-login.',
        );
        return handler.next(err);
      }

      // Create a temporary Dio instance without interceptors to avoid recursion
      final refreshDio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
      final response = await refreshDio.post(
        ApiConstants.refreshToken,
        data: {'refreshToken': refreshToken},
        options: Options(contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200 && response.data['token'] != null) {
        final newAccessToken = response.data['token'];
        final newRefreshToken = response.data['refreshToken'];

        // Store new tokens
        await SecureStorageHelper.setString(
          key: PrefKeys.token,
          value: newAccessToken,
        );
        await SecureStorageHelper.setString(
          key: PrefKeys.refreshToken,
          value: newRefreshToken,
        );

        // Update global Dio header
        DioFactory.setTokenIntoHeader(newAccessToken);

        log('[RefreshTokenInterceptor] Token refreshed successfully.');

        // Retry all queued requests
        final queued = List<Function()>.from(_retryQueue);
        _retryQueue.clear();
        for (final retry in queued) {
          await retry();
        }

        // Retry the original failed request
        final retryResponse = await _retryRequest(
          requestOptions,
          newAccessToken,
        );
        handler.resolve(retryResponse);
      } else {
        log(
          '[RefreshTokenInterceptor] Refresh failed — status: ${response.statusCode}',
        );
        _handleRefreshFailure(handler, err);
      }
    } catch (e, stack) {
      log('[RefreshTokenInterceptor] Refresh token error: $e');
      log(stack.toString());
      _handleRefreshFailure(handler, err);
    } finally {
      _isRefreshing = false;
    }
  }

  /// Retry the original failed request with the new access token
  Future<Response<dynamic>> _retryRequest(
    RequestOptions requestOptions,
    String accessToken,
  ) async {
    final dio = await DioFactory.getDio();

    final options = Options(
      method: requestOptions.method,
      headers: {
        ...requestOptions.headers,
        'Authorization': 'Bearer $accessToken',
      },
    );

    log('[RefreshTokenInterceptor] Retrying request: ${requestOptions.path}');
    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  /// Handles refresh failure (e.g., logout flow)
  Future<void> _handleRefreshFailure(
    ErrorInterceptorHandler handler,
    DioException err,
  ) async {
    await SecureStorageHelper.clearAll();
    await SharedPrefHelper().clearAll();

    log('[RefreshTokenInterceptor] Session expired — user logged out.');
    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: Response(
          statusCode: 401,
          requestOptions: err.requestOptions,
          statusMessage: 'Session expired',
        ),
        type: DioExceptionType.badResponse,
      ),
    );
  }
}
