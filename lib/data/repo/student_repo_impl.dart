import 'package:hive_clean/data/datascource/student_locat_data_source.dart';
import 'package:hive_clean/data/models/student_model.dart';
import 'package:hive_clean/domain/entities/student.dart';
import 'package:hive_clean/domain/repo/student_repo.dart';


class StudentRepositoryImpl implements StudentRepository {
  final StudentLocalDataSource localDataSource;

  StudentRepositoryImpl(this.localDataSource);

  @override
  Future<void> addStudent(Student student) async {
    final studentModel = StudentModel(
      id: student.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
      name: student.name,
      age: student.age,
    );
    await localDataSource.addStudent(studentModel);
  }

  @override
  Future<void> deleteStudent(String id) async {
    await localDataSource.deleteStudent(id);
  }

  @override
  Future<List<Student>> getAllStudents() async {
    final students = await localDataSource.getAllStudents();
    return students.map((model) => Student(
      id: model.id,
      name: model.name,
      age: model.age,
    )).toList();
  }

  @override
  Future<void> updateStudent(String id, Student student) async {
    final studentModel = StudentModel(
      id: id,
      name: student.name,
      age: student.age,
    );
    await localDataSource.updateStudent(id, studentModel);
  }
}