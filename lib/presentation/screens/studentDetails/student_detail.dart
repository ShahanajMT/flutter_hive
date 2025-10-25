import 'package:flutter/material.dart';
import 'package:hive_clean/domain/entities/student.dart';
import 'package:hive_clean/presentation/provider/student_provider.dart';
import 'package:hive_clean/presentation/utils/validators.dart';
import 'package:provider/provider.dart';


import '../../widgets/custom_dialoge.dart';

class StudentDetailScreen extends StatefulWidget {
  final Student student;

  const StudentDetailScreen({super.key, required this.student});

  @override
  State<StudentDetailScreen> createState() => _StudentDetailScreenState();
}

class _StudentDetailScreenState extends State<StudentDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.student.name);
    _ageController = TextEditingController(text: widget.student.age.toString());
    _emailController = TextEditingController(text: widget.student.email ?? '');
    _phoneController = TextEditingController(text: widget.student.phone ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.student.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveChanges,
            tooltip: 'Save Changes',
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _deleteStudent,
            tooltip: 'Delete Student',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildAvatarSection(),
              const SizedBox(height: 24),
              _buildNameField(),
              const SizedBox(height: 16),
              _buildAgeField(),
              const SizedBox(height: 16),
              _buildEmailField(),
              const SizedBox(height: 16),
              _buildPhoneField(),
              const SizedBox(height: 24),
              _buildInfoSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatarSection() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.deepPurple.shade100,
            child: Text(
              widget.student.name[0].toUpperCase(),
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.deepPurple,
              child: IconButton(
                icon: const Icon(Icons.camera_alt, size: 16, color: Colors.white),
                onPressed: _changePhoto,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      controller: _nameController,
      decoration: const InputDecoration(
        labelText: 'Name',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.person),
      ),
      validator: Validators.validateName,
    );
  }

  Widget _buildAgeField() {
    return TextFormField(
      controller: _ageController,
      decoration: const InputDecoration(
        labelText: 'Age',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.numbers),
      ),
      keyboardType: TextInputType.number,
      validator: Validators.validateAge,
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      decoration: const InputDecoration(
        labelText: 'Email (Optional)',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.email),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: Validators.validateEmail,
    );
  }

  Widget _buildPhoneField() {
    return TextFormField(
      controller: _phoneController,
      decoration: const InputDecoration(
        labelText: 'Phone (Optional)',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.phone),
      ),
      keyboardType: TextInputType.phone,
      validator: Validators.validatePhone,
    );
  }

  Widget _buildInfoSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Student Information',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildInfoRow('Created', widget.student.formattedCreatedAt),
            _buildInfoRow('Last Updated', widget.student.formattedUpdatedAt),
            _buildInfoRow('Student ID', widget.student.id ?? 'N/A'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(value),
        ],
      ),
    );
  }

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      final updatedStudent = widget.student.copyWith(
        name: _nameController.text.trim(),
        age: int.parse(_ageController.text.trim()),
        email: _emailController.text.trim().isEmpty ? null : _emailController.text.trim(),
        phone: _phoneController.text.trim().isEmpty ? null : _phoneController.text.trim(),
      );

      final provider = Provider.of<StudentProvider>(context, listen: false);
      provider.updateStudent(widget.student.id!, updatedStudent);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Student updated successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  void _deleteStudent() {
    showDialog(
      context: context,
      builder: (context) => CustomDialog(
        title: 'Delete Student',
        content: 'Are you sure you want to delete ${widget.student.name}? This action cannot be undone.',
        confirmText: 'Delete',
        onConfirm: () {
          final provider = Provider.of<StudentProvider>(context, listen: false);
          provider.deleteStudent(widget.student.id!);
          Navigator.pop(context); // Close dialog
          Navigator.pop(context); // Go back to home
        },
      ),
    );
  }

  void _changePhoto() {
    // Implement image picking functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Image picker coming soon!')),
    );
  }
}