import 'package:sanayi_app/features/bottom_nav/data/models/specialization_model.dart';
import 'package:sanayi_app/features/bottom_nav/data/models/user_model.dart';

class GetMyBookingResponseModel {
  String? status;
  int? results;
  BookingData? bookingData;

  GetMyBookingResponseModel({this.status, this.results, this.bookingData});

  GetMyBookingResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results'];
    bookingData = json['data'] != null ? BookingData.fromJson(json['data']) : null;
  }
  
}

class BookingData {
  List<Booking>? bookings;

  BookingData({this.bookings});

  BookingData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      bookings = <Booking>[];
      json['data'].forEach((v) {
        bookings!.add(Booking.fromJson(v));
      });
    }
  }
}


class Booking {
  String? sId;
  Client? client;
  Craftsman? craftsman;
  String? time;
  String? status;
  String? date;
  String? createdAt;
  String? updatedAt;
  dynamic review;
  String? id;

  Booking(
      {this.sId,
      this.client,
      this.craftsman,
      this.time,
      this.status,
      this.date,
      this.createdAt,
      this.updatedAt,
      this.review,
      this.id});

  Booking.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    client = json['client'] != null ? Client.fromJson(json['client']) : null;
    craftsman = json['craftsman'] != null ? Craftsman.fromJson(json['craftsman']) : null;
    time = json['time'];
    status = json['status'];
    date = json['date'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    review = json['review'];
    id = json['id'];
  }
}


class Client {
  String? sId;
  String? phoneNumber;
  String? name;
  String? profilePicture;
  String? id;

  Client({this.sId, this.phoneNumber, this.name, this.profilePicture, this.id});

  Client.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    phoneNumber = json['phoneNumber'];
    name = json['name'];
    profilePicture = json['profilePicture'];
    id = json['id'];
  }
}

class Craftsman {
  String? sId;
  List<SpecializationModel>? specializations;
  UserModel? user;
  String? id;

  Craftsman({this.sId, this.specializations, this.user, this.id});

  Craftsman.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['specializations'] != null) {
      specializations = <SpecializationModel>[];
      json['specializations'].forEach((v) {
        specializations!.add(SpecializationModel.fromJson(v));
      });
      user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    id = json['id'];
  }
  }
}


