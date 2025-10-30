class RegisterResponseModel {
  final String status;
  final String message;
 
  RegisterResponseModel({
    required this.status,
    required this.message,
  });
 
  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      status: json['status'],
      message: json['message'],
    );
  }
}