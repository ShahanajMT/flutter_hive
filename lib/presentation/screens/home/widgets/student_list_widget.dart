import 'package:flutter/material.dart';
import 'package:hive_clean/domain/entities/student.dart';
import 'package:hive_clean/presentation/provider/student_provider.dart';
import 'package:provider/provider.dart';


class StudentListWidget extends StatelessWidget {
  const StudentListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StudentProvider>(context);

    if (studentProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (studentProvider.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Colors.red.shade300),
            const SizedBox(height: 16),
            Text(
              'Error: ${studentProvider.error}',
              style: TextStyle(color: Colors.red.shade700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => studentProvider.loadStudents(),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (studentProvider.students.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people_outline, size: 64, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            const Text(
              'No students found',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Text(
              'Add a student to get started',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: studentProvider.students.length,
      separatorBuilder: (context, index) => const SizedBox(height: 6),
      itemBuilder: (context, index) {
        final student = studentProvider.students[index];
        return _buildStudentItem(context, student, index);
      },
    );
  }

  Widget _buildStudentItem(BuildContext context, Student student, int index) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 400 + (index * 100)),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(30 * (1 - value), 0),
            child: child,
          ),
        );
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.deepPurple.shade100,
            child: Text(
              student.name[0].toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ),
          title: Text(
            student.name,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Text('Age: ${student.age}'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildEditButton(context, student),
              _buildDeleteButton(context, student),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditButton(BuildContext context, Student student) {
    return IconButton(
      icon: const Icon(Icons.edit, color: Colors.blue),
      onPressed: () => _showEditDialog(context, student),
    );
  }

  Widget _buildDeleteButton(BuildContext context, Student student) {
    return IconButton(
      icon: const Icon(Icons.delete, color: Colors.red),
      onPressed: () => _showDeleteConfirmation(context, student),
    );
  }

  void _showEditDialog(BuildContext context, Student student) {
    final nameController = TextEditingController(text: student.name);
    final ageController = TextEditingController(text: student.age.toString());

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Edit Student',
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation1, animation2) => const SizedBox.shrink(),
      transitionBuilder: (context, animation1, animation2, child) {
        return Transform.scale(
          scale: Curves.easeOutBack.transform(animation1.value),
          child: Opacity(
            opacity: animation1.value,
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: const Text('Edit Student'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: ageController,
                    decoration: const InputDecoration(
                      labelText: 'Age',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _updateStudent(context, student, nameController, ageController);
                    Navigator.pop(context);
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _updateStudent(
    BuildContext context,
    Student student,
    TextEditingController nameController,
    TextEditingController ageController,
  ) {
    final updatedStudent = Student(
      id: student.id,
      name: nameController.text.trim(),
      age: int.tryParse(ageController.text.trim()) ?? student.age,
    );

    final provider = Provider.of<StudentProvider>(context, listen: false);
    provider.updateStudent(student.id!, updatedStudent);
  }

  void _showDeleteConfirmation(BuildContext context, Student student) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Delete Student'),
        content: Text('Are you sure you want to delete "${student.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.delete_outline),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              _deleteStudent(context, student);
              Navigator.pop(context);
            },
            label: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _deleteStudent(BuildContext context, Student student) {
    final provider = Provider.of<StudentProvider>(context, listen: false);
    provider.deleteStudent(student.id!);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${student.name} deleted successfully'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}