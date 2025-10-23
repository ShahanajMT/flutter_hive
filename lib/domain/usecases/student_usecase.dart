import 'package:hive_clean/domain/entities/student.dart';
import 'package:hive_clean/domain/repo/student_repo.dart';

class StudentUseCases {
  final StudentRepository repository;

  StudentUseCases(this.repository);

  Future<void> addStudent(Student student) => repository.addStudent(student);
  
  Future<List<Student>> getAllStudents() => repository.getAllStudents();
  
  Future<void> updateStudent(String id, Student student) => repository.updateStudent(id, student);
  
  Future<void> deleteStudent(String id) => repository.deleteStudent(id);
}