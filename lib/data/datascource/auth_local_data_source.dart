import 'package:hive/hive.dart';
import 'package:hive_clean/data/models/user_model.dart';

// class AuthLocalDataSource {
//   static const String _userBox = 'user_db';
//   static const String _currentUserKey = 'current_user';

//   Future<Box<UserModel>> get _userBoxInstance async => 
//       await Hive.openBox<UserModel>(_userBox);

//   Future<void> saveUser(UserModel user) async {
//     final box = await _userBoxInstance;
//     await box.put(_currentUserKey, user);
//   }

//   Future<UserModel?> getCurrentUser() async {
//     final box = await _userBoxInstance;
//     return box.get(_currentUserKey);
//   }

//   Future<void> clearUser() async {
//     final box = await _userBoxInstance;
//     await box.delete(_currentUserKey);
//   }

//   Future<bool> isUserLoggedIn() async {
//     final box = await _userBoxInstance;
//     return box.containsKey(_currentUserKey);
//   }

//   Future<void> close() async {
//     final box = await _userBoxInstance;
//     await box.close();
//   }
// }


class AuthLocalDataSource {
  static const String _userBox = 'user_db';
  static const String _currentUserKey = 'current_user';

  Future<Box<UserModel>> get _userBoxInstance async => 
      await Hive.openBox<UserModel>(_userBox);

  Future<void> saveUser(UserModel user) async {
    final box = await _userBoxInstance;
    await box.put(_currentUserKey, user);
  }

  Future<UserModel?> getCurrentUser() async {
    final box = await _userBoxInstance;
    return box.get(_currentUserKey);
  }

  Future<void> clearUser() async {
    final box = await _userBoxInstance;
    await box.delete(_currentUserKey);
  }

  Future<bool> isUserLoggedIn() async {
    final box = await _userBoxInstance;
    return box.containsKey(_currentUserKey);
  }

  Future<void> close() async {
    final box = await _userBoxInstance;
    await box.close();
  }
} 