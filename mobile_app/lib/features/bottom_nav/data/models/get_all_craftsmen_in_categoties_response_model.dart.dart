import 'package:sanayi_app/features/bottom_nav/data/models/carftsman_model.dart';

class GetAllCraftsmenInCategoriesResponseModel {
  String status;
  int results;
  Data data;

  GetAllCraftsmenInCategoriesResponseModel({
    required this.status,
    required this.results,
    required this.data,
  });

  factory GetAllCraftsmenInCategoriesResponseModel.fromJson(Map<String, dynamic> json) {
    return GetAllCraftsmenInCategoriesResponseModel(
      status: json['status'],
      results: json['results'],
      data: Data.fromJson(json['data']),
    );
  }
}
class Data {
  List<CarftsmanModel> craftsmen;

  Data({required this.craftsmen});

  factory Data.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<CarftsmanModel> craftsmenList =
        list.map((i) => CarftsmanModel.fromJson(i)).toList();
    return Data(craftsmen: craftsmenList);
  }
}


