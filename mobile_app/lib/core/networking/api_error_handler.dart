import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sanayi_app/core/networking/api_error_factory.dart';
import 'package:sanayi_app/core/networking/api_error_model.dart';
import 'package:sanayi_app/core/networking/dio_exception_type_extension.dart';
import 'package:sanayi_app/core/networking/loacl_status_codes.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic e) {
    if (e is Exception) {
      if (e is DioException) {
        if (e.response?.statusCode == 404) {
          return ApiErrorModel(
            message: "User not found. Please check your credentials.",
            icon: Icons.person_off,
            statusCode: 404,
          );
        }
        return e.when(
          connectionError: () => ApiErrorModel(
            message:
                "No internet connection. Please check your Wi-Fi or mobile data.",
            icon: Icons.wifi_off,
            statusCode: LocalStatusCodes.connectionError,
          ),
          connectionTimeout: () => ApiErrorModel(
            message:
                "The connection took too long. Try checking your internet or try again later.",
            icon: Icons.timer_off,
            statusCode: LocalStatusCodes.connectionTimeout,
          ),
          sendTimeout: () => ApiErrorModel(
            message: "Request timed out while sending data. Please try again.",
            icon: Icons.send,
            statusCode: LocalStatusCodes.sendTimeout,
          ),
          receiveTimeout: () => ApiErrorModel(
            message: "Server took too long to respond. Please try again later.",
            icon: Icons.downloading,
            statusCode: LocalStatusCodes.receiveTimeout,
          ),
          badCertificate: () => ApiErrorModel(
            message:
                "Security issue detected with the server. Connection not secure.",
            icon: Icons.security,
            statusCode: LocalStatusCodes.badCertificate,
          ),
          badResponse: () => ApiErrorModel(
            message:
                "Server returned an unexpected response. Please try again.",
            icon: Icons.warning,
            statusCode: e.response?.statusCode ?? LocalStatusCodes.badResponse,
          ),
          cancel: () => ApiErrorModel(
            message: "The request was cancelled. Please try again.",
            icon: Icons.cancel,
            statusCode: LocalStatusCodes.cancel,
          ),
          unknown: () => ApiErrorModel(
            message:
                "Something went wrong. Please check your connection and try again.",
            icon: Icons.error_outline,
            statusCode: LocalStatusCodes.unknown,
          ),

          // Handle other DioException types if needed
          // USER NOT FOUND EXAMPLE
        );
      } else {
        return ApiErrorFactory.defaultError;
      }
    }
    return ApiErrorFactory.defaultError;
  }
}
