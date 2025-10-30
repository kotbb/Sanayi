import 'package:sanayi_app/features/bottom_nav/data/models/carftsman_model.dart';

class CraftsmenDataModel {
  
  List<CarftsmanModel> craftsmen;

  CraftsmenDataModel({required this.craftsmen});

  factory CraftsmenDataModel.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<CarftsmanModel> craftsmenList =
        list.map((i) => CarftsmanModel.fromJson(i)).toList();
    return CraftsmenDataModel(craftsmen: craftsmenList);
  }

  Map<String, dynamic> toJson() {
    return {'data': craftsmen.map((craftsman) => craftsman.toJson()).toList()};
  }
}