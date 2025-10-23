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

  StudentModel({
    required this.id,
    required this.name,
    required this.age,
  });

  @override
  String toString() {
    return 'StudentModel(id: $id, name: $name, age: $age)';
  }
}