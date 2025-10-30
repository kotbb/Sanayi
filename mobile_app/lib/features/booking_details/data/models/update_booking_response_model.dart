import 'package:sanayi_app/features/bottom_nav/reservations/data/models/get_my_booking_response_model.dart';

class UpdateBookingResponseModel {
  final String status;
  final BookingData? data;

  UpdateBookingResponseModel({required this.status, required this.data});

  factory UpdateBookingResponseModel.fromJson(Map<String, dynamic> json) {
    return UpdateBookingResponseModel(
      status: json['status'],
      data: json['data'] != null ? BookingData.fromJson(json['data']) : null,
    );
  }
}


class BookingDetails {
  String? sId;
  String? clientId;
  String? craftsmanId;
  String? time;
  String? status;
  String? date;
  String? createdAt;
  String? updatedAt;
  dynamic review;
  String? id;

  BookingDetails(
      {this.sId,
      this.clientId,
      this.craftsmanId,
      this.time,
      this.status,
      this.date,
      this.createdAt,
      this.updatedAt,
      this.review,
      this.id});

  BookingDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    clientId = json['client'];
    craftsmanId = json['craftsman'];;
    time = json['time'];
    status = json['status'];
    date = json['date'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    review = json['review'];
    id = json['id'];
  }
}
