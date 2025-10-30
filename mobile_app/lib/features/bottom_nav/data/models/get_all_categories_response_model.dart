import 'package:sanayi_app/features/bottom_nav/data/models/categories_data.dart';

class GetAllCategoriesResponseModel {
  String status;
  int results;
  CategoriesData data;

  GetAllCategoriesResponseModel({
    required this.status,
    required this.results,
    required this.data,
  });

  factory GetAllCategoriesResponseModel.fromJson(Map<String, dynamic> json) {
    return GetAllCategoriesResponseModel(
      status: json['status'],
      results: json['results'],
      data: CategoriesData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'results': results, 'data': data.toJson()};
  }
}





