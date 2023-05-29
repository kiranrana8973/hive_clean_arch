import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_clean_arch/features/auth/ui/login/login_navigator.dart';
import 'package:hive_clean_arch/features/auth/ui/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginNavigator navigator;
  LoginCubit(this.navigator) : super(LoginState());

  onTapRegister() {
    navigator.openRegisterViewRoute();
  }

  onTapHome() {
    navigator.openHomeRoute();
  }
}
