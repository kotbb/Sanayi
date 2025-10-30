import 'package:sanayi_app/features/auth/data/models/user_model.dart';

class GetMyProfileResponseModel {
  GetMyProfileResponseModel({required this.status, required this.data});

  final String status;
  final UserModel data;

  factory GetMyProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      GetMyProfileResponseModel(
        status: json["status"],
        data: UserModel.fromJson(json["data"]["user"]),
      );

  Map<String, dynamic> toJson() => {"status": status, "data": data.toJson()};
}
