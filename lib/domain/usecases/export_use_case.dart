import 'package:hive_clean/domain/entities/student.dart';

class ExportUseCase {
  String exportToCsv(List<Student> students) {
    final csvBuffer = StringBuffer();
    
    // Add header
    csvBuffer.writeln('Name,Age,Email,Phone,Created Date');
    
    // Add data
    for (final student in students) {
      csvBuffer.writeln('"${student.name}",${student.age},"${student.email ?? ''}","${student.phone ?? ''}","${student.formattedCreatedAt}"');
    }
    
    return csvBuffer.toString();
  }

  String exportToJson(List<Student> students) {
    final jsonList = students.map((student) => student.toJson()).toList();
    return jsonList.toString();
  }
}