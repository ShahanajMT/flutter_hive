import 'package:hive/hive.dart';
import 'package:hive_clean/data/models/student_model.dart';
import 'package:hive_clean/data/models/user_model.dart';


class HiveMigrationHelper {
  static Future<void> migrateData() async {
    try {
      // Open boxes to trigger any necessary migrations
      await Hive.openBox<StudentModel>('student_db');
      await Hive.openBox<UserModel>('user_db');
      
      print('Hive migration completed successfully');
    } catch (e) {
      print('Error during Hive migration: $e');
      // If migration fails, clear the boxes and start fresh
      await Hive.deleteBoxFromDisk('student_db');
      await Hive.deleteBoxFromDisk('user_db');
      print('Cleared Hive boxes due to migration error');
    }
  }

  static Future<void> clearAllData() async {
    try {
      await Hive.deleteBoxFromDisk('student_db');
      await Hive.deleteBoxFromDisk('user_db');
      print('All Hive data cleared successfully');
    } catch (e) {
      print('Error clearing Hive data: $e');
    }
  }
}