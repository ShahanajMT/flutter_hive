// // import 'package:flutter/material.dart';
// // import 'package:hive_clean/domain/entities/student.dart';
// // import 'package:hive_clean/domain/usecases/student_usecase.dart';


// // class StudentProvider with ChangeNotifier {
// //   final StudentUseCases studentUseCases;
  
// //   StudentProvider(this.studentUseCases);

// //   List<Student> _students = [];
// //   List<Student> get students => _students;

// //   bool _isLoading = false;
// //   bool get isLoading => _isLoading;

// //   String? _error;
// //   String? get error => _error;

// //   Future<void> loadStudents() async {
// //     _isLoading = true;
// //     notifyListeners();

// //     try {
// //       _students = await studentUseCases.getAllStudents();
// //       _error = null;
// //     } catch (e) {
// //       _error = 'Failed to load students: $e';
// //     } finally {
// //       _isLoading = false;
// //       notifyListeners();
// //     }
// //   }

// //   Future<void> addStudent(Student student) async {
// //     try {
// //       await studentUseCases.addStudent(student);
// //       await loadStudents(); // Reload to get updated list
// //       _error = null;
// //     } catch (e) {
// //       _error = 'Failed to add student: $e';
// //       notifyListeners();
// //       rethrow;
// //     }
// //   }

// //   Future<void> updateStudent(String id, Student student) async {
// //     try {
// //       await studentUseCases.updateStudent(id, student);
// //       await loadStudents();
// //       _error = null;
// //     } catch (e) {
// //       _error = 'Failed to update student: $e';
// //       notifyListeners();
// //       rethrow;
// //     }
// //   }

// //   Future<void> deleteStudent(String id) async {
// //     try {
// //       await studentUseCases.deleteStudent(id);
// //       await loadStudents();
// //       _error = null;
// //     } catch (e) {
// //       _error = 'Failed to delete student: $e';
// //       notifyListeners();
// //       rethrow;
// //     }
// //   }

// //   void clearError() {
// //     _error = null;
// //     notifyListeners();
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:hive_clean/domain/entities/student.dart';
// // import 'package:hive_clean/domain/usecases/student_usecase.dart';


// // class StudentProvider with ChangeNotifier {
// //   final StudentUseCases studentUseCases;
  
// //   StudentProvider(this.studentUseCases);

// //   List<Student> _students = [];
// //   List<Student> get students => _students;

// //   bool _isLoading = false;
// //   bool get isLoading => _isLoading;

// //   String? _error;
// //   String? get error => _error;

// //   Future<void> loadStudents() async {
// //     _isLoading = true;
// //     notifyListeners();

// //     try {
// //       _students = await studentUseCases.getAllStudents();
// //       _error = null;
// //     } catch (e) {
// //       _error = 'Failed to load students: $e';
// //     } finally {
// //       _isLoading = false;
// //       notifyListeners();
// //     }
// //   }

// //   Future<void> addStudent(Student student) async {
// //     try {
// //       await studentUseCases.addStudent(student);
// //       await loadStudents(); // Reload to get updated list
// //       _error = null;
// //     } catch (e) {
// //       _error = 'Failed to add student: $e';
// //       notifyListeners();
// //       rethrow;
// //     }
// //   }

// //   Future<void> updateStudent(String id, Student student) async {
// //     try {
// //       await studentUseCases.updateStudent(id, student);
// //       await loadStudents();
// //       _error = null;
// //     } catch (e) {
// //       _error = 'Failed to update student: $e';
// //       notifyListeners();
// //       rethrow;
// //     }
// //   }

// //   Future<void> deleteStudent(String id) async {
// //     try {
// //       await studentUseCases.deleteStudent(id);
// //       await loadStudents();
// //       _error = null;
// //     } catch (e) {
// //       _error = 'Failed to delete student: $e';
// //       notifyListeners();
// //       rethrow;
// //     }
// //   }

// //   void clearError() {
// //     _error = null;
// //     notifyListeners();
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:hive_clean/domain/entities/student.dart';
// import 'package:hive_clean/domain/usecases/student_usecase.dart';


// class StudentProvider with ChangeNotifier {
//   final StudentUseCases studentUseCases;
  
//   StudentProvider(this.studentUseCases);

//   List<Student> _students = [];
//   List<Student> get students => _students;

//   bool _isLoading = false;
//   bool get isLoading => _isLoading;

//   String? _error;
//   String? get error => _error;

//   Future<void> loadStudents() async {
//     _isLoading = true;
//     notifyListeners();

//     try {
//       _students = await studentUseCases.getAllStudents();
//       _error = null;
//     } catch (e) {
//       _error = 'Failed to load students: ${e.toString()}';
//       print('Error loading students: $e');
//       _students = []; // Reset to empty list on error
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   Future<void> addStudent(Student student) async {
//     try {
//       await studentUseCases.addStudent(student);
//       await loadStudents(); // Reload to get updated list
//       _error = null;
//     } catch (e) {
//       _error = 'Failed to add student: ${e.toString()}';
//       notifyListeners();
//       rethrow;
//     }
//   }

//   Future<void> updateStudent(String id, Student student) async {
//     try {
//       await studentUseCases.updateStudent(id, student);
//       await loadStudents();
//       _error = null;
//     } catch (e) {
//       _error = 'Failed to update student: ${e.toString()}';
//       notifyListeners();
//       rethrow;
//     }
//   }

//   Future<void> deleteStudent(String id) async {
//     try {
//       await studentUseCases.deleteStudent(id);
//       await loadStudents();
//       _error = null;
//     } catch (e) {
//       _error = 'Failed to delete student: ${e.toString()}';
//       notifyListeners();
//       rethrow;
//     }
//   }

//   void clearError() {
//     _error = null;
//     notifyListeners();
//   }

//   // Clear all data (for debugging)
//   void clearAllData() {
//     _students = [];
//     _error = null;
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';
import 'package:hive_clean/domain/entities/student.dart';
import 'package:hive_clean/domain/usecases/student_usecase.dart';


class StudentProvider with ChangeNotifier {
  final StudentUseCases studentUseCases;
  
  StudentProvider(this.studentUseCases);

  List<Student> _students = [];
  List<Student> get students => _students;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> loadStudents() async {
    _isLoading = true;
    notifyListeners();

    try {
      _students = await studentUseCases.getAllStudents();
      _error = null;
    } catch (e) {
      _error = 'Failed to load students: ${e.toString()}';
      _students = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addStudent(Student student) async {
    try {
      await studentUseCases.addStudent(student);
      await loadStudents();
      _error = null;
    } catch (e) {
      _error = 'Failed to add student: ${e.toString()}';
      notifyListeners();
      rethrow;
    }
  }

  Future<void> updateStudent(String id, Student student) async {
    try {
      await studentUseCases.updateStudent(id, student);
      await loadStudents();
      _error = null;
    } catch (e) {
      _error = 'Failed to update student: ${e.toString()}';
      notifyListeners();
      rethrow;
    }
  }

  Future<void> deleteStudent(String id) async {
    try {
      await studentUseCases.deleteStudent(id);
      await loadStudents();
      _error = null;
    } catch (e) {
      _error = 'Failed to delete student: ${e.toString()}';
      notifyListeners();
      rethrow;
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}