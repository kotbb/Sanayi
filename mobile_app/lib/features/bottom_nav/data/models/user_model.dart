class UserModel {
  String id;
  String phoneNumber;
  String name;
  String profilePicture;

  UserModel({
    required this.id,
    required this.phoneNumber,
    required this.name,
    required this.profilePicture,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      phoneNumber: json['phoneNumber'],
      name: json['name'],
      profilePicture: json['profilePicture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'phoneNumber': phoneNumber,
      'name': name,
      'profilePicture': profilePicture,
    };
  }
}
