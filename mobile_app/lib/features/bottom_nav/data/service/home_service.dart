import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sanayi_app/core/networking/api_constants.dart';
import 'package:sanayi_app/features/bottom_nav/data/models/get_all_carftsmen_response_model.dart';
import 'package:sanayi_app/features/bottom_nav/data/models/get_all_categories_response_model.dart';
import 'package:sanayi_app/features/bottom_nav/data/models/get_all_craftsmen_in_categoties_response_model.dart.dart';
import 'package:sanayi_app/features/bottom_nav/data/models/get_carftsman_response_by_id_model.dart';

part 'home_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeService {
  factory HomeService(Dio dio, {String baseUrl}) = _HomeService;

  @GET(ApiConstants.getAllCategories)
  Future<GetAllCategoriesResponseModel> getAllCategories();


  @GET(ApiConstants.getAllCraftsmen)
  Future<GetAllCarftsmenResponseModel> getAllCraftsmen();
  

  @GET("${ApiConstants.getCraftsmen}{id}")
  Future<GetCarftsmanResponseByIdModel> getCraftsmanById(@Path("id") String id);


  @GET("${ApiConstants.getAllCraftsmenInCategories}{categoryId}/craftsmen")
  Future<GetAllCraftsmenInCategoriesResponseModel> getAllCraftsmenInCategory(@Path("categoryId") String id);
}