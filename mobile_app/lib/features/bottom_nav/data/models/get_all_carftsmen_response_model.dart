
import 'package:sanayi_app/features/bottom_nav/data/models/carftsmen_data_model.dart';

class GetAllCarftsmenResponseModel {
  String status;
  int results;
  CraftsmenDataModel craftsmenData;

  GetAllCarftsmenResponseModel({
    required this.status,
    required this.results,
    required this.craftsmenData,
  });

  factory GetAllCarftsmenResponseModel.fromJson(Map<String, dynamic> json) {
    return GetAllCarftsmenResponseModel(
      status: json['status'],
      results: json['results'],
      craftsmenData: CraftsmenDataModel.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'results': results,
      'data': craftsmenData.toJson(),
    };
  }
}


 