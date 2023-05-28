import 'package:get_it/get_it.dart';
import 'package:hive_clean_arch/app/networking/local/hive_service.dart';

final getIt = GetIt.instance;

void setUpLocator() {
  // 1. Create Hive service
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}
