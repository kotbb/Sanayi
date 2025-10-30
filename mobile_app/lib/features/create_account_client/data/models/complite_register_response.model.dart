import 'package:sanayi_app/features/auth/data/models/user_model.dart';

class CompleteRegisterResponse {
  final String status;
  final String token;
  final String refreshToken;
  final UserModel user;

  CompleteRegisterResponse({
    required this.status,
    required this.token,
    required this.refreshToken,
    required this.user,
  });

  factory CompleteRegisterResponse.fromJson(Map<String, dynamic> json) {
    return CompleteRegisterResponse(
      status: json['status'],
      token: json['token'],
      refreshToken: json['refreshToken'],
      user: UserModel.fromJson(json['data']['user']),
    );
  }
}
