import 'package:hive/hive.dart';
import 'package:hive_clean/data/models/student_model.dart';

// class StudentLocalDataSource {
//   static const String _boxName = 'student_db';
  
//   Future<Box<StudentModel>> get _box async => await Hive.openBox<StudentModel>(_boxName);

//   Future<void> addStudent(StudentModel student) async {
//     final box = await _box;
//     await box.put(student.id, student);
//   }

//   Future<List<StudentModel>> getAllStudents() async {
//     final box = await _box;
//     return box.values.toList();
//   }

//   Future<void> updateStudent(String id, StudentModel student) async {
//     final box = await _box;
//     await box.put(id, student);
//   }

//   Future<void> deleteStudent(String id) async {
//     final box = await _box;
//     await box.delete(id);
//   }

//   Future<void> close() async {
//     final box = await _box;
//     await box.close();
//   }
// }

class StudentLocalDataSource {
  static const String _boxName = 'student_db';
  
  Future<Box<StudentModel>> get _box async => await Hive.openBox<StudentModel>(_boxName);

  Future<void> addStudent(StudentModel student) async {
    final box = await _box;
    await box.put(student.id, student);
  }

  Future<List<StudentModel>> getAllStudents() async {
    final box = await _box;
    return box.values.toList();
  }

  Future<void> updateStudent(String id, StudentModel student) async {
    final box = await _box;
    await box.put(id, student);
  }

  Future<void> deleteStudent(String id) async {
    final box = await _box;
    await box.delete(id);
  }

  Future<void> close() async {
    final box = await _box;
    await box.close();
  }
}