import 'package:hive_clean/domain/entities/student.dart';

abstract class StudentRepository {
  Future<void> addStudent(Student student);
  Future<List<Student>> getAllStudents();
  Future<void> updateStudent(String id, Student student);
  Future<void> deleteStudent(String id);
}