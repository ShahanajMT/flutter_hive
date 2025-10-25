class AppConstants {
  static const String appName = 'Student Manager';
  static const String hiveBoxName = 'student_db';
  static const String userBoxName = 'user_db';
  
  // Storage paths
  static const String imagesPath = 'student_images';
  
  // Validation messages
  static const String nameRequired = 'Name is required';
  static const String ageRequired = 'Age is required';
  static const String validAge = 'Please enter a valid age (1-150)';
  static const String emailInvalid = 'Please enter a valid email';
  
  // Sort options
  static const List<String> sortOptions = [
    'Name A-Z',
    'Name Z-A',
    'Age Low-High',
    'Age High-Low',
    'Newest First',
    'Oldest First',
  ];
}

class AppRoutes {
  static const String splash = '/';
  static const String auth = '/auth';
  static const String home = '/home';
  static const String studentDetail = '/student-detail';
  static const String settings = '/settings';
}