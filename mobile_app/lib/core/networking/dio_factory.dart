import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sanayi_app/core/helpers/secure_storage_helper.dart';
import 'package:sanayi_app/core/helpers/shared_pref.dart';
import 'package:sanayi_app/core/networking/refresh_token_incpector.dart';

class DioFactory {
  static Dio? dio;
  DioFactory._();

  static Future<Dio> getDio() async {
    Duration timeOut = const Duration(minutes: 1);

    if (dio == null) {
      dio = Dio();
      dio!.options.connectTimeout = timeOut;
      dio!.options.receiveTimeout = timeOut;
      await addDioHeaders();
      addDioInterceptor();

      return dio!;
    } else {
      return dio!;
    }
  }

  static Future<void> addDioHeaders() async {
    final token = await SecureStorageHelper.getString(key: PrefKeys.token);
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  static void addDioInterceptor() {
    // dio?.interceptors.clear();
    // dio?.interceptors.add(RefreshTokenInterceptor());
    if (!kReleaseMode) {
      dio?.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
        ),
      );
    }
  }

  static void setTokenIntoHeader(String token) async {
    dio?.options.headers = {'Authorization': 'Bearer $token'};
  }
}
