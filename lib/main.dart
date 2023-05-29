import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_clean_arch/app/app.dart';
import 'package:hive_clean_arch/features/batch/domain/usecase/batch_usecase.dart';
import 'package:hive_clean_arch/features/batch/ui/batch_cubit.dart';
import 'package:hive_clean_arch/features/course/domain/repository/course_repository.dart';
import 'package:hive_clean_arch/features/course/ui/course_cubit.dart';

import 'app/di/di.dart';
import 'app/networking/local/hive_service.dart';
import 'features/auth/ui/login/login_cubit.dart';
import 'features/auth/ui/login/login_navigator.dart';
import 'features/auth/ui/register/register_cubit.dart';
import 'features/auth/ui/register/register_navigator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  // Initialize Hive
  getIt.get<HiveService>().init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(
            getIt.get<LoginNavigator>(),
          ),
        ),
        BlocProvider<RegisterCubit>(
          create: (context) => RegisterCubit(
            getIt.get<RegisterNavigator>(),
          ),
        ),
        BlocProvider<CourseCubit>(
          create: (context) => CourseCubit(
            getIt.get<CourseRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) =>
              BatchCubit(getIt.get<BatchUseCase>())..getAllBatches(),
        )
      ],
      child: const App(),
    ),
  );
}
