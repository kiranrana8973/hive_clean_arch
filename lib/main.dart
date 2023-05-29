import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_clean_arch/app/app.dart';
import 'package:hive_clean_arch/features/batch/ui/batch_cubit.dart';
import 'package:hive_clean_arch/features/course/domain/usecase/course_usecase.dart';
import 'package:hive_clean_arch/features/course/ui/course_cubit.dart';

import 'app/di/di.dart';
import 'app/networking/local/hive_service.dart';
import 'features/auth/ui/login/login_cubit.dart';
import 'features/auth/ui/register/register_cubit.dart';

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
            getIt(),
          ),
        ),
        BlocProvider<RegisterCubit>(
          create: (context) => RegisterCubit(
            getIt(),
          ),
        ),
        BlocProvider<CourseCubit>(
          create: (context) => CourseCubit(
            getIt.get<CourseUseCase>(),
          ),
        ),
        BlocProvider<BatchCubit>(
          create: (context) => BatchCubit(getIt())..getAllBatches(),
        )
      ],
      child: const App(),
    ),
  );
}
