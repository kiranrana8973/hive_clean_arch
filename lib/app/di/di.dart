import 'package:get_it/get_it.dart';
import 'package:hive_clean_arch/app/networking/local/hive_service.dart';
import 'package:hive_clean_arch/features/auth/ui/login/login_navigator.dart';
import 'package:hive_clean_arch/features/auth/ui/register/register_navigator.dart';
import 'package:hive_clean_arch/features/batch/data/repositories/batch_local_repository.dart';
import 'package:hive_clean_arch/features/batch/domain/repository/batch_repository.dart';
import 'package:hive_clean_arch/features/course/data/repository/course_remote_repository.dart';

import '../../features/batch/data/models/batch_hive_model.dart';
import '../../features/batch/domain/usecase/batch_usecase.dart';
import '../../features/course/data/repository/course_local_repository.dart';
import '../../features/course/domain/repository/course_repository.dart';

final getIt = GetIt.instance;

void setUpLocator() {
  bool isConnected = false;
  // Hive Service
  getIt.registerLazySingleton<HiveService>(
    () => HiveService(),
  );

  // Hive model
  getIt.registerLazySingleton<BatchHiveModel>(
    () => BatchHiveModel.empty(),
  );

  // Repositories
  getIt.registerLazySingleton<BatchRepository>(
      () => BatchLocalRepository(getIt(), getIt()));

  getIt.registerLazySingleton<CourseRepository>(() =>
      isConnected ? CourseRemoteRepository() : CourseLocalRepository(getIt()));

  // Use cases
  getIt.registerLazySingleton<BatchUseCase>(
    () => BatchUseCase(getIt()),
  );

  // Navigators
  getIt.registerLazySingleton<LoginNavigator>(() => LoginNavigator());
  getIt.registerLazySingleton<RegisterNavigator>(() => RegisterNavigator());
}
