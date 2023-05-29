import 'package:get_it/get_it.dart';
import 'package:hive_clean_arch/app/networking/local/hive_service.dart';
import 'package:hive_clean_arch/features/auth/ui/login/login_navigator.dart';
import 'package:hive_clean_arch/features/auth/ui/register/register_navigator.dart';
import 'package:hive_clean_arch/features/batch/data/repositories/batch_local_repository.dart';
import 'package:hive_clean_arch/features/batch/domain/repository/batch_repository.dart';
import 'package:hive_clean_arch/features/course/domain/usecase/course_usecase.dart';

import '../../features/batch/data/models/batch_hive_model.dart';
import '../../features/batch/domain/usecase/batch_usecase.dart';
import '../../features/course/data/models/course_hive_model.dart';
import '../../features/course/data/repository/course_local_repository.dart';
import '../../features/course/domain/repository/course_repository.dart';

final getIt = GetIt.instance;

void setUpLocator() {
  //----------------------- Hive Database Service -----------------------
  getIt.registerLazySingleton<HiveService>(
    () => HiveService(),
  );

  //----------------------- Hive Models -----------------------
  getIt.registerLazySingleton<BatchHiveModel>(
    () => BatchHiveModel.empty(),
  );

  getIt.registerLazySingleton<CourseHiveModel>(
    () => CourseHiveModel.empty(),
  );

  //----------------------- Repositories -----------------------
  getIt.registerLazySingleton<BatchRepository>(
    () => BatchLocalRepository(getIt(), getIt()),
  );

  getIt.registerLazySingleton<CourseRepository>(
    () => CourseLocalRepository(getIt(), getIt()),
  );

  //----------------------- Use Cases -----------------------
  getIt.registerLazySingleton<BatchUseCase>(
    () => BatchUseCase(getIt()),
  );

  getIt.registerLazySingleton<CourseUseCase>(
    () => CourseUseCase(getIt()),
  );

  //----------------------- Navigators -----------------------
  getIt.registerLazySingleton<LoginNavigator>(() => LoginNavigator());
  getIt.registerLazySingleton<RegisterNavigator>(() => RegisterNavigator());
}
