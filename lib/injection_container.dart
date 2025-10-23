import 'package:get_it/get_it.dart';
import 'package:hive_clean/data/datascource/student_locat_data_source.dart';
import 'package:hive_clean/data/repo/student_repo_impl.dart';
import 'package:hive_clean/domain/repo/student_repo.dart';
import 'package:hive_clean/domain/usecases/student_usecase.dart';
import 'package:hive_clean/presentation/provider/student_provider.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Providers
  getIt.registerFactory(() => StudentProvider(getIt()));

  // Use cases
  getIt.registerLazySingleton(() => StudentUseCases(getIt()));

  // Repository
  getIt.registerLazySingleton<StudentRepository>(
    () => StudentRepositoryImpl(getIt()),
  );

  // Data sources
  getIt.registerLazySingleton<StudentLocalDataSource>(
    () => StudentLocalDataSource(),
  );
}