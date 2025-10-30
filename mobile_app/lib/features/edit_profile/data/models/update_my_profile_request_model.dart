import 'dart:io';

class UpdateMyProfileRequestModel {
  String? name;
  String? phoneNumber;
  File? profilePicture;
  

  UpdateMyProfileRequestModel({
    this.name,
    this.phoneNumber,
    this.profilePicture,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) data['name'] = name;
    if (phoneNumber != null) data['phoneNumber'] = phoneNumber;
    if (profilePicture != null) data['profilePicture'] = profilePicture;

    return data;
  }
}