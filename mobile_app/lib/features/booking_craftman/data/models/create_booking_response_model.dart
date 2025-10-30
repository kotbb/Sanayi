class CreateBookingResponseModel {
  final String status;
  final BookingModel data;

  CreateBookingResponseModel({required this.status, required this.data});

  factory CreateBookingResponseModel.fromJson(Map<String, dynamic> json) {
    return CreateBookingResponseModel(
      status: json['status'],
      data: BookingModel.fromJson(json['data']['booking']),
    );
  }
}

class BookingModel {
  final String id;
  final String craftmanId;
  final String clientId;
  final String date;
  final String time;
  final String price;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  BookingModel({
    required this.id,
    required this.craftmanId,
    required this.clientId,
    required this.date,
    required this.time,
    required this.price,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['_id'],
      craftmanId: json['craftman'],
      clientId: json['client'],
      date: json['date'],
      time: json['time'],
      price: json['price'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
