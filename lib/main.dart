import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_clean_arch/app/app.dart';

import 'app/di/di.dart';
import 'features/auth/ui/login/login_cubit.dart';
import 'features/auth/ui/login/login_navigator.dart';
import 'features/auth/ui/register/register_cubit.dart';
import 'features/auth/ui/register/register_navigator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(getIt.get<LoginNavigator>()),
        ),
        BlocProvider<RegisterCubit>(
          create: (context) => RegisterCubit(getIt.get<RegisterNavigator>()),
        ),
      ],
      child: const App(),
    ),
  );
}
