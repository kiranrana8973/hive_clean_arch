import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_clean_arch/app/networking/local/hive_service.dart';
import 'package:hive_clean_arch/app/networking/remote/dio_client.dart';
import 'package:hive_clean_arch/features/auth/ui/login/login_navigator.dart';
import 'package:hive_clean_arch/features/auth/ui/register/register_navigator.dart';
import 'package:hive_clean_arch/features/batch/data/models/batch_api_model.dart';
import 'package:hive_clean_arch/features/batch/data/models/batch_hive_model.dart';
import 'package:hive_clean_arch/features/batch/data/repositories/batch_local_repository.dart';
import 'package:hive_clean_arch/features/batch/data/repositories/batch_remote_repository.dart';
import 'package:hive_clean_arch/features/batch/domain/repository/batch_repository.dart';
import 'package:hive_clean_arch/features/batch/domain/usecase/batch_usecase.dart';
import 'package:hive_clean_arch/features/course/data/models/course_api_model.dart';
import 'package:hive_clean_arch/features/course/data/models/course_hive_model.dart';
import 'package:hive_clean_arch/features/course/data/repository/course_local_repository.dart';
import 'package:hive_clean_arch/features/course/data/repository/course_remote_repository.dart';
import 'package:hive_clean_arch/features/course/domain/repository/course_repository.dart';
import 'package:hive_clean_arch/features/course/domain/usecase/course_usecase.dart';

final getIt = GetIt.instance;

void setUpLocator() {
  // Check the internet connection later

  bool isNetworkConnected = true;

  //----------------------- Hive Database and Dio Service -----------------------
  getIt.registerLazySingleton<HiveService>(
    () => HiveService(),
  );

  getIt.registerLazySingleton<Dio>(
    () => Dio(),
  );

  getIt.registerLazySingleton<DioClient>(
    // () => DioClient(getIt())..dio,
    () => DioClient(getIt()),
  );

  //----------------------- Hive Models -----------------------
  getIt.registerLazySingleton<BatchHiveModel>(
    () => BatchHiveModel.empty(),
  );

  getIt.registerLazySingleton<CourseHiveModel>(
    () => CourseHiveModel.empty(),
  );

  //----------------------- API Models -----------------------
  getIt.registerLazySingleton<BatchApiModel>(
    () => BatchApiModel.empty(),
  );

  getIt.registerLazySingleton<CourseApiModel>(
    () => CourseApiModel.empty(),
  );

  //----------------------- Repositories -----------------------
  // Check for the internet connection here

  getIt.registerLazySingleton<BatchRepository>(() => isNetworkConnected
      ? BatchRemoteRepository(getIt(), getIt())
      : BatchLocalRepository(getIt(), getIt()));

  getIt.registerLazySingleton<CourseRepository>(() => isNetworkConnected
      ? CourseRemoteRepository(getIt(), getIt())
      : CourseLocalRepository(getIt(), getIt()));

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
