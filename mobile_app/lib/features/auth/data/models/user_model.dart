class UserModel {
  final String id;
  final String phoneNumber;
  final String name;
  final String role;
  final String profilePicture;
  final bool isActive;
  final bool isVerified;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.id,
    required this.phoneNumber,
    required this.name,
    required this.role,
    required this.profilePicture,
    required this.isActive,
    required this.isVerified,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      name: json['name'] ?? '',
      role: json['role'] ?? '',
      profilePicture: json['profilePicture'] ?? '',
      isActive: json['isActive'] ?? false,
      isVerified: json['isVerified'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'phoneNumber': phoneNumber,
      'name': name,
      'role': role,
      'profilePicture': profilePicture,
      'isActive': isActive,
      'isVerified': isVerified,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
