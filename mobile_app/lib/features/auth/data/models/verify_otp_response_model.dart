class VerifyOtpResponseModel {
  final String status;
  final String message;
  final String registerationToken;

  VerifyOtpResponseModel({
    required this.status,
    required this.message,
    required this.registerationToken,
  });

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) {
    return VerifyOtpResponseModel(
      status: json['status'] ,
      message: json['message'],
      registerationToken: json['registerationToken'] ,
    );
  }
}
