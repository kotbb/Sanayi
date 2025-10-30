import 'package:sanayi_app/features/bottom_nav/data/models/portfolio_item_model.dart';
import 'package:sanayi_app/features/bottom_nav/data/models/specialization_model.dart';
import 'package:sanayi_app/features/bottom_nav/data/models/user_model.dart';
/**
 *  {
                "ratingsAverage": 0,
                "ratingsQuantity": 0,
                "_id": "68b46bb15073230624a4b96e",
                "specializations": [
                    {
                        "_id": "68b2fbe5a78a3e45af0b388e",
                        "name": "Painter",
                        "id": "68b2fbe5a78a3e45af0b388e"
                    }
                ],
                "user": {
                    "_id": "68b46bb15073230624a4b96b",
                    "phoneNumber": "01111111114",
                    "name": "Seif",
                    "profilePicture": "default.jpg",
                    "id": "68b46bb15073230624a4b96b"
                },
                "workSchedule": [],
                "portfolio": [],
                "hourlyRate": 50,
                "createdAt": "2025-08-31T15:35:13.858Z",
                "updatedAt": "2025-08-31T15:35:13.858Z",
                "id": "68b46bb15073230624a4b96e"
            },
 */
// class CarftsmanModel{
//   String id;
//   List<SpecializationModel> specializations;
//   UserModel user;
//   int hourlyRate;
//   double ratingsAverage;
//   int ratingsQuantity;
//   List<dynamic> workSchedule;
//   List<PortfolioItemModel> portfolio;
//   DateTime createdAt;
//   DateTime updatedAt;

//   CarftsmanModel({
//     required this.id,
//     required this.specializations,
//     required this.user,
//     required this.hourlyRate,
//     required this.ratingsAverage,
//     required this.ratingsQuantity,
//     required this.workSchedule,
//     required this.portfolio,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory CarftsmanModel.fromJson(Map<String, dynamic> json) {
//     var specList = json['specializations'] as List;
//     List<SpecializationModel> specializationsList =
//         specList.map((i) => SpecializationModel.fromJson(i)).toList();

//     var portfolioList = json['portfolio'] as List;
//     List<PortfolioItemModel> portfolioItemsList =
//         portfolioList.map((i) => PortfolioItemModel.fromJson(i)).toList();

//     return CarftsmanModel(
//       id: json['_id'],
//       specializations: specializationsList,
//       user: UserModel.fromJson(json['user']),
//       hourlyRate: json['hourlyRate'],
//       ratingsAverage: (json['ratingsAverage'] as num).toDouble(),
//       ratingsQuantity: json['ratingsQuantity'],
//       workSchedule: json['workSchedule'] ?? [],
//       portfolio: portfolioItemsList,
//       createdAt: DateTime.parse(json['createdAt']),
//       updatedAt: DateTime.parse(json['updatedAt']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'specializations':
//           specializations.map((spec) => spec.toJson()).toList(),
//       'user': user.toJson(),
//       'hourlyRate': hourlyRate,
//       'ratingsAverage': ratingsAverage,
//       'ratingsQuantity': ratingsQuantity,
//       'workSchedule': workSchedule,
//       'portfolio': portfolio.map((item) => item.toJson()).toList(),
//       'createdAt': createdAt.toIso8601String(),
//       'updatedAt': updatedAt.toIso8601String(),
//     };
//   }
//  }

class CarftsmanModel {
  final String id;
  final List<SpecializationModel> specializations;
  final UserModel user;
  final int hourlyRate;
  final double ratingsAverage;
  final int ratingsQuantity;
  final List<dynamic> workSchedule;
  final List<PortfolioItemModel> portfolio;
  final DateTime createdAt;
  final DateTime updatedAt;

  CarftsmanModel({
    required this.id,
    required this.specializations,
    required this.user,
    required this.hourlyRate,
    required this.ratingsAverage,
    required this.ratingsQuantity,
    required this.workSchedule,
    required this.portfolio,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CarftsmanModel.fromJson(Map<String, dynamic> json) {
    var specList = json['specializations'] as List;
    List<SpecializationModel> specializationsList = specList
        .map((i) => SpecializationModel.fromJson(i))
        .toList();

    var portfolioList = json['portfolio'] as List;
    List<PortfolioItemModel> portfolioItemsList = portfolioList
        .map((i) => PortfolioItemModel.fromJson(i))
        .toList();

    return CarftsmanModel(
      id: json['_id'],
      specializations: specializationsList,
      user: UserModel.fromJson(json['user']),
      hourlyRate: json['hourlyRate'],
      ratingsAverage: (json['ratingsAverage'] as num).toDouble(),
      ratingsQuantity: json['ratingsQuantity'],
      workSchedule: json['workSchedule'] ?? [],
      portfolio: portfolioItemsList,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'specializations': specializations.map((spec) => spec.toJson()).toList(),
      'user': user.toJson(),
      'hourlyRate': hourlyRate,
      'ratingsAverage': ratingsAverage,
      'ratingsQuantity': ratingsQuantity,
      'workSchedule': workSchedule,
      'portfolio': portfolio.map((item) => item.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
  
}
