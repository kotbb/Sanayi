import 'package:sanayi_app/features/bottom_nav/data/models/category_model.dart';

class CategoriesData {
  List<CategoryModel> categories;

  CategoriesData({required this.categories});

  factory CategoriesData.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<CategoryModel> categoriesList = list
        .map((i) => CategoryModel.fromJson(i))
        .toList();
    return CategoriesData(categories: categoriesList);
  }

  Map<String, dynamic> toJson() {
    return {'data': categories.map((category) => category.toJson()).toList()};
  }
}