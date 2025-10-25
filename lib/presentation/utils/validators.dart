// class Validators {
//   static String? validateName(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Name is required';
//     }
//     if (value.length < 2) {
//       return 'Name must be at least 2 characters';
//     }
//     return null;
//   }

//   static String? validateAge(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Age is required';
//     }
//     final age = int.tryParse(value);
//     if (age == null) {
//       return 'Please enter a valid number';
//     }
//     if (age < 1 || age > 150) {
//       return 'Age must be between 1 and 150';
//     }
//     return null;
//   }

//   static String? validateEmail(String? value) {
//     if (value == null || value.isEmpty) return null;
//     final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
//     if (!emailRegex.hasMatch(value)) {
//       return 'Please enter a valid email address';
//     }
//     return null;
//   }

//   static String? validatePhone(String? value) {
//     if (value == null || value.isEmpty) return null;
//     final phoneRegex = RegExp(r'^[0-9+\-\s()]{10,}$');
//     if (!phoneRegex.hasMatch(value)) {
//       return 'Please enter a valid phone number';
//     }
//     return null;
//   }
// }

class Validators {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) return 'Name is required';
    if (value.length < 2) return 'Name must be at least 2 characters';
    return null;
  }

  static String? validateAge(String? value) {
    if (value == null || value.isEmpty) return 'Age is required';
    final age = int.tryParse(value);
    if (age == null) return 'Please enter a valid number';
    if (age < 1 || age > 150) return 'Age must be between 1 and 150';
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return null;
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) return 'Please enter a valid email address';
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) return null;
    final phoneRegex = RegExp(r'^[0-9+\-\s()]{10,}$');
    if (!phoneRegex.hasMatch(value)) return 'Please enter a valid phone number';
    return null;
  }
}