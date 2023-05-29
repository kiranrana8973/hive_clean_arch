import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_clean_arch/features/auth/ui/register/register_navigator.dart';

import '../../domain/entity/student_enitity.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterNavigator navigator;
  RegisterCubit(this.navigator) : super(RegisterState.initial());

  onTapLogin() {
    navigator.openLoginViewRoute();
  }

  registerStudent(Student student) {
    emit(state.copyWith(isLoading: true));
  }
}
