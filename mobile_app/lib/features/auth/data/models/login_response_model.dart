import 'user_model.dart';

class LoginResponseModel {
  final String status;
  final String token;
  final String refreshToken;
  final UserModel user;


  LoginResponseModel({
    required this.status,
    required this.token,
    required this.refreshToken,
    required this.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      status: json['status'] ?? '',
      token: json['token'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
      user: UserModel.fromJson(json['data']['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'token': token,
      'data': {
        'user': user.toJson(),
      },
    };
  }
}
