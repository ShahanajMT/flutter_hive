import 'package:flutter/material.dart';
import 'package:hive_clean/presentation/provider/student_provider.dart';
import 'package:hive_clean/presentation/screens/home/widgets/add_student_widget.dart';
import 'package:hive_clean/presentation/screens/home/widgets/student_list_widget.dart';
import 'package:provider/provider.dart';


class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StudentProvider>(context, listen: false);
    
    // Load students when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      studentProvider.loadStudents();
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Database'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const AddStudentWidget(),
            const SizedBox(height: 16),
            Expanded(child: StudentListWidget()),
          ],
        ),
      ),
    );
  }
}