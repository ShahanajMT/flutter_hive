// // import 'package:get_it/get_it.dart';
// // import 'package:hive_clean/data/datascource/student_locat_data_source.dart';
// // import 'package:hive_clean/data/repo/student_repo_impl.dart';
// // import 'package:hive_clean/domain/repo/student_repo.dart';
// // import 'package:hive_clean/domain/usecases/student_usecase.dart';
// // import 'package:hive_clean/presentation/provider/student_provider.dart';

// // final getIt = GetIt.instance;

// // Future<void> init() async {
// //   // Providers
// //   getIt.registerFactory(() => StudentProvider(getIt()));

// //   // Use cases
// //   getIt.registerLazySingleton(() => StudentUseCases(getIt()));

// //   // Repository
// //   getIt.registerLazySingleton<StudentRepository>(
// //     () => StudentRepositoryImpl(getIt()),
// //   );

// //   // Data sources
// //   getIt.registerLazySingleton<StudentLocalDataSource>(
// //     () => StudentLocalDataSource(),
// //   );
// // }



// import 'package:get_it/get_it.dart';
// import 'package:hive_clean/data/datascource/auth_local_data_source.dart';
// import 'package:hive_clean/data/datascource/student_locat_data_source.dart';
// import 'package:hive_clean/data/repo/auth_repo_imp.dart';
// import 'package:hive_clean/data/repo/student_repo_impl.dart';
// import 'package:hive_clean/domain/repo/auth_repo.dart';
// import 'package:hive_clean/domain/repo/student_repo.dart';
// import 'package:hive_clean/domain/usecases/auth_use_case.dart';
// import 'package:hive_clean/domain/usecases/export_use_case.dart';
// import 'package:hive_clean/domain/usecases/statistic_use_case.dart';
// import 'package:hive_clean/domain/usecases/student_usecase.dart';
// import 'package:hive_clean/presentation/provider/auth_provider.dart';
// import 'package:hive_clean/presentation/provider/student_provider.dart';

// final getIt = GetIt.instance;

// Future<void> init() async {
//   // Providers
//   getIt.registerFactory(() => StudentProvider(getIt()));
//   getIt.registerFactory(() => AuthProvider(getIt()));

//   // Use cases
//   getIt.registerLazySingleton(() => StudentUseCases(getIt()));
//   getIt.registerLazySingleton(() => AuthUseCases(getIt()));
//   getIt.registerLazySingleton(() => ExportUseCase());
//   getIt.registerLazySingleton(() => StatisticsUseCase());

//   // Repository
//   getIt.registerLazySingleton<StudentRepository>(
//     () => StudentRepositoryImpl(getIt()),
//   );
//   getIt.registerLazySingleton<AuthRepository>(
//     () => AuthRepositoryImpl(getIt()),
//   );

//   // Data sources
//   getIt.registerLazySingleton<StudentLocalDataSource>(
//     () => StudentLocalDataSource(),
//   );
//   getIt.registerLazySingleton<AuthLocalDataSource>(
//     () => AuthLocalDataSource(),
//   );
// }

import 'package:get_it/get_it.dart';
import 'package:hive_clean/data/datascource/auth_local_data_source.dart';
import 'package:hive_clean/data/datascource/student_locat_data_source.dart';
import 'package:hive_clean/data/repo/auth_repo_imp.dart';
import 'package:hive_clean/data/repo/student_repo_impl.dart';
import 'package:hive_clean/domain/repo/auth_repo.dart';
import 'package:hive_clean/domain/repo/student_repo.dart';
import 'package:hive_clean/domain/usecases/auth_use_case.dart';
import 'package:hive_clean/domain/usecases/export_use_case.dart';
import 'package:hive_clean/domain/usecases/statistic_use_case.dart';
import 'package:hive_clean/domain/usecases/student_usecase.dart';
import 'package:hive_clean/presentation/provider/auth_provider.dart';
import 'package:hive_clean/presentation/provider/student_provider.dart';


final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerFactory(() => StudentProvider(getIt()));
  getIt.registerFactory(() => AuthProvider(getIt()));

  getIt.registerLazySingleton(() => StudentUseCases(getIt()));
  getIt.registerLazySingleton(() => AuthUseCases(getIt()));
  getIt.registerLazySingleton(() => ExportUseCase());
  getIt.registerLazySingleton(() => StatisticsUseCase());

  getIt.registerLazySingleton<StudentRepository>(
    () => StudentRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt()),
  );

  getIt.registerLazySingleton<StudentLocalDataSource>(
    () => StudentLocalDataSource(),
  );
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSource(),
  );
}