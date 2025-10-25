import 'dart:io';
import 'package:hive_clean/domain/entities/student.dart';
import 'package:hive_clean/domain/usecases/export_use_case.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';


class FileExporter {
  final ExportUseCase exportUseCase = ExportUseCase();

  Future<void> exportStudentsToCsv(List<Student> students, BuildContext context) async {
    if (students.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No students to export')),
      );
      return;
    }

    try {
      final csvContent = exportUseCase.exportToCsv(students);
      final directory = await getTemporaryDirectory();
      final file = File('${directory.path}/students_${DateTime.now().millisecondsSinceEpoch}.csv');
      await file.writeAsString(csvContent);

      await Share.shareXFiles([XFile(file.path)], text: 'Exported Students');
    } catch (e) {
      rethrow;
    }
  }

  Future<void> exportStudentsToJson(List<Student> students, BuildContext context) async {
    if (students.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No students to export')),
      );
      return;
    }

    try {
      final jsonContent = exportUseCase.exportToJson(students);
      final directory = await getTemporaryDirectory();
      final file = File('${directory.path}/students_${DateTime.now().millisecondsSinceEpoch}.json');
      await file.writeAsString(jsonContent);

      await Share.shareXFiles([XFile(file.path)], text: 'Exported Students (JSON)');
    } catch (e) {
      rethrow;
    }
  }
}