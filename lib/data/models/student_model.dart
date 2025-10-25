// import 'package:hive/hive.dart';

// part 'student_model.g.dart';

// @HiveType(typeId: 0)
// class StudentModel {
//   @HiveField(0)
//   final String id;
  
//   @HiveField(1)
//   final String name;
  
//   @HiveField(2)
//   final int age;

//   StudentModel({
//     required this.id,
//     required this.name,
//     required this.age,
//   });

//   @override
//   String toString() {
//     return 'StudentModel(id: $id, name: $name, age: $age)';
//   }
// }

// import 'package:hive/hive.dart';

// part 'student_model.g.dart';

// @HiveType(typeId: 0)
// class StudentModel {
//   @HiveField(0)
//   final String id;
  
//   @HiveField(1)
//   final String name;
  
//   @HiveField(2)
//   final int age;

//   @HiveField(3)
//   final String? email;

//   @HiveField(4)
//   final String? phone;

//   @HiveField(5)
//   final String? imagePath;

//   @HiveField(6)
//   final int createdAt;

//   @HiveField(7)
//   final int updatedAt;

//   StudentModel({
//     required this.id,
//     required this.name,
//     required this.age,
//     this.email,
//     this.phone,
//     this.imagePath,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   @override
//   String toString() {
//     return 'StudentModel(id: $id, name: $name, age: $age)';
//   }
// }

import 'package:hive/hive.dart';

part 'student_model.g.dart';

@HiveType(typeId: 0)
class StudentModel {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String name;
  
  @HiveField(2)
  final int age;

  @HiveField(3)
  final String? email;

  @HiveField(4)
  final String? phone;

  @HiveField(5)
  final String? imagePath;

  @HiveField(6)
  final int? createdAt; // Change to nullable

  @HiveField(7)
  final int? updatedAt; // Change to nullable

  StudentModel({
    required this.id,
    required this.name,
    required this.age,
    this.email,
    this.phone,
    this.imagePath,
    this.createdAt, // Make optional
    this.updatedAt, // Make optional
  });

  @override
  String toString() {
    return 'StudentModel(id: $id, name: $name, age: $age)';
  }
}