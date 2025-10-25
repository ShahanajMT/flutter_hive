// // import 'package:flutter/material.dart';
// // import 'package:hive_clean/domain/entities/student.dart';
// // import 'package:hive_clean/presentation/provider/student_provider.dart';
// // import 'package:provider/provider.dart';

// // class AddStudentWidget extends StatefulWidget {
// //   const AddStudentWidget({super.key});

// //   @override
// //   State<AddStudentWidget> createState() => _AddStudentWidgetState();
// // }

// // class _AddStudentWidgetState extends State<AddStudentWidget>
// //     with SingleTickerProviderStateMixin {
// //   final _nameController = TextEditingController();
// //   final _ageController = TextEditingController();

// //   late AnimationController _controller;
// //   late Animation<Offset> _slideAnimation;
// //   late Animation<double> _fadeAnimation;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _initializeAnimations();
// //   }

// //   void _initializeAnimations() {
// //     _controller = AnimationController(
// //       duration: const Duration(milliseconds: 600),
// //       vsync: this,
// //     );

// //     _slideAnimation = Tween<Offset>(
// //       begin: const Offset(0, 0.2),
// //       end: Offset.zero,
// //     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

// //     _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
// //       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
// //     );

// //     _controller.forward();
// //   }

// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     _nameController.dispose();
// //     _ageController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return SlideTransition(
// //       position: _slideAnimation,
// //       child: FadeTransition(
// //         opacity: _fadeAnimation,
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               const Text(
// //                 'Add New Student',
// //                 style: TextStyle(
// //                   fontSize: 22,
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.deepPurple,
// //                 ),
// //               ),
// //               const SizedBox(height: 16),
// //               _buildNameField(),
// //               const SizedBox(height: 10),
// //               _buildAgeField(),
// //               const SizedBox(height: 16),
// //               _buildAddButton(context),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildNameField() {
// //     return TextField(
// //       controller: _nameController,
// //       decoration: const InputDecoration(
// //         labelText: 'Name',
// //         border: OutlineInputBorder(),
// //         prefixIcon: Icon(Icons.person),
// //       ),
// //     );
// //   }

// //   Widget _buildAgeField() {
// //     return TextField(
// //       controller: _ageController,
// //       decoration: const InputDecoration(
// //         labelText: 'Age',
// //         border: OutlineInputBorder(),
// //         prefixIcon: Icon(Icons.numbers),
// //       ),
// //       keyboardType: TextInputType.number,
// //     );
// //   }

// //   Widget _buildAddButton(BuildContext context) {
// //     return AnimatedScale(
// //       scale: 1,
// //       duration: const Duration(milliseconds: 200),
// //       child: ElevatedButton.icon(
// //         onPressed: () => _onAddStudentClicked(context),
// //         style: ElevatedButton.styleFrom(
// //           backgroundColor: Colors.deepPurple,
// //           foregroundColor: Colors.white,
// //           minimumSize: const Size(double.infinity, 50),
// //           shape: RoundedRectangleBorder(
// //             borderRadius: BorderRadius.circular(10),
// //           ),
// //         ),
// //         icon: const Icon(Icons.add),
// //         label: const Text(
// //           'Add Student',
// //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
// //         ),
// //       ),
// //     );
// //   }

// //   Future<void> _onAddStudentClicked(BuildContext context) async {
// //     final name = _nameController.text.trim();
// //     final ageText = _ageController.text.trim();

// //     if (!_validateInputs(context, name, ageText)) return;

// //     final student = Student(name: name, age: int.parse(ageText));
// //     await _addStudentToProvider(context, student);
// //   }

// //   bool _validateInputs(BuildContext context, String name, String ageText) {
// //     if (name.isEmpty || ageText.isEmpty) {
// //       _showSnackbar(context, 'Please enter both name and age.', Colors.orange);
// //       return false;
// //     }

// //     final age = int.tryParse(ageText);
// //     if (age == null || age <= 0) {
// //       _showSnackbar(context, 'Please enter a valid age.', Colors.redAccent);
// //       return false;
// //     }

// //     return true;
// //   }

// //   Future<void> _addStudentToProvider(BuildContext context, Student student) async {
// //     final provider = Provider.of<StudentProvider>(context, listen: false);
// //     try {
// //       await provider.addStudent(student);
// //       _nameController.clear();
// //       _ageController.clear();
// //       _showSnackbar(context, 'Student added successfully!', Colors.green);
// //     } catch (e) {
// //       _showSnackbar(context, 'Failed to add student: $e', Colors.red);
// //     }
// //   }

// //   void _showSnackbar(BuildContext context, String message, Color color) {
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(
// //         content: Text(message, style: const TextStyle(color: Colors.white)),
// //         backgroundColor: color,
// //         behavior: SnackBarBehavior.floating,
// //         duration: const Duration(seconds: 2),
// //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// //       ),
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';
// import 'package:hive_clean/domain/entities/student.dart';
// import 'package:hive_clean/presentation/provider/student_provider.dart';
// import 'package:provider/provider.dart';

// class AddStudentWidget extends StatefulWidget {
//   const AddStudentWidget({super.key});

//   @override
//   State<AddStudentWidget> createState() => _AddStudentWidgetState();
// }

// class _AddStudentWidgetState extends State<AddStudentWidget>
//     with SingleTickerProviderStateMixin {
//   final _nameController = TextEditingController();
//   final _ageController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _phoneController = TextEditingController();

//   late AnimationController _controller;
//   late Animation<Offset> _slideAnimation;
//   late Animation<double> _fadeAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _initializeAnimations();
//   }

//   void _initializeAnimations() {
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 600),
//       vsync: this,
//     );

//     _slideAnimation = Tween<Offset>(
//       begin: const Offset(0, 0.2),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

//     _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );

//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _nameController.dispose();
//     _ageController.dispose();
//     _emailController.dispose();
//     _phoneController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SlideTransition(
//       position: _slideAnimation,
//       child: FadeTransition(
//         opacity: _fadeAnimation,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Add New Student',
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.deepPurple,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               _buildNameField(),
//               const SizedBox(height: 10),
//               _buildAgeField(),
//               const SizedBox(height: 10),
//               _buildEmailField(),
//               const SizedBox(height: 10),
//               _buildPhoneField(),
//               const SizedBox(height: 16),
//               _buildAddButton(context),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildNameField() {
//     return TextField(
//       controller: _nameController,
//       decoration: const InputDecoration(
//         labelText: 'Name',
//         border: OutlineInputBorder(),
//         prefixIcon: Icon(Icons.person),
//       ),
//     );
//   }

//   Widget _buildAgeField() {
//     return TextField(
//       controller: _ageController,
//       decoration: const InputDecoration(
//         labelText: 'Age',
//         border: OutlineInputBorder(),
//         prefixIcon: Icon(Icons.numbers),
//       ),
//       keyboardType: TextInputType.number,
//     );
//   }

//   Widget _buildEmailField() {
//     return TextField(
//       controller: _emailController,
//       decoration: const InputDecoration(
//         labelText: 'Email (Optional)',
//         border: OutlineInputBorder(),
//         prefixIcon: Icon(Icons.email),
//       ),
//       keyboardType: TextInputType.emailAddress,
//     );
//   }

//   Widget _buildPhoneField() {
//     return TextField(
//       controller: _phoneController,
//       decoration: const InputDecoration(
//         labelText: 'Phone (Optional)',
//         border: OutlineInputBorder(),
//         prefixIcon: Icon(Icons.phone),
//       ),
//       keyboardType: TextInputType.phone,
//     );
//   }

//   Widget _buildAddButton(BuildContext context) {
//     return AnimatedScale(
//       scale: 1,
//       duration: const Duration(milliseconds: 200),
//       child: ElevatedButton.icon(
//         onPressed: () => _onAddStudentClicked(context),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.deepPurple,
//           foregroundColor: Colors.white,
//           minimumSize: const Size(double.infinity, 50),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         icon: const Icon(Icons.add),
//         label: const Text(
//           'Add Student',
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//         ),
//       ),
//     );
//   }

//   Future<void> _onAddStudentClicked(BuildContext context) async {
//     final name = _nameController.text.trim();
//     final ageText = _ageController.text.trim();
//     final email = _emailController.text.trim();
//     final phone = _phoneController.text.trim();

//     if (!_validateInputs(context, name, ageText)) return;

//     final student = Student(
//       name: name,
//       age: int.parse(ageText),
//       email: email.isEmpty ? null : email,
//       phone: phone.isEmpty ? null : phone,
//     );

//     await _addStudentToProvider(context, student);
//   }

//   bool _validateInputs(BuildContext context, String name, String ageText) {
//     if (name.isEmpty || ageText.isEmpty) {
//       _showSnackbar(context, 'Please enter both name and age.', Colors.orange);
//       return false;
//     }

//     final age = int.tryParse(ageText);
//     if (age == null || age <= 0) {
//       _showSnackbar(context, 'Please enter a valid age.', Colors.redAccent);
//       return false;
//     }

//     return true;
//   }

//   Future<void> _addStudentToProvider(BuildContext context, Student student) async {
//     final provider = Provider.of<StudentProvider>(context, listen: false);
//     try {
//       await provider.addStudent(student);
//       _nameController.clear();
//       _ageController.clear();
//       _emailController.clear();
//       _phoneController.clear();
//       _showSnackbar(context, 'Student added successfully!', Colors.green);
//     } catch (e) {
//       _showSnackbar(context, 'Failed to add student: $e', Colors.red);
//     }
//   }

//   void _showSnackbar(BuildContext context, String message, Color color) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message, style: const TextStyle(color: Colors.white)),
//         backgroundColor: color,
//         behavior: SnackBarBehavior.floating,
//         duration: const Duration(seconds: 2),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:hive_clean/domain/entities/student.dart';
import 'package:hive_clean/presentation/provider/student_provider.dart';
import 'package:hive_clean/presentation/widgets/form_feild.dart';
import 'package:hive_clean/presentation/widgets/loading_button.dart';
import 'package:provider/provider.dart';


class AddStudentForm extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  AddStudentForm({super.key});

  Future<void> _addStudent(BuildContext context) async {
    final name = nameController.text.trim();
    final ageText = ageController.text.trim();
    final email = emailController.text.trim();
    final phone = phoneController.text.trim();

    if (!_validateInputs(context, name, ageText)) return;

    final student = Student(
      name: name,
      age: int.parse(ageText),
      email: email.isEmpty ? null : email,
      phone: phone.isEmpty ? null : phone,
    );

    await _addStudentToProvider(context, student);
  }

  bool _validateInputs(BuildContext context, String name, String ageText) {
    if (name.isEmpty || ageText.isEmpty) {
      _showSnackbar(context, 'Please enter both name and age.', Colors.orange);
      return false;
    }

    final age = int.tryParse(ageText);
    if (age == null || age <= 0) {
      _showSnackbar(context, 'Please enter a valid age.', Colors.redAccent);
      return false;
    }

    return true;
  }

  Future<void> _addStudentToProvider(BuildContext context, Student student) async {
    final provider = Provider.of<StudentProvider>(context, listen: false);
    try {
      await provider.addStudent(student);
      _clearForm();
      _showSnackbar(context, 'Student added successfully!', Colors.green);
      FocusScope.of(context).unfocus();
    } catch (e) {
      _showSnackbar(context, 'Failed to add student: $e', Colors.red);
    }
  }

  void _clearForm() {
    nameController.clear();
    ageController.clear();
    emailController.clear();
    phoneController.clear();
  }

  void _showSnackbar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StudentProvider>(context);

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Add New Student',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepPurple),
          ),
          const SizedBox(height: 16),
          CustomFormField(controller: nameController, label: 'Name', icon: Icons.person),
          const SizedBox(height: 10),
          CustomFormField(
            controller: ageController,
            label: 'Age',
            icon: Icons.numbers,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 10),
          CustomFormField(
            controller: emailController,
            label: 'Email (Optional)',
            icon: Icons.email,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 10),
          CustomFormField(
            controller: phoneController,
            label: 'Phone (Optional)',
            icon: Icons.phone,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16),
          LoadingButton(
            onPressed: () => _addStudent(context),
            isLoading: studentProvider.isLoading,
            text: 'Add Student',
          ),
        ],
      ),
    );
  }
}