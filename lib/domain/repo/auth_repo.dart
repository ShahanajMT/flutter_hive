// import 'package:hive_clean/domain/entities/user.dart';

// abstract class AuthRepository {
//   Future<User?> getCurrentUser();
//   Future<User> signUp(String email, String password, String name);
//   Future<User> login(String email, String password);
//   Future<void> logout();
//   Future<void> saveUser(User user);
//   Future<bool> isLoggedIn();
// }

import 'package:hive_clean/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User?> getCurrentUser();
  Future<User> signUp(String email, String password, String name);
  Future<User> login(String email, String password);
  Future<void> logout();
  Future<void> saveUser(User user);
  Future<bool> isLoggedIn();
}