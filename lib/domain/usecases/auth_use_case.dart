import 'package:hive_clean/domain/entities/user.dart';
import 'package:hive_clean/domain/repo/auth_repo.dart';


// class AuthUseCases {
//   final AuthRepository repository;

//   AuthUseCases(this.repository);

//   Future<User?> getCurrentUser() => repository.getCurrentUser();
//   Future<User> signUp(String email, String password, String name) => repository.signUp(email, password, name);
//   Future<User> login(String email, String password) => repository.login(email, password);
//   Future<void> logout() => repository.logout();
//   Future<bool> isLoggedIn() => repository.isLoggedIn();
// }

class AuthUseCases {
  final AuthRepository repository;

  AuthUseCases(this.repository);

  Future<User?> getCurrentUser() => repository.getCurrentUser();
  Future<User> signUp(String email, String password, String name) => 
      repository.signUp(email, password, name);
  Future<User> login(String email, String password) => 
      repository.login(email, password);
  Future<void> logout() => repository.logout();
  Future<bool> isLoggedIn() => repository.isLoggedIn();
}