import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_clean_arch/features/course/domain/repository/course_repository.dart';
import 'package:hive_clean_arch/features/course/ui/course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  final CourseRepository courseRepository;
  CourseCubit(this.courseRepository) : super(CourseState.initial());

  void getAllCourses() async {
    emit(state.copyWith(isLoading: true));
    final response = await courseRepository.getCourses();
    response.fold(
      (l) => emit(state.copyWith(isLoading: false, error: l.error)),
      (r) => emit(state.copyWith(isLoading: false, courses: r)),
    );
  }
}