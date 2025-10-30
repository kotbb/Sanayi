
import 'package:sanayi_app/core/networking/api_error_model.dart';

class ApiResult<T> {
  final T? data;
  final ApiErrorModel? errorModel;

  ApiResult._({this.data, this.errorModel});

  factory ApiResult.success(T data){
    return ApiResult._(data: data);
  }

  factory ApiResult.failure(ApiErrorModel apiErrorModel){
    return ApiResult._(errorModel: apiErrorModel);
  }

  bool get isSuccess => data != null;

  bool get isFailure => errorModel != null;
}