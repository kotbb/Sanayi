import 'package:sanayi_app/core/networking/api_error_handler.dart';
import 'package:sanayi_app/core/networking/api_result.dart';
import 'package:sanayi_app/features/bottom_nav/data/models/carftsmen_data_model.dart';
import 'package:sanayi_app/features/bottom_nav/data/models/get_all_categories_response_model.dart';
import 'package:sanayi_app/features/bottom_nav/data/models/get_all_craftsmen_in_categoties_response_model.dart.dart';
import 'package:sanayi_app/features/bottom_nav/data/models/get_carftsman_response_by_id_model.dart';
import 'package:sanayi_app/features/bottom_nav/data/service/home_service.dart';

class HomeRepo {
  final HomeService _homeService;
  const HomeRepo(this._homeService);

  Future<ApiResult<GetAllCategoriesResponseModel>> getAllCategories() async {
    try {
      final response = await _homeService.getAllCategories();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<CraftsmenDataModel>> getAllCraftsmen() async {
    try {
      final response = await _homeService.getAllCraftsmen();
      return ApiResult.success(response.craftsmenData);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<GetCarftsmanResponseByIdModel>> getCraftsmenByCategoryId(
    String categoryId,
  ) async {
    try {
      final response = await _homeService.getCraftsmanById(categoryId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }


  Future<ApiResult<Data>> getAllCraftsmenInCategory(String categoryId) async {
    try {
      final response = await _homeService.getAllCraftsmenInCategory(categoryId);
      return ApiResult.success(response.data);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
