

class RefreshTokenResponseModel {
  final String status;
  final String token;
  final String refreshToken;

  RefreshTokenResponseModel({
    required this.status,
    required this.token,
    required this.refreshToken,
  });

  factory RefreshTokenResponseModel.fromJson(Map<String, dynamic> json) {
    return RefreshTokenResponseModel(
      status: json['status'] ?? '',
      token: json['token'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'token': token,
      'refreshToken': refreshToken,
      
    };
  }


}
