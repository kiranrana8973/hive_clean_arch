import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_clean_arch/features/course/domain/usecase/course_usecase.dart';
import 'package:hive_clean_arch/features/course/ui/course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  final CourseUseCase _courseUseCase;

  CourseCubit(this._courseUseCase) : super(CourseState.initial()) {
    getAllCourses();
  }

  void getAllCourses() async {
    emit(state.copyWith(isLoading: true));
    final response = await _courseUseCase.getCourses();
    response.fold(
      (l) => emit(state.copyWith(isLoading: false, error: l.error)),
      (r) => emit(state.copyWith(isLoading: false, courses: r)),
    );
  }
}
