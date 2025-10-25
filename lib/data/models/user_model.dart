// import 'package:hive/hive.dart';

// part 'user_model.g.dart';

// @HiveType(typeId: 1)
// class UserModel {
//   @HiveField(0)
//   final String id;
  
//   @HiveField(1)
//   final String email;
  
//   @HiveField(2)
//   final String name;
  
//   @HiveField(3)
//   final int createdAt;
  
//   @HiveField(4)
//   final int? lastLogin;

//   UserModel({
//     required this.id,
//     required this.email,
//     required this.name,
//     required this.createdAt,
//     this.lastLogin,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'email': email,
//       'name': name,
//       'createdAt': createdAt,
//       'lastLogin': lastLogin,
//     };
//   }

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       id: json['id'],
//       email: json['email'],
//       name: json['name'],
//       createdAt: json['createdAt'],
//       lastLogin: json['lastLogin'],
//     );
//   }
// }

import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String email;
  
  @HiveField(2)
  final String name;
  
  @HiveField(3)
  final int? createdAt; // Change to nullable
  
  @HiveField(4)
  final int? lastLogin; // Already nullable

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.createdAt, // Make optional
    this.lastLogin,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'createdAt': createdAt,
      'lastLogin': lastLogin,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      createdAt: json['createdAt'],
      lastLogin: json['lastLogin'],
    );
  }
}