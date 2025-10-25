// // import 'package:flutter/material.dart';
// // import 'package:hive_clean/domain/entities/user.dart';
// // import 'package:hive_clean/domain/usecases/auth_use_case.dart';


// // class AuthProvider with ChangeNotifier {
// //   final AuthUseCases authUseCases;
  
// //   AuthProvider(this.authUseCases);

// //   User? _currentUser;
// //   bool _isLoading = false;
// //   bool _isAuthenticated = false;
// //   String? _error;

// //   User? get currentUser => _currentUser;
// //   bool get isLoading => _isLoading;
// //   bool get isAuthenticated => _isAuthenticated;
// //   String? get error => _error;

// //   Future<void> initialize() async {
// //     _isLoading = true;
// //     notifyListeners();

// //     try {
// //       _isAuthenticated = await authUseCases.isLoggedIn();
// //       if (_isAuthenticated) {
// //         _currentUser = await authUseCases.getCurrentUser();
// //       }
// //       _error = null;
// //     } catch (e) {
// //       _error = 'Failed to initialize authentication';
// //       _isAuthenticated = false;
// //     } finally {
// //       _isLoading = false;
// //       notifyListeners();
// //     }
// //   }

// //   Future<bool> login(String email, String password) async {
// //     _isLoading = true;
// //     _error = null;
// //     notifyListeners();

// //     try {
// //       _currentUser = await authUseCases.login(email, password);
// //       _isAuthenticated = true;
// //       _error = null;
// //       return true;
// //     } catch (e) {
// //       _error = e.toString();
// //       _isAuthenticated = false;
// //       return false;
// //     } finally {
// //       _isLoading = false;
// //       notifyListeners();
// //     }
// //   }

// //   Future<bool> signUp(String email, String password, String name) async {
// //     _isLoading = true;
// //     _error = null;
// //     notifyListeners();

// //     try {
// //       _currentUser = await authUseCases.signUp(email, password, name);
// //       _isAuthenticated = true;
// //       _error = null;
// //       return true;
// //     } catch (e) {
// //       _error = e.toString();
// //       _isAuthenticated = false;
// //       return false;
// //     } finally {
// //       _isLoading = false;
// //       notifyListeners();
// //     }
// //   }

// //   Future<void> logout() async {
// //     _isLoading = true;
// //     notifyListeners();

// //     try {
// //       await authUseCases.logout();
// //       _currentUser = null;
// //       _isAuthenticated = false;
// //       _error = null;
// //     } catch (e) {
// //       _error = e.toString();
// //     } finally {
// //       _isLoading = false;
// //       notifyListeners();
// //     }
// //   }

// //   void clearError() {
// //     _error = null;
// //     notifyListeners();
// //   }
// // }


// import 'package:flutter/material.dart';
// import 'package:hive_clean/domain/entities/user.dart';
// import 'package:hive_clean/domain/usecases/auth_use_case.dart';


// class AuthProvider with ChangeNotifier {
//   final AuthUseCases authUseCases;
  
//   AuthProvider(this.authUseCases);

//   User? _currentUser;
//   bool _isLoading = false;
//   bool _isAuthenticated = false;
//   String? _error;

//   User? get currentUser => _currentUser;
//   bool get isLoading => _isLoading;
//   bool get isAuthenticated => _isAuthenticated;
//   String? get error => _error;

//   Future<void> initialize() async {
//     _isLoading = true;
//     notifyListeners();

//     try {
//       _isAuthenticated = await authUseCases.isLoggedIn();
//       if (_isAuthenticated) {
//         _currentUser = await authUseCases.getCurrentUser();
//       }
//       _error = null;
//     } catch (e) {
//       _error = 'Failed to initialize authentication';
//       _isAuthenticated = false;
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   Future<bool> login(String email, String password) async {
//     _isLoading = true;
//     _error = null;
//     notifyListeners();

//     try {
//       _currentUser = await authUseCases.login(email, password);
//       _isAuthenticated = true;
//       _error = null;
//       return true;
//     } catch (e) {
//       _error = e.toString();
//       _isAuthenticated = false;
//       return false;
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   Future<bool> signUp(String email, String password, String name) async {
//     _isLoading = true;
//     _error = null;
//     notifyListeners();

//     try {
//       _currentUser = await authUseCases.signUp(email, password, name);
//       _isAuthenticated = true;
//       _error = null;
//       return true;
//     } catch (e) {
//       _error = e.toString();
//       _isAuthenticated = false;
//       return false;
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   Future<void> logout() async {
//     _isLoading = true;
//     notifyListeners();

//     try {
//       await authUseCases.logout();
//       _currentUser = null;
//       _isAuthenticated = false;
//       _error = null;
//     } catch (e) {
//       _error = e.toString();
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   void clearError() {
//     _error = null;
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';
import 'package:hive_clean/domain/entities/user.dart';
import 'package:hive_clean/domain/usecases/auth_use_case.dart';


class AuthProvider with ChangeNotifier {
  final AuthUseCases authUseCases;
  
  AuthProvider(this.authUseCases);

  User? _currentUser;
  bool _isLoading = false;
  bool _isAuthenticated = false;
  String? _error;

  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _isAuthenticated;
  String? get error => _error;

  Future<void> initialize() async {
    _isLoading = true;
    notifyListeners();

    try {
      _isAuthenticated = await authUseCases.isLoggedIn();
      if (_isAuthenticated) {
        _currentUser = await authUseCases.getCurrentUser();
      }
      _error = null;
    } catch (e) {
      _error = 'Failed to initialize authentication';
      _isAuthenticated = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _currentUser = await authUseCases.login(email, password);
      _isAuthenticated = true;
      return true;
    } catch (e) {
      _error = e.toString();
      _isAuthenticated = false;
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> signUp(String email, String password, String name) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _currentUser = await authUseCases.signUp(email, password, name);
      _isAuthenticated = true;
      return true;
    } catch (e) {
      _error = e.toString();
      _isAuthenticated = false;
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();

    try {
      await authUseCases.logout();
      _currentUser = null;
      _isAuthenticated = false;
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}