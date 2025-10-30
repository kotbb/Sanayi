import 'package:sanayi_app/features/bottom_nav/data/models/carftsman_model.dart';
class GetCarftsmanResponseByIdModel {
  String status;
  CarftsmanModel craftsman;

  GetCarftsmanResponseByIdModel({
    required this.status,
    required this.craftsman,
  });

  factory GetCarftsmanResponseByIdModel.fromJson(Map<String, dynamic> json) {
    return GetCarftsmanResponseByIdModel(
      status: json['status'],
      craftsman: CarftsmanModel.fromJson(json['data']['craftsman']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'data': {'craftsman': craftsman.toJson()}};
  }
}