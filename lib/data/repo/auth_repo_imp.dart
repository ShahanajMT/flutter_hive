// import 'package:hive_clean/data/datascource/auth_local_data_source.dart';
// import 'package:hive_clean/data/models/user_model.dart';
// import 'package:hive_clean/domain/entities/user.dart';
// import 'package:hive_clean/domain/repo/auth_repo.dart';


// class AuthRepositoryImpl implements AuthRepository {
//   final AuthLocalDataSource localDataSource;

//   AuthRepositoryImpl(this.localDataSource);

//   @override
//   Future<User?> getCurrentUser() async {
//     final userModel = await localDataSource.getCurrentUser();
//     if (userModel == null) return null;
    
//     return User(
//       id: userModel.id,
//       email: userModel.email,
//       name: userModel.name,
//       createdAt: DateTime.fromMillisecondsSinceEpoch(userModel.createdAt),
//       lastLogin: userModel.lastLogin != null 
//           ? DateTime.fromMillisecondsSinceEpoch(userModel.lastLogin!)
//           : null,
//     );
//   }

//   @override
//   Future<User> login(String email, String password) async {
//     // Simulate API call delay
//     await Future.delayed(const Duration(seconds: 2));
    
//     // In a real app, this would call an API and validate credentials
//     // For demo purposes, we'll create a mock user
//     if (email.isEmpty || password.isEmpty) {
//       throw Exception('Email and password are required');
//     }

//     if (password.length < 6) {
//       throw Exception('Password must be at least 6 characters');
//     }

//     final user = User(
//       id: DateTime.now().millisecondsSinceEpoch.toString(),
//       email: email,
//       name: email.split('@').first, // Generate name from email
//       createdAt: DateTime.now(),
//       lastLogin: DateTime.now(),
//     );

//     await saveUser(user);
//     return user;
//   }

//   @override
//   Future<void> logout() async {
//     await localDataSource.clearUser();
//   }

//   @override
//   Future<User> signUp(String email, String password, String name) async {
//     // Simulate API call delay
//     await Future.delayed(const Duration(seconds: 2));
    
//     // In a real app, this would call an API to create a user
//     if (email.isEmpty || password.isEmpty || name.isEmpty) {
//       throw Exception('All fields are required');
//     }

//     if (password.length < 6) {
//       throw Exception('Password must be at least 6 characters');
//     }

//     final user = User(
//       id: DateTime.now().millisecondsSinceEpoch.toString(),
//       email: email,
//       name: name,
//       createdAt: DateTime.now(),
//       lastLogin: DateTime.now(),
//     );

//     await saveUser(user);
//     return user;
//   }

//   @override
//   Future<void> saveUser(User user) async {
//     final userModel = UserModel(
//       id: user.id,
//       email: user.email,
//       name: user.name,
//       createdAt: user.createdAt.millisecondsSinceEpoch,
//       lastLogin: user.lastLogin?.millisecondsSinceEpoch,
//     );
    
//     await localDataSource.saveUser(userModel);
//   }

//   @override
//   Future<bool> isLoggedIn() async {
//     return await localDataSource.isUserLoggedIn();
//   }
// }

import 'package:hive_clean/data/datascource/auth_local_data_source.dart';
import 'package:hive_clean/data/models/user_model.dart';
import 'package:hive_clean/domain/entities/user.dart';
import 'package:hive_clean/domain/repo/auth_repo.dart';


class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl(this.localDataSource);

  @override
  Future<User?> getCurrentUser() async {
    final userModel = await localDataSource.getCurrentUser();
    if (userModel == null) return null;
    
    // Handle null createdAt
    final createdAt = userModel.createdAt != null
        ? DateTime.fromMillisecondsSinceEpoch(userModel.createdAt!)
        : DateTime.now();
    
    final lastLogin = userModel.lastLogin != null 
        ? DateTime.fromMillisecondsSinceEpoch(userModel.lastLogin!)
        : null;

    return User(
      id: userModel.id,
      email: userModel.email,
      name: userModel.name,
      createdAt: createdAt,
      lastLogin: lastLogin,
    );
  }

  @override
  Future<User> login(String email, String password) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 2));
    
    // In a real app, this would call an API and validate credentials
    // For demo purposes, we'll create a mock user
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email and password are required');
    }

    if (password.length < 6) {
      throw Exception('Password must be at least 6 characters');
    }

    final user = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      email: email,
      name: email.split('@').first, // Generate name from email
      createdAt: DateTime.now(),
      lastLogin: DateTime.now(),
    );

    await saveUser(user);
    return user;
  }

  @override
  Future<void> logout() async {
    await localDataSource.clearUser();
  }

  @override
  Future<User> signUp(String email, String password, String name) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 2));
    
    // In a real app, this would call an API to create a user
    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      throw Exception('All fields are required');
    }

    if (password.length < 6) {
      throw Exception('Password must be at least 6 characters');
    }

    final user = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      email: email,
      name: name,
      createdAt: DateTime.now(),
      lastLogin: DateTime.now(),
    );

    await saveUser(user);
    return user;
  }

  @override
  Future<void> saveUser(User user) async {
    final userModel = UserModel(
      id: user.id,
      email: user.email,
      name: user.name,
      createdAt: user.createdAt.millisecondsSinceEpoch,
      lastLogin: user.lastLogin?.millisecondsSinceEpoch,
    );
    
    await localDataSource.saveUser(userModel);
  }

  @override
  Future<bool> isLoggedIn() async {
    return await localDataSource.isUserLoggedIn();
  }
}