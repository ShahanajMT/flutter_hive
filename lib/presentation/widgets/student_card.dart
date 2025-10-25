import 'package:flutter/material.dart';
import 'package:hive_clean/domain/entities/student.dart';
import 'package:hive_clean/presentation/provider/student_provider.dart';
import 'package:hive_clean/presentation/screens/studentDetails/student_detail.dart';
import 'package:hive_clean/presentation/widgets/custom_dialoge.dart';
import 'package:provider/provider.dart';


class StudentCard extends StatelessWidget {
  final Student student;
  final int index;

  const StudentCard({
    super.key,
    required this.student,
    required this.index,
  });

  void _showEditDialog(BuildContext context) {
    final nameController = TextEditingController(text: student.name);
    final ageController = TextEditingController(text: student.age.toString());
    final emailController = TextEditingController(text: student.email ?? '');
    final phoneController = TextEditingController(text: student.phone ?? '');

    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Edit Student', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Name')),
              const SizedBox(height: 12),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      _updateStudent(context, nameController, ageController, emailController, phoneController);
                      Navigator.pop(context);
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateStudent(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController ageController,
    TextEditingController emailController,
    TextEditingController phoneController,
  ) {
    final updatedStudent = student.copyWith(
      name: nameController.text.trim(),
      age: int.tryParse(ageController.text.trim()) ?? student.age,
      email: emailController.text.trim().isEmpty ? null : emailController.text.trim(),
      phone: phoneController.text.trim().isEmpty ? null : phoneController.text.trim(),
    );

    final provider = Provider.of<StudentProvider>(context, listen: false);
    provider.updateStudent(student.id!, updatedStudent);
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CustomDialog(
        title: 'Delete Student',
        content: 'Are you sure you want to delete "${student.name}"?',
        confirmText: 'Delete',
        onConfirm: () => _deleteStudent(context),
      ),
    );
  }

  void _deleteStudent(BuildContext context) {
    final provider = Provider.of<StudentProvider>(context, listen: false);
    provider.deleteStudent(student.id!);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${student.name} deleted successfully'),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: CircleAvatar(
            backgroundColor: Colors.deepPurple.shade100,
            child: Text(
              student.name[0].toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
          ),
          title: Text(student.name, style: const TextStyle(fontWeight: FontWeight.w600)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Age: ${student.age}'),
              if (student.email != null) Text('Email: ${student.email}', overflow: TextOverflow.ellipsis),
              Text('Added: ${student.formattedCreatedAt}'),
            ],
          ),
          trailing: SizedBox(
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.visibility, color: Colors.green, size: 20),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StudentDetailScreen(student: student)),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue, size: 20),
                  onPressed: () => _showEditDialog(context),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                  onPressed: () => _showDeleteConfirmation(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}